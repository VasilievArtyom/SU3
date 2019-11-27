#!/bin/bash
#
#SBATCH --job-name=SU3
#SBATCH --partition compute
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-task=1
#SBATCH --output=output.txt
#SBATCH --mail-user=vasiliev.av15@physics.msu.ru
#SBATCH --mail-type=All

scriptspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/calcscripts
module add cuda/6.5

for task in {0..8}
do
    srun -n1 --exclusive ${scriptspath}/task${task}.sh &
done

wait
