from HydraulicSimulator.HydraulicSimulator import Simulator
from SensitivitySimulation.Simulation import SensitivitySimulation
import pandas as pd

class Sampler():
    
    def generate_params(self, samples_n):
        return [[50, 50, 0.025], [30, 40, 0.01], [40, 60, 0.03]]


mo_path = '../../../MoModels/nb_hydr_static_v3.mo'
sudo_pwd = '63z64q92zza'
log_level = 'DEBUG'
calibration_data = pd.read_csv('2020P2_calibration_data_30m.csv')[0:20]
tgt_sup_pre = {'tgt_sup_pre_sp': calibration_data['NB2_S_1_NYZ_sys_x_PcwOut_x'].values,
			 'tgt_sup_pre_pv_name': 'chw_sup_P.p',
			 'sup_pre_cv_name': 'terminal_resist_ratio.k',
			 'sup_pre_cv_range': [0.1, 1]}
simulator = Simulator(mo_path=mo_path, res_dir=None, 
				sudo_pwd=sudo_pwd, log_level=log_level,
                      step_size = 1000,
                     fmu_path = None, mo_set_params = {},
                      tgt_sup_pre = tgt_sup_pre, tgt_search_its = 10,
                      tgt_err_thres_perct = 5, search_fail_return = False
                     )
param_names = ['Buildings.Fluid.FixedResistances.Pipe:chiller_1:length',
               'Buildings.Fluid.FixedResistances.Pipe:chiller_2:length',
               'parameter:Real:chr_roughness']
res_dir = 'nb_hydr_static_v3_sssim'
sim_inputs = {'pump_speed_12.k': calibration_data['NB2_S_1_NYZ_cwp_9_HzSPR_x'].values/50,
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
sampler = Sampler()
sssim = SensitivitySimulation(sampler, simulator, param_names, res_dir,
                             sim_inputs, outputs)
sssim.run(samples_n=3, max_workers=3)