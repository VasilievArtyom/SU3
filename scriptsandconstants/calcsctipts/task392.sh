#!/bin/bash
./home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag -G0 -L/home/vasiliev_artyom/_scratch/compute/SU3/logs/24^3x6/mu=0.00000/m_sa=0.09367/nfluxes=33 -O/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.00000/m_sa=0.09367/nfluxes=33 -D/home/vasiliev_artyom/_scratch/compute/SU3/output/24^3x6/mu=0.00000/m_sa=0.09367/nfluxes=33 -Nconf_gen -C/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/24^3x6/mu=0.00000/m_sa=0.09367/nfluxes=33/constants.txt -A
echo 2137{Ls}^3x6/mu=0.00000/m_sa=0.09367/nfluxes=33 >> calclog.txt
./home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh
