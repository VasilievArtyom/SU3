#!/bin/bash


projpath=/home/vasiliev_artyom/proj/SU3_stag/bin/SU3_stag


for Ls in 24 
do
for Lt in 6
do
for ma in 0.01
do
for mu in 0.00 
do
for nfluxes in 0
do
logspath=/home/vasiliev_artyom/_scratch/compute/SU3/logs/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
confpath=/home/vasiliev_artyom/_scratch/compute/SU3/configurations/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
outppath=/home/vasiliev_artyom/_scratch/compute/SU3/output/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
conspath=/home/vasiliev_artyom/_scratch/compute/SU3/scriptsandconstants/${Ls}^3x${Lt}/mu=${mu}/ma=${ma}/nfluxes=${nfluxes}
mkdir -p ${logspath}
mkdir -p ${confpath}
mkdir -p ${outppath}
mkdir -p ${conspath}

cd ${conspath}
rm constants.txt

echo 'Ls, spatial lattice size' >> constants.txt
echo ${Ls} >> constants.txt
echo 'Lt, temporal latticesize' >> constants.txt
echo ${Lt} >> constants.txt
echo 'beta' >> constants.txt
echo '5.15' >> constants.txt
echo 'c_plaq' >> constants.txt
echo '1.00' >> constants.txt
echo 'c_rect' >> constants.txt
echo '0.00' >> constants.txt
echo 'rho, parameter of the isotropic stout smearing (2 steps, relevant for the Dirac operator; 0.0 --- no smearing)' >> constants.txt
echo '0.0' >> constants.txt
echo 'leapfrog N' >> constants.txt
echo '2' >> constants.txt
echo 'leapfrog dt' >> constants.txt
echo '0' >> constants.txt
echo 'start_info, 0 --- cold start; 1 --- hot start; 2 --- starting from conf_start.conf, located in confs_dir' >> constants.txt
echo '0' >> constants.txt
echo 'skip_confs, only configurations, separated by skip_confs, will be saved' >> constants.txt
echo '0' >> constants.txt
echo 'NMC, number of configurations for generation' >> constants.txt
echo '1' >> constants.txt
echo 'adjust_leapfrog, 1 --- tune integrator step for desired acceptance (see below)' >> constants.txt
echo '1' >> constants.txt
echo 'N_thermalisation, number of configurations for thermalisation' >> constants.txt
echo '10' >> constants.txt
echo 'N_accept_measure, every N_accept_measure configurations leapfrog dt will be corrected to fit acceptance rate boundaries' >> constants.txt
echo '5' >> constants.txt
echo 'N_min_acc, minimal acceptance rate' >> constants.txt
echo '0.70' >> constants.txt
echo 'N_max_acc, maximal acceptance rate' >> constants.txt
echo '0.85' >> constants.txt
echo 'flag_add_fermions, 0 --- without fermions, 1 --- with fermions' >> constants.txt
echo '1' >> constants.txt
echo 'm_qa, mass of the light quarks' >> constants.txt
echo ${ma} >> constants.txt
echo 'flag_add_strange_quark, 0 --- without s-quark, 1 --- with s-quark' >> constants.txt
echo '0' >> constants.txt
echo 'm_sa, mass of the strange quark, below it should stand 3 files with the coefficients of approximations (-1/4, -1/4, 1/8)' >> constants.txt
echo '0.40' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/InvFourthRoot.txt' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/InvFourthRoot_fine.txt' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/EighthRoot.txt' >> constants.txt
echo 'Parameters CG for MD, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)' >> constants.txt
echo '0 1e-12 0.1' >> constants.txt
echo 'Parameters CG for Metro, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)' >> constants.txt
echo '0 1e-12 0.1' >> constants.txt
echo 'Parameters CG for Observables, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)' >> constants.txt
echo '0 1e-12 0.1' >> constants.txt
echo 'CG_max_iterations(for all types)' >> constants.txt
echo '100000' >> constants.txt
echo 'omelyan lambda, parameter of the Omelyan integrator' >> constants.txt
echo '0.193' >> constants.txt
echo 'omelyan N_steps, N_gauge_steps/N_fermion_steps in the multiple timescales integration' >> constants.txt
echo '3' >> constants.txt
echo 'n_rooting, power of the root from fermionic determinant, below it should stand 3 files with the coefficients of approximations' >> constants.txt
echo '2' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/InvSqrRoot.txt' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/FourthRoot.txt' >> constants.txt
echo '/home/vasiliev_artyom/proj/SU3_stag/approx_files/InvSqrRoot_fine.txt' >> constants.txt
echo 'N_stoch_estimator, number of random vectors for the stochastic estimator. It should be even.' >> constants.txt
echo '6' >> constants.txt
echo 'n_print_obs, only for (n_print_obs)th configuration observables will be calculated during generation' >> constants.txt
echo '1' >> constants.txt
echo 'n_fermions, n-root trick (useful only for n_rooting > 1)' >> constants.txt
echo '1' >> constants.txt
echo 'Magnetic fields (nfluxes), this flag should be used together with the macros EMFIELD in Makefile.var' >> constants.txt
echo ${nfluxes} >> constants.txt
echo 'mu5 (0=const, 1=from file). Next value is either constant or file_name. Only 0 works now' >> constants.txt
echo '0 0.0' >> constants.txt
echo 'mu_im_u mu_im_d mu_im_s, imaginary chemical potential for each quark' >> constants.txt
echo "${mu} ${mu} ${mu}" >> constants.txt
echo 'mu_isospin and lambda, isospin chemical potential for light quarks and isospin breaking source (the macros MUISO in Makefile.var has to be enabled)' >> constants.txt
echo '0.00 0.00' >> constants.txt
cd -
done
done
done
done
done
