import math
import numpy as np
from numpy import *
from scipy.optimize import curve_fit
from os import path
import matplotlib.pyplot as plt
import sys
import matplotlib.lines as mlines
import sys

#just to easily iterate over arrays
ma_num = 1
mu_num = 16 
nfluxes_num = 31

if len(sys.argv) > 2:
   ma_num = int(sys.argv[1])
   mu_num = int(sys.argv[2]) 
   nfluxes_num = int(sys.argv[3])

plt.rc('text', usetex=True)
colors = ['xkcd:purple', 'xkcd:green', 'xkcd:blue', 'xkcd:teal', 'xkcd:orange', 'xkcd:red', 'xkcd:mauve', 'xkcd:indigo', 'xkcd:maroon', 'xkcd:lime', 'xkcd:peach', 'xkcd:pink', 'xkcd:yellow', 'xkcd:navy', 'xkcd:aquamarine', 'xkcd:lavender', 'xkcd:grey']

outpath = ""
inpath = ""

Ls, Lt, mu, ma, nfluxes, AxialCurrent, AxialCurrentErr = np.loadtxt(path.join(inpath, "AxialCurrent.txt"), usecols=(0, 1, 2, 3, 4, 5, 6), unpack=True)



#Axial current as function of nfluxes and \mu
#outpath = "AxialCurrent/nfluxes_mu/"
_Ls=0
_Lt=0
Lt_num=0
for _ma in range(0, ma_num):		
	fig, ax = plt.subplots()
	for _mu in range(0, mu_num):
		start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
				_Lt * (mu_num * ma_num * nfluxes_num) + \
				_mu * (ma_num * nfluxes_num) + \
				_ma * nfluxes_num
		stop = start + nfluxes_num
		step = 1
		ax.errorbar(nfluxes[start:stop:step]*2, AxialCurrent[start:stop:step], yerr=AxialCurrentErr[start:stop:step], 
			fmt='o', label=(r'$\mu = $' + str(mu[start])), ls='--', marker='.', capsize=5, capthick=1, ecolor=colors[_mu], color=colors[_mu])
		l = mlines.Line2D([0,nfluxes[stop-1]*2], [0,-(nfluxes[stop-1])*2 * mu[start] * 3 * Lt[start] / (3.141593 * Lt[start]**2 )], color=colors[_mu])
		#ax.add_line(l)
	printindex = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
				_Lt * (mu_num * ma_num * nfluxes_num) + \
				0 * (ma_num * nfluxes_num) + \
				_ma * nfluxes_num
	plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
	plt.xlabel(r'$n_{fluxes}$')
	ax.xaxis.grid(b=True, which='both')
	ax.yaxis.grid(b=True, which='both')
	plt.title(r'$m_q$ = ' + str(ma[printindex]) + r' $Ls$ = ' + str(Ls[printindex]) + r' $Lt$ = ' + str(Lt[printindex]))
	box = ax.get_position()
	ax.set_position([box.x0, box.y0, box.width * 0.9, box.height])

	# Put a legend to the right of the current axis
	ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))
	plt.draw()
	fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('ma' + str(ma[printindex]) + 'Ls' + str(Ls[printindex]) + 'Lt' + str(Lt[printindex]))))
	fig.clf();

for _ma in range(0, ma_num):		
	fig, ax = plt.subplots()
	for _mu in range(0, mu_num):
		start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
				_Lt * (mu_num * ma_num * nfluxes_num) + \
				_mu * (ma_num * nfluxes_num) + \
				_ma * nfluxes_num
		stop = start + nfluxes_num
		step = 1
		ax.errorbar(nfluxes[start:stop:step]*2, AxialCurrent[start:stop:step], 
			fmt='o', label=(r'$\mu = $' + str(mu[start])), ls='--', marker='.', color=colors[_mu])
		l = mlines.Line2D([0,nfluxes[stop-1]*2], [0,(nfluxes[stop-1])*2 * mu[start] * 3 * Lt[start] / (3.141593 * Lt[start]**2 )], color=colors[_mu])
		#ax.add_line(l)
	printindex = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
				_Lt * (mu_num * ma_num * nfluxes_num) + \
				0 * (ma_num * nfluxes_num) + \
				_ma * nfluxes_num
	plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
	plt.xlabel(r'$n_{fluxes}$')
	ax.xaxis.grid(b=True, which='both')
	ax.yaxis.grid(b=True, which='both')
	ax.legend(loc='best', frameon=True)
	plt.title(r'$m_q$ = ' + str(ma[printindex]) + r' $Ls$ = ' + str(Ls[printindex]) + r' $Lt$ = ' + str(Lt[printindex]))
	box = ax.get_position()
	ax.set_position([box.x0, box.y0, box.width * 0.9, box.height])

	# Put a legend to the right of the current axis
	ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))
	plt.draw()
	fig.savefig(path.join(outpath, "AxCurr_{0}_raw.png".format('ma' + str(ma[printindex]) + 'Ls' + str(Ls[printindex]) + 'Lt' + str(Lt[printindex]))))
	fig.clf();
