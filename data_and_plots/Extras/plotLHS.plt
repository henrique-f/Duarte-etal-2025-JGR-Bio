#Fig. S8

infile = "LHS_JGRBioR1.out"
#plot "LHS_JGRBioR1.out" u 1:2 w p pt 7

set terminal postscript eps enhanced color solid font "Helvetica,12" size 7in,7in
set size square
set output "plotLHS.eps"
set multiplot layout 5,5 rowsfirst downwards title "Latin hypercube sampling in 5 dimensions (50 samples)" font "Helvetica,18"

#----------------------- ROW 1 -------------------------
set yl "q_{10}"
set yr[1.5:3.0]
set ytics 0.3

set xl "q_{10}"
set xr[1.5:3.0]
set xtics 0.3
plot infile u 1:1 t "" w p pt 7

set xl "{/Symbol a}_1"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 2:1 t "" w p pt 7

set xl "{/Symbol a}_2"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 3:1 t "" w p pt 7

set xl "{/Symbol a}_3"
set xr[0.5:1.0]
set xtics 0.1
plot infile u 4:1 t "" w p pt 7

set xl "p_{liq} (mm)"
set xr[0.1:0.5]
set xtics 0.1
plot infile u 5:1 t "" w p pt 7
#-------------------------------------------------------


#----------------------- ROW 2 -------------------------
set yl "{/Symbol a}_1"
set yr[1.0:2.0]
set ytics 0.2

set xl "q_{10}"
set xr[1.5:3.0]
set xtics 0.3
plot infile u 1:2 t "" w p pt 7

set xl "{/Symbol a}_1"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 2:2 t "" w p pt 7

set xl "{/Symbol a}_2"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 3:2 t "" w p pt 7

set xl "{/Symbol a}_3"
set xr[0.5:1.0]
set xtics 0.1
plot infile u 4:2 t "" w p pt 7

set xl "p_{liq} (mm)"
set xr[0.1:0.5]
set xtics 0.1
plot infile u 5:2 t "" w p pt 7
#-------------------------------------------------------


#----------------------- ROW 3 -------------------------
set yl "{/Symbol a}_2"
set yr[1.0:2.0]
set ytics 0.2

set xl "q_{10}"
set xr[1.5:3.0]
set xtics 0.3
plot infile u 1:3 t "" w p pt 7

set xl "{/Symbol a}_1"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 2:3 t "" w p pt 7

set xl "{/Symbol a}_2"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 3:3 t "" w p pt 7

set xl "{/Symbol a}_3"
set xr[0.5:1.0]
set xtics 0.1
plot infile u 4:3 t "" w p pt 7

set xl "p_{liq} (mm)"
set xr[0.1:0.5]
set xtics 0.1
plot infile u 5:3 t "" w p pt 7
#-------------------------------------------------------


#----------------------- ROW 4 -------------------------
set yl "{/Symbol a}_3"
set yr[0.5:1.0]
set ytics 0.1

set xl "q_{10}"
set xr[1.5:3.0]
set xtics 0.3
plot infile u 1:4 t "" w p pt 7

set xl "{/Symbol a}_1"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 2:4 t "" w p pt 7

set xl "{/Symbol a}_2"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 3:4 t "" w p pt 7

set xl "{/Symbol a}_3"
set xr[0.5:1.0]
set xtics 0.1
plot infile u 4:4 t "" w p pt 7

set xl "p_{liq} (mm)"
set xr[0.1:0.5]
set xtics 0.1
plot infile u 5:4 t "" w p pt 7
#-------------------------------------------------------


#----------------------- ROW 5 -------------------------
set yl "p_{liq} (mm)"
set yr[0.1:0.5]
set ytics 0.1

set xl "q_{10}"
set xr[1.5:3.0]
set xtics 0.3
plot infile u 1:5 t "" w p pt 7

set xl "{/Symbol a}_1"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 2:5 t "" w p pt 7

set xl "{/Symbol a}_2"
set xr[1.0:2.0]
set xtics 0.2
plot infile u 3:5 t "" w p pt 7

set xl "{/Symbol a}_3"
set xr[0.5:1.0]
set xtics 0.1
plot infile u 4:5 t "" w p pt 7

set xl "p_{liq} (mm)"
set xr[0.1:0.5]
set xtics 0.1
plot infile u 5:5 t "" w p pt 7
#-------------------------------------------------------

unset multiplot

!epstopdf plotLHS.eps
!convert -density 300 plotLHS.pdf plotLHS.png
