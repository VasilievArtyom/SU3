#!/bin/bash
#
#SBATCH --job-name=SU3
#SBATCH --partition compute
#SBATCH --nodes=1
#SBATCH --output=output.txt
#SBATCH --mail-user=vasiliev.av15@physics.msu.ru
#SBATCH --mail-type=All

projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag

for Ls in 24
do
for Lt in 12
do
for ma in 0.01
do
for mu in 0.05
do
for nfluxes in 0
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
outppath=/home/vasiliev_artyom/_scratch/compute/SU3/output/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
conspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

nohup ${projpath} -G0 -L${logspath} -O${confpath} -D${outppath} -Nconf_gen -C${conspath}/constants.txt
echo ${confpath}

echo $(date)
echo ${logspath} >> genlog.txt
echo $(date) >> genlog.txt


done
done
done
done
done
