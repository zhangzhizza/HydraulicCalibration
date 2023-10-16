mcmcPackage = 'pystan';
from BayesianCalibration.DataPreprocessor import Preprocessor
from BayesianCalibration.MCMCPyStan import MCMC4Posterior
from BayesianCalibration.Utils.Logger import Logger
import numpy as np
import os 
import pickle as pk
import time

LOG_LEVEL = 'DEBUG';
LOG_FMT = "[%(asctime)s] %(name)s %(levelname)s:%(message)s"

field_data_file = './cali_field_data_all.csv'#'DEBUG_D_field_org_down (copy).csv'#
sim_data_file = './cali_sim_data_down.csv'#'DEBUG_D_sim_org_down (copy).csv'#'
cmbYArgs = None
ydim = 1
x_ranges = {2: [0, 50]}
iterations = 750
chains = 4

stan_in_path = './stan_model/chong_nodelta_allUniformPrior.stan'
stan_model_path = None

save_dir = './run_{}'.format(time.time())
os.makedirs(save_dir)

logger = Logger().getLogger('Calibration', 
            LOG_LEVEL, LOG_FMT, save_dir + os.sep + 'log.log')

prep = Preprocessor(logger);
(z, xf, xc, t, z_copy_afternorm, z_copy_beforestd, z_copy_afterstd,
    tc_min, tc_ptp) = \
        prep.getDataFromFile(field_data_file, sim_data_file, 
                            cmbYArgs, ydim, x_ranges)

if LOG_LEVEL == 'DEBUG':
    np.savetxt("{}/z.csv".format(save_dir), z, delimiter=",")
    np.savetxt("{}/xf.csv".format(save_dir), xf, delimiter=",")
    np.savetxt("{}/xc.csv".format(save_dir), xc, delimiter=",")
    np.savetxt("{}/t.csv".format(save_dir), t, delimiter=",")
    if z_copy_afternorm is not None:
        np.savetxt('{}/z_copy_afternorm.csv'.format(save_dir), z_copy_afternorm, delimiter=",")
    np.savetxt('{}/z_copy_beforestd.csv'.format(save_dir), z_copy_beforestd, delimiter=",")
    np.savetxt('{}/z_copy_afterstd.csv'.format(save_dir), z_copy_afterstd, delimiter=",")


trace = None;
trace_file_name = 'trace.pkl'

mcmc_obj = MCMC4Posterior(z, xf, xc, t, logger)
trace = mcmc_obj.build_run(stan_in_path = stan_in_path, 
                                iterations = iterations, 
                                chains = chains)

with open(save_dir + os.sep + 'posteriors.txt', 'w') as txtfile:
    txtfile.write(str(trace))
with open(save_dir + os.sep + trace_file_name, 'wb') as tracefile:
    pk.dump(trace, tracefile)