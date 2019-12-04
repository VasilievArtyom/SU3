#!/bin/bash

for Ls in 8
do
for Lt in 8
do
for mu in 0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70
do
for ma in 0.01 0.0001
do
for nfluxes in {0..32}
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
