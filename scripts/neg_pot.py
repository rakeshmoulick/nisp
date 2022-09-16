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
gamma = 15
delta = 0
alpha0 = 0.5
psip = 5
iniValue = 0.01
x = []
y = []
while (alpha0 <= 100):
    #x.append(alpha0)
    #---------------------------------------------------------------------------
    #psis = fsolve(f, iniValue, args=(gamma,delta,alpha0,psip),xtol=1e-06)
    #x.append(alpha0)
    #y.append(float(psis))

    #if(float(psis)>1000.0):
    #    y.append(np.nan)
    #else:
    #    y.append(float(psis))
    #---------------------------------------------------------------------------
    psis = root(f, iniValue,args=(gamma,delta,alpha0,psip),method='lm')
    x.append(alpha0)
    y.append(float(psis.x))
    #---------------------------------------------------------------------------
    #psis = minimize(f,iniValue,args=(gamma,delta,alpha0,psip)) # return square of the function f(psis)
    #y.append(float(psis.x))
    #---------------------------------------------------------------------------
    #psis = newton(f, iniValue,args=(gamma,delta,alpha0,psip))
    #y.append(float(psis))
    #---------------------------------------------------------------------------
    #psis = root_scalar(f,args=(gamma,delta,alpha0,psip),method='toms748',bracket=[1E-3, 2.0],x0=0.1,x1=0.5,xtol=1e-6)
    #psis = root_scalar(f,args=(gamma,delta,alpha0,psip),method='brenth',bracket=[1E-4,1],x0=0.3,x1=0.5,xtol=1e-6)
    #if (psis.converged!=True):print('alpha0=%f, not converged'%(alpha0))
    #y.append(float(psis.root))
    #---------------------------------------------------------------------------
    #print(psis)
    alpha0 = alpha0 + 0.5

for i in range(len(y)):
    writeData(x[i],y[i])

fig, ax = plt.subplots()
ax.scatter(x,y,marker='.')
ax.set_xlabel('$\u03B1_{0}$')
ax.set_ylabel('$\Psi_{s}$')
ax.set_xscale('log')
#ax.set_ylim([-0.2,0.6])
ax.grid(True)
plt.savefig(pjoin(path_fig,fig_name),dpi=600)
plt.show()
