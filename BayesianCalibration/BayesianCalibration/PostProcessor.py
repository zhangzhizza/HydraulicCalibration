# Author: Zhiang Zhang
# First create: 2022-08-22
import os
import seaborn
import pickle as pk
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks
from sklearn.mixture import GaussianMixture
from sklearn.cluster import KMeans

class TraceProcessor(object):

	def __init__(self, trace_path: str, save_dir: str = None):
		with open(trace_path, 'rb') as f:
			trace = pk.load(f)
		trace_df = trace.to_frame()
		self._trace_df = trace_df
		self._trace_path = trace_path
		self._save_dir = save_dir

	def get_stats(self, hist_bins: int = 50,
						peak_height_prop: float = None,
						peak_width_prop: float = None) -> dict:
		"""
		Args:
		----------
		hist_bins: int
			Bins to generate the histogram for samples.
		peak_height_prop: float
			The proportion of the total number of samples in a 
			bin of the histogram so that is can be recognized as a peak.
			If None, this number is 0.5/hist_bins.
		peak_width_prop: float
			The proportion of hist_bins so that a peak in histogram must
			be larger than this width. 
			If None, this number is 0.2.

		----------
		Return:
			stats: dict
				{'theta.1': {'mean': 0.5, 'std': 0.5, peaks:[0.2, 0.4],
							'peak_heights': [123, 50]},
				 'theta.2': {'mean': 0.5, 'std': 0.2, peaks:[0.1, 0.9]}
				 }
		"""
		stats = {}
		for trace_element in list(self._trace_df.columns):
			if trace_element[-2: ] != '__':
				element_data = self._trace_df[trace_element].values
				element_mean = element_data.mean()
				element_std = element_data.std()
				element_hist = np.histogram(element_data,
											bins = hist_bins)
				element_hist_freq = element_hist[0]
				element_hist_vals = element_hist[1]
				if peak_height_prop is None:
					peak_height = 0.5*len(element_data)/hist_bins
				else:
					peak_height = int(len(element_data) 
									* peak_height_prop)
				if peak_width_prop is None:
					peak_width_prop = 0.2
				peak_width = peak_width_prop * hist_bins
				peak = find_peaks(element_hist_freq, 
					distance = peak_width, height = peak_height)
				element_peak_idx = list(peak[0])
				element_peak_vals = element_hist_vals[element_peak_idx]
				element_peak_heights = list(peak[1]['peak_heights'])

				stats[trace_element] = {'mean': element_mean, 
										'std': element_std,
										'peaks': element_peak_vals,
								'peak_heights': element_peak_heights}
		return stats

	def get_theta_result(self, center_n: int, 
						theta_min_ptp: dict = None) -> dict:
		theta_names = []
		for element in list(self._trace_df.columns):
			if 'theta' in element:
				theta_names.append(element)
		samples = self._trace_df[theta_names].values
		centers, cluster_populations, _ = \
					self._get_centers(samples, center_n)
		result = {'centers_norm': centers, 
				 'population': cluster_populations}
		if theta_min_ptp is not None:
			theta_min = theta_min_ptp['min']
			theta_ptp = theta_min_ptp['ptp']
			centers_org = np.array(centers) * theta_ptp + theta_min
			result['centers_org'] = centers_org.tolist()
		return result

	def _get_centers(self, samples: np.array, 
					center_n: int = 3, method: str = 'GM')\
					-> tuple:
		"""
		Args:
		----------
		samples: np.array
			Each row is a sample, each column is a feature.
		center_n: int
			Number of centers to look for.
		method: str
			Choice of GM (Gaussian-mixture), KMeans

		Return:
		----------
		centers: list
			Centers of the samples, each row is a center.
		cluster_populations: list
			Number of samples in each cluster.
		cluster_members: list
			Each element in the list is a np.array, representing
			the members in a cluster. 
		"""
		if method == 'GM':
			cm = GaussianMixture(n_components=center_n, random_state=0)
			y_pred = cm.fit_predict(samples)
			centers = cm.means_
		elif method == 'KMeans':
			cm = KMeans(n_clusters=2, random_state=0).fit(X)
			y_pred = cm.fit_predict(samples)
			centers = cm.cluster_centers_
		cluster_populations = []
		cluster_members = []
		for i in range(center_n):
			this_cluster = samples[y_pred == i]
			cluster_populations.append(len(this_cluster))
			cluster_members.append(this_cluster)
		centers = centers.tolist()
		return centers, cluster_populations, cluster_members

	def draw_hist1D(self, hist_bins: int = 50, 
					target_elements: list = None,
					subplots_per_figure: tuple = None,
					fig_size: tuple = None,
					font_size: int = 15,
					color: str = 'k') -> list:
		"""
		Args:
		----------
		hist_bins: int
			Bins to generate the histogram for samples.
		target_elements: list
			A list of element names that histogram figures will be 
			generated. 
			If None, then all elements' histogram figures will 
			be generated.
		subplots_per_figure: tuple
			A tuple of (row_n, col_n), indicating the number of subplots
			per figure to be generated. The number of figures that need
			to be generated is determined by the total number of 
			histogram plots and the number of subplots in one figure.  
			If None, subplots_per_figure = (1, 1) 
		fig_size: tuple
			A tuple of (figure width, figure height), indicating the 
			size of each figure. 
			If None, figure width = subplots_per_figure[1]*5
					 figure height = subplots_per_figure[0]*5
		font_size: int
			The base font size of the figure.
		color: str
			Histogram drawing color. 

		Return:
		----------
		paths: list
			A list of paths string to the generated figures. 
		"""
		paths = []
		if target_elements is None:
			target_elements = []
			for trace_element in list(self._trace_df.columns):
				if trace_element[-2: ] != '__':
					target_elements.append(trace_element)
		
		if subplots_per_figure is None:
			subplots_per_figure = (1, 1)
		if fig_size is None:
			fig_size = (subplots_per_figure[1]*5,
						subplots_per_figure[0]*5)
		save_dir = self._save_dir
		if save_dir is None:
			save_dir = '.'
		
		counter = 0
		fig_counter = 0
		while counter < len(target_elements):
			fig, axs = plt.subplots(subplots_per_figure[0],
								subplots_per_figure[1],
								figsize = fig_size)
			for row_i in range(subplots_per_figure[0]):
				for col_j in range(subplots_per_figure[1]):
					if counter >= len(target_elements):
						break
					if subplots_per_figure == (1, 1):
						axs_i = axs
					elif subplots_per_figure[0] == 1:
						axs_i = axs[col_j]
					elif subplots_per_figure[1] == 1:
						axs_i = axs[row_i]
					else:
						axs_i = axs[row_i][col_j]
					element_i = target_elements[counter]
					data_i = self._trace_df[element_i].values
					axs_i.hist(data_i, bins = hist_bins, color = color)
					axs_i.set_xlabel(element_i, fontsize = font_size)
					axs_i.tick_params(axis = 'both', which='major', 
										labelsize = font_size)
					counter += 1
			fig_name = '{}_hist{}.png'.format(
						os.path.splitext(
						os.path.basename(self._trace_path))[0],
						fig_counter)
			fig_path = save_dir + os.sep + fig_name
			fig.savefig(fig_path)
			paths.append(fig_path)
			fig_counter += 1
		return paths

	def draw_hist2D(self, element_x: str, element_y: str,
					hist_bins: int) -> str:
		"""
		Args:
		----------
		element_x: str
			Element name for the x-axis.
		element_y: str
			Element name for the y-axis.
		hist_bins: int
			Bins for histogram.

		Return:
		----------
		path: str
			The path string to the generated figure. 
		"""
		save_dir = self._save_dir
		if save_dir is None:
			save_dir = '.'
		jp = seaborn.jointplot(data = self._trace_df, 
								x = element_x,
								y = element_y,
								marginal_kws=dict(bins=hist_bins))
		fig_name = '{}_hist2D_{}_{}.png'.format(
						os.path.splitext(
						os.path.basename(self._trace_path))[0],
						element_x,
						element_y)
		fig_path = save_dir + os.sep + fig_name
		plt.savefig(fig_path)
		return fig_path

