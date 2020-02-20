#!/bin/bash
./home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.11519/m_sa=0.12889/nfluxes=5 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.11519/m_sa=0.12889/nfluxes=5 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.11519/m_sa=0.12889/nfluxes=5 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.11519/m_sa=0.12889/nfluxes=5/constants.txt -A
echo 2137{Ls}^3x6/mu=0.11519/m_sa=0.12889/nfluxes=5 >> calclog.txt
./home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
