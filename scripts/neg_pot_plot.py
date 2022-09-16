"""
neg_pot_plot.py
"""
import numpy as np
from numpy import log, log2
import cmath as cm
import matplotlib.pyplot as plt
from scipy.optimize import root, minimize, fsolve, newton, root_scalar
import os.path
from os.path import join as pjoin
import warnings
warnings.filterwarnings('ignore')
# ------------------------File Opening------------------------------------------
filename = 'neg_data.txt'
path = '../data/'
path_fig = '../data/figs/'
fig_name = 'neg_pot_plot.png'
# -----------------------------------------------------------------------------
def writeData(x,y):
    if os.path.exists(pjoin(path,filename)):
        outfile = open(pjoin(path,filename),"a")
    else:
        print('No Data')
        exit()
    outfile.write(str(x)+'\t'+str(y)+'\n')
    outfile.close()
# ------------------------Clean Existing File-----------------------------------
# This is to clean the file if exists, else, it will create the file
open(pjoin(path,filename),"w").close()
# ------------------------------------------------------------------------------
def f(psis):
    sqr1 = (cm.sqrt(psis/(psip-psis)))
    sqr2 = (cm.sqrt(psis/((psip-psis)**3)))
    A = (np.exp(-psis) + alpha0*np.exp(-gamma*psis))/(1-delta*(sqr1))
    fun = -(A*(1.0/psis)) + 2.0*np.exp(-psis) + 2.0*gamma*alpha0*np.exp(-gamma*psis) - delta*A*(sqr2)
    if (np.iscomplex(fun) == True): print('complex data found for %.2f'%(psis), fun)
    return np.real(fun)
# ------------------------------------------------------------------------------
gamma = 15.0
delta = 0.0
alpha0 = 2.01
psip = 5.0
iniValue = [0.01, 0.2, 0.3, 0.5]
psis1 = np.arange(-0.2,-0.001,0.001)
psis2 = np.arange(0.01,1.0,0.01)
# ------------------------------------------------------------------------------
F1 = np.empty([len(psis1)])
F2 = np.empty([len(psis2)])
# Evaluate the function for the negative axis
for i in range(len(psis1)):
    F1[i] = f(psis1[i])
# Evaluate the function for the positive axis
for i in range(len(psis2)):
    F2[i] = f(psis2[i])
#-------------------------------------------------------------------------------
# Write data of negative axis
for i in range(len(psis1)):
    writeData(psis1[i],F1[i])
# Write data of positive axis
for i in range(len(psis2)):
    writeData(psis2[i],F2[i])
# ------------------------------------------------------------------------------
# Find the root for a definite alpha0
psis = np.empty([len(iniValue)])
for i in range(len(iniValue)):
    psis = fsolve(f, iniValue[i],xtol=1E-03)
    print('Roots are: %.3f'%(float(psis)))
# ------------------------------------------------------------------------------
fig, ax = plt.subplots()
#ax.plot(psis1,F1,marker='.') # plot in negative axis
ax.plot(psis2,F2,marker='.') # plot in positive axis
ax.set_xlabel('$\Psi_{s}$')
ax.set_ylabel('F($\Psi_{s}$)')
#ax.set_xscale('log')
#ax.set_ylim([-0.2,0.6])
ax.grid(True)
#plt.savefig(pjoin(path_fig,fig_name),dpi=600)
plt.show()
# ------------------------------------------------------------------------------
