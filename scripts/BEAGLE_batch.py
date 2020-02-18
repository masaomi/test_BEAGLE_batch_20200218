#!/usr/bin/env python
# Version = '20200218-095010'

VCF_DIR="data"
OUT_DIR="out_BEAGLE"
NTHREADS=8

from pathlib import Path
import os.path
import subprocess

print("source /usr/local/ngseq/etc/lmod_profile")
print("module load Variants/Beagle/5.1")

for file in list(Path(VCF_DIR).glob("*.vcf.gz")):
    # java -jar $Beagle_jar gt=data/test1.vcf.gz out=out_BEAGLE/test1 nthreads=8
    out_file_base = os.path.join(OUT_DIR, os.path.basename(file))
    command = "java -jar $Beagle_jar gt=%s out=%s nthreads=%d" % (file, out_file_base, NTHREADS)
    print(command)
    #subprocess.call(command)
