#!/bin/bash

echo "#PBS -q kepler"
echo "#PBS -m ea"
echo "#PBS -N multigputest"
echo "#PBS -M vasiliev.av15@physics.msu.ru"
echo "#PBS -l nodes=rrcmpi-k-012:ppn=8"
echo ""
echo ""
echo "mpirun  ${1} -G0 -L${2} -O${3} -Nconf_gen -D${3} -C${4} -Ag"
