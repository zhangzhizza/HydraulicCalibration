# Author: Zhiang Zhang
# First creation: Mar-29 2022
# This file contains utility functions to deal with weather

import math

GLOBAL_SOL_CONST = 1355 # W/m2

def get_dew_point_c(t_air_c, rel_humidity):
    """
    Compute the dew point in degrees Celsius

    Args:
    ----------
    t_air_c: float
    	Dry bulb temperature in C
    rel_humidity: float
    	Relative humidity in 0 - 1

    Returns:
    ----------
    dew_point: float
    	Dew point temperature in C
    """
    A = 17.27
    B = 237.7
    alpha = ((A * t_air_c) / (B + t_air_c)) + math.log(rel_humidity)
    return (B * alpha) / (A - alpha)

def get_sol_breakdown(total_sol, sol_alt):
    """
    Break down total solar radiation into direct solar and diffuse
    solar radiation using Watanabe method
    (https://gundog.lbl.gov/dirpubs/51436.pdf)

    Args:
    ----------
    total_sol: float
        Total solar radiation in W/m2
    sol_alt: float
        Solar altitude in degree

    Returns:
    ----------
    dir_sol: float
        Direct solar radiation in W/m2
    dif_sol: float
        Diffuse solar radiation in W/m2

    """
    # Dir sol
    if (total_sol>0):
        kt = _get_Kt(total_sol, sol_alt);
        ktc = _get_Ktc(sol_alt);
        kds = _get_Kds(kt, sol_alt, ktc);
        dh = (GLOBAL_SOL_CONST*math.sin(math.radians(sol_alt))
                                        *kds*(1-kt)/(1-kds));
        sh = (GLOBAL_SOL_CONST*math.sin(math.radians(sol_alt))
                                        *(kt-kds)/(1-kds));
        if (dh>0):
            dir_sol = dh;
        else:
            dir_sol = 0.0;
        if (sh>0):
            dif_sol = sh;
        else:
            dif_sol = 0.0;          
    else:
        dir_sol = 0.0;
        dif_sol = 0.0;
    return (dir_sol, dif_sol);
    

def _get_Kt(total_sol, sol_alt):
    return total_sol/(GLOBAL_SOL_CONST*math.sin(math.radians(sol_alt)));

def _get_Ktc(sol_alt):
    return 0.4268 + 0.1934*math.sin(math.radians(sol_alt));

def _get_Kds(kt, sol_alt, ktc):
    if (kt>=ktc):
        return (kt-(1.107+0.03569*math.sin(math.radians(sol_alt))+
                    1.681*math.pow(math.sin(math.radians(sol_alt)), 2))*
                    math.pow((1-kt), 2));
    else:
        return ((3.996-3.862*math.sin(math.radians(sol_alt))+
                    1.540*math.pow(math.sin(math.radians(sol_alt)), 2))*
                    math.pow(kt, 3));