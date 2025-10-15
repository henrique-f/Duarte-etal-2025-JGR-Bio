
#Tue Sep 10 01:58:25 PM EDT 2024
#Updating soil information based on site obs
#Data are from soiltexture_LL1.gnumeric.


cp surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc


#g/cm3
ncap2 -O -s 'BULK(0,:,:)=1.66' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(1,:,:)=1.66' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(2,:,:)=1.66' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(3,:,:)=1.81' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(4,:,:)=1.81' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(5,:,:)=1.74' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(6,:,:)=1.68' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(7,:,:)=1.63' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(8,:,:)=1.55' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'BULK(9,:,:)=1.46' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc

#kg/m3
ncap2 -O -s 'ORGANIC(0,:,:)=17.928' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(1,:,:)=17.596' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(2,:,:)=16.932' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(3,:,:)=16.652' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(4,:,:)=11.403' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(5,:,:)= 6.09 ' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(6,:,:)= 4.536' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(7,:,:)= 3.423' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(8,:,:)= 2.17 ' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGANIC(9,:,:)= 1.898' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc

#gC/kg soil
ncap2 -O -s 'ORGC(0,:,:)=6.264' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(1,:,:)=6.148' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(2,:,:)=5.916' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(3,:,:)=5.336' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(4,:,:)=3.654' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(5,:,:)=2.03 ' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(6,:,:)=1.566' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(7,:,:)=1.218' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(8,:,:)=0.812' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'ORGC(9,:,:)=0.754' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc

#%
ncap2 -O -s 'PCT_SAND(0,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(1,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(2,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(3,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(4,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(5,:,:)=69.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(6,:,:)=50.4' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(7,:,:)=49.8' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(8,:,:)=36.4' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_SAND(9,:,:)=34.4' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc

#%
ncap2 -O -s 'PCT_CLAY(0,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(1,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(2,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(3,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(4,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(5,:,:)= 8.6' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(6,:,:)=36.1' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(7,:,:)=36.9' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(8,:,:)=53.8' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc
ncap2 -O -s 'PCT_CLAY(9,:,:)=56.3' MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc MOD_surfdata_US-LL1_hist_1850_78pfts_c240731.nc

