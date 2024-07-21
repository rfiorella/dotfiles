#!/bin/sh

echo "Cloning repositories..."

CODE=/code

#===========================
# NGEE Arctic Repositories
#===========================
git clone --recursive -b rfiorella/IM3-shrub-bending git@github.com:lanl/NGEE-Arctic-E3SM $CODE/E3SM/IM3
git clone --recursive -b lanl/IM1 git@github.com:lanl/NGEE-Arctic-E3SM $CODE/E3SM/IM1
git clone -b rfiorella/era5 git@github.com:rfiorella/OLMT $CODE/E3SM/OLMT
# add important upstreams:
cd $CODE/E3SM/IM3; git remote add upstream git@github.com:thorntonpe/E3SM.git
cd $CODE/E3SM/IM1; git remote add upstream git@github.com:thorntonpe/E3SM.git
cd $CODE/E3SM/OLMT; git remote add upstream git@github.com:ricciutodm/OLMT.git

#======================
# Early career project
#======================
git clone --recursive -b rfiorella/eamxx/wiso git@github.com:rfiorella/E3SM $CODE/E3SM/EAMXX-wiso
git clone --recursive -b rfiorella/eamv2/wiso git@github.com:rfiorella/E3SM $CODE/E3SM/EAMv2-wiso
# add E3SM project upstreams
cd $CODE/E3SM/EAMXX-wiso; git remote add upstream git@github.com:E3SM-Project/E3SM.git
cd $CODE/E3SM/EAMv2-wiso; git remote add upstream git@github.com:E3SM-Project/E3SM.git

#=============================
# Amanzi/ATS (COMPASS, IDEAS)
#=============================
git clone git@github.com:amanzi/amanzi $CODE/amanzi
git clone git@github.com:amanzi/ats $CODE/ats
git clone git@github.com:environmental-modeling-workflows:watershed-workflow $CODE/watershed-workflow

#============================
# InteRFACE (nothing yet)
#============================


#============================
# Various NEON Repositories:
#============================
git clone git@github.com:rfiorella/NEON-fluxprocessing $CODE/NEON/NEON-fluxprocessing
git clone git@github.com:rfiorella/NEONiso $CODE/NEON/NEONiso
git clone git@github.com:rfiorella/neonIsoDiag $CODE/NEON/neonIsoDiag
git clone git@github.com:NEONScience/NEON-utilities $CODE/NEON/NEON-utilities
git clone git@github.com:rfiorella/NEON-FIU-algorithm $CODE/NEON/NEON-FIU-algorithm
git clone git@github.com:rfiorella/NEON_data_processing $CODE/NEON/NEON_data_processing
git clone git@github.com:rfiorella/UUfluxproc $CODE/NEON/UUfluxproc

# add important upstreams:
cd $CODE/NEON/NEON-FIU-algorithm; git remote add upstream git@github.com:NEONScience/NEON-FIU-algorithm

#==============
# Other models
#==============
git clone git@github.com:wrf-model/WRF $CODE/WRF
git clone git@github.com:wrf-model/WPS $CODE/WPS
git clone git@github.com:rfiorella/model-containers $CODE/model-containers
git clone git@github.com:rfiorella/CAM $CODE/CESM/iCAM
$CODE/iCAM/manage_externals/checkout_externals
git clone git@github.com:rfiorella/CLUBB_CESM $CODE/CESM/CLUBB_CESM
git clone git@github.com:rfiorella/cime $CODE/CESM/CLUBB_CIME
git clone git@github.com:flexpart/flexpart $CODE/flexpart
git clone git@github.com:firelab/windninja $CODE/windninja
git clone git@github.com:rfiorella/tropical-d18O-scales $CODE/attenuation-isotope-model

#============
# Tutorials:
#============
git clone git@github.com:xarray-contrib/xarray-tutorial $CODE/tutorials/
git clone git@github.com:wlandau/targets-tutorial $CODE/tutorials/
git clone git@github.com:kokkos/kokkos-tutorials $CODE/tutorials/
git clone git@github.com:amanzi/ats-demos $CODE/tutorials/

# Some conda-forge things I'm working on:
git clone git@github.com:rfiorella/subversion-feedstock $CODE/
git clone git@github.com:rfiorella/serf-feedstock $CODE/

#=============================================
# add some things to the packages directory:
#============================================
PACK=/packages

git clone git@github.com:amanzi/amanzi $PACK/src/
git clone git@github.com:amanzi/ats_manager $PACK/src/
git clone -b amanzi-1.5 git@github.com:amanzi/amanzi $PACK/src/amanzi-1.5 # last release


