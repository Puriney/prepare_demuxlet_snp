#!/volumes/lab/users/yyan/apps/anaconda3/bin/python

proj  = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
SNP_BED = proj + '/vcf/All_SNPs_Merged_mergedPositions.bed'
RCMD = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxlet_pipeline/s8.export_as_demuxlet.R'
VCF_HEADER = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxlet_pipeline/dummy_VCF_header.txt'

sample_names = ['k562', 'mdamb231', 'mdamb436']

rule ExportDemuxletVCF:
  input:
    proj + '/demuxlet/demuxlet_input.vcf'

rule _write_demuxlet_VCF:
  input:
    expand(proj + "/birdseed/{sample}.affx", sample=sample_names)
  output:
    proj + '/demuxlet/demuxlet_input.txt'
  log:
    proj + '/log/ExportDemuxletVCF.txt'
  shell:
    '/usr/bin/Rscript {} {} {} {} &> {}'.format(
      RCMD,
      SNP_BED, "{output}", "{input}",
      "{log}"
    )
    # '/usr/bin/Rscript {} --snp {} --outfile {} --inputfiles {} &> {}'.format(
    #   RCMD,
    #   SNP_BED, "{output}", "{input}".replace(' ', ':'),
    #   "{log}"
    # )

rule _attach_vcf_header:
  input:
    vcf_content = proj + '/demuxlet/demuxlet_input.txt',
    vcf_header  = VCF_HEADER
  output:
    proj + '/demuxlet/demuxlet_input.vcf'
  shell:
    "cat {input.vcf_header} {input.vcf_content} > {output}"
