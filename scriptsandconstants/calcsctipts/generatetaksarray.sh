#!/bin/bash

let i=0
projpath=/home/vasilievav15_2089/_scratch/proj/SU3_stag/bin/SU3_stag
calc_mode=o

rm task*.sh

for Ls in 12 16 24
do
for Lt in 12 16 24
do
for ma in 0.001
do
for mu in 0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75
do
for nfluxes in {0..50}
do
logspath=/home/vasilievav15_2089/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
confpath=/home/vasilievav15_2089/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
outppath=/home/vasilievav15_2089/_scratch/compute/SU3/output/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
conspath=/home/vasilievav15_2089/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}


echo "#!/bin/bash" >> task${i}.sh
chmod +x task${i}.sh
echo ".${projpath} -G0 -L${logspath} -O${confpath} -D${outppath} -Nconf_gen -C${conspath}/constants.txt -A${calc_mode}" >> task${i}.sh
echo "echo ${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes} >> calclog.txt" >> task${i}.sh
let i++

done
done
done
done
done

echo "There are ${i} tasks generated"
