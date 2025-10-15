#Gnuplot script by Henrique Duarte
# It creates the ms figures 5, 6, and 7 (or supplement figures S4, S5, and S6); Each figure panel is plotted individually here.
#Fri Jan 31 12:56:31 PM EST 2025
#Tue Feb 25 09:45:38 PM EST 2025: same as before, but now comparing against UNCORRECTED H and LE (energy balance closure is NOT imposed)
#Tue Oct 14 02:43:21 PM EDT 2025: change in data paths (in prep for data archival)



################## USER INPUT: use "R09c" for calibrated run or "P0-default" for default run
RUN="R09c""
##################

in_annual_pft1=RUN."_US-LL1_annual_pft1.csv"
in_annual_pft14=RUN."_US-LL1_annual_pft14.csv"

set terminal postscript eps color solid font "Helvetica,18"
set datafile separator ","
set xdata time
set timefmt "%Y,%m,%d"
set format x "%b\n%Y"
set grid

#Fig. 5|S4 (RUN="R09c"|"P0-default")
################################# BEGIN ANNUAL PLOTS ############################################
#################################################################################################

#AGB, annual
set output "plotagem-uncorrfluxes_".RUN."_01.eps"
set yl "AGB (gC&{.}m^{-2})" #LEAFC +DEADSTEMC +LIVESTEMC
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are scaled from pft patch to grid cell level
plot ["2000,1,1":"2021,1,1"][0:12000]\
"obs_LL1_AGB_Wiesner20182019_Mitchell1999.csv" u 1:4 t "Obs, ENF" w p pt 13 ps 3 lc rgb 'blue', \
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):(($4 +$5 +$6)*0.66) t "CLM5, ENF" w lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_01.eps"
system(cmd)

#HTOP, annual
set output "plotagem-uncorrfluxes_".RUN."_02.eps"
set yl "Canopy top (m)"
set label 1 "(b)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are for the PFT1 patch
plot ["2000,1,1":"2021,1,1"][0:50]\
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):($11) t "CLM5, ENF" w lp pt 6 lc rgb 'red', \
"obs_LL1_HTOP_Kenney2021.csv" u 1:4:5 t "Obs (avg +/- SD), ENF" with yerror pt 13 ps 3 lc rgb "blue", \
"obs_LL1_HTOP_Kenney2021.csv" u 1:6 t "Obs (max), ENF" w p pt 9 ps 3 lc rgb "blue"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_02.eps"
system(cmd)

#CROOTC, annual
set output "plotagem-uncorrfluxes_".RUN."_03.eps"
set yl "Coarse root biomass (gC&{.}m^{-2})" #DEADCROOTC +LIVECROOTC
set label 1 "(c)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are scaled from pft patch to grid cell level
plot ["2000,1,1":"2021,1,1"][0:4000]\
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):(($7+$8)*0.66) t "CLM5, ENF" w lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_03.eps"
system(cmd)

#FROOTC, annual
set output "plotagem-uncorrfluxes_".RUN."_04.eps"
set yl "Fine root biomass (gC&{.}m^{-2})" #FROOTC
set label 1 "(d)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are scaled from pft patch to grid cell level
plot ["2000,1,1":"2021,1,1"][0:700]\
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):(($9)*0.66) t "CLM5, ENF" w lp pt 6 lc rgb 'red', \
in_annual_pft14 u (timecolumn(1)-182.5*24.*3600.):(($9)*0.34) t "CLM5, C4 grass" w lp pt 6 lc rgb 'black'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_04.eps"
system(cmd)

#LEAFC, annual
set output "plotagem-uncorrfluxes_".RUN."_05.eps"
set yl "Leaf biomass (gC&{.}m^{-2})" #LEAFC
set label 1 "(e)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are scaled from pft patch to grid cell level
plot ["2000,1,1":"2021,1,1"][0:500]\
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):(($4)*0.66) t "CLM5, ENF" w lp pt 6 lc rgb 'red', \
in_annual_pft14 u (timecolumn(1)-182.5*24.*3600.):(($4)*0.34) t "CLM5, C4 grass" w lp pt 6 lc rgb 'black', \
"obs_LL1_LEAFC_Wiesner20182019_Mitchell1999.csv" u 1:4 t "Obs, ENF" with p pt 13 ps 3 lc rgb "blue"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_05.eps"
system(cmd)

#TLAI, annual
set output "plotagem-uncorrfluxes_".RUN."_06.eps"
set yl "LAI (m^2&{.}m^{-2})" #TLAI
set label 1 "(f)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
#Shifting back the CLM time coordinate in ~1/2 year; values are scaled from pft patch to grid cell level
plot ["2000,1,1":"2021,1,1"][0:7]\
in_annual_pft1 u (timecolumn(1)-182.5*24.*3600.):(($10)*0.66) t "CLM5, ENF" w lp pt 6 lc rgb 'red', \
in_annual_pft14 u (timecolumn(1)-182.5*24.*3600.):(($10)*0.34) t "CLM5, C4 grass" w lp pt 6 lc rgb 'black', \
"obs_LL1_LAI_Kenney2021_annualmean.csv" u 1:4 t "Obs, ENF" with p pt 13 ps 3 lc rgb "blue"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_06.eps"
system(cmd)

################################# END ANNUAL PLOTS ##############################################
#################################################################################################


#Fig. 7|S6 (RUN="R09c"|"P0-default")
################################# BEGIN AVG SEASONAL PLOTS ######################################
#################################################################################################

in_avgseasonal="annualcycle_".RUN."_US-LL1.out"

set timefmt "%j"
set format x "%b"

set output "plotagem-uncorrfluxes_".RUN."_07.eps"
set yl "GPP (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:10]\
in_avgseasonal u 1:2 t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:6 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_07.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_08.eps"
set yl "ER (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(b)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:10]\
in_avgseasonal u 1:3 t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:7 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_08.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_09.eps"
set yl "LE (W&{.}m^{-2})"
set label 1 "(c)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:140]\
in_avgseasonal u 1:($4) t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:8 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_09.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_10.eps"
set yl "H (W&{.}m^{-2})"
set label 1 "(d)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][0:140]\
in_avgseasonal u 1:($5) t "Obs" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:9 t "CLM5" with lp pt 6 lc rgb 'red'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_10.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_11.eps"
set yl "Energy balance component (W&{.}m^{-2})"
set label 1 "(e)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][-50:250]\
in_avgseasonal u 1:11 t "Obs R_n" with lp pt 6 lc rgb 'purple', \
in_avgseasonal u 1:($5) t "Obs H" with lp pt 6 lc rgb 'red', \
in_avgseasonal u 1:($4) t "Obs LE" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:10 t "Obs G" with lp pt 6 lc rgb 'black'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_11.eps"
system(cmd)

set output "plotagem-uncorrfluxes_".RUN."_12.eps"
set yl "Energy balance component (W&{.}m^{-2})"
set label 1 "(f)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"
plot ["1":"365"][-50:250]\
in_avgseasonal u 1:12 t "CLM5 R_n" with lp pt 6 lc rgb 'purple', \
in_avgseasonal u 1:9 t "CLM5 H" with lp pt 6 lc rgb 'red', \
in_avgseasonal u 1:8 t "CLM5 LE" with lp pt 6 lc rgb 'blue', \
in_avgseasonal u 1:13 t "CLM5 G" with lp pt 6 lc rgb 'black'
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_12.eps"
system(cmd)


################################# END AVG SEASONAL PLOTS ########################################
#################################################################################################


#Fig. 6|S5 (RUN="R09c"|"P0-default")
################################# BEGIN SCATTER PLOTS ###########################################
#################################################################################################

reset
set terminal postscript eps color solid font "Helvetica,18"
set datafile separator ","
set grid
set size square

in_scatter="merged_obs_".RUN."_US-LL1.csv"

#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set output "plotagem-uncorrfluxes_".RUN."_13.eps"
set xl "GPP CLM5 (gC&{.}m^{-2}&{.}day^{-1})"
set yl "GPP Obs  (gC&{.}m^{-2}&{.}day^{-1})"
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,22"
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($23*86400.0)-($9!=-9999?$9*86400.0:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($23*86400.0):($9!=-9999?$9*86400.0:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [0:14][0:14]\
in_scatter u ($23*86400.0):($9!=-9999?$9*86400.0:1/0) t '' w p pt 6 lc rgb 'blue', \
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
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($24*86400.0)-($10!=-9999?$10*86400.0:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($24*86400.0):($10!=-9999?$10*86400.0:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [0:14][0:14]\
in_scatter u ($24*86400.0):($10!=-9999?$10*86400.0:1/0) t '' w p pt 6 lc rgb 'blue', \
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
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($32)-($5!=-9999?$5:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($32):($5!=-9999?$5:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [0:200][0:200]\
in_scatter u ($32):($5!=-9999?$5:1/0) t '' w p pt 6 lc rgb 'blue', \
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
set label 2 RUN." US-LL1" at graph 0.8,0.05 font "Helvetica,14"

stats in_scatter u ($33)-($4!=-9999?$4:1/0) nooutput
MBE = STATS_mean
RMSE = sqrt(STATS_sumsq/STATS_records)
stats in_scatter u ($33):($4!=-9999?$4:1/0) nooutput
r = STATS_correlation
slope = STATS_slope
intercept = STATS_intercept
set title sprintf("MBE: %g; RMSE: %g; r: %g; y=%g*x %+g",MBE,RMSE,r,slope,intercept)

plot  [-100:200][-100:200]\
in_scatter u ($33):($4!=-9999?$4:1/0) t '' w p pt 6 lc rgb 'blue', \
x t '1:1' w l lc rgb "black", \
slope*x +intercept t "y(x)" w l lc rgb "red"
unset label 1
unset label 2
cmd="epstopdf plotagem-uncorrfluxes_".RUN."_16.eps"
system(cmd)
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

################################# END SCATTER PLOTS #############################################
#################################################################################################











