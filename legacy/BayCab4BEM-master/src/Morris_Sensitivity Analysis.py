import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from SALib.sample.morris import sample
from SALib.analyze import morris
from SALib.test_functions import Ishigami

def Morris_SA(problem, N, num_levels, num_resamples, conf_level
              optimal_trajectories: int = None, local_optimization: bool = True,
              seed: int = None, print_to_console : bool = False
              ):
    '''
    problem:
        The problem definition
    N:
        The number of trajectories to generate
    num_levels:
        The number of grid levels which should be even, default=4
    num_resamples:
        The number of resamples used to compute the confidence intervals (default 1000)
    conf_level
        The confidence interval level (default 0.95)
    optimal_trajectories：
        The number of optimal trajectories to sample (between 2 and N)
    local_optimization:
        Flag whether to use local optimization
        Speeds up the process tremendously for bigger N and num_levels.
    seed:
        Seed to generate a random number
    print_to_console : bool
        Print results directly to console (default False)
    '''
    problem = read_param_file('../../doc_path')
    
    # Generate Samples
    param_values = sample(problem, N, num_levels,
                          optimal_trajectories, local_optimization,seed)
    
    # Run the "model", here we choose an example of Ishigami function. Instead of your model.
    Y = Ishigami.evaluate(param_values)
    
    # Perform the sensitivity analysis
    # Specify which column of the output file to analyze (zero-indexed)
    Si = morris.analyze(problem, param_values, Y, conf_level,
                    print_to_console,
                    num_levels, num_resamples)
        '''
        Returns a dictionary with keys 'mu', 'mu_star', 'sigma', and 'mu_star_conf'
        e.g. Si['mu_star'] contains the mu* value for each parameter, in the same order as the parameter file
        '''
    
    
    fig, (ax1, ax2) = plt.subplots(1, 2)
    horizontal_bar_plot(ax1, Si, {}, sortby='mu_star')
    covariance_plot(ax2, Si, {})
    
    fig2 = plt.figure()
    sample_histograms(fig2, param_values, problem, {'color': 'y'})
    plt.show()

    fig, ax = plt.subplots()
    ax.scatter(Si['mu_star'],Si['sigma'])

    plt.title('Distribution of Elementary effects')
    plt.xlabel('mu_star')
    plt.ylabel('standard deviation of elementary effect')
