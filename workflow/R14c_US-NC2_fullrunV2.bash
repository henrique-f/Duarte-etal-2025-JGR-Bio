#!/bin/bash

#Wed Oct 16 10:28:52 AM EDT 2024: Found a way to prescribe harvest in fractional terms instead of mass rate

############################# BEGIN AD-SPIN CASE ###############################

export RUNXX="R14c"
export SITE="US-NC2"
export NOMECASO=${RUNXX}_${SITE}_adspin

#vvvvvvvvvvvvvvvvvvvvvvvvvv ADJUSTING A FEW PARAMETERS vvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-projects/cesm-inputdata/lnd/clm2/paramdata/ctsm60_params.c240208.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#kg/m3
ncap2 -O -s 'wood_density(1)=470.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#yr
ncap2 -O -s 'leaf_long(1)=1.76' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#m2/gC
ncap2 -O -s 'slatop(1)=0.0082' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gC
ncap2 -O -s 'froot_leaf(1)=1.76' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gC
ncap2 -O -s 'croot_stem(1)=0.3172' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#nstem, trees/m2
#WATCH OUT: REMEMBER TO ALSO SET THE POST-THINNING nstem VALUE BELOW
ncap2 -O -s 'nstem(1)=0.0635' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gN
ncap2 -O -s 'leafcn(1)=42.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gN
ncap2 -O -s 'lflitcn(1)=93.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gN
ncap2 -O -s 'frootcn(1)=52.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gC
ncap2 -O -s 'stem_leaf(1)=2.54' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#gC/gC
ncap2 -O -s 'flivewd(1)=0.076' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#kPa**0.5
ncap2 -O -s 'medlynslope(1)=3.096' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#
ncap2 -O -s 'medlynintercept(1)=18000.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#J/mol
ncap2 -O -s 'jmaxha=50000.*1.4' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc
ncap2 -O -s 'vcmaxha=72000.*1.4' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc
ncap2 -O -s 'tpuha=72000.*1.4' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc
ncap2 -O -s 'lmrha=46390.*2.' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#adim
ncap2 -O -s 'q10_hr=3.0' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc
ncap2 -O -s 'q10_mr=3.0' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#NEW, kg/m2
ncap2 -O -s 'liq_canopy_storage_scalar=0.4' ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}.nc

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW: will use new nstem after 58% thinning
cp ctsm60_params.c240208_${RUNXX}_${SITE}.nc ctsm60_params.c240208_${RUNXX}_${SITE}_postthinning.nc
ncap2 -O -s 'nstem(1)=0.02667' ctsm60_params.c240208_${RUNXX}_${SITE}_postthinning.nc ctsm60_params.c240208_${RUNXX}_${SITE}_postthinning.nc

#vvvvvvvvvvvv ADJUSTING SURFDATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 
#WATCH OUT, LANDUSE FILE CHANGES FOR TR{2|3|3b|4}OF4 CASES MUST BE CONSISTENT WITH THE CHANGES BELOW
cp /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc

ncap2 -O -s 'zbedrock(:,:)= 3.45' /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc

ncap2 -O -s 'PCT_NAT_PFT(1,:,:)= 100.' /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(10,:,:)= ?.' /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(13,:,:)= ?.' /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(14,:,:)= ?.' /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset 1850_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803

./xmlchange RUN_TYPE=startup
./xmlchange CLM_FORCE_COLDSTART=on
./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=0001-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 11 cycles of 19 years
./xmlchange STOP_N=209

./case.setup

#WATCH OUT, THIS NEEDS TO BE SET FOR EACH OF THE CASES BELOW (Watch out for consistency)
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=1" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=1" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams

echo "flanduse_timeseries = ' '" >> user_nl_clm
#echo "finidat = ' '" >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/"${SITE}"/MOD-"${RUNXX}"_surfdata_"${SITE}"_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_"${RUNXX}_${SITE}".nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
#echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc'" >> user_nl_clm

echo "hist_mfilt = 1" >> user_nl_clm
echo "hist_nhtfrq = -8760" >> user_nl_clm


./preview_namelists

./case.build
./case.submit

############################# END   AD-SPIN CASE ###############################


############################# BEGIN FINAL-SPIN CASE ############################

export NOMECASO=${RUNXX}_${SITE}_finalspin

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset 1850_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=0001-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 53 cycles of 19 years +16 years for alignment
./xmlchange STOP_N=1023

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=1" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=1" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams

echo "flanduse_timeseries = ' '" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_adspin/${RUNXX}_${SITE}_adspin/run/${RUNXX}_${SITE}_adspin.clm2.r.0210-01-01-00000.nc'" >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
#echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc'" >> user_nl_clm

echo "hist_mfilt = 1" >> user_nl_clm
echo "hist_nhtfrq = -8760" >> user_nl_clm


./preview_namelists

./case.build
./case.submit

############################# END   FINAL-SPIN CASE ############################


############################# BEGIN TR1of4 CASE ################################

export NOMECASO=${RUNXX}_${SITE}_tr1of4

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset HIST_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=1850-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 1850--1991
./xmlchange STOP_N=142

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams


echo "flanduse_timeseries = ' '" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_finalspin/${RUNXX}_${SITE}_finalspin/run/${RUNXX}_${SITE}_finalspin.clm2.r.1024-01-01-00000.nc'" >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
#echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc'" >> user_nl_clm

echo "hist_mfilt = 1" >> user_nl_clm
echo "hist_nhtfrq = -8760" >> user_nl_clm


./preview_namelists

./case.build
./case.submit

############################# END   TR1of4 CASE ################################


#CREATING LANDUSE FILE
#This will ensure that there is no land use change (same PFT allocation throughout the years) ##WATCH OUT! THIS MUST BE CONSISTENT WITH THE SURFMAP CREATED/MODIFIED ABOVE
#Here we also prescribe a 95% harvest disturbance in 1992 to simulate a clear cut (PFT 1) and a 58% harvest disturbance in 2010 to simulate thinning

cd /home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}

cp landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc

ncap2 -O -s 'PCT_URBAN=PCT_URBAN*0.0'                             MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_URBAN_MAX=PCT_URBAN_MAX*0.0'                     MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_LAKE=PCT_LAKE*0.0'                               MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_LAKE_MAX=PCT_LAKE_MAX*0.0'                       MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_CROP=PCT_CROP*0.0'                               MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_CROP_MAX=PCT_CROP_MAX*0.0'                       MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_VH1=HARVEST_VH1*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_VH2=HARVEST_VH2*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH1=HARVEST_SH1*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH2=HARVEST_SH2*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH3=HARVEST_SH3*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'GRAZING=GRAZING*0.0'                                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'UNREPRESENTED_PFT_LULCC=UNREPRESENTED_PFT_LULCC*0.0' MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'UNREPRESENTED_CFT_LULCC=UNREPRESENTED_CFT_LULCC*0.0' MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc

ncap2 -O -s 'PCT_NAT_PFT=PCT_NAT_PFT*0.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_NAT_PFT(:,1,:,:)=100.0'                           MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(:,10,:,:)=12.0'                          MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(:,13,:,:)=11.0'                          MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT(:,14,:,:)=34.0'                          MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc

ncap2 -O -s 'PCT_NAT_PFT_MAX=PCT_NAT_PFT_MAX*0.0'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'PCT_NAT_PFT_MAX(1,:,:)=100.0'                         MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT_MAX(10,:,:)=12.0'                        MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT_MAX(13,:,:)=11.0'                        MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
#ncap2 -O -s 'PCT_NAT_PFT_MAX(14,:,:)=34.0'                        MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc

#CLM code is smart to understand the units provided. If @units="unitless", CLM will interpret the values as fractions [0:1]. 
#Here I am simulating a clearcut by harvesting 95% of the tree pfts (pft 1 in this case) ---> Year 1992 (i=142)
#I am also simulating a forest thinning by harvesting 58% of the tree pfts (pft 1 in this case) ---> Year 2010 (i=160)
ncap2 -O -s "HARVEST_VH1(142,:,:)=0.95"                    MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s "HARVEST_VH1(160,:,:)=0.58"                    MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_VH1@units="unitless"'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_VH2@units="unitless"'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH1@units="unitless"'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH2@units="unitless"'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'HARVEST_SH3@units="unitless"'                 MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc
ncap2 -O -s 'GRAZING@units="unitless"'                     MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc


############################# BEGIN TR2of4 CASE ################################


export NOMECASO=${RUNXX}_${SITE}_tr2of4

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset HIST_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=1992-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 1992--2004
./xmlchange STOP_N=13

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams


echo "flanduse_timeseries = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc'" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_tr1of4/${RUNXX}_${SITE}_tr1of4/run/${RUNXX}_${SITE}_tr1of4.clm2.r.1992-01-01-00000.nc'" >> user_nl_clm
#IMPORTANT: there was no flanduse_timeseries set in the previous run (_tr1of4), and now there is. This requires the following namelist to avoid model crash:
echo "use_init_interp = .true." >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
#echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc'" >> user_nl_clm

echo "hist_mfilt = 1" >> user_nl_clm
echo "hist_nhtfrq = -8760" >> user_nl_clm


./preview_namelists

./case.build
./case.submit

############################# END   TR2of4 CASE ################################


############################# BEGIN TR3of4 CASE ################################


export NOMECASO=${RUNXX}_${SITE}_tr3of4

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset HIST_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=2005-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 2005--2009
./xmlchange STOP_N=5

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams

echo "flanduse_timeseries = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc'" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_tr2of4/${RUNXX}_${SITE}_tr2of4/run/${RUNXX}_${SITE}_tr2of4.clm2.r.2005-01-01-00000.nc'" >> user_nl_clm
#IMPORTANT: there was no flanduse_timeseries set in the previous run (_tr1of4), and now there is. This requires the following namelist to avoid model crash:
#echo "use_init_interp = .true." >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc', 'FSDS', 'FLDS', 'ZBOT', 'ER', 'AR', 'NPP', 'NEP', 'NEE', 'TOTFIRE', 'EFLX_LH_TOT', 'FSH', 'FSH_TO_COUPLER', 'QRUNOFF', 'QH2OSFC', 'QOVER', 'QDRAI', 'QDRAI_PERCH', 'QDRAI_XS', 'QFLOOD'" >> user_nl_clm
echo "hist_fincl3 = 'GPP','TLAI','ER','Qle','Qh','Qstor','Rnet','FCEV', 'FCTR', 'FGEV', 'TV', 'TSKIN'" >> user_nl_clm
echo "hist_mfilt = 1,1,1" >> user_nl_clm
echo "hist_nhtfrq = -8760,-24,-24" >> user_nl_clm
echo "hist_dov2xy = .true., .true., .false." >> user_nl_clm
echo "hist_type1d_pertape = ' ', ' ', 'PFTS'" >> user_nl_clm

./preview_namelists

./case.build
./case.submit

############################# END   TR3of4 CASE ################################


############################# BEGIN TR3bof4 CASE ################################ ....NEW


export NOMECASO=${RUNXX}_${SITE}_tr3bof4

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset HIST_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=2010-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 2010--2014
./xmlchange STOP_N=5

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams

echo "flanduse_timeseries = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc'" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_tr3of4/${RUNXX}_${SITE}_tr3of4/run/${RUNXX}_${SITE}_tr3of4.clm2.r.2010-01-01-00000.nc'" >> user_nl_clm
#IMPORTANT: there was no flanduse_timeseries set in the previous run (_tr1of4), and now there is. This requires the following namelist to avoid model crash:
#echo "use_init_interp = .true." >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
#POST THINNING PARAM FILE WATCH OUT!!!!!!!!
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}_postthinning.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc', 'FSDS', 'FLDS', 'ZBOT', 'ER', 'AR', 'NPP', 'NEP', 'NEE', 'TOTFIRE', 'EFLX_LH_TOT', 'FSH', 'FSH_TO_COUPLER', 'QRUNOFF', 'QH2OSFC', 'QOVER', 'QDRAI', 'QDRAI_PERCH', 'QDRAI_XS', 'QFLOOD'" >> user_nl_clm
echo "hist_fincl3 = 'GPP','TLAI','ER','Qle','Qh','Qstor','Rnet','FCEV', 'FCTR', 'FGEV', 'TV', 'TSKIN'" >> user_nl_clm
echo "hist_mfilt = 1,1,1" >> user_nl_clm
echo "hist_nhtfrq = -8760,-24,-24" >> user_nl_clm
echo "hist_dov2xy = .true., .true., .false." >> user_nl_clm
echo "hist_type1d_pertape = ' ', ' ', 'PFTS'" >> user_nl_clm

./preview_namelists

./case.build
./case.submit

############################# END   TR3bof4 CASE ################################


############################# BEGIN TR4of4 CASE ################################

export NOMECASO=${RUNXX}_${SITE}_tr4of4

cd /media/duarteh/seagate8tb_a/clm-master/cime/scripts

./create_newcase --case /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --output-root /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO} --res CLM_USRDAT --compset HIST_DATM%1PT_CLM60%BGC_SICE_SOCN_SROF_SGLC_SWAV --run-unsupported --machine Storm --pecount 1

cd /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}

#dummy
./xmlchange CLM_USRDAT_NAME=NEON
./xmlchange NEONSITE=JERC

#----- This is because most historical input streams go until 2014... Will need scenario to expand until 2018
./xmlchange DATM_PRESAERO=SSP3-7.0
./xmlchange DATM_PRESNDEP=SSP3-7.0
./xmlchange DATM_PRESO3=SSP3-7.0
./xmlchange CLM_NML_USE_CASE=1850-2100_SSP3-7.0_transient
#New
./xmlchange DATM_CO2_TSERIES=SSP3-7.0
#--------------

#NC2 site coordinates
./xmlchange PTS_LON=283.3315
./xmlchange PTS_LAT=35.803


./xmlchange RUN_TYPE=startup
#./xmlchange CLM_FORCE_COLDSTART=on
#./xmlchange CLM_ACCELERATED_SPINUP=on
./xmlchange CALENDAR=NO_LEAP

./xmlchange RUN_STARTDATE=2015-01-01
./xmlchange STOP_OPTION=nyears
#Runs for 2015--2018
./xmlchange STOP_N=4

./case.setup

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv SOURCE MODS vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
cp /media/duarteh/seagate8tb_a/clm-master/src/biogeophys/LunaMod.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/
sed -i -e 's/real(r8), parameter :: SNC = 0.004_r8/real(r8), parameter :: SNC = 0.00140_r8/g' /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/LunaMod.F90
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#NEW (g0fix)
cp ~/Dropbox/UNH/CLM/scripts/PhotosynthesisMod_HFD_g0fix.F90 /media/duarteh/seagate8tb_a/clm-projects/scratch/${NOMECASO}/SourceMods/src.clm/PhotosynthesisMod.F90

echo "NEON.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.JERC: datavars=\\" >> user_nl_datm_streams
echo "FSDS     Faxa_swdn,\\" >> user_nl_datm_streams
echo "TBOT     Sa_tbot,\\" >> user_nl_datm_streams
echo "PSRF     Sa_pbot,\\" >> user_nl_datm_streams
echo "RH       Sa_rh,\\" >> user_nl_datm_streams
echo "WIND     Sa_wind,\\" >> user_nl_datm_streams
echo "FLDS     Faxa_lwdn,\\" >> user_nl_datm_streams
echo "ZBOT     Sa_z" >> user_nl_datm_streams

echo " " >> user_nl_datm_streams
echo " " >> user_nl_datm_streams

echo "NEON.NEON_PRECIP.JERC: taxmode=cycle" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: tintalgo=linear" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: readmode=single" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: mapalgo=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: dtlimit=1.5" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_first=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_last=2023" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: year_align=2005" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: vectors=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: meshfile=none" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: lev_dimname=null" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datafiles=\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2005-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2006-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2007-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2008-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2009-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2010-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2011-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2012-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2013-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2014-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2015-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2016-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2017-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2018-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2019-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2020-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2021-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2022-12.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-01.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-02.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-03.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-04.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-05.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-06.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-07.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-08.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-09.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-10.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-11.nc,\\" >> user_nl_datm_streams
echo "/home/duarteh/Dropbox/UNH/CLM/meteorology/US-NC2/GMT_US-NC2_2023-12.nc" >> user_nl_datm_streams
echo "NEON.NEON_PRECIP.JERC: datavars=\\" >> user_nl_datm_streams
echo "PRECTmms Faxa_precn" >> user_nl_datm_streams


echo "flanduse_timeseries = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_landuse.timeseries_${SITE}_SSP2-4.5_1850-2100_78pfts_c240617.nc'" >> user_nl_clm
echo "finidat = '/media/duarteh/seagate8tb_a/clm-projects/scratch/${RUNXX}_${SITE}_tr3bof4/${RUNXX}_${SITE}_tr3bof4/run/${RUNXX}_${SITE}_tr3bof4.clm2.r.2015-01-01-00000.nc'" >> user_nl_clm
#IMPORTANT: there was no flanduse_timeseries set in the previous run (_tr1of4), and now there is. This requires the following namelist to avoid model crash:
#echo "use_init_interp = .true." >> user_nl_clm
echo "fsurdat = '/home/duarteh/Dropbox/UNH/CLM/surfdata/${SITE}/MOD-${RUNXX}_surfdata_${SITE}_hist_1850_78pfts_c240617.nc'" >> user_nl_clm

#NEW ADDITION
#POST THINNING PFT FILE, WATCH OUT
echo "paramfile = '/home/duarteh/Dropbox/UNH/CLM/scripts/ctsm60_params.c240208_${RUNXX}_${SITE}_postthinning.nc'" >> user_nl_clm

echo "hist_empty_htapes = .true." >> user_nl_clm
#echo "hist_fincl1 = 'FSDS','RAIN','SNOW','TBOT','PBOT','RH','WIND','FLDS','ZBOT'" >> user_nl_clm
#echo "hist_mfilt = 48" >> user_nl_clm
#echo "hist_nhtfrq = 1" >> user_nl_clm
echo "hist_fincl1 = 'TOTECOSYSC', 'TOTECOSYSN', 'TOTSOMC', 'TOTSOMN', 'TOTVEGC','TOTVEGN', 'TLAI', 'GPP', 'CPOOL', 'NPP', 'TWS', 'H2OSOI', 'TOTFIRE', 'DEADSTEMC', 'LIVESTEMC', 'LEAFC', 'DEADCROOTC', 'LIVECROOTC', 'FROOTC', 'WOODC', 'TOT_WOODPRODC', 'WOOD_HARVESTC', 'HTOP', 'TOTLITC', 'CWD_C', 'Qh', 'Qle', 'Qstor', 'Rnet', 'ER', 'TV'" >> user_nl_clm
echo "hist_fincl2 = 'RAIN', 'SNOW', 'TBOT', 'RH', 'VPD', 'PBOT', 'LWup', 'LWdown', 'SWup', 'SWdown', 'WIND', 'MR', 'GR', 'HR', 'GPP', 'TLAI', 'Qh', 'Qle', 'Qstor', 'Rnet', 'TV', 'TSKIN', 'FCEV', 'FCTR', 'FGEV', 'BTRANMN', 'SOILWATER_10CM', 'TWS', 'ZWT', 'H2OSOI', 'WF', 'watsat', 'watfc', 'FSDS', 'FLDS', 'ZBOT', 'ER', 'AR', 'NPP', 'NEP', 'NEE', 'TOTFIRE', 'EFLX_LH_TOT', 'FSH', 'FSH_TO_COUPLER', 'QRUNOFF', 'QH2OSFC', 'QOVER', 'QDRAI', 'QDRAI_PERCH', 'QDRAI_XS', 'QFLOOD'" >> user_nl_clm
echo "hist_fincl3 = 'GPP','TLAI','ER','Qle','Qh','Qstor','Rnet','FCEV', 'FCTR', 'FGEV', 'TV', 'TSKIN'" >> user_nl_clm

echo "hist_mfilt = 1,1,1" >> user_nl_clm
echo "hist_nhtfrq = -8760,-24,-24" >> user_nl_clm
echo "hist_dov2xy = .true., .true., .false." >> user_nl_clm
echo "hist_type1d_pertape = ' ', ' ', 'PFTS'" >> user_nl_clm

./preview_namelists

./case.build
./case.submit

############################# END   TR4of4 CASE ################################

exit
























