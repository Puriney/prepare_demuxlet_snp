#!/usr/bin/bash
set -e

## Parameters
BAM=$1
PEAKS=$2
FASTA=$3
OUTVCF=$4

# samtools mpileup -l $PEAKS -B \
#   -f ${FASTA} $BAM | \
#   varscan mpileup2snp \
#   --min-coverage 5 \
#   --min-reads2 2 \
#   --min-var-freq 0.1 \
#   --strand-filter 1 \
#   --output-vcf 1 | \
#   grep -vE \"^#\" | awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' > \
#   ${OUTVCF}
  
samtools mpileup -l $PEAKS -B \
  -f ${FASTA} $BAM | \
  varscan mpileup2snp \
  --min-coverage 8 \
  --min-reads2 2 \
  --min-var-freq 0.01 \
  --strand-filter 1 \
  --output-vcf 1 | \
  grep -vE \"^#\" | awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' > \
  ${OUTVCF}

# USAGE: java -jar VarScan.jar mpileup2cns [pileup file] OPTIONS
# 	mpileup file - The SAMtools mpileup file
# 
# 	OPTIONS:
# 	--min-coverage	Minimum read depth at a position to make a call [8]
# 	--min-reads2	Minimum supporting reads at a position to call variants [2]
# 	--min-avg-qual	Minimum base quality at a position to count a read [15]
# 	--min-var-freq	Minimum variant allele frequency threshold [0.01]
# 	--min-freq-for-hom	Minimum frequency to call homozygote [0.75]
# 	--p-value	Default p-value threshold for calling variants [99e-02]
# 	--strand-filter	Ignore variants with >90% support on one strand [1]
# 	--output-vcf	If set to 1, outputs in VCF format
# 	--vcf-sample-list	For VCF output, a list of sample names in order, one per line
# 	--variants	Report only variant (SNP/indel) positions [0]  