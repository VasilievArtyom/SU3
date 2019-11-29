#!/bin/bash


rm AxialCurrent.txt
rm -rf AxialCurrentData/

echo "#Ls   Lt  mu  ma  nfluxes AxialCurrent Err" >> AxialCurrent.txt

Ls_num=3
Lt_num=3
mu_num=8
ma_num=3
nfluxes_num=33

for Ls in 8 10 12
do
for Lt in 8 10 12
do

currentlatticepath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/AxialCurrentData/${Ls}^3x${Lt}
currentlatticeprintfile=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/AxialCurrentData/${Ls}^3x${Lt}/AxialCurrent.txt

for mu in 0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70
do
for ma in 0.001 0.01 0.0001
do

currentprinfile=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/AxialCurrentData/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/AxialCurrent.txt
currentpath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/AxialCurrentData/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}
mkdir -p ${currentpath}
echo "#Ls   Lt  mu  ma  nfluxes AxialCurrent Err" >> ${currentprinfile}
	for nfluxes in {0..32}
	do
	logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

	csplit ${logspath}/info_log.txt '/^#/' '{*}'
	echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> AxialCurrent.txt
	echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> ${currentprinfile}
	echo "${Ls} ${Lt} ${mu} ${ma} ${nfluxes} $(cat xx04 | head -2 | tail -1)" >> ${currentlatticeprintfile}

	rm xx00
	rm xx01
	rm xx02
	rm xx03
	rm xx04
	rm xx05
	done
cp sigleAxialCurrentPlot.py ${currentpath}/plot.py
cd ${currentpath}
tac AxialCurrent.txt | awk '{if ($6=="") {$6="nan"; $7="nan"}; print}' | tac >> _AxialCurrent.txt
cp _AxialCurrent.txt AxialCurrent.txt
rm _AxialCurrent.txt
python3 plot.py
rm plot.py
cd -

done
done

echo "#Ls   Lt  mu  ma  nfluxes AxialCurrent Err" >> ${currentlatticeprintfile}

cp currentLatticeAxialCurrent.py ${currentlatticepath}/plot.py
cd ${currentlatticepath}
tac AxialCurrent.txt | awk '{if ($6=="") {$6="nan"; $7="nan"}; print}' | tac >> _AxialCurrent.txt
cp _AxialCurrent.txt AxialCurrent.txt
rm _AxialCurrent.txt
python3 plot.py ${ma_num} ${mu_num} ${nfluxes_num}
rm plot.py
cd -


done
done

tac AxialCurrent.txt | awk '{if ($6=="") {$6="nan"; $7="nan"}; print}' | tac >> _AxialCurrent.txt
cp _AxialCurrent.txt AxialCurrent.txt
rm _AxialCurrent.txt
