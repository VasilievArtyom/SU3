#!/bin/bash


projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag
rm 4dAxialCurrent.txt
echo "#Ls   Lt  mu  ma  nfluxes J^5_t Err J^5_x Err J^5_y Err J^5_z Err" >> 4dAxialCurrent.txt

for Ls in 8
do
for Lt in 8
do
for mu in 0.025 0.05 0.1 0.2 0.3
do
for ma in 0.01 0.001 0.0005
do
for nfluxes in {0..7}
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

csplit ${logspath}/info_log.txt '/^#/' '{*}'
echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> 4dAxialCurrent.txt

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
