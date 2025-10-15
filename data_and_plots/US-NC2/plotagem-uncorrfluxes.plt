#Gnuplot script by Henrique Duarte
# It creates the ms figures 2, 3, and 4 (or supplement figures S1, S2, and S3); Each figure panel is plotted individually here.
#Sun Feb  2 04:44:54 PM EST 2025
#Wed Feb 26 08:42:41 AM EST 2025: comparing against uncorrected H and LE (energy balance closure is NOT imposed)
#Tue Oct 14 11:32:24 AM EDT 2025: change in data paths (in prep for data archival)


################## USER INPUT: use "R14c" for calibrated run or "P0-default" for default run
RUN="R14c"
##################

set terminal postscript eps color solid font "Helvetica,18"
set datafile separator ","
set xdata time
set timefmt "%Y,%m,%d"
set format x "%b\n%Y"
set grid

#Fig. 2|S1 (RUN="R14c"|"P0-default")
################################# BEGIN ANNUAL PLOTS ############################################
#################################################################################################

in_annual="".RUN."_US-NC2_h0.csv"

#AGB, annual
set output "plotagem-uncorrfluxes_".RUN."_01.eps"
set yl "AGB (gC&{.}m^{-2})" #LEAFC +DEADSTEMC +LIVESTEMC
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:10000]\
"obs_nc2_Mitra_etal2019.csv" u 1:($6!=-9999?$6:1/0) t "Obs" w p pt 13 ps 3 lc rgb "blue", \
in_annual u (timecolumn(1)-182.5*24.*3600.):($16 +$17 +$18) t "CLM5" with lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_01.eps"
system(cmd)

#HTOP, annual
set output "plotagem-uncorrfluxes_".RUN."_02.eps"
set yl "Canopy top (m)"
set label 1 "(b)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:45]\
"obs_nc2_Mitra_etal2019.csv" u 1:($5!=-9999?$5:1/0) t "Obs" w p pt 13 ps 3 lc rgb "blue", \
in_annual u (timecolumn(1)-182.5*24.*3600.):($25) t "CLM5" with lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_02.eps"
system(cmd)

#CROOTC, annual
set output "plotagem-uncorrfluxes_".RUN."_03.eps"
set yl "Coarse root biomass (gC&{.}m^{-2})" #DEADCROOTC +LIVECROOTC
set label 1 "(c)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:3000]\
"obs_nc2_Mitra_etal2019.csv" u 1:($7!=-9999?$7:1/0) t "Obs" w p pt 13 ps 3 lc rgb "blue", \
in_annual u (timecolumn(1)-182.5*24.*3600.):($19+$20) t "CLM5" with lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_03.eps"
system(cmd)

#FROOTC, annual
set output "plotagem-uncorrfluxes_".RUN."_04.eps"
set yl "Fine root biomass (gC&{.}m^{-2})" #FROOTC
set label 1 "(d)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:1000]\
"obs_nc2_Noormets_etal2012.csv" u 1:($10!=-9999?$10*100.:1/0) t "Obs" w p pt 13 ps 3 lc rgb "blue", \
in_annual u (timecolumn(1)-182.5*24.*3600.):($21) t "CLM5" with lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_04.eps"
system(cmd)

#LEAFC, annual
set output "plotagem-uncorrfluxes_".RUN."_05.eps"
set yl "Leaf biomass (gC&{.}m^{-2})" #LEAFC
set label 1 "(e)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:700]\
"obs_nc2_Noormets_etal2012.csv" u 1:($6!=-9999?$6*100.:1/0) t "Obs" w p pt 13 ps 3 lc rgb "blue", \
in_annual u (timecolumn(1)-182.5*24.*3600.):($18) t "CLM5" with lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_05.eps"
system(cmd)

#TLAI, annual
set output "plotagem-uncorrfluxes_".RUN."_06.eps"
set yl "LAI (m^2&{.}m^{-2})" #TLAI
set label 1 "(f)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year;
plot ["2005,1,1":"2019,1,1"][0:10] \
"obs_nc2_MODIS_LAI_annualavg.csv" u 1:4 t "Obs (MODIS)" w p pt 13 ps 3 lc rgb "blue", \
"LAI2000obs_GeSun_annual.csv" u 1:4 t "Obs (LAI2000)" w p pt 13 ps 3 lc rgb "green", \
in_annual u (timecolumn(1)-182.5*24.*3600.):10 t "CLM5" w lp pt 6 lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_06.eps"
system(cmd)

################################# END ANNUAL PLOTS ##############################################
#################################################################################################


#Fig. 4|S3 (RUN="R14c"|"P0-default")
################################# BEGIN AVG SEASONAL PLOTS ######################################
#################################################################################################

in_avgseasonal="annualcycle_exclui2018_".RUN.".out"

set timefmt "%j"
set format x "%b"

set output "plotagem-uncorrfluxes_".RUN."_07.eps"
set yl "GPP (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:14]\
in_avgseasonal u 1:2 t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:6 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_07.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_08.eps"
set yl "ER (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(b)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:14]\
in_avgseasonal u 1:3 t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:7 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_08.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_09.eps"
set yl "LE (W&{.}m^{-2})"
set label 1 "(c)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:160]\
in_avgseasonal u 1:($4) t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:8 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_09.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_10.eps"
set yl "H (W&{.}m^{-2})"
set label 1 "(d)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][-20:100]\
in_avgseasonal u 1:($5) t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:9 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_10.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_11.eps"
set yl "Energy balance component (W&{.}m^{-2})"
set label 1 "(e)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][-50:200]\
"annualcycle_obsG-Rn_exclui2018.out" u 1:3 t "Obs R_n" with lp pt 6 lc rgb 'purple', \
in_avgseasonal u 1:($5) t "Obs H" with lp pt 6 lc rgb 'red', \
in_avgseasonal u 1:($4) t "Obs LE" with lp pt 6 lc rgb 'blue', \
"annualcycle_obsG-Rn_exclui2018.out" u 1:2 t "Obs G" with lp pt 6 lc rgb 'black'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_11.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_12.eps"
set yl "Energy balance component (W&{.}m^{-2})"
set label 1 "(f)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][-50:200]\
in_avgseasonal u 1:14 t "CLM5 R_n" with lp pt 6 lc rgb 'purple', \
in_avgseasonal u 1:9 t "CLM5 H" with lp pt 6 lc rgb 'red', \
in_avgseasonal u 1:8 t "CLM5 LE" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:13 t "CLM5 G" with lp pt 6 lc rgb 'black'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_12.eps"
system(cmd)

################################# END AVG SEASONAL PLOTS ########################################
#################################################################################################


#Fig. 3|S2 (RUN="R14c"|"P0-default")
################################# BEGIN SCATTER PLOTS ###########################################
#################################################################################################

reset
set terminal postscript eps color solid font "Helvetica,18"
set datafile separator ","
set grid
set size square

#Note that I am fetching data up until 2017,12,31 only
system("head -n 4746 merged_obs_".RUN."_US-NC2.csv > aux3.csv")
in_scatter="aux3.csv"

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set output "plotagem-uncorrfluxes_".RUN."_13.eps"
set xl "GPP CLM5 (gC&{.}m^{-2}&{.}day^{-1})"
set yl "GPP Obs  (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($24*86400.0)-($6!=-9999?$6:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($24*86400.0):($6!=-9999?$6:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [0:25][0:25]\
in_scatter u ($24*86400.0):($6!=-9999?$6:1/0) t '' w p pt 6 lc rgb 'blue', \
x t '1:1' w l lc rgb "black", \
slope*x +intercept t "y(x)" w l lc rgb "red"

unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_13.eps"
system(cmd)
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set output "plotagem-uncorrfluxes_".RUN."_14.eps"
set xl "ER CLM5 (gC&{.}m^{-2}&{.}day^{-1})"
set yl "ER Obs (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(b)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($25*86400.0)-($7!=-9999?$7:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($25*86400.0):($7!=-9999?$7:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [0:25][0:25]\
in_scatter u ($25*86400.0):($7!=-9999?$7:1/0) t '' w p pt 6 lc rgb 'blue', \
x t '1:1' w l lc rgb "black", \
slope*x +intercept t "y(x)" w l lc rgb "red"

unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_14.eps"
system(cmd)
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set output "plotagem-uncorrfluxes_".RUN."_15.eps"
set xl "LE CLM5 (W&{.}m^{-2})"
set yl "LE Obs (W&{.}m^{-2})"
set label 1 "(c)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($33)-($8!=-9999?$8:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($33):($8!=-9999?$8:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [-50:250][-50:250]\
in_scatter u ($33):($8!=-9999?$8:1/0) t '' w p pt 6 lc rgb 'blue', \
x t '1:1' w l lc rgb "black", \
slope*x +intercept t "y(x)" w l lc rgb "red"

unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_15.eps"
system(cmd)
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set output "plotagem-uncorrfluxes_".RUN."_16.eps"
set xl "H CLM5 (W&{.}m^{-2})"
set yl "H Obs (W&{.}m^{-2})"
set label 1 "(d)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-NC2" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($34)-($9!=-9999?$9:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($34):($9!=-9999?$9:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [-150:300][-150:300]\
in_scatter u ($34):($9!=-9999?$9:1/0) t '' w p pt 6 lc rgb 'blue', \
x t '1:1' w l lc rgb "black", \
slope*x +intercept t "y(x)" w l lc rgb "red"

unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_16.eps"
system(cmd)
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

################################# END SCATTER PLOTS #############################################
#################################################################################################


