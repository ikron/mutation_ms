FILE=$1
#ANC=$2
REF='/home/marvilla/Dropbox/Neurospora/reference/neurospora_crassa_or74a_12_supercontigs_mtDNA_mata.fasta'
SPATH='/home/marvilla/Dropbox/Neurospora/mut_ac/SNV/bam_files/'

#Stop at any error
set -ue

cd ${SPATH}
samtools view ${FILE}_al.sort.bam | perl -lane 'print "$F[2]\t$F[3]"'> ${FILE}.hits

cd '/home/marvilla/programs/cnv-seq-master'
./cnv-seq.pl --test ${SPATH}/${FILE}.hits --ref ${SPATH}/ANC2a.hits --genome-size 41000000
echo "CNV-seq DONE"

#open R
library(cnv)
data <- read.delim("test.hits-vs-ref.hits.log2-0.6.pvalue-0.001.cnv")
cnv.print(data)
cnv.summary(data)
plot.cnv(data, CNV=4, upstream=4e+6, downstream=4e+6)
ggsave("sample.pdf")
