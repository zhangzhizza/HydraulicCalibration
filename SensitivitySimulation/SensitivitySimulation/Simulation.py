# Author: Zhiang Zhang
# First create: 2022-08-02
import os
import copy
import time
import traceback
import numpy as np
from concurrent.futures import ThreadPoolExecutor
from concurrent.futures import wait

from .Utils.Logger import Logger

LOG_FMT = "[%(asctime)s] %(name)s %(levelname)s:%(message)s";

class SensitivitySimulation():

	def __init__(self, sampler, simulator, param_names, res_dir,
				 sim_inputs, output_names, log_level = 'INFO'):
		"""
		Args:
		----------
		sampler: Sampler object
		simulator: A simulator object
		param_names: python List
			A list of parameter names that can be recieved by the 
			simulator
		"""
		
		self._sampler = sampler
		self._simulator = simulator
		self._param_names = param_names
		self._res_dir = res_dir
		if not os.path.isdir(res_dir):
			os.makedirs(res_dir)
		self._sim_inputs = sim_inputs
		self._output_names = output_names
		self._logger = Logger().getLogger('SensitivitySimulation',\
                                        log_level, LOG_FMT)

	def run(self, samples_n, max_workers=3):
		################################################################
		# use the sampler to get sampled parameter values
		# param_vals is a 2-D array
		param_vals = self._sampler.generate_params(samples_n)
		################################################################
		# parallelly run multiple simulations
		with ThreadPoolExecutor(max_workers = max_workers) as executor:
			jobs = []
			for i in range(len(param_vals)):
				param_val = param_vals[i]
				job_i = executor.submit(self._run_single_simulation,
							org_simulator = self._simulator, 
							run_id = i, param_names = self._param_names, 
							param_val = param_val, 
							root_res_dir = self._res_dir, 
							sim_inputs = self._sim_inputs, 
							output_names = self._output_names)
				time.sleep(1)
				jobs.append(job_i)
			wait(jobs)
		for job in jobs:
			result = job.result()

	def _run_single_simulation(self, org_simulator, run_id, 
							param_names, param_val, root_res_dir,
							sim_inputs, output_names):
		model_set_param = dict(zip(param_names, param_val))
		# make result directory
		this_res_dir = root_res_dir + os.sep + 'run_{}'.format(run_id)
		if not os.path.isdir(this_res_dir):
			os.makedirs(this_res_dir)
		# copy a new simulator
		this_simulator = copy.deepcopy(org_simulator)
		this_simulator.res_dir = this_res_dir
		this_simulator.mo_set_params = model_set_param
		try:
			sim_res_ls = this_simulator.simulate(
								sim_inputs, output_names)
			# write the results to file
			np.savetxt(this_res_dir + os.sep + 'sensi_sim_res.csv', 
					sim_res_ls, delimiter=",")
		except:
			self._logger.error('Error! run_id:{}, param_val: {}'\
								.format(run_id, param_val))
			traceback.print_exc()