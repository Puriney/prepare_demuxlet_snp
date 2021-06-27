#!/usr/bin/bash
set -x
#
# Merge all peaks into a master peak file
#
RES_DIR='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
PEAK_DIR=${RES_DIR}/peaks
blacklist='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/bulkATAC/hg19.blacklist.bed'

cd $PEAK_DIR

echo Concatenating peak files...
cat *_peaks.narrowPeak > MergedPeaks.narrowPeak

echo Sorting merged peak file...
bedSort MergedPeaks.narrowPeak MergedPeaks.srt.narrowPeak && \
  rm MergedPeaks.narrowPeak

echo Merging sorted peak file...
bedtools merge -i MergedPeaks.srt.narrowPeak \
  -c 6,7,8,9 -o count,max,max,max \
  > MergedPeaks.srt.mrg.narrowPeak

echo Filtering merged peak file...
bedtools intersect -v \
  -a MergedPeaks.srt.mrg.narrowPeak \
  -b $blacklist | grep -v chrM > MergedPeaks.srt.mrg.flt.narrowPeak

rm MergedPeaks.srt.narrowPeak
rm MergedPeaks.srt.mrg.narrowPeak
