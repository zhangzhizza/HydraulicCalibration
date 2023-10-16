# Author: Zhiang Zhang
# First create: 2022-08-22
import os
import unittest
from BayesianCalibration.PostProcessor import TraceProcessor
from BayesianCalibration.Utils.Logger import Logger

THIS_DIR = os.path.dirname(os.path.realpath(__file__))
LOG_LEVEL = 'DEBUG';
LOG_FMT = "[%(asctime)s] %(name)s %(levelname)s:%(message)s"
LOGGER = Logger().getLogger('TestPostProcessor', LOG_LEVEL, LOG_FMT, None)

class TestTraceProcessor(unittest.TestCase):
    def test_get_stats(self):
        LOGGER.info('Testing get_stats... ')
        trace_path = THIS_DIR + os.sep + 'TestTraceProcessor_trace1.pkl'
        trace = TraceProcessor(trace_path = trace_path)
        stats = trace.get_stats(hist_bins = 50)
        LOGGER.info('stats: {}'.format(stats))
        LOGGER.info('Testing test_get_stats done.')

    def test_draw_hist1D(self):
        LOGGER.info('Testing draw_hist1D... ')
        trace_path = THIS_DIR + os.sep + 'TestTraceProcessor_trace1.pkl'
        trace = TraceProcessor(trace_path = trace_path)
        paths = trace.draw_hist1D(hist_bins = 50, 
                                subplots_per_figure = (1, 2),
                                font_size = 15)
        LOGGER.info('paths: {}'.format(paths))
        LOGGER.info('Testing draw_hist1D done.')

    def test_draw_hist2D(self):
        LOGGER.info('Testing draw_hist2D... ')
        trace_path = THIS_DIR + os.sep + 'TestTraceProcessor_trace1.pkl'
        trace = TraceProcessor(trace_path = trace_path)
        path = trace.draw_hist2D(element_x = 'theta.1', 
                                element_y = 'theta.2',
                                hist_bins = 50)
        LOGGER.info('path: {}'.format(path))
        LOGGER.info('Testing draw_hist2D done.')

    def test_get_theta_result(self):
        LOGGER.info('Testing get_theta_result... ')
        trace_path = THIS_DIR + os.sep + 'TestTraceProcessor_trace1.pkl'
        trace = TraceProcessor(trace_path = trace_path)
        centers, center_populations, center_members = \
            trace.get_theta_result(center_n = 3)
        LOGGER.info('centers: {}'.format(centers))
        LOGGER.info('center_populations: {}'.format(center_populations))
        LOGGER.info('Testing get_theta_result done.')