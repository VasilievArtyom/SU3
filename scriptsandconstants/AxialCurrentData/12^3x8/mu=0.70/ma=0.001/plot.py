import math
import numpy as np
from numpy import *
from scipy.optimize import curve_fit
from os import path
import matplotlib.pyplot as plt
import sys
import matplotlib.lines as mlines

plt.rc('text', usetex=True)
colors = ['xkcd:purple', 'xkcd:green', 'xkcd:blue', 'xkcd:teal', 'xkcd:orange', 'xkcd:red', 'xkcd:mauve', 'xkcd:indigo', 'xkcd:maroon', 'xkcd:lime', 'xkcd:peach', 'xkcd:pink', 'xkcd:yellow', 'xkcd:navy', 'xkcd:aquamarine', 'xkcd:lavender', 'xkcd:grey']

outpath = ""
inpath = ""

fig, ax = plt.subplots()
Ls, Lt, mu, ma, nfluxes, AxialCurrent, AxialCurrentErr = np.loadtxt(path.join(inpath, "AxialCurrent.txt"), usecols=(0, 1, 2, 3, 4, 5, 6), unpack=True)

ax.errorbar(nfluxes*2, AxialCurrent, yerr=AxialCurrentErr, 
		fmt='o', label=(r'$z$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[5], color=colors[5])
#l = mlines.Line2D([0,nfluxes[-1]*2], [0,(nfluxes[-2]*2) * mu[0] * 3 * Lt[0] / (3.141593 * Lt[0]**2 )], color=colors[5])
#ax.add_line(l)
plt.ylabel(r'$\left\langle  J^5_{\mu}  \right\rangle$', {'fontsize': 10})
plt.xlabel(r'$n_{fluxes}$')
ax.xaxis.grid(b=True, which='both')
ax.yaxis.grid(b=True, which='both')
#ax.legend(loc='best', frameon=True)
plt.title(r'$m_q$ = ' + str(ma[0]) + r' $\mu = $' + str(mu[0]) + r' $Ls$ = ' + str(Ls[0]) + r' $Lt$ = ' + str(Lt[0]))
plt.draw()
fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('ma' + str(ma[0]) + 'mu' + str(mu[0]) + 'Ls' + str(Ls[0]) + 'Lt' + str(Lt[0]))))
fig.clf();
