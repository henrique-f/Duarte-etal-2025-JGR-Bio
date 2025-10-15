
#Updating soil information based on site obs
#Data are from soiltexture_NC2.gnumeric.
#June 17, 2024

cp surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc


#g/cm3
ncap2 -O -s 'BULK(0,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(1,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(2,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(3,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(4,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(5,:,:)=1.00' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(6,:,:)=1.18' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(7,:,:)=1.30' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(8,:,:)=1.30' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'BULK(9,:,:)=1.30' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc

#kg/m3
ncap2 -O -s 'ORGANIC(0,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(1,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(2,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(3,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(4,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(5,:,:)=580.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(6,:,:)=401.2' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(7,:,:)= 26.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(8,:,:)= 11.7' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGANIC(9,:,:)=  6.5' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc

#gC/kg soil
ncap2 -O -s 'ORGC(0,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(1,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(2,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(3,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(4,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(5,:,:)=336.4' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(6,:,:)=197.2' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(7,:,:)= 11.6' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(8,:,:)=  5.2' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'ORGC(9,:,:)=  2.9' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc

#%
ncap2 -O -s 'PCT_SAND(0,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(1,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(2,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(3,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(4,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(5,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(6,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(7,:,:)=65.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(8,:,:)=70.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_SAND(9,:,:)=80.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc

#%
ncap2 -O -s 'PCT_CLAY(0,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(1,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(2,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(3,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(4,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(5,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(6,:,:)=11.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(7,:,:)=20.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(8,:,:)=15.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc
ncap2 -O -s 'PCT_CLAY(9,:,:)= 5.0' MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc MOD_surfdata_US-NC2_hist_1850_78pfts_c240617.nc

