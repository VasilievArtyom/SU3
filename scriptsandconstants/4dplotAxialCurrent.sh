#!/bin/bash

rm -rf 4dAxialCurrent/
mkdir -p 4dAxialCurrent/nfluxes_mu
mkdir -p 4dAxialCurrent/nfluxes_ma
mkdir -p 4dAxialCurrent/nfluxes_Nt
mkdir -p 4dAxialCurrent/nfluxes_Ns

python3 4dAxialCurrent.py
