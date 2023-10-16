# Author: Zhiang Zhang
# First creation: 2022-03-28
# Utilities functions for time
import datetime

def get_dt_from_sec(sec):
	"""
	Return corresonding month, day, hour, minute based on the given
	second since the start of a year.
	Apply only for non-leap year. 

	Args:
	----------
	sec: int
		Seconds since the start of a year

	Returns:
	----------
	mon: int
		Month, 1-12
	day: int
		Day
	hour: int
		Hour, 0-23
	minu: int
		Minute, 0-59
	"""
	st_of_year = datetime.datetime(2002, 1, 1)
	ed_time = st_of_year + datetime.timedelta(0, sec)
	mon = ed_time.month
	day = ed_time.day
	hour = ed_time.hour
	minu = ed_time.minute
	return (mon, day, hour, minu)

def get_sec_from_year(year, month, day, hour):
	st_of_year = datetime.datetime(year, 1, 1)
	cur_time = datetime.datetime(year, month, day, hour)
	time_delta = cur_time - st_of_year
	return time_delta.total_seconds()