#!/bin/bash
expect /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/dwnld/autodwnld beta_3.45887_m0.152226_muoverpit_0.22_b6/
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/conf* | wc -l >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6//index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/conf* >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6//index.txt
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/ -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/ -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/ -Nconf -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/constants.txt -Ao
echo beta_3.45887_m0.152226_muoverpit_0.22_b6/ >> calclog.txt
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.45887_m0.152226_muoverpit_0.22_b6/conf*
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
