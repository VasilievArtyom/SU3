#!/bin/bash
nohup /home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.12566/m_sa=0.06703/nfluxes=2 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.12566/m_sa=0.06703/nfluxes=2 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.12566/m_sa=0.06703/nfluxes=2 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.12566/m_sa=0.06703/nfluxes=2/constants.txt -Ao
echo 24^3x6/mu=0.12566/m_sa=0.06703/nfluxes=2 >> calclog.txt
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
