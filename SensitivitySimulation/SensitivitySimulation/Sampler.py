# Author: Zhiang Zhang & Hanyang Wang
# First create: 2022-08-02
from numpy import random
import json
import pandas as pd

class SamplesGenerator():
    # seed = random.seed(seed = 42)
    def __init__(self, param_json_path,size = 1):
        """
        Args:
        ----------
        param_json_path: str, path to the distribution params json
        samples_n: integer, number of sampling from distribution(s)
        size: integer, the size of samping from distributions each time, defult = 1
         
        """
        self.param_json_path = param_json_path
        self.size = size    
    
    def generate_params(self, samples_n):
        """
        Distribution kinds:
        ---------
        distributions can be discrete distriburion, continuous distribution or your own 'distribution'
        your own distribution: a list of parameters values
        
        
        Return:
        ----------
        param_list: array-lik
        A list including n samples list.
        The order of elements in the samples lists is the same as the order of distributions defined in json
        Eg: 10 samples, 3 distributions
        [[-1.6127158711896517, 0.8226005606596583, 0.22329251210387235],
         [0.06428001909546277, 0.7699935530986108, 0.12155900171495168],
         [-1.0777447779293061, 0.6228904758190003, 0.04460551449494864],
         [0.045571839903813784, 0.5406351216101065, 0.5072687241023079],
         [-0.6516003476058171, 0.7260913337226615, 1.8617785043499964],
         [-2.025142586657607, 0.7951861947687037, 0.15792573271806865],
         [0.18645431476942764, 0.4389714207056361, 0.04085258429183495],
         [0.5049872789804571, 0.4089529444142699, 0.09515326807105437],
         [0.8657551941701215, 0.15643704267108605, 0.1440029945632918],
         [1.7654542402810969, 0.6601973767177313, 0.16420613069449796]]
        """
        

        with open(self.param_json_path) as param_obj:
            params = json.load(param_obj)
        assert params["params"], "No params specified"
        n = len(params["params"])
        
        size = self.size
        params_list = []
        for i in range(samples_n):
            list_1 = []

            for j in range(n):
        
                if params['params'][j]['dist_type'] == 'gaussian':
                    mean = params['params'][j]['dist_param']['mean']
                    std = params['params'][j]['dist_param']['std']
                    x =random.normal(mean,std,size)
                    x= float(x)
                    
                elif params['params'][j]['dist_type'] == 'uniform':
                    low = params['params'][j]['dist_param']['low']
                    high = params['params'][j]['dist_param']['high']
                    x =random.uniform(low,high,size)
                    x= float(x)

                elif params['params'][j]['dist_type'] == 'exponential':
                    scale = params['params'][j]['dist_param']['scale']
                    x =random.exponential(scale,size)
                    x= float(x)
                 
                elif params['params'][j]['dist_type'] == 'poisson':
                    lam = params['params'][j]['dist_param']['lam']
                    x =random.poisson(lam,size)
                    
                    x= float(x)
                elif params['params'][j]['dist_type'] == 'binomial':
                    n = params['params'][j]['dist_param']['n']
                    p = params['params'][j]['dist_param']['p']
                    x =random.binomial(n,p,size)
                    x= float(x)
                
                elif params['params'][j]['dist_type'] == 'hypergeometric':
                    ngood = params['params'][j]['dist_param']['ngood']
                    nbad = params['params'][j]['dist_param']['nbad']
                    nsample = params['params'][j]['dist_param']['nsample']
                    x =random.hypergeometric(ngood, nbad, nsample, size)
                    x= float(x)
                    
                else:
                    specs_dist = params['params'][j]['dist_param']
                    x = random.choice(specs_dist, size , replace = True, p=None)
                    x = float(x)
                
                
                list_1.append(x)
            params_list.append(list_1)
        return params_list


