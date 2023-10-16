from BayesianCalibration.DataPreprocessor import Preprocessor
from BayesianCalibration.PostProcessor import TraceProcessor
from BayesianCalibration.Utils.Logger import Logger
import numpy as np
import os 
import pickle as pk
import time
import json

LOG_LEVEL = 'DEBUG';
LOG_FMT = "[%(asctime)s] %(name)s %(levelname)s:%(message)s"

run_dir = './run_1661103729.7374938'
field_data_file = './cali_field_data_all.csv'#'DEBUG_D_field_org_down (copy).csv'#
sim_data_file = './cali_sim_data_down.csv'#'DEBUG_D_sim_org_down (copy).csv'#'
ydim = 1
x_ranges = {2: [0, 50]}
result_centers = 3
dist_bins = 50

logger = Logger().getLogger('ProcessTrace', 
            LOG_LEVEL, LOG_FMT, None)
prep = Preprocessor(logger);
(z, xf, xc, t, z_copy_afternorm, z_copy_beforestd, z_copy_afterstd,
    tc_min, tc_ptp) = \
        prep.getDataFromFile(field_data_file, sim_data_file, 
                            cmbYMethodNArgs=None, ydim=ydim, x_ranges=x_ranges)

trace_path = run_dir + os.sep + 'trace.pkl'
trace = TraceProcessor(trace_path = trace_path, save_dir = run_dir)
trace.draw_hist1D(hist_bins = dist_bins, 
                  subplots_per_figure = (3, 3),
                  color = 'b')
trace.draw_hist2D(element_x = 'theta.1', element_y = 'theta.2',
                    hist_bins = dist_bins)
theta_result = trace.get_theta_result(center_n = result_centers, 
                                    theta_min_ptp = {'min': tc_min, 'ptp': tc_ptp})
with open(run_dir + os.sep + 'theta_result.json', 'w') as fp:
    json.dump(theta_result, fp)