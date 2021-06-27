FASTA="/volumes/seq/genomes/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome.fa"
RES_DIR='/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'

ø align
  - k562
  - mdamb231
  - mdamb436
ø peaks
  - k562
  - mdamb231
  - mdamb436
  - merged.peaks `s2.merge_peaks.sh`
ø vcf
  - k562
  - mdamb231
  - mdamb436
  - merged.vcf
  - merged.snp.bed
ø mpileup
  - k562
  - mdamb231
  - mdamb436
ø birdseed
  - k562
  - mdamb231
  - mdamb436
ø demuxlet
  - demuxlet.input.vcf  ## <- Product of this pipeline

Step 1 Align and MACS2
  - Several small bash scripts
  - `s0.link_bam.sh` and `s0.link_peaks.sh` to fetch all rep1 files to the proper folder structure.
Step 2 Merge peaks to create a master peak `s2.merge_peaks.sh`.
Step 3 Varscan each sample to create VCF:
  - `s3.call_vcf_wrapper.snakemake.py`
  - `s3.call_vcf_each_sample.sh`
Step 4 Concatenate VCFs to create a master VCF
Step 5 Polish the concatednated VCF to a VCF with unique positions
Step 6 Use the VCF to calculate the allelic depth in each sample
Step 7 Make birdseed file
Step 8 Merge all birdseed files to create the demuxlet's required VCF.

Ready to run demuxlet.

  
