from HydraulicSimulator.HydraulicSimulator import Simulator
import pandas as pd
import numpy as np
import time
import os

mo_path = './calibrated_model/nb_hydr_static_v5_cali_exp1_res.mo'
res_dir = './calibrated_model'
sudo_pwd = '63z64q92zza'
log_level = 'DEBUG'
calibration_data = pd.read_csv('../2021P2_calibration_data_30m.csv')
tgt_sup_pre = {'tgt_sup_pre_sp': calibration_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values,
			 'tgt_sup_pre_pv_name': 'chw_sup_P.p',
			 'sup_pre_cv_name': 'terminal_resist_ratio.k',
			 'sup_pre_cv_range': [0.1, 1]}
simulator = Simulator(mo_path=mo_path, res_dir=res_dir, 
				sudo_pwd=sudo_pwd, log_level=log_level,
                      step_size = 500,
                     fmu_path = None, mo_set_params = {},
                      tgt_sup_pre = tgt_sup_pre, tgt_search_its = 20,
                      tgt_err_thres_perct = 1, search_fail_return = False
                     )
sim_inputs = {'pump_speed_1.k': calibration_data['NB2_S_1_NYZ_cwp_9_HzSPR_x'].values/50,
			 'pump_speed_2.k': calibration_data['NB2_S_1_NYZ_cwp_10_HzSPR_x'].values/50,
			 'pump_speed_3.k': calibration_data['NB2_S_1_NYZ_cwp_11_HzSPR_x'].values/50,
			 'pump_speed_4.k': calibration_data['NB2_S_1_NYZ_cwp_12_HzSPR_x'].values/50,
             'val_pos_1.k': calibration_data['cwp_9_val_pos'],
             'val_pos_2.k': calibration_data['cwp_10_val_pos'],
             'val_pos_3.k': calibration_data['cwp_11_val_pos'],
             'val_pos_4.k': calibration_data['cwp_12_val_pos'],
             'ret_p.k': calibration_data['NB2_S_1_NYZ_sys_x_PcwIn_x'].values,
              'chw_sup_P.p': calibration_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values
			}
outputs = ['chw_sup_m.m_flow', 'chw_sup_P.p', 'terminal_resist.y_actual']
time_s = time.time()
sim_res = simulator.simulate(inputs=sim_inputs, output_names=outputs, threads_n = None)
print('Running time: {}s'.format(time.time() - time_s))
np.savetxt(res_dir + os.sep + 'sim_res_testing.csv', sim_res, delimiter = ',')