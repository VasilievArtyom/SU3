#!/bin/bash

for Ls in 8
do
for Lt in 8
do
for ma in 0.0015
do
for mu in 0.00 0.10
do
for nfluxes in {0..32}
do
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
printpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=0.00/ma=0.0015/nfluxes=0

cd ${confpath}

thispath=$(pwd)

rm index.txt
echo "10" >> index.txt
for N in {1..10}
do
    echo "${printpath}/conf_gen0001.conf" >> index.txt
done
cd -

done
done
done
done
done

