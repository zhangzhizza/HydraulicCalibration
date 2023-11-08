# Author: Zhiang Zhang
# First create: 2022-07-18
import os
import time
import copy
import shutil
import traceback
import numpy as np
import pandas as pd

from ModelicaEngine.ModelicaEngine import Engine
from concurrent.futures import ThreadPoolExecutor
from concurrent.futures import wait

from .HSUtils.Logger import Logger

LOG_FMT = "[%(asctime)s] %(name)s %(levelname)s:%(message)s"

class Simulator():
	def __init__(self, mo_path, res_dir, 
				sudo_pwd, log_level, mo_set_params = {},
				fmu_path = None, step_size = 3600,
				tgt_sup_pre = None, tgt_search_its = 10, 
				tgt_err_thres_perct = 5, search_fail_return = False):
		"""
		tgt_sup_pre: Dict
			{
			 'tgt_sup_pre_pv_name': 'chw_sup_P.p',
			 'sup_pre_cv_name': 'terminal_resist_ratio.k',
			 'sup_pre_cv_range': [0, 1]}
		"""
		self._mo_path = mo_path
		self._res_dir = res_dir
		self._sudo_pwd = sudo_pwd
		self._log_level = log_level
		self._fmu_path = fmu_path
		self._step_size = step_size
		self._mo_set_params = self._process_set_params(mo_set_params)
		self._tgt_sup_pre = tgt_sup_pre
		self._tgt_search_its = tgt_search_its
		self._tgt_err_thres_perct = tgt_err_thres_perct
		self._search_fail_return = search_fail_return
		self._logger = Logger().getLogger('HydraulicSimulator',
                                        log_level, LOG_FMT)

	def _process_set_params(self, raw_set_params):
		"""
		Args:
		----------
		raw_set_params: Dict
			e.g.:
		{'Buildings.Fluid.FixedResistances.Junction:jun_1:m_flow_nominal': 800,
		 'Buildings.Fluid.Movers.SpeedControlled_y:chwp_2:p_start': 40000,
		 'parameter:Real:jun_p1_dp': 2000}

		Return:
		----------
		mo_set_params: List
			e.g.:
		[['Buildings.Fluid.FixedResistances.Junction:', 'jun_1', 
			{'m_flow_nominal': '800'}],
		  ['Buildings.Fluid.Movers.SpeedControlled_y', 'chwp_2', 
		  	{'p_start': '40000'} ],
		  ['parameter', 'Real', 'jun_p1_dp', '2000']]

		"""
		mo_set_params = []
		for set_param_key in raw_set_params.keys():
			set_param_list = set_param_key.split(':')
			set_param_vals = raw_set_params[set_param_key]
			if set_param_list[0] == 'parameter':
				set_param_list.append(str(set_param_vals))
			else:
				last_key = set_param_list[-1]
				set_param_list[-1] = {last_key: str(set_param_vals)}
			mo_set_params.append(set_param_list)
		return mo_set_params

	@property
	def res_dir(self):
		return self._res_dir

	@res_dir.setter
	def res_dir(self, res_dir):
		self._res_dir = res_dir 

	@property
	def mo_set_params(self):
		return self._mo_set_params

	@mo_set_params.setter
	def mo_set_params(self, mo_set_params):
		self._mo_set_params = self._process_set_params(mo_set_params)
	

	def _compile_model(self, mo_path, res_dir, sudo_pwd, log_level,
					mo_set_params, fmu_path):
		if fmu_path is None:
			mo_engine = Engine(mo_path, res_dir, sudo_pwd, 
					log_level = log_level,
                  	set_params = mo_set_params)
		else:
			mo_engine = Engine(mo_path = None, 
					res_dir = res_dir, sudo_pwd = sudo_pwd,
					log_level = log_level, set_params = mo_set_params,
					fmu_path = fmu_path)
		return mo_engine

	def simulate(self, inputs, output_names, threads_n = None, check_pressure = True):
		"""
		Args:
		----------
		inputs: Dict
			{'pump_speed_1': [0.5, 0.6, 0.7, 0.8],
			 'pump_speed_2': [0.5, 0.6, 0.7, 0.8],
			 'pump_speed_3': [0.5, 0.6, 0.7, 0.8],
			 'pump_speed_4': [0.5, 0.6, 0.7, 0.8],
			 'chw_sup_P.p': [1200000, 1300000, 1500000, 1600000]
			}
		
		"""
		tgt_sup_pre = self._tgt_sup_pre
		tgt_search_its = self._tgt_search_its
		tgt_err_thres_perct = self._tgt_err_thres_perct
		search_fail_return = self._search_fail_return
		################################################################
		# compile model first
		mo_engine = self._compile_model(self._mo_path, self._res_dir, 
					self._sudo_pwd, self._log_level, self._mo_set_params, 
					self._fmu_path)
		################################################################
		# simulate, support parallel simulation
		all_input_names = list(inputs.keys())
		all_input_vals = pd.DataFrame(list(inputs.values())).values
		all_input_vals = all_input_vals.T
		sim_res_ls = []
		if threads_n is not None and type(threads_n) is int:
			exe = ThreadPoolExecutor(max_workers = threads_n)
			jobs = []
		if tgt_sup_pre is not None:
			tgt_sup_pre_pv_name = tgt_sup_pre['tgt_sup_pre_pv_name']
			sup_pre_cv_name = tgt_sup_pre['sup_pre_cv_name']
			sup_pre_cv_range = \
							tgt_sup_pre['sup_pre_cv_range']
			for i in range(all_input_vals.shape[0]):
				self._logger.info('=======Simulation Iteration: {} '\
									'======='.format(i))
				tgt_sup_pre_sp = inputs[tgt_sup_pre_pv_name][i]
				input_val_i = all_input_vals[i]
				if np.isnan(input_val_i).sum() > 0:
					continue
				input_dict_i = dict(zip(all_input_names, input_val_i))	
				if threads_n is not None and type(threads_n) is int:
					mo_engine_this = copy.deepcopy(mo_engine)
					job_i = exe.submit(self._search_simulate,
							moenv = mo_engine_this,
							start_time = 0, 
							final_time = self._step_size,
							set_param_dict = input_dict_i,
							res_names = output_names,
							tgt_sp = tgt_sup_pre_sp,
							tgt_pv_name = tgt_sup_pre_pv_name,
							cv_name = sup_pre_cv_name,
							cv_range = sup_pre_cv_range,
							iteration = tgt_search_its,
							err_thres_percent = tgt_err_thres_perct,
							search_fail_return = search_fail_return)
					time.sleep(1)
					jobs.append(job_i)
				else:
					sim_res_i = self._search_simulate(
								moenv = mo_engine,
								start_time = 0, 
								final_time = self._step_size,
								set_param_dict = input_dict_i,
								res_names = output_names,
								tgt_sp = tgt_sup_pre_sp,
								tgt_pv_name = tgt_sup_pre_pv_name,
								cv_name = sup_pre_cv_name,
								cv_range = sup_pre_cv_range,
								iteration = tgt_search_its,
								err_thres_percent = tgt_err_thres_perct,
								search_fail_return = search_fail_return)
					sim_res_ls.append(sim_res_i)
			if threads_n is not None and type(threads_n) is int:
				wait(jobs)
		else:
			for i in range(all_input_vals.shape[0]):
				self._logger.info('=======Simulation Iteration: {} '\
									'======='.format(i))
				input_val_i = all_input_vals[i]
				if np.isnan(input_val_i).sum() > 0:
					continue
				input_dict_i = dict(zip(all_input_names, input_val_i))
				if threads_n is not None and type(threads_n) is int:
					mo_engine_this = copy.deepcopy(mo_engine)
					job_i = exe.submit(self._base_simulate,
								moenv = mo_engine_this,
								start_time = 0, 
								final_time = self._step_size,
								set_param_dict = input_dict_i,
								res_names = output_names,
								check_pressure = check_pressure)
					time.sleep(1)
					jobs.append(job_i)
				else:
					sim_res_i = self._base_simulate(
								moenv = mo_engine,
								start_time = 0, 
								final_time = self._step_size,
								set_param_dict = input_dict_i,
								res_names = output_names,
								check_pressure = check_pressure)
					sim_res_ls.append(sim_res_i)
			if threads_n is not None and type(threads_n) is int:
				wait(jobs)
		if threads_n is not None and type(threads_n) is int:
			for job in jobs:
				result = job.result()
				sim_res_ls.append(result)
			exe.shutdown(wait=True)
		sim_res_ls = np.array(sim_res_ls)
		return sim_res_ls

	def _search_simulate(self, moenv, start_time, final_time, 
						set_param_dict, res_names, tgt_sp, tgt_pv_name,
						cv_name, cv_range, iteration, 
						err_thres_percent, search_fail_return):
		"""
		Args:
			search_fail_return: boolean
				If true, still return the simulation results even
				the search fails.
				If false, return none as simulation results.
		----------

		"""
		self._logger.info('search_simulate starts...')
		cv_min = cv_range[0]
		cv_max = cv_range[1]
		cv_res = None
		# to save computational time, check min cv and max cv first
		# pv decreases with cv
		while cv_max > 0:
			try:
				set_param_dict[cv_name] = cv_max
				pv_min = self._base_simulate(
								moenv = moenv,
								start_time = start_time, 
								final_time = final_time,
								set_param_dict = set_param_dict,
								res_names = [tgt_pv_name])
				break
			except:
				cv_max -= 0.05
		if cv_max <= 0:
			raise RuntimeError('_search_simulate: '\
					'Error! Cannot find a suitable cv_max '\
				'to make the simulaiton converge. set_param_dict: {}'
				.format(set_param_dict))
		else:
			if cv_max < cv_range[1]:
				self._logger.warning(f'The original cv_range '\
					'({cv_range}) cannot make the simulation converge, '\
					'the new range is set to [{cv_min}, {cv_max}]')
		if pv_min > tgt_sp:
			cv_res = cv_max
		if cv_res is None:
			set_param_dict[cv_name] = cv_min
			pv_max = self._base_simulate(
								moenv = moenv,
								start_time = start_time, 
								final_time = final_time,
								set_param_dict = set_param_dict,
								res_names = [tgt_pv_name])
			if pv_max < tgt_sp:
				cv_res = cv_min
		if (cv_res is not None) and (search_fail_return is False):
			self._logger.warning(f'Search simulate failed! '\
				'Cannot find a suitable value for {cv_name} to meet '\
				'the setpoint of {tgt_pv_name} (sp: {tgt_sp}). '\
				'This iteration will return None as the result. You can '\
				'force the simulation to return a value by setting '\
				'search_fail_return = True')
			return [np.nan for i in range(len(res_names))]
		elif (cv_res is not None) and (search_fail_return is True):
			cv_res = cv_res
			self._logger.warning(f'Search simulate failed! '\
				'Cannot find a suitable value for {cv_name} to meet '\
				'the setpoint of {tgt_pv_name} (sp: {tgt_sp}). '\
				'The result at the boundary of {cv_name} (cv: {cv_res}) '\
				'will be returned.')
		else:
			# if sp is in the range of pv, 
			# then proceed with binary search
			for i in range(iteration):
				cv_mid = (cv_min + cv_max)/2.0
				set_param_dict[cv_name] = cv_mid
				pv_i = self._base_simulate(
									moenv = moenv,
									start_time = start_time, 
									final_time = final_time,
									set_param_dict = set_param_dict,
									res_names = [tgt_pv_name])
				err = abs(pv_i - tgt_sp)
				if 100*(err/tgt_sp) < err_thres_percent:
					break
				else:
					if pv_i > tgt_sp:
						cv_min = cv_mid
						cv_max = cv_max
					else:
						cv_min = cv_min
						cv_max = cv_mid
			cv_res = (cv_min + cv_max)/2.0
		set_param_dict[cv_name] = cv_res
		sim_res = self._base_simulate(
								moenv = moenv,
								start_time = start_time, 
								final_time = final_time,
								set_param_dict = set_param_dict,
								res_names = res_names)
		return sim_res

	def _base_simulate(self, moenv, start_time, final_time, 
						set_param_dict, res_names, 
						check_pressure = False,
						debug = False):
		res_names_effective = copy.deepcopy(res_names)
		if check_pressure is True:
			res_names_effective.append('sup_P_err.y')
		sim_res_dir = moenv.simulate(start_time=start_time, 
					final_time=final_time, 
					set_param_dict = set_param_dict,
					res_names = res_names_effective)
		try:
			res_pd = pd.read_csv('{}{}{}_res.csv'\
					.format(sim_res_dir, os.sep, moenv.mo_name))
			res = res_pd[res_names].iloc[-1]
			if check_pressure is True:
				press_err = res_pd['sup_P_err.y'].iloc[-1]
				if press_err > 200:
					raise RuntimeError(f'Simulation supply pressure error is {press_err}Pa, '\
						'which is higher than the threshold 200, simulation terminates. '\
						'You should check the Modelica Model.')
				else:
					self._logger.info(f'Simulation supply pressure error is {press_err}Pa, '\
						'which is smaller than the threshold 200.')
		except:
			traceback.print_exc()
			raise RuntimeError('_base_simulate: '\
								'Simulation failed, set_param_dict:{}'\
								.format(set_param_dict))
		try:
			res = res.values
		except:
			res = res
		# clear result directory
		if not debug:
			shutil.rmtree(sim_res_dir, ignore_errors = False) 
		return res
