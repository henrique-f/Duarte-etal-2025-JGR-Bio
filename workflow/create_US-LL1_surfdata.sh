
#I am having trouble to run this script automatically. Commands need to be run manually in the terminal.

conda activate
conda activate ctsm_pylib
export PYTHONPATH=""

cd /media/duarteh/seagate8tb_a/clm-master/tools/site_and_regional

./subset_data point --lat 31.2792 --lon 275.4671 --site US-LL1 --crop --dompft 1 --create-surface --uniform-snowpack --cap-saturation --verbose --overwrite --surf-year 1850 --create-landuse --cfg-file /home/duarteh/Dropbox/UNH/CLM/scripts/default_data_1850.cfg.henrique --outdir /home/duarteh/Dropbox/UNH/CLM/surfdata/US-LL1

cd /home/duarteh/Dropbox/UNH/CLM/surfdata/US-LL1
