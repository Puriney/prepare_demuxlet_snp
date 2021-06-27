#!/usr/bin/bash
#
# Soft link all narrowPeaks files
#

RES_DIR='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
PEAK_DIR=${RES_DIR}/peaks
mkdir -p $PEAK_DIR

# k562
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/k562/rep4/peaks/rep4_peaks.narrowPeak \
  ${PEAK_DIR}/k562_peaks.narrowPeak
  
# mdamb231
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb231/rep1/peaks/rep1_peaks.narrowPeak \
  ${PEAK_DIR}/mdamb231_peaks.narrowPeak

# mdamb436
ln -s \
  /volumes/lab/users/yyan/project/snubar_atac/data0/bulk_atac/mdamb436/rep1/peaks/rep1_peaks.narrowPeak \
  ${PEAK_DIR}/mdamb436_peaks.narrowPeak