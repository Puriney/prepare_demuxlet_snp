#!/volumes/lab/users/yyan/apps/anaconda3/bin/python

proj  = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxplet_res/96plex'
PEAKS = proj + '/peaks/MergedPeaks.srt.mrg.flt.narrowPeak'
FASTA = "/volumes/seq/genomes/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa"
SHCMD = '/volumes/lab/users/yyan/project/snubar_atac/misc_analysis/demuxlet_pipeline/s3.call_vcf_each_sample.sh'

sample_names = ['k562', 'mdamb231', 'mdamb436']

rule all:
  input:
    expand(proj + "/vcf/{sample}.vcf", sample=sample_names)
    

rule VarscanEachSample:
  input:
    bam  = proj + '/align/{sample}.sorted.dedup.bam'
  output:
    vcf = proj + "/vcf/{sample}.vcf"
  log:
    proj + '/log/vcf.{sample}.txt'
  run:
    cmd = "sh {} {} {} {} {}".format(SHCMD, input.bam, PEAKS, FASTA, output.vcf)
    shell(cmd)
