#!/bin/bash
nohup ./home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.14399/m_sa=0.134929/nfluxes=42 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.14399/m_sa=0.134929/nfluxes=42 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.14399/m_sa=0.134929/nfluxes=42 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.14399/m_sa=0.134929/nfluxes=42/constants.txt -A
echo 3443{Ls}^3x6/mu=0.14399/m_sa=0.134929/nfluxes=42 >> calclog.txt
. /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
