# Author: Zhiang Zhang
# First creation: Mar-29 2022
# This file contains utility functions to deal with modelica simulaiton
import shutil
import os

def get_latest_ver(fmu_name, tgt_dir):
    """
    Get the fmu directory with the largest version number.
    E.g., {fmu_name}_v4, {fmu_name}_v5 will return {fmu_name}_v5.

    Args:
    ----------
    fmu_name: str
        FMU name
    tgt_dir: str
        Target directory
    """
    cur_max_vernum = None
    for dir_i in os.listdir(tgt_dir):
        if os.path.isdir('%s%s%s'%(tgt_dir, os.sep, dir_i)):
            if '%s_'%fmu_name in dir_i:
                ver_name = dir_i.split('%s_'%fmu_name)[-1]
                ver_num = None
                try:
                    ver_num = int(ver_name[1:])
                except:
                    ver_num = None
                if ver_num is not None:
                    if cur_max_vernum is None:
                        cur_max_vernum = ver_num
                    elif ver_num > cur_max_vernum:
                        cur_max_vernum = ver_num
    return cur_max_vernum
    
def mk_res_dir(base_dir, dir_name, ver_sig = 'v', ver_num=None):
    if not os.path.exists(base_dir):
        os.mkdir(base_dir)
    if ver_num is None:
        cur_max_vernum = 0
        for dir_i in os.listdir(base_dir):
            if os.path.isdir('%s%s%s'%(base_dir, os.sep, dir_i)):
                if '%s_'%dir_name in dir_i:
                    ver_name = dir_i.split('%s_'%dir_name)[-1]
                    ver_num = None
                    try:
                        ver_num = int(ver_name[len(ver_sig):])
                    except:
                        ver_num = None
                    if ver_num is not None:
                        if ver_num > cur_max_vernum:
                            cur_max_vernum = ver_num
        cur_vernum = cur_max_vernum + 1
        cur_res_name = '%s_%s%s'%(dir_name, ver_sig, cur_vernum)
    else:
        cur_res_name = '%s_%s%s'%(dir_name, ver_sig, ver_num)
    tgt_res_dir = '%s%s%s'%(base_dir, os.sep, cur_res_name)
    os.mkdir(tgt_res_dir)
    return tgt_res_dir

def mv_sim_res(fmu_name, sou_dir, tgt_dir):
    """
    Move Modelica simulation results file to the target directory

    Args:
    ----------
    fmu_name: str
        fmu name
    sou_dir: str
        source results directory
    tgt_dir: str
    	target results directory
    ver: str
        If specify, all results will be moved to tgt_dir/fmu_name_{ver}
        folder. If None, it will move results to tgt_dir/fmu_name_{v{x}}
        where x will automatically increment from 1. 

    Returns:
    ----------
    None
    """
    # prepare res directory #
    #########################
    tgt_dir = mk_res_dir(tgt_dir, dir_name = fmu_name, ver_sig = 'v')
    # move files #
    ##############
    eplus_fmu_sou_path = '%s%sEnergyPlus-simulation-%s.building'\
                                %(sou_dir, os.sep, fmu_name)
    eplus_fmu_tgt_path = '%s%sEnergyPlus-simulation-%s.building'\
                                %(tgt_dir, os.sep, fmu_name)
    if os.path.exists(eplus_fmu_sou_path):
        shutil.move(eplus_fmu_sou_path, eplus_fmu_tgt_path)
    log_sou_path = '%s%s%s_log.txt'%(sou_dir, os.sep, fmu_name)
    log_tgt_path = '%s%s%s_log.txt'%(tgt_dir, os.sep, fmu_name)
    if os.path.exists(log_sou_path):
        shutil.move(log_sou_path, log_tgt_path)
    debug_sou_path = '%s%s%s_debug.txt'%(sou_dir, os.sep, fmu_name)
    debug_tgt_path = '%s%s%s_debug.txt'%(tgt_dir, os.sep, fmu_name)
    if os.path.exists(debug_sou_path):
        shutil.move(debug_sou_path, debug_tgt_path)
    res_sou_path = '%s%s%s_result.mat'%(sou_dir, os.sep, fmu_name)
    res_tgt_path = '%s%s%s_result.mat'%(tgt_dir, os.sep, fmu_name)
    if os.path.exists(res_sou_path):
        shutil.move(res_sou_path, res_tgt_path)
    csv_sou_path = '%s%s%s_res.csv'%(sou_dir, os.sep, fmu_name)
    csv_tgt_path = '%s%s%s_res.csv'%(tgt_dir, os.sep, fmu_name)
    if os.path.exists(csv_sou_path):
        shutil.move(csv_sou_path, csv_tgt_path)
    return tgt_dir

def mv_cmp_res(model_name, sou_dir, tgt_dir, ver=None):
    """
    Move Modelica compilation results file to the target directory

    Args:
    ----------
    model_name: str
        model name
    sou_dir: str
        source results directory
    tgt_dir: str
        target results directory
    ver: str
        If specify, all results will be moved to tgt_dir/model_name_{ver}
        folder. If None, it will move results to tgt_dir/model_name_{v{x}}
        where x will automatically increment from 1. 

    Returns:
    ----------
    None
    """
    # prepare directory #
    #####################
    if not os.path.exists(tgt_dir):
        os.mkdir(tgt_dir)
    if ver is None:
        cur_max_vernum = 0
        for dir_i in os.listdir(tgt_dir):
            if os.path.isdir('%s%s%s'%(tgt_dir, os.sep, dir_i)):
                if '%s_'%model_name in dir_i:
                    ver_name = dir_i.split('%s_'%model_name)[-1]
                    ver_num = None
                    try:
                        ver_num = int(ver_name[1:])
                    except:
                        ver_num = None
                    if ver_num is not None:
                        if ver_num > cur_max_vernum:
                            cur_max_vernum = ver_num
        cur_vernum = cur_max_vernum + 1
        cur_res_name = '%s_v%s'%(model_name, cur_vernum)
    else:
        cur_res_name = '%s_%s'%(model_name, ver)
    tgt_res_dir = '%s%s%s'%(tgt_dir, os.sep, cur_res_name)
    os.mkdir(tgt_res_dir)
    # move files #
    ##############
    html_diag_sou_path = '%s%s%s_html_diagnostics'\
                                %(sou_dir, os.sep, model_name)
    html_diag_tgt_path = '%s%s%s_html_diagnostics'\
                                %(tgt_res_dir, os.sep, model_name)
    if os.path.exists(html_diag_sou_path):
        shutil.move(html_diag_sou_path, html_diag_tgt_path)
    fmu_sou_path = '%s%s%s.fmu'%(sou_dir, os.sep, model_name)
    fmu_tgt_path = '%s%s%s.fmu'%(tgt_res_dir, os.sep, model_name)
    if os.path.exists(fmu_sou_path):
        shutil.move(fmu_sou_path, fmu_tgt_path)
    return tgt_res_dir

def clear_dir(fmu_name, sou_dir):
    """
    Clear working directory, otherwise simulation may have a problem

    Args:
    ----------
    fmu_name: str
        fmu name
    sou_dir: str
        source directory

    """
    html_diag_file = '%s%s%s_html_diagnostics'\
                        %(sou_dir, os.sep, fmu_name)
    if os.path.exists(html_diag_file):
        shutil.rmtree(html_diag_file)
    eplus_fmu_file = '%s%sEnergyPlus-simulation-%s.building'\
                        %(sou_dir, os.sep, fmu_name)
    if os.path.exists(eplus_fmu_file):
        shutil.rmtree(eplus_fmu_file)
    log_file = '%s%s%s_log.txt'%(sou_dir, os.sep, fmu_name)
    if os.path.exists(log_file):
        os.remove(log_file)
    res_file = '%s%s%s_result.mat'%(sou_dir, os.sep, fmu_name)
    if os.path.exists(res_file):
        os.remove(res_file)
    fmu_file = '%s%s%s.fmu'%(sou_dir, os.sep, fmu_name)
    if os.path.exists(fmu_file):
        os.remove(fmu_file)