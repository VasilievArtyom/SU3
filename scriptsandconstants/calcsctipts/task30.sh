#!/bin/bash
expect /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/dwnld/autodwnld beta_3.6562_m0.06703_muoverpit_0.24_b30/
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/conf* | wc -l >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30//index.txt
ls -d /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/conf* >> /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30//index.txt
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/ -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/ -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/ -Nconf -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/constants.txt -Ao
echo beta_3.6562_m0.06703_muoverpit_0.24_b30/ >> calclog.txt
rm /home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/beta_3.6562_m0.06703_muoverpit_0.24_b30/conf*
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
