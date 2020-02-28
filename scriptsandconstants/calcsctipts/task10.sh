#!/bin/bash
expect /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/dwnld/autodwnld beta_3.7927_m0.04521_muoverpit_0.17_b1/
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/conf* | wc -l >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1//index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/conf* >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1//index.txt
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/ -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/ -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/ -Nconf -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/constants.txt -Ao
echo beta_3.7927_m0.04521_muoverpit_0.17_b1/ >> calclog.txt
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.7927_m0.04521_muoverpit_0.17_b1/conf*
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
