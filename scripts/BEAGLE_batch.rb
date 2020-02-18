#!/usr/bin/env ruby
# encoding: utf-8
# Version = '20200218-092258'

unless vcf_dir=ARGV[0] and out_dir=ARGV[1]
  puts <<-eos
  usage:
   #{File.basename(__FILE__)} [vcf dir] [out dir] (nthreads, default:8)
  eos
  exit
end

NTHREADS = (ARGV[2]||8)

require 'fileutils'
FileUtils.mkdir_p out_dir
warn "# mkdir #{out_dir}"
puts "source /usr/local/ngseq/etc/lmod_profile"
puts "module load Variants/Beagle/5.1"
Dir[File.join(vcf_dir, "*.vcf.gz")].sort.each do |file|
  # java -jar $Beagle_jar gt=data/Run1AB.sa0020.vcf.gz out=beagle_out nthreads=8
  out_file_base = File.join(out_dir, File.basename(file).gsub(/.vcf.gz/, ''))
  command = "java -jar $Beagle_jar gt=#{file} out=#{out_file_base} nthreads=#{NTHREADS}"
  puts command
  # `#{command}`
end


