import math
import numpy as np
from numpy import *
from scipy.optimize import curve_fit
from os import path
import matplotlib.pyplot as plt
import sys
import matplotlib.lines as mlines

plt.rc('text', usetex=True)
colors = ['xkcd:purple', 'xkcd:green', 'xkcd:blue', 'xkcd:teal', 'xkcd:orange', 'xkcd:red', 'xkcd:mauve', 'xkcd:indigo', 'xkcd:maroon', 'xkcd:lime', 'xkcd:peach']

outpath = "4dAxialCurrent"
inpath = ""

Ls, Lt, mu, ma, nfluxes, AC_t, AC_t_err, AC_x, AC_x_err, AC_y, AC_y_err, AC_z, AC_z_err = np.loadtxt(path.join(inpath, "4dAxialCurrent.txt"), unpack=True)

#just to easily iterate over arrays
Ls_num = 1
Lt_num = 1
ma_num = 1
mu_num = 1
nfluxes_num = 33

outpath = "4dAxialCurrent"

for i in range(0, Ls_num * Lt_num * ma_num * mu_num):
	fig, ax = plt.subplots()
	start = i * nfluxes_num
	stop = start + nfluxes_num
	step = 1
	ax.errorbar(nfluxes[start:stop:step]*2, AC_t[start:stop:step], yerr=AC_t_err[start:stop:step], 
		fmt='o', label=(r'$t$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[0], color=colors[0])
	ax.errorbar(nfluxes[start:stop:step]*2, AC_x[start:stop:step], yerr=AC_x_err[start:stop:step], 
		fmt='o', label=(r'$x$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[1], color=colors[1])
	ax.errorbar(nfluxes[start:stop:step]*2, AC_y[start:stop:step], yerr=AC_y_err[start:stop:step], 
		fmt='o', label=(r'$y$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[2], color=colors[2])
	ax.errorbar(nfluxes[start:stop:step]*2, AC_z[start:stop:step], yerr=AC_z_err[start:stop:step], 
		fmt='o', label=(r'$z$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[3], color=colors[3])
	#l = mlines.Line2D([0,nfluxes[stop-1]*2], [0,-(nfluxes[stop-1])*2 * mu[start] * 3 * Lt[start] / (3.141593 * Lt[start]**2 )], color=colors[_mu])
	#ax.add_line(l)
	plt.ylabel(r'$\left\langle  J^5_{\mu}  \right\rangle$', {'fontsize': 10})
	plt.xlabel(r'$n_{fluxes}$')
	ax.xaxis.grid(b=True, which='both')
	ax.yaxis.grid(b=True, which='both')
	ax.legend(loc='best', frameon=True)
	plt.title(r'$m_q$ = ' + str(ma[start]) + r' $\mu = $' + str(mu[start]) + r' $Ls$ = ' + str(Ls[start]) + r' $Lt$ = ' + str(Lt[start]))
	plt.draw()
	fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('ma' + str(ma[start]) + 'mu' + str(mu[start]) + 'Ls' + str(Ls[start]) + 'Lt' + str(Lt[start]))))
	fig.clf();
