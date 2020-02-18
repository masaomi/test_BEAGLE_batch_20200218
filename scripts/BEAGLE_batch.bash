#!/usr/bin/env bash
# Version = '20200218-094501'

echo source /usr/local/ngseq/etc/lmod_profile
echo module load Variants/Beagle/5.1

VCF_DIR=data
OUT_DIR=out_BEAGLE
mkdir -p $OUT_DIR

files="$VCF_DIR/*.vcf.gz"
for file in $files; do
  file_base=`basename $file|sed -e 's/.vcf.gz//'`
  echo java -jar $Beagle_jar gt=$file out=$OUT_DIR/$file_base nthreads=8
done
