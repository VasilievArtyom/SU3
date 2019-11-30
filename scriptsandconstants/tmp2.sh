#!/bin/bash

for Ls in 8 
do
for Lt in 8 
do
for ma in 0.001
do
for _mu in {000..700}
do
for nfluxes in {0..32}
do
mu=0.${_mu}

#confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
echo ${mu}
#cp /home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=0.05/ma=0.01/nfluxes=0/conf_gen0001.conf ${confpath}/conf_gen0001.conf



done
done
done
done
done

