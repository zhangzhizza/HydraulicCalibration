from SensitivitySimulation.Simulation import SensitivitySimulation
from SensitivitySimulation.Sampler import SamplesGenerator
from HydraulicSimulator.HydraulicSimulator import Simulator
import pandas as pd
mo_path = '../../../MoModels/nb_hydr_static_v5.mo'
res_dir = 'nb_hydr_static_v5_sssim_cali_exp_3_1'
param_json_path = 'calibration_param_dist_exp_3.json'# 'calibration_param_dist_exp_2.json'
sudo_pwd = '123456'
log_level = 'DEBUG'
search_fail_return = True
data_range_l = 0
data_range_h = 200
calibration_data = pd.read_csv('2020P2_calibration_data_30m.csv')[data_range_l:data_range_h]
tgt_sup_pre = {'tgt_sup_pre_sp': calibration_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values,
			 'tgt_sup_pre_pv_name': 'chw_sup_P.p',
			 'sup_pre_cv_name': 'terminal_resist_ratio.k',
			 'sup_pre_cv_range': [0.1, 1]}
simulator = Simulator(mo_path=mo_path, res_dir=None, 
				sudo_pwd=sudo_pwd, log_level=log_level,
                      step_size = 500,
                     fmu_path = None, mo_set_params = {},
                      tgt_sup_pre = tgt_sup_pre, tgt_search_its = 20,
                      tgt_err_thres_perct = 1, search_fail_return = search_fail_return
                     )
param_names = ['parameter:Real:chiller_pipe_len',
               'parameter:Real:chiller_v_nominal']

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
sampler = SamplesGenerator(param_json_path)
sssim = SensitivitySimulation(sampler, simulator, param_names, res_dir,
                             sim_inputs, outputs)
sssim.run(samples_n=500, max_workers=3)
