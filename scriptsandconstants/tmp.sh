#!/bin/bash

for Ls in 8 10 12
do
for Lt in 8 10 12
do
for ma in 0.01 0.0001
do
for mu in 0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70
do
for nfluxes in {0..32}
do
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
printpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=0.00/ma=0.001/nfluxes=0

cd ${confpath}

thispath=$(pwd)

rm index.txt
echo "50" >> index.txt
for N in {1..50}
do
    echo "${printpath}/conf_gen0001.conf" >> index.txt
done
cd -

done
done
done
done
done

