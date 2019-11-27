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

outpath = "AxialCurrent"
inpath = ""

Ls, Lt, mu, ma, nfluxes, AxialCurrent, AxialCurrentErr = np.loadtxt(path.join(inpath, "AxialCurrent.txt"), usecols=(0, 1, 2, 3, 4, 5, 6), unpack=True)

#just to easily iterate over arrays
Ls_num = 3
Lt_num = 3
ma_num = 1
mu_num = 8
nfluxes_num = 33

err_norm = 1.0#0.08164965809

#Axial current as function of nfluxes and \mu
outpath = "AxialCurrent/nfluxes_mu/"
for _Ls in range(0, Ls_num):
	for _Lt in range(0, Lt_num):
		for _ma in range(0, ma_num):
			
			fig, ax = plt.subplots()
			for _mu in range(0, mu_num):
				start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
				stop = start + nfluxes_num
				step = 1
				ax.errorbar(nfluxes[start:stop:step]*2, AxialCurrent[start:stop:step], yerr=AxialCurrentErr[start:stop:step]*err_norm, 
					fmt='o', label=(r'$\mu = $' + str(mu[start])), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[_mu], color=colors[_mu])
				l = mlines.Line2D([0,nfluxes[stop-1]*2], [0,(nfluxes[stop-1])*2 * mu[start] * 3 * Lt[start] / (3.141593 * Lt[start]**2 )], color=colors[_mu])
				ax.add_line(l)
			printindex = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						0 * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
			plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
			plt.xlabel(r'$n_{fluxes}$')
			ax.xaxis.grid(b=True, which='both')
			ax.yaxis.grid(b=True, which='both')
			# Shrink current axis by 20%
			box = ax.get_position()
			ax.set_position([box.x0, box.y0, box.width * 0.9, box.height])

			# Put a legend to the right of the current axis
			ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))
			# ax.legend(loc='upper left', frameon=True)
			# plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)
			plt.title(r'$m_q$ = ' + str(ma[printindex]) + r' $Ls$ = ' + str(Ls[printindex]) + r' $Lt$ = ' + str(Lt[printindex]))
			plt.draw()
			fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('ma' + str(ma[printindex]) + 'Ls' + str(Ls[printindex]) + 'Lt' + str(Lt[printindex]))))
			fig.clf();

#Axial current as function of nfluxes and m_q
outpath = "AxialCurrent/nfluxes_ma/"
for _Ls in range(0, Ls_num):
	for _Lt in range(0, Lt_num):
		for _mu in range(0, mu_num):
			
			fig, ax = plt.subplots()
			for _ma in range(0, ma_num):
				start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
				stop = start + nfluxes_num
				step = 1
				ax.errorbar(nfluxes[start:stop:step], AxialCurrent[start:stop:step], yerr=AxialCurrentErr[start:stop:step]*err_norm, 
					fmt='o', label=(r'$m_q = $' + str(ma[start])), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[_ma], color=colors[_ma])
			printindex = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						0 * nfluxes_num
			plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
			plt.xlabel(r'$n_{fluxes}$')
			ax.xaxis.grid(b=True, which='both')
			ax.yaxis.grid(b=True, which='both')
			ax.legend(loc='best', frameon=True)
			plt.title(r'$\mu$ = ' + str(mu[printindex]) + r' $Ls$ = ' + str(Ls[printindex]) + r' $Lt$ = ' + str(Lt[printindex]))
			plt.draw()
			fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('mu' + str(mu[printindex]) + 'Ls' + str(Ls[printindex]) + 'Lt' + str(Lt[printindex]))))
			fig.clf();

#Axial current as function of nfluxes and N_t
outpath = "AxialCurrent/nfluxes_Nt/"
for _Ls in range(0, Ls_num):
	for _ma in range(0, ma_num):
		for _mu in range(0, mu_num):
			
			fig, ax = plt.subplots()
			for _Lt in range(0, Lt_num):
				start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
				stop = start + nfluxes_num
				step = 1
				ax.errorbar(nfluxes[start:stop:step], AxialCurrent[start:stop:step], yerr=AxialCurrentErr[start:stop:step]*err_norm, 
					fmt='o', label=(r'$N_t = $' + str(Lt[start])), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[_Lt], color=colors[_Lt])
			printindex = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						0 * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
			plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
			plt.xlabel(r'$n_{fluxes}$')
			ax.xaxis.grid(b=True, which='both')
			ax.yaxis.grid(b=True, which='both')
			ax.legend(loc='best', frameon=True)
			plt.title(r'$\mu$ = ' + str(mu[printindex]) + r' $Ls$ = ' + str(Ls[printindex]) + r' $m_q$ = ' + str(ma[printindex]))
			plt.draw()
			fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('mu' + str(mu[printindex]) + 'Ls' + str(Ls[printindex]) + 'ma' + str(ma[printindex]))))
			fig.clf();

#Axial current as function of nfluxes and N_s
outpath = "AxialCurrent/nfluxes_Ns/"
for _ma in range(0, ma_num):
	for _Lt in range(0, Lt_num):
		for _mu in range(0, mu_num):
			
			fig, ax = plt.subplots()
			for _Ls in range(0, Ls_num):
				start = _Ls * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
				stop = start + nfluxes_num
				step = 1
				ax.errorbar(nfluxes[start:stop:step], AxialCurrent[start:stop:step], yerr=AxialCurrentErr[start:stop:step]*err_norm, 
					fmt='o', label=(r'$N_s = $' + str(Ls[start])), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[_Ls], color=colors[_Ls])
			printindex = 0 * (Lt_num * mu_num * ma_num * nfluxes_num) + \
						_Lt * (mu_num * ma_num * nfluxes_num) + \
						_mu * (ma_num * nfluxes_num) + \
						_ma * nfluxes_num
			plt.ylabel(r'$\left\langle  J^5_z  \right\rangle$', {'fontsize': 10})
			plt.xlabel(r'$n_{fluxes}$')
			ax.xaxis.grid(b=True, which='both')
			ax.yaxis.grid(b=True, which='both')
			ax.legend(loc='best', frameon=True)
			plt.title(r'$\mu$ = ' + str(mu[printindex]) + r' $m_q$ = ' + str(ma[printindex]) + r' $Lt$ = ' + str(Lt[printindex]))
			plt.draw()
			fig.savefig(path.join(outpath, "AxCurr_{0}.png".format('mu' + str(mu[printindex]) + 'Lt' + str(Lt[printindex]) + 'ma' + str(ma[printindex]))))
			fig.clf();
