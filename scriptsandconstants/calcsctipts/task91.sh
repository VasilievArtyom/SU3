#!/bin/bash
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.05236/m_sa=0.128891/nfluxes=30 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.05236/m_sa=0.128891/nfluxes=30 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.05236/m_sa=0.128891/nfluxes=30 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.05236/m_sa=0.128891/nfluxes=30/constants.txt -A
echo 19933{Ls}^3x6/mu=0.05236/m_sa=0.128891/nfluxes=30 >> calclog.txt
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
