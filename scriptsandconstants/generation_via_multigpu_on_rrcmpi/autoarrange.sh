#!/bin/bash
declare -a arr=(
'24 4 4.036 0.000529100 0.001861770 0 0 0 0 0 0 0.0000000'
'24 4 4.036 0.000529100 0.001861770 0 0 0 0 0 0 0.0000529'
'24 4 4.036 0.000529100 0.001861770 0 0 0 0 0 0 0.0001058'
'24 4 4.036 0.000529100 0.001861770 0 0 0 0 0 0 0.0002116'
'24 4 4.036 0.000529100 0.001861770 0 0 0 0 0 0 0.0003175'
'28 4 4.140 0.000364945 0.001281280 0 0 0 0 0 0 0.0000000'
'28 4 4.140 0.000364945 0.001281280 0 0 0 0 0 0 0.0000365'
'28 4 4.140 0.000364945 0.001281280 0 0 0 0 0 0 0.0000730'
'28 4 4.140 0.000364945 0.001281280 0 0 0 0 0 0 0.0001460'
'28 4 4.140 0.000364945 0.001281280 0 0 0 0 0 0 0.0002190'
'20 4 3.938 0.000774506 0.002719200 0 0 0 0 0 0 0.0000000'
'20 4 3.938 0.000774506 0.002719200 0 0 0 0 0 0 0.0000775'
'20 4 3.938 0.000774506 0.002719200 0 0 0 0 0 0 0.0001549'
'20 4 3.938 0.000774506 0.002719200 0 0 0 0 0 0 0.0003098'
'20 4 3.938 0.000774506 0.002719200 0 0 0 0 0 0 0.0004647'
)

let j=0
for i in "${arr[@]}"
do
    Ls=$( echo $i | cut -d' ' -f1)
    Lt=$( echo $i | cut -d' ' -f2)
    beta=$( echo $i | cut -d' ' -f3)
    m_qa=$( echo $i | cut -d' ' -f4)
    m_sa=$( echo $i | cut -d' ' -f5)
    nfluxes=$( echo $i | cut -d' ' -f6)
    mu5=$( echo $i | cut -d' ' -f7)
    mu_im_u=$( echo $i | cut -d' ' -f8)
    mu_im_d=$( echo $i | cut -d' ' -f9)
    mu_im_s=$( echo $i | cut -d' ' -f'10')
    mu_isospin=$( echo $i | cut -d' ' -f'11')
    lambda=$( echo $i | cut -d' ' -f'12')
    logspath=/home/clusters/01/vasiliev/job_id=0/compute/logs /${Ls}^3x${Lt}/${pathto}
    confpath=/home/clusters/01/vasiliev/job_id=0/compute/configurations /${Ls}^3x${Lt}/${pathto}
    outppath=/home/clusters/01/vasiliev/job_id=0/compute/output /${Ls}^3x${Lt}/${pathto}
    conspath=/home/clusters/01/vasiliev/job_id=0/compute/scriptsandconstants /${Ls}^3x${Lt}/${pathto}

    bash printconstants.sh ${Ls} ${Lt} ${beta} ${m_qa} ${m_sa} ${nfluxes} ${mu5} ${mu_im_u} ${mu_im_d} ${mu_im_s} ${mu_isospin} ${lambda} >> .txt
done

