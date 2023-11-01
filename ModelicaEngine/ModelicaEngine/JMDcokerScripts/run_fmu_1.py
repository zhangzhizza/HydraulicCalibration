#!/usr/bin/env python
##########################################################################
# Script to simulate Modelica models with JModelica.
#
##########################################################################
from pyfmi import load_fmu

import os
import sys
import csv
import argparse
import traceback
import time

import numpy as np

from MOUtils.mo_utils import mv_sim_res

def run_fmu(fmu_path, start_time, final_time,
            ncp = 0, set_list = [],
            result_filter = [],
            log_level = 'DEBUG', 
            debug_solver = False):
  fmu_log_level = {'DEBUG': 7, 'INFO': 3, 'WARNING': 2, 'ERROR': 1}
  if log_level not in fmu_log_level.keys():
    log_level = 'INFO'
  fmu_name = fmu_path.split('.fmu')[0].split(os.sep)[-1]
  mod = load_fmu(fmu_path, log_level=fmu_log_level[log_level])
  if len(set_list)>0:
    mod.set(set_list[0], set_list[1])
  mod.set_max_log_size(2073741824) # = 2*1024^3 (about 2GB)
  ######################################################################
  # Retrieve and set solver options
  x_nominal = mod.nominal_continuous_states
  opts = mod.simulate_options() #Retrieve the default options
  opts['solver'] = 'CVode'#'Radau5ODE' #CVode
  opts['ncp'] = ncp
  opts['filter'] = result_filter
  opts['initialize'] = True
  if opts['solver'].lower() == 'cvode':
    # Set user-specified tolerance if 
    # it is smaller than the tolerance in the .mo file
    rtol = 1.0e-8
    x_nominal = mod.nominal_continuous_states
    if len(x_nominal) > 0:
      atol = rtol*x_nominal
    else:
      atol = rtol
    opts['CVode_options']['external_event_detection'] = False
    if ncp > 0:
      opts['CVode_options']['maxh'] = ((mod.get_default_experiment_stop_time()
                                  -mod.get_default_experiment_start_time())
                                    /float(opts['ncp']))
    opts['CVode_options']['iter'] = 'Newton'
    opts['CVode_options']['discr'] = 'BDF'
    opts['CVode_options']['rtol'] = rtol
    opts['CVode_options']['atol'] = atol
    opts['CVode_options']['store_event_points'] = True # True is default, set to false if many events

    if debug_solver:
      opts['CVode_options']['clock_step'] = True
  if debug_solver:
    opts["logging"] = True #<- Turn on solver debug logging
    mod.set("_log_level", 7)
  ######################################################################
  # Simulate
  try:
    res = mod.simulate(options=opts, 
                      start_time = start_time, 
                      final_time = final_time)
    ######################################################################
    # Process output
    res_keys = res.keys()
    res_list = []
    for res_key_i in res_keys:
      res_list.append(res[res_key_i])
    res_list = np.array(res_list).T.tolist()
    with open('%s_res.csv'%fmu_name, 'w') as f:
      # using csv.writer method from CSV package
      write = csv.writer(f)
      write.writerow(res_keys)
      write.writerows(res_list)
  except Exception:
    print(traceback.format_exc())
    for log_line in mod.get_log():
      print(log_line)
  ######################################################################
  # Clean the directory
  sim_res_dir = mv_sim_res(fmu_name, sou_dir = '.',
                            tgt_dir = 'mo_sim_res')
  return sim_res_dir


if __name__ == "__main__":
  # Create the parser
  parser = argparse.ArgumentParser(description='Run FMU script')
  parser.add_argument('-p', '--path', action = 'store', required=True,
                      type = str,
                      help = 'FMU file path')
  parser.add_argument('-st', '--start_time', action = 'store', 
                      default = 0, type = int, 
                      help = 'Simulation start time in second, '\
                             'default is 0')
  parser.add_argument('-ft', '--final_time', action = 'store', 
                      default = 3600, type = int, 
                      help = 'Simulation final time in second, '\
                             'default is 3600')
  parser.add_argument('-ll', '--log_level', action = 'store', 
                      default = 'INFO', type = str, 
                      help = 'Log level, choice of DEBUG, INFO, '\
                      'WARNING, ERROR')
  parser.add_argument('-d', '--is_debug', action = 'store_true',
                      default = False, help = 'Activate debug mode')
  parser.add_argument('-s', '--set_params', action = 'store',\
                      nargs = '*', default = [],
                      help = 'Parameters to be set, '\
                      'format: {parameter_name}:{parameter_val} '\
                      '{parameter_name}:{parameter_val} ...')
  parser.add_argument('-r', '--res_filter', action = 'store',\
                      nargs = '*', default = [],
                      help = 'Result filter, '\
                      'format: {result_parameter_name} '\
                      '{result_parameter_name} ...')
  args = parser.parse_args()
  fmu_path = args.path
  start_time = args.start_time
  final_time = args.final_time
  log_level = args.log_level
  if log_level not in ['DEBUG', 'INFO', 'WARNING', 'ERROR']:
    log_level = 'INFO'
  debug_solver = args.is_debug
  set_params = args.set_params
  set_list = []
  for param in set_params:
    param = param.split(':')
    set_key = param[0]
    set_val = float(param[1])
    if len(set_list) == 0:
      set_list = [[set_key], [set_val]]
    else:
      set_list[0].append(set_key)
      set_list[1].append(set_val)
  res_filter = args.res_filter
  sim_res_dir = run_fmu(fmu_path, start_time, 
                    final_time, set_list = set_list,
                    result_filter = res_filter,
                    log_level = log_level,
                    debug_solver = debug_solver)
  print('{}:{}'.format('Simulation_Result_Directory', sim_res_dir))
  print('{}:{}'.format('Simulation_Result_Directory', sim_res_dir))
  print('{}:{}'.format('Simulation_Result_Directory', sim_res_dir))
