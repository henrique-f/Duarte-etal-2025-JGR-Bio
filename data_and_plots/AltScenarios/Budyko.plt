#Fig S7

set terminal postscript eps color solid font "Helvetica,18"
set datafile separator ","
set grid

f(x)=(x<=1?x:1)

set output "Budyko.eps"
set xl "Aridity index (PET/P)"
set yl "Evaporative index (ET/P)"
plot [0.6:1.4][0.6:1.1] \
"Budyko.dat" u 2:3:4:5:6 t "" w p pt variable ps variable lc variable, \
"Budyko_arrows.dat" u 2:3:($5-$2):($6-$3) t "" w vectors lc rgb "black" lw 1, \
"Budyko.dat" u ($2+0.02):3:1 t "" w labels left, \
f(x) t "" w l lc rgb "black" lw 2
!epstopdf Budyko.eps 

