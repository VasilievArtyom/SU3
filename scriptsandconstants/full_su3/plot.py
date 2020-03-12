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
inpath = "../"

_id, a, mu, T, qB, Jz, JzErr, freeJz, freeJzErr = np.loadtxt(path.join(inpath, "conf_list.csv"),unpack=True, delimiter=',', usecols=(1, 8, 9, 10, 11, 12, 13, 14, 15))
print(shape(qB))

id_s_to_print = [1, 4, 51, 58]
batch_size = 8

fig, ax = plt.subplots(figsize=(10, 5))
for i, id_val in enumerate(id_s_to_print):
	f = id_val * batch_size
	t = (id_val + 1) * batch_size
	current = np.divide(Jz[f:t] - Jz[f], freeJz[f:t] - freeJz[f])
	currentErr = np.zeros(batch_size)
	for j in range(0, batch_size):
		currentErr[j] = np.sqrt( (JzErr[f+j]**2 + JzErr[f]**2)/(freeJz[f+j] - freeJz[f])**2 + (freeJzErr[f+j]**2 + freeJzErr[f]**2) * current[j]**2 /(freeJz[f+j] - freeJz[f])**2)
	mu_slice =  mu[f:t]
	a_val = a[f]
	T_val = T[f]
	qB_val = qB[f]
	ax.errorbar(mu_slice, current, yerr=currentErr, 
		fmt='o', label=(r'$qB = $'+str(np.round(qB_val,2))+r' ${GeV}^2$ $T = $'+str(np.round(T_val,2))+r' $MeV$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[i], color=colors[i])
plt.grid(which='both', axis='both')
plt.ylabel(r'$\left\langle  \frac{J^5_z(\mu) - J^5_z(0)}{J^5_{z,free}(\mu) - J^5_{z,free}(0)} \right\rangle$', {'fontsize': 15})
plt.xlabel(r'$\mu$, MeV' )
plt.ylim(-2, 2)
ax.legend(loc='best', frameon=True)
plt.tight_layout()
plt.draw()
fig.savefig(path.join(outpath, "AxialCurrentFraction.png"))
plt.clf()

fig, ax = plt.subplots(figsize=(10, 5))
for i, id_val in enumerate(id_s_to_print):
	f = id_val * batch_size
	t = (id_val + 1) * batch_size
	current = Jz[f:t]
	currentErr = JzErr[f:t]
	mu_slice =  mu[f:t]
	a_val = a[f]
	T_val = T[f]
	qB_val = qB[f]
	ax.errorbar(mu_slice, current, yerr=currentErr, 
		fmt='o', label=(r'$qB = $'+str(np.round(qB_val,2))+r' ${GeV}^2$ $T = $'+str(np.round(T_val,2))+r' $MeV$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[i], color=colors[i])
plt.grid(which='both', axis='both')
plt.ylabel(r'$\left\langle  J^5_z(\mu) \right\rangle$', {'fontsize': 15})
plt.xlabel(r'$\mu$, MeV' )
ax.legend(loc='best', frameon=True)
plt.tight_layout()
plt.draw()
fig.savefig(path.join(outpath, "AxialCurrentInteract.png"))
plt.clf()

fig, ax = plt.subplots(figsize=(10, 5))
for i, id_val in enumerate(id_s_to_print):
	f = id_val * batch_size
	t = (id_val + 1) * batch_size
	current = freeJz[f:t]
	currentErr = freeJzErr[f:t]
	mu_slice =  mu[f:t]
	a_val = a[f]
	T_val = T[f]
	qB_val = qB[f]
	ax.errorbar(mu_slice, current, yerr=currentErr, 
		fmt='o', label=(r'$qB = $'+str(np.round(qB_val,2))+r' ${GeV}^2$ $T = $'+str(np.round(T_val,2))+r' $MeV$'), ls='--', marker='o', capsize=5, capthick=1, ecolor=colors[i], color=colors[i])
plt.grid(which='both', axis='both')
plt.ylabel(r'$\left\langle  J^5_{z,free}(\mu) \right\rangle$', {'fontsize': 15})
plt.xlabel(r'$\mu$, MeV' )
ax.legend(loc='best', frameon=True)
plt.tight_layout()
plt.draw()
fig.savefig(path.join(outpath, "AxialCurrentFree.png"))
plt.clf()