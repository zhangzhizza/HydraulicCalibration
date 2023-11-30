from HydraulicSimulator.HydraulicSimulator import Simulator
import pandas as pd
import numpy as np
import time
import os
import json

res_dir = './run_1699339352.8566556'
res_type = 'testing'
base_mo_file_path = '../../../MoModels/nb_hydr_static_v6.mo'
input_cali_data = pd.read_csv('../2020P2_calibration_data_30m.csv')
input_test_data = pd.read_csv('../2021P2_calibration_data_30m.csv')
param_names = ['parameter:Real:chr_flow_nom',
               'parameter:Real:chr_dp_nom']

with open(f'{res_dir}/theta_result.json', 'r') as f:
	param_res_dict = json.load(f)
larger_pop_i = np.argmax(np.array(param_res_dict['population']))
mo_set_params = {}
for param_name_i in range(len(param_names)):
	param_name = param_names[param_name_i]
	mo_set_params[param_name] = param_res_dict['centers_org'][larger_pop_i][param_name_i]
print('mo_set_params:', mo_set_params)
res_dir = f'{res_dir}/calibrated_model'
sudo_pwd = '123456'
log_level = 'DEBUG'
tgt_sup_pre = None
simulator = Simulator(mo_path=base_mo_file_path, res_dir=res_dir, 
				sudo_pwd=sudo_pwd, log_level=log_level,
                      step_size = 1000,
                     fmu_path = None, mo_set_params = mo_set_params,
                      tgt_sup_pre = tgt_sup_pre, tgt_search_its = 20,
                      tgt_err_thres_perct = 1, search_fail_return = True
                     )
sim_inputs_cali = {'pump_speed_1.k': input_cali_data['NB2_S_1_NYZ_cwp_9_HzSPR_x'].values/50,
			 'pump_speed_2.k': input_cali_data['NB2_S_1_NYZ_cwp_10_HzSPR_x'].values/50,
			 'pump_speed_3.k': input_cali_data['NB2_S_1_NYZ_cwp_11_HzSPR_x'].values/50,
			 'pump_speed_4.k': input_cali_data['NB2_S_1_NYZ_cwp_12_HzSPR_x'].values/50,
             'val_pos_1.k': input_cali_data['cwp_9_val_pos'],
             'val_pos_2.k': input_cali_data['cwp_10_val_pos'],
             'val_pos_3.k': input_cali_data['cwp_11_val_pos'],
             'val_pos_4.k': input_cali_data['cwp_12_val_pos'],
             'ret_p.k': input_cali_data['NB2_S_1_NYZ_sys_x_PcwIn_x'].values,
              'chw_sup_PSP.k': input_cali_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values
			}
sim_inputs_test = {'pump_speed_1.k': input_test_data['NB2_S_1_NYZ_cwp_9_HzSPR_x'].values/50,
			 'pump_speed_2.k': input_test_data['NB2_S_1_NYZ_cwp_10_HzSPR_x'].values/50,
			 'pump_speed_3.k': input_test_data['NB2_S_1_NYZ_cwp_11_HzSPR_x'].values/50,
			 'pump_speed_4.k': input_test_data['NB2_S_1_NYZ_cwp_12_HzSPR_x'].values/50,
             'val_pos_1.k': input_test_data['cwp_9_val_pos'],
             'val_pos_2.k': input_test_data['cwp_10_val_pos'],
             'val_pos_3.k': input_test_data['cwp_11_val_pos'],
             'val_pos_4.k': input_test_data['cwp_12_val_pos'],
             'ret_p.k': input_test_data['NB2_S_1_NYZ_sys_x_PcwIn_x'].values,
              'chw_sup_PSP.k': input_test_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values
			}
outputs = ['chw_sup_m.m_flow', 'chw_sup_P.k', 'terminal_resist.y_actual']
time_s = time.time()
sim_res_cali = simulator.simulate(inputs=sim_inputs_cali, output_names=outputs, threads_n = 1, check_pressure = False)
np.savetxt(res_dir + os.sep + 'sim_res_cali.csv', 
            sim_res_cali, delimiter = ',')
sim_res_test = simulator.simulate(inputs=sim_inputs_test, output_names=outputs, threads_n = 1, check_pressure = False)
np.savetxt(res_dir + os.sep + 'sim_res_test.csv', 
            sim_res_test, delimiter = ',')
print('Running time: {}s'.format(time.time() - time_s))

