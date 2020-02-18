source /usr/local/ngseq/etc/lmod_profile
module load Variants/Beagle/5.1
java -jar $Beagle_jar gt=data/test1.vcf.gz out=out_BEAGLE/test1 nthreads=8
java -jar $Beagle_jar gt=data/test2.vcf.gz out=out_BEAGLE/test2 nthreads=8
java -jar $Beagle_jar gt=data/test3.vcf.gz out=out_BEAGLE/test3 nthreads=8
