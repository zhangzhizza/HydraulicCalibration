"""
Run MCMC using PyMC3, some code snippets borrowed from Adrian Chong. 

Author: Zhiang Zhang

First Created: Sept 5th, 2017
Last Updated: Sept 11th, 2017
"""

import stan
import numpy as np
import pickle as pk
import os

class MCMC4Posterior(object):

	def __init__(self, z, xf, xc, t, logger):
		"""
		Args:
			z: np.ndarray
				1-D, n + m row
			xf: np.ndarray
				2-D, n * p
			xc: np.ndarray
				2-D, m * p
			t: np.ndarray
				2-D, m * q
			thetaPriorInfo, rho_etaPriorInfo, rho_deltaPriorInfo, lambda_etaPriorInfo, 
				lambda_deltaPriorInfo, lambda_epsiPriorInfo: 1-D list
				It contains the prior distribution info, like mean, std, 
				or max and min. For this impl, it is is [pymc3 dist function, *args for the dist func]
		"""
		
		self._n = xf.shape[0]; # Number of field observations
		self._p = xf.shape[1]; # Number of field x features
		self._q = t.shape[1]; # Number of calibration parameters
		self._m = xc.shape[0] # Number of simulation observations
		self._N = self._n + self._m;
		self._z = z;
		self._xf = xf;
		self._xc = xc;
		self._t = t;
		self._logger = logger;
		self._dataMap = self._prepareStanData(self._n, self._p, self._q, self._m, self._N, 
												self._z, self._xf, self._xc, self._t);

	def _prepareStanData(self, *args):
		"""
		Prepare the python dic for stan data.

		Args:
			args: list of arguments.

		Ret: dict
			Python dict for stan data. 
		"""
		dataMap = {};
		dataMap['n'] = self._n;
		dataMap['p'] = self._p;
		dataMap['q'] = self._q;
		dataMap['m'] = self._m;
		dataMap['N'] = self._N;
		dataMap['z'] = self._z;
		dataMap['xf'] = self._xf;
		dataMap['xc'] = self._xc;
		dataMap['t'] = self._t;
		print (dataMap)

		return dataMap;

	def build_run(self, stan_in_path: str, iterations: int, 
						chains: int) -> stan.fit.Fit:
		"""
		Build the MCMC model.

		Args:
			stan_in_path: str
				The stan input file path.
			iterations: int
				The number of samples in sampling
			chains: int
				The number of independent processes 
				to use when drawing samples. 
		Returns:
			fit: a stan.fit.Fit object
		"""
		self._logger.info('Start the stan model from input file %s ...'
							%(stan_in_path))
		################################################################
		# load stan file
		with open(stan_in_path, 'r') as f:
			stan_code = f.read()
		################################################################
		# run MCMC sampling
		sm = stan.build(stan_code, data=self._dataMap)
		fit = sm.sample(num_chains=chains, num_samples=iterations)
		return fit