#!/bin/bash
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.07330/m_sa=0.115094/nfluxes=26 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.07330/m_sa=0.115094/nfluxes=26 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.07330/m_sa=0.115094/nfluxes=26 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.07330/m_sa=0.115094/nfluxes=26/constants.txt -Ao
echo 24^3x6/mu=0.07330/m_sa=0.115094/nfluxes=26 >> calclog.txt
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
