#!/volumes/lab/users/yyan/apps/anaconda3/bin/python

proj  = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
FASTA = "/volumes/seq/genomes/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa"

SNP = proj + '/vcf/All_SNPs_Merged_mergedPositions.bed'
SHCMD = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxlet_pipeline/s6.mpileup_allelic_depth_each_sample.sh'

sample_names = ['k562', 'mdamb231', 'mdamb436']

rule Mpileup:
  input:
    expand(proj + "/mpileup/{sample}.mpileup.vcf", sample=sample_names)
    
rule _mpileup:
  input:
    proj + '/align/{sample}.sorted.dedup.bam'
  output:
    proj + "/mpileup/{sample}.mpileup.vcf"
  log:
    proj + "/log/mpileup.{sample}.txt"
  shell:
    'sh {} {} {} {} {} &> {}'.format(
      SHCMD,
      "{input}", SNP, "{output}", FASTA,
      "{log}"
    )
    

    
