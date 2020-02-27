#!/bin/bash
expect dwnld/autodwnld beta_3.47519_m0.141803_muoverpit_0.22_b83/
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/conf* | wc -l >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83//index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/conf* >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83//index.txt
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/ -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/ -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/ -Nconf -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/constants.txt -Ao
echo beta_3.47519_m0.141803_muoverpit_0.22_b83/ >> calclog.txt
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.47519_m0.141803_muoverpit_0.22_b83/conf*
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
