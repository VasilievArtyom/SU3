#!/bin/bash

#for Ls in 12 16 24
#do
#for Lt in 12 16 24
#do
#for mu in 0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75
#do
#for ma in 0.001
#do
#for nfluxes in {0..50}
#do
#logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}

declare -a arr=(
#beta_3.45887_m0.152226_muoverpit_0.0_b6/
#beta_3.45887_m0.152226_muoverpit_0.14_b6/
#beta_3.45887_m0.152226_muoverpit_0.17_b6/
#beta_3.45887_m0.152226_muoverpit_0.1_b6/
#beta_3.45887_m0.152226_muoverpit_0.20_b6/
#beta_3.45887_m0.152226_muoverpit_0.22_b6/
#beta_3.45887_m0.152226_muoverpit_0.24_b6/
#beta_3.45887_m0.152226_muoverpit_0.275_b6/
#beta_3.7927_m0.04521_muoverpit_0.0_b1/
#beta_3.7927_m0.04521_muoverpit_0.14_b1/
#beta_3.7927_m0.04521_muoverpit_0.17_b1/
#beta_3.7927_m0.04521_muoverpit_0.1_b1/
#beta_3.7927_m0.04521_muoverpit_0.20_b1/
#beta_3.7927_m0.04521_muoverpit_0.22_b1/
#beta_3.7927_m0.04521_muoverpit_0.24_b1/
#beta_3.7927_m0.04521_muoverpit_0.275_b1/
#beta_3.47519_m0.141803_muoverpit_0.0_b83/
#beta_3.47519_m0.141803_muoverpit_0.14_b83/
#beta_3.47519_m0.141803_muoverpit_0.17_b83/
#beta_3.47519_m0.141803_muoverpit_0.1_b83/
#beta_3.47519_m0.141803_muoverpit_0.20_b83/
beta_3.47519_m0.141803_muoverpit_0.22_b83/
#beta_3.47519_m0.141803_muoverpit_0.24_b83/
#beta_3.47519_m0.141803_muoverpit_0.275_b83/
#beta_3.6562_m0.06703_muoverpit_0.0_b30/
#beta_3.6562_m0.06703_muoverpit_0.14_b30/
#beta_3.6562_m0.06703_muoverpit_0.17_b30/
#beta_3.6562_m0.06703_muoverpit_0.1_b30/
#beta_3.6562_m0.06703_muoverpit_0.20_b30/
#beta_3.6562_m0.06703_muoverpit_0.22_b30/
#beta_3.6562_m0.06703_muoverpit_0.24_b30/
#beta_3.6562_m0.06703_muoverpit_0.275_b30/
)

for i in "${arr[@]}"
do
      Ls=24
      Lt=6
      logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/${i}
      cp MeanAndError.py ${logspath}MeanAndError.py
      cd ${logspath}
      cp info_log.txt info_log_bu.txt
      csplit ${logspath}/info_log.txt '/^#/' '{*}'
      python3 MeanAndError.py
      rm info_log.txt
      cat xx00 >> info_log.txt
      cat xx01 >> info_log.txt
      cat xx02 >> info_log.txt
      cat xx03 >> info_log.txt
      cat xx04 >> info_log.txt
      cat xx05 >> info_log.txt

      rm xx00
      rm xx01
      rm xx02
      rm xx03
      rm xx04
      rm xx05
      rm MeanAndError.py
      cd -
done

#done
#done
#done
#done
#done
