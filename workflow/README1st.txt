#Tue Oct 14 10:50:28 PM EDT 2025

--------
Workflow
--------

Simulations at the loblolly pine site (US-NC2)
1. Use create_NC2_surfdata.sh (and default_data_1850.cfg.henrique aux file) to create surfdat and landuse files for US-NC2
2. Use mod_NC2_surdata.sh to update surfdat soil information based on site observations
3. Create a full simulation case (1850 spin-up and transient run):
      R14c_US-NC2_fullrunV2.bash (calibrated parameters)
      P0-default_US-NC2_fullrunV2.bash (default parameters)
      AR03_US-NC2_fullrunV2.bash (alternate run with a longleaf pine land cover scenario)

Simulations at the longleaf pine site (US-LL1)
1. Use create_US-LL1_surfdata.sh (and default_data_1850.cfg.henrique aux file) to create surfdat and landuse files for US-LL1
2. Use mod_LL1_surfdata.sh to update surfdat soil information based on site observations
3. Create a full simulation case (1850 spin-up and transient run):
      R09c_US-LL1_fullrunV2.bash (calibrated parameters)
      P0-default_US-LL1_fullrunV2.bash (default parameters)
      AR03_US-LL1_fullrunV2.bash (alternate run with a loblolly pine land cover scenario)

LHS analysis
1. Use LHS_JGRBioR1.py to draw 50 parameter sets from the 5-dimensional parameter space that was targeted for optimization
2. Create a base case for initialization of the ensemble of 50 simulations:
      Use R16_US-NC2_fullrunV2.bash for US-NC2
      Use R10_US-LL1_fullrunV2.bash for US-LL1
3. Create an ensemble of 50 simulations using the LHS parameter sets
      Use geraensemblecases.ncl and R16_xxxlhs_US-NC2_fullrunV2.bash for US-NC2
      Use geraensemblecases_US-LL1.ncl and R10_xxxlhs_US-LL1_fullrunV2.bash for US-LL1

Meteorological driver
   Gap-filled meteorological data used to drive CLM are available in:
      * meteorology_US-NC2.tar.gz 
      * meteorology_US-LL1.tar.gz

CLM bug fix (g0 downscaling)
   PhotosynthesisMod_HFD_g0fix.F90 fixes the g0 downscaling issue reported in Appendix A.


For further information on materials and methods, please see our JGR Biogeosciences manuscript: 
Duarte HF, Sun G, Aguilos M, McNulty S, Kim JB, Starr G, & Xiao J (2025) Assessing the Community Land Model (CLM5) for quantifying energy, water, and carbon balances in loblolly and longleaf pine ecosystems in southeastern United States. Submitted to JGR: Biogeosciences. 
