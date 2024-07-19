#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/code


# NGEE Arctic Repositories
git clone --recursive -b rfiorella/IM3-shrub-bending git@github.com:lanl/NGEE-Arctic-E3SM $CODE/NGEE-Arctic-E3SM-IM3
git clone --recursive -b lanl/IM1 git@github.com:lanl/NGEE-Arctic-E3SM $CODE/NGEE-Arctic-E3SM-lanlIM1
git clone -b rfiorella/era5 git@github.com:rfiorella/OLMT $CODE/OLMT

# Early career project
git clone --recursive -b rfiorella/eamxx/wiso git@github.com:rfiorella/E3SM $CODE/EAMXX-wiso
git clone --recursive -b rfiorella/eamv2/wiso git@github.com:rfiorella/E3SM $CODE/EAMv2-wiso

# Amanzi/ATS
git clone git@github.com:amanzi/amanzi $CODE/amanzi
git clone git@github.com:environmental-modeling-workflows:watershed-workflow $CODE/watershed-workflow

# Various NEON Repositories:
git clone git@github.com:rfiorella/NEON-fluxprocessing $CODE/NEON-fluxprocessing
git clone git@github.com:rfiorella/NEONiso $CODE/NEONiso
git clone git@github.com:rfiorella/neonIsoDiag $CODE/neonIsoDiag
git clone git@github.com:NEONScience/NEON-utilities $CODE/NEON-utilities
git clone git@github.com:NEONScience/NEON-FIU-algorithm $CODE/NEON-FIU-algorithm

# Other models
git clone git@github.com:wrf-model/WRF $CODE/WRF
git clone git@github.com:wrf-model/WPS $CODE/WPS
git clone git@github.com:rfiorella/model-containers $CODE/model-containers
git clone git@github.com:rfiorella/CAM $CODE/iCAM
$CODE/iCAM/manage_externals/checkout_externals
git clone git@github.com:flexpart/flexpart $CODE/flexpart
git clone git@github.com:firelab/windninja $CODE/windninja


# Tutorials:
git clone git@github.com:xarray-contrib/xarray-tutorial $CODE/xarray-tutorial
git clone git@github.com:wlandau/targets-tutorial $CODE/targets-tutorial
git clone git@github.com:kokkos/kokkos-tutorials $CODE/kokkos-tutorials


