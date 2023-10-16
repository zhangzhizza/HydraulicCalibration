# Author: Zhiang Zhang & Hanyang Wang
# First create: 2022-08-02
from numpy import random
import json

from Sampler import SamplesGenerator
param_json_path = "dists_input_demo.json"
sample_n = 10
#filename = '.\list_1.pkl'


x = SamplesGenerator(param_json_path,sample_n)
a = x.generate_params()
print(a)
