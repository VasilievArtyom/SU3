#!/bin/bash

for Ls in 12 16 24 
do
for Lt in 12 16 24
do
for ma in 0.001
do
for mu in 0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75
do
for nfluxes in {0..30}
do
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

mkdir -p ${confpath}

cd ${confpath}

thispath=$(pwd)

#rm LAST.CONF
#rm index.txt
#rm conf_gen001.conf
#cp /home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=0.05/ma=0.01/nfluxes=0/conf_gen0011.conf conf_gen001.conf
#echo "50" >> index.txt
#cp conf_gen0011.conf conf_gen001.conf
#cp conf_gen001.conf conf_gen0011.conf
#for N in {1..50}
#do
#    echo "${thispath}/conf_gen001.conf" >> index.txt
#done
cd -

done
done
done
done
done


