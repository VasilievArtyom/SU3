#!/bin/bash
declare -a arr=(
beta_3.45887_m0.152226_muoverpit_0.0_b6/
beta_3.45887_m0.152226_muoverpit_0.14_b6/
beta_3.45887_m0.152226_muoverpit_0.17_b6/
beta_3.45887_m0.152226_muoverpit_0.1_b6/
beta_3.45887_m0.152226_muoverpit_0.20_b6/
beta_3.45887_m0.152226_muoverpit_0.22_b6/
beta_3.45887_m0.152226_muoverpit_0.24_b6/
beta_3.45887_m0.152226_muoverpit_0.275_b6/
beta_3.7927_m0.04521_muoverpit_0.0_b1/
beta_3.7927_m0.04521_muoverpit_0.14_b1/
beta_3.7927_m0.04521_muoverpit_0.17_b1/
beta_3.7927_m0.04521_muoverpit_0.1_b1/
beta_3.7927_m0.04521_muoverpit_0.20_b1/
beta_3.7927_m0.04521_muoverpit_0.22_b1/
beta_3.7927_m0.04521_muoverpit_0.24_b1/
beta_3.7927_m0.04521_muoverpit_0.275_b1/
beta_3.47519_m0.141803_muoverpit_0.0_b83/
beta_3.47519_m0.141803_muoverpit_0.14_b83/
beta_3.47519_m0.141803_muoverpit_0.17_b83/
beta_3.47519_m0.141803_muoverpit_0.1_b83/
beta_3.47519_m0.141803_muoverpit_0.20_b83/
beta_3.47519_m0.141803_muoverpit_0.22_b83/
beta_3.47519_m0.141803_muoverpit_0.24_b83/
beta_3.47519_m0.141803_muoverpit_0.275_b83/
beta_3.6562_m0.06703_muoverpit_0.0_b30/
beta_3.6562_m0.06703_muoverpit_0.14_b30/
beta_3.6562_m0.06703_muoverpit_0.17_b30/
beta_3.6562_m0.06703_muoverpit_0.1_b30/
beta_3.6562_m0.06703_muoverpit_0.20_b30/
beta_3.6562_m0.06703_muoverpit_0.22_b30/
beta_3.6562_m0.06703_muoverpit_0.24_b30/
beta_3.6562_m0.06703_muoverpit_0.275_b30/
)

let j=0
for i in "${arr[@]}"
do
    currentpath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/configurations/SU3_pseudocriticalB_true_fjord/log_24_6/${i}
    beta=$(sed -n 6p ${currentpath}constants.txt)
    Ls=24
    Lt=6
    mqa=$(sed -n 36p ${currentpath}constants.txt)
    msa=$(sed -n 40p ${currentpath}constants.txt)
    mu_string=$(sed -n 72p ${currentpath}constants.txt)
    mu=$(echo $mu_string | awk '{print $1}')
    nfluxes=$(sed -n 68p /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/configurations/SU3_pseudocriticalB_true_fjord/log_24_6/${i}constants.txt)
    logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/${i}
    confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/${i}
    outppath=/home/vasiliev_artyom/_scratch/compute/SU3/output/${Ls}^3x${Lt}/${i}
    conspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/${i}

    #./arrangefiles.sh ${beta} 24 6 ${mqa} ${msa} ${mu} ${nfluxes} $i
    #logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/m_sa=${msa}/nfluxes=${nfluxes}
    #confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/m_sa=${msa}/nfluxes=${nfluxes}
    #outppath=/home/vasiliev_artyom/_scratch/compute/SU3/output/${Ls}^3x${Lt}/mu=${mu}/m_sa=${msa}/nfluxes=${nfluxes}
    #conspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/mu=${mu}/m_sa=${msa}/nfluxes=${nfluxes}
    #rm ${confpath}/index.txt
    #echo "20" >> ${confpath}/index.txt
    #for N in {1..20}
    #do
    #  echo "/home/vasiliev_artyom/_scratch/compute/SU3/configurations/24^3x6/mu=0.00/ma=0.01/nfluxes=0/conf_gen0001.conf" >> ${confpath}/index.txt
    #done
    projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag
    calc_mode=o
    rm calcsctipts/task${j}.sh
    echo "#!/bin/bash" >> calcsctipts/task${j}.sh
    chmod +x calcsctipts/task${j}.sh
    echo "expect /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/dwnld/autodwnld $i" >> calcsctipts/task${j}.sh
    echo "rm ${confpath}index.txt" >> calcsctipts/task${j}.sh
    echo "ls -d ${confpath}conf* | wc -l >> ${confpath}/index.txt" >> calcsctipts/task${j}.sh
    echo "ls -d ${confpath}conf* >> ${confpath}/index.txt" >> calcsctipts/task${j}.sh
    echo "nohup ${projpath} -G0 -L${logspath} -O${confpath} -D${outppath} -Nconf -C${conspath}constants.txt -A${calc_mode}" >> calcsctipts/task${j}.sh
    echo "echo ${i} >> calclog.txt" >> calcsctipts/task${j}.sh
    echo "rm ${confpath}conf*" >> calcsctipts/task${j}.sh
    echo ". /home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/BU.sh" >> calcsctipts/task${j}.sh
    let j++
done

