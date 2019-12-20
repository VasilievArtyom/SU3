#!/bin/bash

projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag

rm calclog.txt
echo "Start calculation at $(date)" >> calclog.txt

max_nfluxes=0
for Ls in 8
do
let max_nfluxes=${Ls}*${Ls}/2
for Lt in 8
do
for ma in 0.0015
do
for mu in 0.00 #0.10
do
for ((nfluxes=0; nfluxes<=max_nfluxes; nfluxes++))
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
outppath=/home/vasiliev_artyom/_scratch/compute/SU3/output/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
conspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
calc_mode=o


echo  ${projpath} -G0 -L${logspath} -O${confpath} -D${outppath} -Nconf_gen -C${conspath}/constants.txt -A${calc_mode}

echo ${logspath}
echo $(date)
echo ${logspath} >> calclog.txt
echo $(date) >> calclog.txt

#./BU.sh

done
done
done
done
done

echo "Calculation finished at $(date)" >> calclog.txt


