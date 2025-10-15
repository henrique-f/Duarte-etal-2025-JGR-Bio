lines = asciiread("LHS_JGRBioR1.out",-1,"string")
delim = " "

;dimension 1, q10_mr and q10_hr absolute value (adim)
;dimension 2, vcmaxha, jmaxha, tpuha scaling factor
;dimension 3, lmrha scaling factor
;dimension 4, kmax (all segments) scaling factor
;dimension 5, liq_canopy_storage_scalar absolute value (mm)

p1 = str_get_field(lines,1,delim)
p2 = str_get_field(lines,2,delim)
p3 = str_get_field(lines,3,delim)
p4 = str_get_field(lines,4,delim)
p5 = str_get_field(lines,5,delim)

do i=0,dimsizes(p1)-1,1

   fout="R16_"+sprinti("%0.3i",i+1)+"lhs_US-NC2_fullrunV2.bash"
   system("cp R16_xxxlhs_US-NC2_fullrunV2.bash "+fout)
   system("chmod u+x "+fout)
   ;Watch out: period(.) and asterisk(*) are special characters in sed, they need to be escaped for the search expression
   system("sed -i 's/R16_xxxlhs/R16_"+sprinti("%0.3i",i+1)+"lhs/g' "+fout)
   system("sed -i 's/q10_mr=1\.5/q10_mr="+p1(i)+"/g' "+fout)
   system("sed -i 's/q10_hr=1\.5/q10_hr="+p1(i)+"/g' "+fout)
   system("sed -i 's/vcmaxha=72000\.\*1\./vcmaxha=72000.*"+p2(i)+"/g' "+fout)
   system("sed -i 's/jmaxha=50000\.\*1\./jmaxha=50000.*"+p2(i)+"/g' "+fout)
   system("sed -i 's/tpuha=72000\.\*1\./tpuha=72000.*"+p2(i)+"/g' "+fout)
   system("sed -i 's/lmrha=46390\.\*1\./lmrha=46390.*"+p3(i)+"/g' "+fout)
   system("sed -i 's/kmax(:,1)=kmax(:,1)\*1\./kmax(:,1)=kmax(:,1)*"+p4(i)+"/g' "+fout)
   system("sed -i 's/liq_canopy_storage_scalar=0\.1/liq_canopy_storage_scalar="+p5(i)+"/g' "+fout)

end do
