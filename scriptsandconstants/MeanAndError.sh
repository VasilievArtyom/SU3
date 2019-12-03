#!/bin/bash


projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag
rm AxialCurrent.txt
echo "#Ls   Lt  mu  ma  nfluxes AxialCurrent Err" >> AxialCurrent.txt

for Ls in 12 16 24
do
for Lt in 12 16 24
do
for mu in 0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75
do
for ma in 0.001
do
for nfluxes in {0..50}
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

cp MeanAndError.py ${logspath}/MeanAndError.py
cd ${logspath}
cp info_log.txt info_log_bu.txt
csplit ${logspath}/info_log.txt '/^#/' '{*}'
python3 MeanAndError.py
rm info_log.txt
cat xx00 >> info_log.txt
cat xx01 >> info_log.txt
cat xx02 >> info_log.txt
cat xx03 >> info_log.txt
cat xx04 >> info_log.txt
cat xx05 >> info_log.txt

rm xx00
rm xx01
rm xx02
rm xx03
rm xx04
rm xx05
rm MeanAndError.py
cd -

done
done
done
done
done

#echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> AxialCurrent.txt