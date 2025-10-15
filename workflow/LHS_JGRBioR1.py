#https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.qmc.LatinHypercube.html
#Fri Jul 25 04:38:00 PM EDT 2025

from scipy.stats import qmc
import numpy as np

dimsize = 5 #Number of dimensions (parameter space)
nsamples = dimsize*10 #Number of samples, following rule of thumb

sampler = qmc.LatinHypercube(d=dimsize, seed=12345) #using the same seed guarantees reproducible results
sample  = sampler.random(n=nsamples)

#dimension 1, q10_mr and q10_hr absolute value (adim)
#dimension 2, vcmaxha, jmaxha, tpuha scaling factor
#dimension 3, lmrha scaling factor
#dimension 4, kmax (all segments) scaling factor
#dimension 5, liq_canopy_storage_scalar absolute value (mm)

l_bounds = [1.5, 1.0, 1.0, 0.5, 0.1]  #dim1, dim2, dim3, dim4, dim5
u_bounds = [3.0, 2.0, 2.0, 1.0, 0.5]  #dim1, dim2, dim3, dim4, dim5
sample_scaled=qmc.scale(sample, l_bounds, u_bounds)
print(sample_scaled)

