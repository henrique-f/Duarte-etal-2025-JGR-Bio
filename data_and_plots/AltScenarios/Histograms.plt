#Fig. 8

set datafile separator ","
infile="Histograms.csv"

set y2tics
unset xtics

set terminal postscript eps color solid font "Helvetica,18" size 6in,3.5in

set output "Histograms.eps"
set multiplot layout 2,2 rowsfirst
unset key

set yl "ET component (mm&{.}yr^{-1})"
set y2l "NEP (gC&{.}m^{-2}&{.}yr^{-1})"
set xr[0.5:3.5]
set yr[0:1200]
set y2r[0:600]
set boxwidth 0.5


set tmargin 1
set bmargin 2
set label 1 "(a)" at graph 0.80,0.90
plot \
infile u 1:($2+$3+$4) t "E_{trans}" with boxes fillstyle solid 1.0 fillcolor "#FFBE6F", \
infile u 1:($3+$4) t "E_{int}" with boxes fillstyle solid 1.0 fillcolor "#FF7800", \
infile u 1:($4) t "E_{soil}" with boxes fillstyle solid 1.0 fillcolor "#C64600", \
infile u ($1+1):5 t "Q" with boxes fillstyle solid 1.0 fillcolor "#1A5FB4", \
infile u ($1+2):6 axis x1y2 t "NEP" with boxes fillstyle solid 1.0 fillcolor "#26A269"
unset label 1

set label 1 "(b)" at graph 0.80,0.90
set label 2 "Alt. scenario" at graph 0.25,0.90
plot \
infile u 1:($7+$8+$9) t "E_t" with boxes fillstyle solid 1.0 fillcolor "#FFBE6F", \
infile u 1:($8+$9) t "E_i" with boxes fillstyle solid 1.0 fillcolor "#FF7800", \
infile u 1:($9) t "E_s" with boxes fillstyle solid 1.0 fillcolor "#C64600", \
infile u ($1+1):10 t "Q" with boxes fillstyle solid 1.0 fillcolor "#1A5FB4", \
infile u ($1+2):11 axis x1y2 t "NEP" with boxes fillstyle solid 1.0 fillcolor "#26A269"
unset label 1
unset label 2

set tmargin 0
set bmargin 3
set label 1 "(c)" at graph 0.80,0.90
set label 2 "Alt. scenario" at graph 0.25,0.90
plot \
infile u 1:($12+$13+$14) t "E_t" with boxes fillstyle solid 1.0 fillcolor "#FFBE6F", \
infile u 1:($13+$14) t "E_i" with boxes fillstyle solid 1.0 fillcolor "#FF7800", \
infile u 1:($14) t "E_s" with boxes fillstyle solid 1.0 fillcolor "#C64600", \
infile u ($1+1):15 t "Q" with boxes fillstyle solid 1.0 fillcolor "#1A5FB4", \
infile u ($1+2):16 axis x1y2 t "NEP" with boxes fillstyle solid 1.0 fillcolor "#26A269"
unset label 1
unset label 2

set key horizontal at screen 0.5,screen 0.05 samplen 1 center center width -2.5
set label 1 "(d)" at graph 0.80,0.90
plot \
infile u 1:($17+$18+$19) t "E_{trans}" with boxes fillstyle solid 1.0 fillcolor "#FFBE6F", \
infile u 1:($18+$19) t "E_{int}" with boxes fillstyle solid 1.0 fillcolor "#FF7800", \
infile u 1:($19) t "E_{soil}" with boxes fillstyle solid 1.0 fillcolor "#C64600", \
infile u ($1+1):20 t "Q" with boxes fillstyle solid 1.0 fillcolor "#1A5FB4", \
infile u ($1+2):21 axis x1y2 t "NEP" with boxes fillstyle solid 1.0 fillcolor "#26A269"
unset label 1

unset multiplot
!epstopdf Histograms.eps
!pdflatex Fig_Histograms_prepowerpoint.tex
!convert -density 600 Fig_Histograms_prepowerpoint.pdf -quality 100 -flatten -sharpen 0x1.0 -trim Fig_Histograms_prepowerpoint.jpg

