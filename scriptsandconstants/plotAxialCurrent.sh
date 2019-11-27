#!/bin/bash

rm -rf AxialCurrent/
mkdir -p AxialCurrent/nfluxes_mu
mkdir -p AxialCurrent/nfluxes_ma
mkdir -p AxialCurrent/nfluxes_Nt
mkdir -p AxialCurrent/nfluxes_Ns

python3 AxialCurrent.py
