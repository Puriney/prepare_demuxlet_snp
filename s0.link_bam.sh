#!/usr/bin/bash
#
# Soft link all bam files with bam.bai
#

RES_DIR='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
ALN_DIR=${RES_DIR}/align
mkdir -p $ALN_DIR


# k562
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/k562/rep4.sorted.dedup.bam \
  ${ALN_DIR}/k562.sorted.dedup.bam
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/k562/rep4.sorted.dedup.bam.bai \
  ${ALN_DIR}/k562.sorted.dedup.bam.bai
  
# mdamb231
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb231/rep1.sorted.dedup.bam \
  ${ALN_DIR}/mdamb231.sorted.dedup.bam
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb231/rep1.sorted.dedup.bam.bai \
  ${ALN_DIR}/mdamb231.sorted.dedup.bam.bai
  
# mdamb436
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb436/rep1.sorted.dedup.bam \
  ${ALN_DIR}/mdamb436.sorted.dedup.bam
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb436/rep1.sorted.dedup.bam.bai \
  ${ALN_DIR}/mdamb436.sorted.dedup.bam.bai