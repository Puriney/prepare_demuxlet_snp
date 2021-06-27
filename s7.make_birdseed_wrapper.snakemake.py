#!/volumes/lab/users/yyan/apps/anaconda3/bin/python
proj  = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
SNP_BED = proj + '/vcf/All_SNPs_Merged_mergedPositions.bed'
RCMD = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxlet_pipeline/s7.make_birdseed_each_sample.R'
sample_names = ['k562', 'mdamb231', 'mdamb436']

rule Birdseed:
  input:
    expand(proj + "/birdseed/{sample}.affx", sample=sample_names),
    expand(proj + "/birdseed/{sample}.snp", sample=sample_names)
    
rule _birdseed:
  input:
    proj + "/mpileup/{sample}.mpileup.vcf"
  output:
    snp  = proj + "/birdseed/{sample}.snp",
    affx = proj + "/birdseed/{sample}.affx"
  log:
    proj + "/log/birdseed.{sample}.txt"
  shell:
    '/usr/bin/Rscript {} --input {} --affx {} --outsnp {} --outaffx {} &> {}'.format(
      RCMD,
      "{input}", SNP_BED, "{output.snp}", "{output.affx}",
      "{log}"
    )
    
