""
For Sensitivity Analysis for parameters
Author: Hanyang Wang

First Created: Jun 17th, 2022
Last Updated: Jun 17th, 2022
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from SALib.sample import saltelli
from SALib.analyze import morris
from SALib.test_functions import Ishigami

# Define the question that we wanna solve.
Morris_problem = {
    # The number of parameters
    'num_vars': 3,
    # Their names
    'names': ['a', 'b', 'c'],
    # the upper bound and lower bounde
    'bounds': [[1,10],
               [2,6],
               [1,9]
              ],
    
    # I don't want to group any of these variables together
    'groups': None
    }
    
# Here we define the model we are evaluating.
# After the building of the modelica model, we can cite the function.

# from JMDockerScripts.ModelicaEngine import simulate
def evaluate(x,y,z):
    return  0.5 * x + 2 * y + z
    
# 样本生成
'''
Param_values is a NumPy matrix. If we run param_values.shape,

We're going to see that matrix times 3 is equal to 8,182. The Saltelli sampler generated 8,000 samples.

The Saltelli sampler generates N∗(2D+2) samples, in which N is 1024 (the parameter we provide),

D is 3 (number of model inputs)
'''
param_values = saltelli.sample(Morris_problem,1024)

Y = np.zeros([param_values.shape[0]])
for i,X in enumerate(param_values):
    Y[i] = evaluate(X[0],X[1],X[2])

# Sensitivity Analysis
Si = morris.analyze(Morris_problem, param_values, Y, print_to_console=False)

# mean(EE)---the mean elementary effect
# mean(|EE|)---the absolute of the mean elementary effect, higher mean |EE|, more important factor
# std(EE) --- the standard deviation of the elementary effect

print("{:20s} {:>7s} {:>7s} {:>7s}".format("Name", "mean(EE)", "mean(|EE|)", "std(EE)"))
for name, s1, st, mean in zip(Morris_problem['names'],
                              Si['mu'],
                              Si['mu_star'],
                              Si['sigma']):
    print("{:20s} {:=7.3f} {:=7.3f} {:=7.3f}".format(name, s1, st, mean))

fig, ax = plt.subplots()
ax.scatter(Si['mu_star'],Si['sigma'])
#ax.plot(Si['mu_star'],2*Si['sigma']/np.sqrt(number_of_trajectories),'--',alpha=0.5)
#ax.plot(np.array([0,Si['mu_star'][0]]),2*np.array([0,Si['sigma'][0]/np.sqrt(number_of_trajectories)]),'--',alpha=0.5)

plt.title('Distribution of Elementary effects')
plt.xlabel('mean(|EE|)')
plt.ylabel('standard deviation of elementary effect')


for i, txt in enumerate(Si['names']):
    ax.annotate(txt, (Si['mu_star'][i], Si['sigma'][i]))
