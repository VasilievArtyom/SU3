#!/bin/bash


projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag
rm AxialCurrent.txt
echo "#Ls   Lt  mu  ma  nfluxes AxialCurrent Err" >> AxialCurrent.txt

for Ls in 8
do
for Lt in 8
do
for mu in 0.00 0.01 0.20 0.30 0.40 0.50 0.60 0.70
do
for ma in 0.001 0.01 0.0001
do
for nfluxes in {0..32}
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

csplit ${logspath}/info_log.txt '/^#/' '{*}'
echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> AxialCurrent.txt

rm xx00
rm xx01
rm xx02
rm xx03
rm xx04
rm xx05

done
done
done
done
done
