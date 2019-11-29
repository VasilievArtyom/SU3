#!/bin/bash

for Ls in 8 10 12
do
for Lt in 8 10 12
do
for ma in 0.01 0.0001
do
for mu in 0.00 
do
for nfluxes in 0
do
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

cp /home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=0.05/ma=0.01/nfluxes=0/conf_gen0001.conf ${confpath}/conf_gen0001.conf



done
done
done
done
done

