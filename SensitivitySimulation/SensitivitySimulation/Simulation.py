# Author: Zhiang Zhang
# First create: 2022-08-02
import os
import json
import copy
import time
import random
import traceback
import numpy as np
import pandas as pd
import multiprocessing

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

	def run(self, samples_n, max_workers=3, inputs_sample_n=None):
		################################################################
		# use the sampler to get sampled parameter values
		# param_vals is a 2-D array
		param_vals = self._sampler.generate_params(samples_n)
		################################################################
		# parallelly run multiple simulations
		pool = multiprocessing.Pool(processes = max_workers)
		processes = []
		for i in range(len(param_vals)):
			param_val = param_vals[i]
			#param_val = [44.164923733582626, 2.4257761823941832]
			processes.append(pool.apply_async(self._run_single_simulation, 
								(self._simulator, i, self._param_names, 
								param_val, self._res_dir, self._sim_inputs, 
								self._output_names, inputs_sample_n)))
			time.sleep(1)
		# close the pool so no more processes can be added
		pool.close()
		# wait for all processes to finish before processing the results
		pool.join()

	def _run_single_simulation(self, org_simulator, run_id, 
							param_names, param_val, root_res_dir,
							sim_inputs, output_names, inputs_sample_n = None):
		model_set_param = dict(zip(param_names, param_val))
		# make result directory
		this_res_dir = root_res_dir + os.sep + 'run_{}'.format(run_id)
		if not os.path.isdir(this_res_dir):
			os.makedirs(this_res_dir)
		with open(this_res_dir + os.sep + 'model_set_param.json', 'w') as param_json:
			json.dump(model_set_param, param_json)
		# copy a new simulator
		this_simulator = copy.deepcopy(org_simulator)
		this_simulator.res_dir = this_res_dir
		this_simulator.mo_set_params = model_set_param
		try:
			if inputs_sample_n is not None:
				sim_inputs_len = len(sim_inputs[list(sim_inputs.keys())[0]])
				random_indices = random.sample(range(sim_inputs_len), inputs_sample_n)
				#random_indices = [1260]
				sim_inputs = {k:v[random_indices] for k, v in sim_inputs.items()}
				
				np.savetxt(this_res_dir + os.sep + 'random_indices.csv', 
							random_indices, delimiter = ',')
			sim_inputs_df = pd.DataFrame(sim_inputs)
			sim_inputs_df.to_csv(this_res_dir + os.sep + 'sim_inputs.csv')
			sim_res_ls = this_simulator.simulate(
								sim_inputs, output_names)
			# write the results to file
			np.savetxt(this_res_dir + os.sep + 'sensi_sim_res.csv', 
					sim_res_ls, delimiter=",")
		except:
			self._logger.error('Error! run_id:{}, param_val: {}'\
								.format(run_id, param_val))
			traceback.print_exc()
