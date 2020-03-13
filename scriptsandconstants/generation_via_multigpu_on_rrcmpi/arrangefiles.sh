#!/bin/bash


projpath=/home/clusters/01/vasiliev/_sсratch/proj/SU3_stag

Ls=$1
Lt=$2
beta=$3
m_qa=$4
m_sa=$5
nfluxes=$6
mu5=$7
mu_im_u=$8
mu_im_d=$9
mu_im_s=$10
mu_isospin=$11
lambda=$12

echo 'Ls, spatial lattice size'
echo ${Ls}
echo 'Lt, temporal lattice size'
echo ${Lt}
echo 'beta'
echo ${beta}
echo 'c_plaq'
echo '1.0'
echo 'c_rect'
echo '0.0'
echo 'rho, parameter of the isotropic stout smearing (2 steps, relevant for the Dirac operator; 0.0 --- no smearing)'
echo '0.15'
echo 'leapfrog N'
echo '100'
echo 'leapfrog dt'
echo '0.01'
echo 'start_info, 0 --- cold start; 1 --- hot start; 2 --- starting from conf_start.conf, located in confs_dir; 3 -- starting from cold conf with mag. field'
echo '0'
echo 'skip_confs, only configurations, separated by skip_confs, will be saved'
echo '9'
echo 'NMC, number of configurations for generation'
echo '0'
echo 'adjust_leapfrog, 1 --- tune integrator step for desired acceptance (see below)'
echo '1'
echo 'N_thermalisation, number of configurations for thermalisation'
echo '500'
echo 'N_accept_measure, every N_accept_measure configurations leapfrog dt will be corrected to fit acceptance rate boundaries'
echo '15'
echo 'N_min_acc, minimal acceptance rate'
echo '0.65'
echo 'N_max_acc, maximal acceptance rate'
echo '0.85'
echo 'flag_add_fermions, 0 --- without fermions, 1 --- with fermions'
echo '0'
echo 'm_qa, mass of the light quarks'
echo ${m_qa}
echo 'flag_add_strange_quark, 0 --- without s-quark, 1 --- with s-quark'
echo '0'
echo 'm_sa, mass of the strange quark'
echo ${m_sa}
echo '/home/itep/astrahantsev/SU3_stag/approx_files/InvFourthRoot.txt'
echo '/home/itep/astrahantsev/SU3_stag/approx_files/InvFourthRoot_fine.txt'
echo '/home/itep/astrahantsev/SU3_stag/approx_files/EighthRoot.txt'
echo 'Parameters CG for MD, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)'
echo '0 1e-6 0.1'
echo 'Parameters CG for Metro, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)'
echo '0 1e-6 0.1'
echo 'Parameters CG for Observables, type (0 = double, 1 = mixed, 2 = float), epsilon, delta (relevant only for CG_type == 1)'
echo '0 1e-6 0.1'
echo 'CG_max_iterations(for all types)'
echo '100000'
echo 'omelyan lambda, parameter of the Omelyan integrator'
echo '0.193'
echo 'omelyan N_steps, N_gauge_steps/N_fermion_steps in the multiple timescales integration'
echo '3'
echo 'n_rooting, power of the root from fermionic determinant, below it should stand 3 files with the coefficients of approximations'
echo '1'
echo '/home/itep/astrahantsev/SU3_stag/approx_files/InvSqrRoot.txt'
echo '/home/itep/astrahantsev/SU3_stag/approx_files/InvSqrRoot_fine.txt'
echo '/home/itep/astrahantsev/SU3_stag/approx_files/FourthRoot.txt'
echo 'N_stoch_estimator, number of random vectors for the stochastic estimator. It should be even.'
echo '10'
echo 'n_print_obs, only for (n_print_obs)th configuration observables will be calculated during generation'
echo '1'
echo 'n_fermions, n-root trick (useful only for n_rooting > 1)'
echo '1'
echo 'Magnetic fields (nfluxes), this flag should be used together with the macros EMFIELD in Makefile.var'
echo ${nfluxes}
echo 'mu5 (0=const, 1=from file). Next value is either constant or file_name. Only 0 works now'
echo "0 ${mu5}"
echo 'mu_im_u mu_im_d mu_im_s, imaginary chemical potential for each quark'
echo "${mu_im_u} ${mu_im_d} ${mu_im_s}"
echo 'mu_isospin and lambda, isospin chemical potential for light quarks and isospin breaking source (the macros MUISO in Makefile.var has to be enabled)'
echo "${mu_isospin} ${lambda}"
echo 'nev m, number of eigenvectors for deflation (to enable deflated solver set it non-zero) and restart frequency (m has to be > 2 * nev)'
echo '8 40 200'
