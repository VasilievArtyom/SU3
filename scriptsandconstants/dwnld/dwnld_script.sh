#!/bin/bash
#mkdir -p /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/configurations/SU3_pseudocriticalB_true_fjord/log_24_6/$1
scp -r vasiliev@rrcmpi-a.itep.ru:/home/clusters/01/kotov/SU3_pseudocriticalB_true_fjord/log_24_6/${1} /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/
echo "$1 done"
done

