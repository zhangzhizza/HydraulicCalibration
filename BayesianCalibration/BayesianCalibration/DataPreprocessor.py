"""
The main class to combine all sub-tasks for Bayesian calibration for BEM. 

Author: Zhiang Zhang

First Created: Sept 6th, 2017
Last Updated: Sept 6th, 2017
"""
from BayesianCalibration.CmbYChoices import CmbYMtdMapping

import pandas as pd
import numpy as np
import pickle as pk
import os

class Preprocessor(object):

	def __init__(self, logger):
		self._logger = logger;

	def _prepareMCMCIn(self, D_COMP, D_FIELD, cmbYMethodNArgs, ydim,
						x_ranges = None):
		"""
		Prepare data for MCMC.

		Args:

		Ret:

		"""
		# Get info when to comb y
		if ydim > 1:
			cmbdYTime = cmbYMethodNArgs[-1];
		# Extract y and xf
		y = D_FIELD[:,0:ydim]
		xf = D_FIELD[:,ydim:]
		(n,p) = xf.shape
		# Extract eta, xc, and tc
		eta = D_COMP[:,0:ydim]
		xc = D_COMP[:,ydim:(ydim+p)]
		tc = D_COMP[:,(p+ydim):]
		x = np.concatenate((xf,xc), axis=0)
		(m,q) = tc.shape
		# Mix max normalization x eta y and tc
		self._logger.debug('Data shape before norm of y xf eta xc tc: %s %s %s %s %s'%(y.shape, 
							xf.shape, eta.shape, xc.shape, tc.shape))
		x, _, _ = self._getMinMaxNormalized(x, x_ranges)
		tc, tc_min, tc_ptp = self._getMinMaxNormalized(tc)
		# Combine y and eta into one z
		z = np.concatenate((y,eta), axis=0);
		# Reduce dimension of z to one, if not one if selected combd before std
		z_copy_afternorm = None;
		if ydim > 1 and cmbdYTime == 'before_std':
			z, _, _ = self._getMinMaxNormalized(z);
			z_copy_afternorm = np.copy(z);
			self._logger.debug('Data shape after min max norm of z: %s', (z.shape));
			z = cmbYMtdMapping[cmbYMethodNArgs[0]](z, *cmbYMethodNArgs[1:-1]);
			if len(z.shape) > 1:
				z = np.reshape(z, (-2,)) # Make z to be one-dim array
		# Standardize the z
		z_copy_beforestd = np.copy(z);
		self._logger.debug('z shape before standardization %s', z.shape);
		(z_y_stand, z_eta_stand) = self._getStandardizedByEta(z[0:n], z[n:]);
		z = np.append(z_y_stand, z_eta_stand, axis = 0);
		self._logger.debug('z shape after standardization %s', z.shape);
		z_copy_afterstd = np.copy(z);
		# Combine y if selected after_std
		if ydim > 1 and cmbdYTime == 'after_std':
			z = cmbYMtdMapping[cmbYMethodNArgs[0]](z, *cmbYMethodNArgs[1:-1]);
			if len(z.shape) > 1:
				z = np.reshape(z, (-2,)) # Make z to be one-dim array
			self._logger.debug('Data shape after combine y after std: %s', (z.shape))
		# Extract xf and xc
		if len(z.shape) > 1:
			z = np.reshape(z, (-2,)) # Make z to be one-dim array
		xf = x[0:n,:]
		xc = x[n:,:]
		return (z, xf, xc, tc, z_copy_afternorm, z_copy_beforestd, z_copy_afterstd,
				tc_min, tc_ptp)

	def getDataFromFile(self, fieldDataFile, simDataFile, cmbYMethodNArgs, ydim,
						x_ranges = None):
		"""
		Most of the following code is taken from Adrian Chong
		"""
		self._logger.info('Reading dataset from files %s and %s...', simDataFile, fieldDataFile)
		# Read file
		D_COMP = np.genfromtxt(simDataFile, delimiter = ',', skip_header = 1)
		D_FIELD = np.genfromtxt(fieldDataFile, delimiter = ',', skip_header = 1)

		self._logger.info('Preparing data...')
		self._logger.info('Y dimension reduction method is %s.', cmbYMethodNArgs)
		self._logger.info('x_ranges is %s.', x_ranges)
		return self._prepareMCMCIn(D_COMP, D_FIELD, cmbYMethodNArgs, ydim, x_ranges)

	def _getMinMaxNormalized(self, x, ranges = None):
		ptp = x.ptp(axis = 0)
		x_min = x.min(axis = 0)
		if ranges is not None:
			for i in list(ranges.keys()):
				range_i = ranges[i]
				ptp_i = range_i[-1] - range_i[0]
				ptp[i] = ptp_i
				min_i = range_i[0]
				x_min[i] = min_i
		ptp[ptp==0] = 1
		x_norm = (x - x_min) / ptp;
		return x_norm, x_min, ptp
	
	def _getStandardizedByEta(self, y, eta):
		eta_mean = eta.mean(axis = 0);
		eta_std = eta.std(axis = 0);
		eta_stand = (eta - eta_mean) / eta_std; 
		y_stand = (y - eta_mean) / eta_std;
		return (y_stand, eta_stand);



