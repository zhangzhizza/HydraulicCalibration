from HydraulicSimulator.HydraulicSimulator import Simulator
import pandas as pd
import numpy as np
import time
import os

mo_path = '../../../MoModels/tongwei_shuili_balance_v5.mo'
res_dir = './run_1'
sudo_pwd = '63z64q92zza'
log_level = 'INFO'#'DEBUG'
fmu_path = None #'./run_1/compilation/tongwei_shuili_balance_v5.fmu'
calibration_data = pd.read_csv('calibration_data_1.csv')[2:3]
tgt_sup_pre = {'tgt_sup_pre_sp': calibration_data['secd_sup_p'].values,
             'tgt_sup_pre_pv_name': 'chw_sup_P.p',
             'sup_pre_cv_name': 'terminal_resist_ratio.k',
             'sup_pre_cv_range': [0.1, 1]}
simulator = Simulator(mo_path=mo_path, res_dir=res_dir, 
                sudo_pwd=sudo_pwd, log_level=log_level,
                      step_size = 500,
                     fmu_path = fmu_path, mo_set_params = {},
                      tgt_sup_pre = tgt_sup_pre, tgt_search_its = 20,
                      tgt_err_thres_perct = 1, search_fail_return = True)
sim_inputs = {'chwp12_speed_const.k': calibration_data['secd_pump_1_hz'].values/50,
             'chwp13_speed_const.k': calibration_data['secd_pump_2_hz'].values/50,
             'chwp14_speed_const.k': calibration_data['secd_pump_3_hz'].values/50,
             'chwp15_speed_const.k': calibration_data['secd_pump_4_hz'].values/50,
             'chwp16_speed_const.k': calibration_data['secd_pump_5_hz'].values/50,
             'chwp17_speed_const.k': calibration_data['secd_pump_6_hz'].values/50,
             'chwp18_speed_const.k': calibration_data['secd_pump_7_hz'].values/50,
             'chwp12_val_pos.k': calibration_data['secd_pump_1_val'],
             'chwp13_val_pos.k': calibration_data['secd_pump_2_val'],
             'chwp14_val_pos.k': calibration_data['secd_pump_3_val'],
             'chwp15_val_pos.k': calibration_data['secd_pump_4_val'],
             'chwp16_val_pos.k': calibration_data['secd_pump_5_val'],
             'chwp17_val_pos.k': calibration_data['secd_pump_6_val'],
             'chwp18_val_pos.k': calibration_data['secd_pump_7_val'],
             'chwp1_speed_const.k': 1*(calibration_data['hrchr_1_perct'].values>0),
             'chwp2_speed_const.k': 1*(calibration_data['hrchr_2_perct'].values>0),
             'chwp3_speed_const.k': 1*(calibration_data['hrchr_3_perct'].values>0),
             'chwp4_speed_const.k': 1*(calibration_data['hrchr_4_perct'].values>0),
             'chwp5_speed_const.k': 1*(calibration_data['hrchr_5_perct'].values>0),
             'chwp6_speed_const.k': 1*(calibration_data['hrchr_6_perct'].values>0),
             'chwp7_speed_const.k': 1*(calibration_data['hrchr_7_perct'].values>0),
             'chwp8_speed_const.k': 1*(calibration_data['hrchr_8_perct'].values>0),
             'chwp9_speed_const.k': 1*(calibration_data['hrchr_9_perct'].values>0),
             'chwp10_speed_const.k': 1*(calibration_data['hrchr_10_perct'].values>0),
             'chwp11_speed_const.k': 1*(calibration_data['hrchr_11_perct'].values>0),
             'chwp1_val_pos.k':  np.clip(1*(calibration_data['hrchr_1_perct'].values>0), 0.001, 1),
             'chwp2_val_pos.k':  np.clip(1*(calibration_data['hrchr_2_perct'].values>0), 0.001, 1),
             'chwp3_val_pos.k':  np.clip(1*(calibration_data['hrchr_3_perct'].values>0), 0.001, 1),
             'chwp4_val_pos.k':  np.clip(1*(calibration_data['hrchr_4_perct'].values>0), 0.001, 1),
             'chwp5_val_pos.k':  np.clip(1*(calibration_data['hrchr_5_perct'].values>0), 0.001, 1),
             'chwp6_val_pos.k':  np.clip(1*(calibration_data['hrchr_6_perct'].values>0), 0.001, 1),
             'chwp7_val_pos.k':  np.clip(1*(calibration_data['hrchr_7_perct'].values>0), 0.001, 1),
             'chwp8_val_pos.k':  np.clip(1*(calibration_data['hrchr_8_perct'].values>0), 0.001, 1),
             'chwp9_val_pos.k':  np.clip(1*(calibration_data['hrchr_9_perct'].values>0), 0.001, 1),
             'chwp10_val_pos.k':  np.clip(1*(calibration_data['hrchr_10_perct'].values>0), 0.001, 1),
             'chwp11_val_pos.k':  np.clip(1*(calibration_data['hrchr_11_perct'].values>0), 0.001, 1),
             'ret_p.k': calibration_data['secd_ret_p'].values,
              'chw_sup_P.p': calibration_data['secd_sup_p'].values
            }
outputs = ['chw_sup_m.m_flow', 'chw_sup_P.p', 'terminal_resist1.y_actual', 'bypass_pipe.dp_nominal',
            'bypass_pipe.dp', 'chw_ret_pipe.port_b.p', 'prim_ret_pipe.port_b.p', 'chwp_1.dp', 'chwp_1.port_b.p',
            'chiller_1.dp', 'chiller_1.dp_nominal', 'prim_sup_pipe.port_b.p', 'secd_ret_pipe.port_b.p',
            'chwp_18.dp', 'chwp_18.port_b.p','chwp_18_pipe.port_b.p', 'chwp_18_pipe.dp', 'chwp_18_pipe.dp_nominal',
            'secd_sup_pipe.port_b.p', 'terminal_resist1.dp', 
             'bypass_pipe.m_flow', 'chiller_1.m_flow', 'chwp_18_pipe.m_flow',
             'chwp_1.m_flow', 'chwp_1.y_actual']
time_s = time.time()
sim_res = simulator.simulate(inputs=sim_inputs, output_names=outputs, threads_n = None)
print('Running time: {}s'.format(time.time() - time_s))
np.savetxt(res_dir + os.sep + 'sim_res_testing.csv', sim_res, delimiter = ',')