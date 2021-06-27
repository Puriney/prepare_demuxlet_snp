#!/usr/bin/bash
set -ex

BAM=$1
REGIONS=$2
OUT_MPILEUP=$3
FASTA=$4

samtools mpileup --VCF --skip-indels --uncompressed \
  --output-tags AD \
  --positions $REGIONS \
  --fasta-ref $FASTA \
  $BAM | grep -vE "#" > $OUT_MPILEUP
