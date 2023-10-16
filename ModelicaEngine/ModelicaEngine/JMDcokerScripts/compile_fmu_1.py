#!/usr/bin/env python3
##########################################################################
# Script to simulate Modelica models with JModelica.
#
##########################################################################
# Import the function for compilation of models and the load_fmu method

from pymodelica import compile_fmu
import traceback
import logging

from pyfmi import load_fmu
import pymodelica

import os
import shutil
import sys
import csv
import numpy as np
import matplotlib.pyplot as plt

from MOUtils.mo_utils import clear_dir, mv_cmp_res

A_LOG_LEVEL = 'standard'

def compile_mo_wrapper(model_name, model_path, fmu_type='cs', 
                      is_soep = False, default_epw = 'models/shanghai_2017.epw',
                      default_mos = 'models/shanghai_2017.mos'):
  if is_soep is True:
    shutil.copyfile(default_epw, '%s%s%s.epw'
                    %(model_path, os.sep, model_name))
    shutil.copyfile(default_mos, '%s%s%s.mos'
                    %(model_path, os.sep, model_name))
  clear_dir(fmu_name = model_name, sou_dir = '.')
  try:
    compile_mo(model_name, fmu_type = fmu_type)
  except:
    pass
  comp_res_dir = mv_cmp_res(model_name, sou_dir = '.', 
                            tgt_dir = 'fmus', ver=None)
  return comp_res_dir

def compile_mo(model_name, fmu_type='cs'):
  a_log_level = A_LOG_LEVEL
  # Increase memory
  pymodelica.environ['JVM_ARGS'] = '-Xmx4096m'
  sys.stdout.flush()
  ######################################################################
  # Compile fmu
  compile_log_level = {'verbose': 'debug', 'standard': 'info',
                       'less': 'warning', 'essential': 'error'}
  fmu_name = compile_fmu(model_name,
                target = fmu_type,
                compiler_log_level= compile_log_level[a_log_level],
                compiler_options = {"generate_html_diagnostics" : False, #########!!!!!True,
                                    "nle_solver_tol_factor": 1e-2}) 
                                           # 1e-2 is the default
  htm_dir = os.path.splitext(os.path.basename(fmu_name))[0] + "_html_diagnostics"
  if os.path.exists(htm_dir):
      for fil in ["scripts.js", "style.css", "zepto.min.js"]:
          src = os.path.join(".jmodelica_html", fil)
          if os.path.exists(src):
              des = os.path.join(htm_dir, fil)
              shutil.copyfile(src, des)


if __name__ == "__main__":
  model_name = sys.argv[1]
  model_path = sys.argv[2]
  fmu_type = sys.argv[3]
  is_soep = eval(sys.argv[4])
  cmp_res_dir = compile_mo_wrapper(model_name, model_path, 
                    fmu_type=fmu_type, 
                    is_soep = is_soep)
  print('{}:{}'.format('Compilation_Result_Directory', cmp_res_dir))