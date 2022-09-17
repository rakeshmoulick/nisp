"""
neg_pot.py
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
fig_name = 'neg_pot.png'
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
def f(psis,gamma,delta,alpha0,psip):
    sqr1 = (np.sqrt(psis/(psip-psis)))
    sqr2 = (np.sqrt(psis/((psip-psis)**3)))
    A = (np.exp(-psis) + alpha0*np.exp(-gamma*psis))/(1-delta*(sqr1))
    fun = -(A*(1.0/psis)) + 2.0*np.exp(-psis) + 2.0*gamma*alpha0*np.exp(-gamma*psis) - delta*A*(sqr2)
    if (np.iscomplex(fun) == True): print('complex data found for %.2f'%(psis), fun)
    return np.real(fun)
# ------------------------------------------------------------------------------
delta = [0, 0.2, 0.4, 0.6]
fig, ax = plt.subplots()
for k in range(len(delta)):
    gamma = 7 # from Temperature ratio around 7 multiple values appear
    alpha0 = 0.1
    psip = 5
    x = []
    y = []
    iniValue = [0.01, 0.2, 0.5]
    while (alpha0 <= 100):
        #-----------------------------------------------------------------------
        for i in range(len(iniValue)):
            psis = root(f, iniValue[i], args=(gamma,delta[k],alpha0,psip),method='lm')
            x.append(alpha0)
            y.append(float(psis.x))
        #-----------------------------------------------------------------------
        alpha0 = alpha0 + 0.1
        #-----------------------------------------------------------------------
    ax.scatter(x,y,marker='.',label='$\delta=$'+str(delta[k]))

ax.set_xlabel('$\u03B1_{0}$')
ax.set_ylabel('$\Psi_{s}$')
ax.set_ylim([0.0,1.0])
ax.set_xscale('log')
ax.set_title('$\gamma=$%0.2f'%(gamma))
ax.grid(True)
ax.legend(loc=0)
#plt.savefig(pjoin(path_fig,fig_name),dpi=600)
plt.show()
