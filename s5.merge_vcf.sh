#!/usr/bin/bash
set -ex

proj='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'

CAT_VCF=${proj}/vcf/All_SNPs_Merged.vcf  ## input
MRG_VCF=${proj}/vcf/All_SNPs_Merged_mergedPositions.bed ## output

bedtools merge -d -1 \
  -c 5,6,5,6 -o distinct,distinct,count_distinct,count_distinct \
  -i $CAT_VCF > ${CAT_VCF}.tmp
  
# awk -v OFS="\'"\t"\'" "\''$7 == 1 {print $1, $2, $3, $4, $5}'\'" ${CAT_VCF}.tmp | \
#   awk "\''{ if ($4 !~ /[UMRWSYKVHDBN]/ && $5 !~ /[UMRWSYKVHDBN]/) print $0 }'\'" > \
#   $MRG_VCF && rm ${CAT_VCF}.tmp
  
awk 'BEGIN {{OFS = "\t"}} ; {{if ($7==1) print $1, $2, $3, $4, $5}} ' ${CAT_VCF}.tmp > ${CAT_VCF}.tmp2
awk '{{if ($4 !~ /[UMRWSYKVHDBN]/ && $5 !~ /[UMRWSYKVHDBN]/) print $0 }}' ${CAT_VCF}.tmp2 > $MRG_VCF

rm ${CAT_VCF}.tmp ${CAT_VCF}.tmp2