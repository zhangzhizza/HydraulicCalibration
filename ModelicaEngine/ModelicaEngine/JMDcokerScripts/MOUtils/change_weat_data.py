# Author: Zhiang Zhang
# First creation: 2022-03-27
# Functions to modify simulation weather data
import os
import subprocess
import shutil
import datetime
import copy
import time
import numpy as np
from epw import epw

this_file_dir = os.path.dirname(os.path.realpath(__file__))
CONVERTWEATHERDATA_PATH = this_file_dir + os.sep + 'ConvertWeatherData.jar'

def change_epw(org_epw_file, tgt_epw_file,
				start_mon, start_day, start_hour,
				end_mon, end_day, end_hour, tgt_columns,
				tgt_values):
	"""
	Args:
	----------
	start_mon: int
		Start month (inclusive), 1-12.
	start_day: int
		Start day (inclusive).
	start_hour: int
		Start hour (inclusive), 1-24.
	end_mon: int
		End month (inclusive), 1-12.
	end_day: int
		End_day (inclusive).
	end_hour: int
		End hour (inclusive), 1-24.
	tgt_columns: list
		List of columns to be changed.
		Available column names:
		'Dry Bulb Temperature',
       'Dew Point Temperature', 'Relative Humidity',
       'Atmospheric Station Pressure', 
       'Extraterrestrial Horizontal Radiation',
       'Extraterrestrial Direct Normal Radiation',
       'Horizontal Infrared Radiation Intensity', 
       'Global Horizontal Radiation', 
       'Direct Normal Radiation',
       'Diffuse Horizontal Radiation', 
       'Global Horizontal Illuminance',
       'Direct Normal Illuminance', 
       'Diffuse Horizontal Illuminance',
       'Zenith Luminance', 'Wind Direction', 'Wind Speed', 
       'Total Sky Cover',
       'Opaque Sky Cover (used if Horizontal IR Intensity missing)',
       'Visibility', 'Ceiling Height', 'Present Weather Observation',
       'Present Weather Codes', 'Precipitable Water', 
       'Aerosol Optical Depth',
       'Snow Depth', 'Days Since Last Snowfall', 'Albedo',
       'Liquid Precipitation Depth', 'Liquid Precipitation Quantity'
    tgt_values: ndarray
    	2D array, each column corresponds to the values to be changed
    	for the target column
	"""
	org_epw = epw()
	org_epw.read(r'%s' %org_epw_file)
	start_index = org_epw.dataframe.index[
					(org_epw.dataframe['Month']==start_mon) &
					(org_epw.dataframe['Day']==start_day) &
					(org_epw.dataframe['Hour']==start_hour)].tolist()[0]
	end_index = org_epw.dataframe.index[
					(org_epw.dataframe['Month']==end_mon) &
					(org_epw.dataframe['Day']==end_day) &
					(org_epw.dataframe['Hour']==end_hour)].tolist()[0]
	for tgt_i in range(len(tgt_columns)):
		tgt_column = tgt_columns[tgt_i]
		org_epw.dataframe.loc[start_index: end_index-1,
								tgt_column] = tgt_values[:, tgt_i]
	org_epw.write(tgt_epw_file)	

def generate_mos(org_epw_file, tgt_mos_file):
	subprocess.call('java -jar %s %s'
                        %(CONVERTWEATHERDATA_PATH,
                        	org_epw_file),
                        shell = True,
                        cwd = './',
                        stdout = subprocess.PIPE,
                        stderr = subprocess.PIPE,
                        preexec_fn=os.setsid)
	mos_file_name = org_epw_file.split('.epw')[0]\
								+ '.mos'
	os.rename(mos_file_name, tgt_mos_file)


EPW_NAMES = ['Dry Bulb Temperature',
       'Dew Point Temperature', 'Relative Humidity',
       'Atmospheric Station Pressure', 
       'Extraterrestrial Horizontal Radiation',
       'Extraterrestrial Direct Normal Radiation',
       'Horizontal Infrared Radiation Intensity', 
       'Global Horizontal Radiation', 
       'Direct Normal Radiation',
       'Diffuse Horizontal Radiation', 
       'Global Horizontal Illuminance',
       'Direct Normal Illuminance', 
       'Diffuse Horizontal Illuminance',
       'Zenith Luminance', 'Wind Direction', 'Wind Speed', 
       'Total Sky Cover',
       'Opaque Sky Cover (used if Horizontal IR Intensity missing)',
       'Visibility', 'Ceiling Height', 'Present Weather Observation',
       'Present Weather Codes', 'Precipitable Water', 
       'Aerosol Optical Depth',
       'Snow Depth', 'Days Since Last Snowfall', 'Albedo',
       'Liquid Precipitation Depth', 'Liquid Precipitation Quantity']
EPW_DEFAULT_VALS = [33.0,24.1785625528434,60.0,101300.0,0,0,400.0,0,0.0,
					0.0,0,0,0,0,180,0.0,3,3,3.2,1165,9,999999999,120,
					0.0,0,88,999.0,0.0,1.0]
EPW_DEFAULT_HEADER = '''LOCATION,SHANGHAI,-,CHN,Custom-583620,583620,31.40,121.47,8.0,4.0
DESIGN CONDITIONS,1,Climate Design Data 2013 ASHRAE Handbook,,Heating,1,-2,-0.6,-12.9,1.2,1.2,-10.3,1.6,2.1,7.9,4.8,7.3,4.6,2.9,270,Cooling,7,5.6,35.1,26.9,33.8,26.6,32.6,26.3,27.9,32.5,27.4,31.7,27,31.1,3.6,220,26.7,22.3,30.4,26.2,21.7,29.9,25.8,21.2,29.6,89.4,32.7,87.1,32,85.2,31.2,724,Extremes,7.6,6.8,6.1,30.1,-3.9,37,1.3,1.1,-4.8,37.8,-5.6,38.5,-6.3,39.1,-7.3,39.9
TYPICAL/EXTREME PERIODS,6,Summer - Week Nearest Max Temperature For Period,Extreme,7/22,7/28,Summer - Week Nearest Average Temperature For Period,Typical,8/12,8/18,Winter - Week Nearest Min Temperature For Period,Extreme,2/ 5,2/11,Winter - Week Nearest Average Temperature For Period,Typical,2/12,2/18,Autumn - Week Nearest Average Temperature For Period,Typical,11/12,11/18,Spring - Week Nearest Average Temperature For Period,Typical,5/ 6,5/12
GROUND TEMPERATURES,3,.5,,,,6.39,8.53,12.69,16.63,24.09,28.02,29.11,27.11,22.51,16.78,11.13,7.41,2,,,,9.34,9.86,12.23,14.88,20.61,24.28,26.10,25.69,23.07,19.11,14.65,11.15,4,,,,12.39,12.02,13.05,14.56,18.35,21.19,23.03,23.47,22.33,19.99,16.97,14.24
HOLIDAYS/DAYLIGHT SAVINGS,No,0,0,0
COMMENTS 1,Custom/User Format -- WMO#583620
COMMENTS 2, -- Ground temps produced with a standard soil diffusivity of 2.3225760E-03 {m**2/day}
DATA PERIODS,1,1,Data,Sunday, 1/ 1,12/31\n'''
MOS_DEFAULTY_HEADER = '''#1
double tab1(0,30)
#LOCATION,SHANGHAI,-,CHN,Custom-583620,583620,31.40,121.47,8.0,4.0
#DESIGN CONDITIONS,1,Climate Design Data 2013 ASHRAE Handbook,,Heating,1,-2,-0.6,-12.9,1.2,1.2,-10.3,1.6,2.1,7.9,4.8,7.3,4.6,2.9,270,Cooling,7,5.6,35.1,26.9,33.8,26.6,32.6,26.3,27.9,32.5,27.4,31.7,27,31.1,3.6,220,26.7,22.3,30.4,26.2,21.7,29.9,25.8,21.2,29.6,89.4,32.7,87.1,32,85.2,31.2,724,Extremes,7.6,6.8,6.1,30.1,-3.9,37,1.3,1.1,-4.8,37.8,-5.6,38.5,-6.3,39.1,-7.3,39.9
#TYPICAL/EXTREME PERIODS,6,Summer - Week Nearest Max Temperature For Period,Extreme,7/22,7/28,Summer - Week Nearest Average Temperature For Period,Typical,8/12,8/18,Winter - Week Nearest Min Temperature For Period,Extreme,2/ 5,2/11,Winter - Week Nearest Average Temperature For Period,Typical,2/12,2/18,Autumn - Week Nearest Average Temperature For Period,Typical,11/12,11/18,Spring - Week Nearest Average Temperature For Period,Typical,5/ 6,5/12
#GROUND TEMPERATURES,3,.5,,,,6.39,8.53,12.69,16.63,24.09,28.02,29.11,27.11,22.51,16.78,11.13,7.41,2,,,,9.34,9.86,12.23,14.88,20.61,24.28,26.10,25.69,23.07,19.11,14.65,11.15,4,,,,12.39,12.02,13.05,14.56,18.35,21.19,23.03,23.47,22.33,19.99,16.97,14.24
#HOLIDAYS/DAYLIGHT SAVINGS,No,0,0,0
#COMMENTS 1,Custom/User Format -- WMO#583620
#COMMENTS 2, -- Ground temps produced with a standard soil diffusivity of 2.3225760E-03 {m**2/day}
#DATA PERIODS,1,1,Data,Sunday, 1/ 1,12/31
#C1 Time in seconds. Beginning of a year is 0s.
#C2 Dry bulb temperature in Celsius at indicated time
#C3 Dew point temperature in Celsius at indicated time
#C4 Relative humidity in percent at indicated time
#C5 Atmospheric station pressure in Pa at indicated time
#C6 Extraterrestrial horizontal radiation in Wh/m2
#C7 Extraterrestrial direct normal radiation in Wh/m2
#C8 Horizontal infrared radiation intensity in Wh/m2
#C9 Global horizontal radiation in Wh/m2
#C10 Direct normal radiation in Wh/m2
#C11 Diffuse horizontal radiation in Wh/m2
#C12 Averaged global horizontal illuminance in lux during minutes preceding the indicated time
#C13 Direct normal illuminance in lux during minutes preceding the indicated time
#C14 Diffuse horizontal illuminance in lux  during minutes preceding the indicated time
#C15 Zenith luminance in Cd/m2 during minutes preceding the indicated time
#C16 Wind direction at indicated time. N=0, E=90, S=180, W=270
#C17 Wind speed in m/s at indicated time
#C18 Total sky cover at indicated time
#C19 Opaque sky cover at indicated time
#C20 Visibility in km at indicated time
#C21 Ceiling height in m
#C22 Present weather observation
#C23 Present weather codes
#C24 Precipitable water in mm
#C25 Aerosol optical depth
#C26 Snow depth in cm
#C27 Days since last snowfall
#C28 Albedo
#C29 Liquid precipitation depth in mm at indicated time
#C30 Liquid precipitation quantity\n'''


def create_epw_header(tgt_epw_path, header = EPW_DEFAULT_HEADER):
	tgt_epw_dir = os.sep.join(tgt_epw_path.split(os.sep)[0: -1])
	if os.path.exists(tgt_epw_path):
		os.remove(tgt_epw_path)
	if len(tgt_epw_dir) > 0 and not os.path.exists(tgt_epw_dir):
		os.mkdir(tgt_epw_dir)
	epw_file = open(tgt_epw_path, "w")
	epw_file.write(header)
	epw_file.close()

def create_mos_header(tgt_mos_path, header = MOS_DEFAULTY_HEADER):
	tgt_mos_dir = os.sep.join(tgt_mos_path.split(os.sep)[0: -1])
	if os.path.exists(tgt_mos_path):
		os.remove(tgt_mos_path)
	if len(tgt_mos_dir) > 0 and not os.path.exists(tgt_mos_dir):
		os.mkdir(tgt_mos_dir)
	mos_file = open(tgt_mos_path, "w")
	mos_file.write(header)
	mos_file.close()

def read_last_line(file_path):
	with open(file_path, 'rb') as f:
		try:  # catch OSError in case of a one line file 
			f.seek(-2, os.SEEK_END)
			while f.read(1) != b'\n':
				f.seek(-2, os.SEEK_CUR)
		except OSError:
			f.seek(0)
		last_line = f.readline().decode()
	return last_line

def modify_epw_line(org_epw_file, to_change_names, to_change_vals, 
			time_hr, default_vals = EPW_DEFAULT_VALS):
	"""
	Args:
	----------
	time_hr: int or list
		if it is an int, it directs to the hour 
		(since the start of a year, starting from 1) that the
		data should be changed. 
		if it is a list, it directs to the range of hours 
		(inclusive) that the data should be changed, and all hours
		have the same data. 
	"""
	timest = time.time()
	org_epw = epw()
	org_epw.read(r'%s' %org_epw_file)
	for tgt_i in range(len(to_change_names)):
		tgt_column = to_change_names[tgt_i]
		if isinstance(time_hr, int):
			org_epw.dataframe.loc[time_hr - 1, tgt_column]\
				 = to_change_vals[tgt_i]
		elif isinstance(time_hr, list):
			org_epw.dataframe.loc[time_hr[0]-1: time_hr[1]-1, 
						tgt_column]\
				 = np.ones((time_hr[1] - time_hr[0] + 1, 1))\
				 * to_change_vals[tgt_i]
	org_epw.write(org_epw_file)	
	print('epw:', time.time() - timest)

def add_epw_line(org_epw_file, to_change_names, to_change_vals,
				default_vals = EPW_DEFAULT_VALS):
	last_line = read_last_line(org_epw_file)
	last_line_first = last_line.split(',')[0]
	line_header = '2017,1,1,1,0,?'\
				'9?9?9?9E0?9?9?9?9*9?9?9?9?9*9?9?9?9?9*_*9*9*9?9?9,'
	if last_line_first == 'DATA PERIODS':
		new_line = line_header
	else:
		last_line_list = last_line.split(',')
		last_datetime = datetime.datetime(int(last_line_list[0]),
										int(last_line_list[1]),
										int(last_line_list[2]),
										int(last_line_list[3])-1,
										int(last_line_list[4]))
		this_datetime = last_datetime + datetime.timedelta(0, 3600)
		year = this_datetime.year
		mon = this_datetime.month
		day = this_datetime.day
		hour = this_datetime.hour + 1
		minu = this_datetime.minute
		new_line_list = line_header.split(',')
		new_line_list[0] = str(year)
		new_line_list[1] = str(mon)
		new_line_list[2] = str(day)
		new_line_list[3] = str(hour)
		new_line_list[4] = str(minu)
		new_line = ','.join(new_line_list)
	new_vals = copy.deepcopy(default_vals)
	for item_i in range(len(to_change_names)): 
		to_change_name = to_change_names[item_i]
		to_change_i = EPW_NAMES.index(to_change_name)
		new_vals[to_change_i] = to_change_vals[item_i]
	new_line += ','.join([str(i) for i in new_vals])
	new_line += '\n'
	with open(org_epw_file, 'a') as f:
		f.write(new_line)

def modify_mos_line(org_mos_file, to_change_names, to_change_vals, 
			time_hr, default_vals = EPW_DEFAULT_VALS):
	"""
	Args:
	----------
	time_hr: int or list
		if it is an int, it directs to the hour 
		(since the start of a year, starting from 1) that the
		data should be changed. 
		if it is a list, it directs to the range of hours 
		(inclusive) that the data should be changed, and all hours
		have the same data. 
	"""
	to_change_names = copy.deepcopy(to_change_names)
	try:
		to_change_names.remove('Month')
	except:
		pass
	try:
		to_change_names.remove('Day')
	except:
		pass
	try:
		to_change_names.remove('Hour')
	except:
		pass
	timest = time.time()
	with open(org_mos_file, 'r') as f:
		contents = f.readlines()
		if isinstance(time_hr, int):
			tgt_line_ls = contents[time_hr + 40].split('\t')
			for item_i in range(len(to_change_names)): 
				to_change_name = to_change_names[item_i]
				to_change_i = EPW_NAMES.index(to_change_name) + 1
				tgt_line_ls[to_change_i] = str(to_change_vals[item_i])
			contents[time_hr + 40] = '\t'.join(tgt_line_ls)
		elif isinstance(time_hr, list):
			tgt_line_ls = contents[time_hr[0] + 40].split('\t')
			for item_i in range(len(to_change_names)): 
				to_change_name = to_change_names[item_i]
				to_change_i = EPW_NAMES.index(to_change_name) + 1
				tgt_line_ls[to_change_i] = str(to_change_vals[item_i])
			change_contents = []
			for i in range(time_hr[1] - time_hr[0] + 1):
				this_line = copy.deepcopy(tgt_line_ls)
				this_line[0] = str(float(tgt_line_ls[0]) + i * 3600)
				this_line = '\t'.join(this_line)
				change_contents.append(this_line)
			contents[time_hr[0] + 40: time_hr[1] + 40 + 1] = change_contents 
	with open(org_mos_file, 'w') as f:
		f.writelines(contents)
	print('mos:', time.time() - timest)

def add_mos_line(org_mos_file, to_change_names, to_change_vals,
				is_time_increment = True,
				default_vals = EPW_DEFAULT_VALS):
	last_line = read_last_line(org_mos_file)
	last_line_first = last_line[0]
	if last_line_first == '#':
		new_line = '0.0 '
	else:
		last_line_list = last_line.split(' ')
		last_time = float(last_line_list[0])
		if is_time_increment:
			this_time = last_time + 3600
		else:
			this_time = last_time
		new_line = str(this_time) + ' '
	new_vals = copy.deepcopy(EPW_DEFAULT_VALS)
	for item_i in range(len(to_change_names)): 
		to_change_name = to_change_names[item_i]
		to_change_i = EPW_NAMES.index(to_change_name)
		new_vals[to_change_i] = to_change_vals[item_i]
	new_line += ' '.join([str(i) for i in new_vals])
	new_line += '\n'
	with open(org_mos_file, 'a') as f:
		f.write(new_line)
	with open(org_mos_file, "r") as f:
		list_of_lines = f.readlines()
		cur_line_n = int(list_of_lines[1].split('(')[1].split(',')[0])
		new_line_n = cur_line_n + 1
		list_of_lines[1] = list_of_lines[1].split('(')[0] + '(' \
							+ str(new_line_n)\
							+ ',' + list_of_lines[1].split(',')[1]
	with open(org_mos_file, "w") as f:
		f.writelines(list_of_lines)