#!/usr/bin/bash
# echo '== STEP 0'
# sh s0.link_bam.sh
# sh s0.link_peak.sh
# 
# echo '== STEP 2'
# sh s2.merge_peaks.sh
# 
echo '== STEP 3'
snakemake -s s3.call_vcf_wrapper.snakemake.py -j 3 -F

echo '== STEP 4'
snakemake -s s4.concatenate_vcf.snakemake.py -j 1 -F

echo '== STEP 5'
sh s5.merge_vcf.sh

echo '== STEP 6'
snakemake -s s6.mpileup_wrapper.snakemake.py -j 3 -F

echo '== STEP 7'
snakemake -s s7.make_birdseed_wrapper.snakemake.py -j 3 -F
echo '== STEP 8'
snakemake -s s8.export_as_demuxlet_wrapper.snakemake.py -j 1 -F