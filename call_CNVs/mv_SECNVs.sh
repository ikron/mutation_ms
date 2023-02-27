
REF='/home/marvilla/Dropbox/Neurospora/reference/neurospora_crassa_or74a_12_supercontigs_mtDNA_mata_modfnames.fasta'
output='/home/marvilla/Dropbox/Neurospora/mut_ac/SNV/CNV'
SPTH_r='/home/marvilla/Dropbox/Neurospora/mut_ac/raw_data'

#Stop at any error
set -ue

#cd /home/marvilla/programs/SECNVs

#Simulate CNV
python2 SECNVs.py -G ${REF} -T ${output}/neurospora_crassa.bed -o ${output} -e_chr 4 -min_len 500 -max_len 10000

#Simulate the reads
dwgsim -N 10000 -C 30 -c 0 -S 2 -r 0 -F 0 -R 0 -1 150 -2 150 -e 0.003 -E 0.003 ${output}/test.fa ${SPTH_r}/dwg_cnv
 #-N number of reads
 #-C coverage
 # -c 0 generate reads from Illumina
 #-S opposite side from illumina
 #-r rate of mutations
 # -F frecuency of mutations
 # -R fration of mutations that are indels
 # -e & -E error rates
