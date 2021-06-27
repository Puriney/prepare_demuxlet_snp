#!/volumes/lab/users/yyan/apps/anaconda3/bin/python

proj = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
VCF_DIR = proj + '/vcf'

sample_names = ['k562', 'mdamb231', 'mdamb436']

rule ConcatenateVCF:
  input:
    expand(VCF_DIR + "/{sample}.vcf", sample=sample_names)
  output:
    VCF_DIR + '/All_SNPs_Merged.vcf'
  shell:
    "cat {input} | sort -k1,1 -k2,2n > {output}"
    

