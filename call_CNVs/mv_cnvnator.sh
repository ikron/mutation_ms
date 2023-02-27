FILE=$1
SbPTH='/home/marvilla/Dropbox/Neurospora/mut_ac/SNV/bam_files'
REF='/home/marvilla/Dropbox/Neurospora/reference/neurospora_crassa_or74a_12_supercontigs_mtDNA_mata.fasta'

#Stop at any error
set -ue
#move to CNVnator directory
cd /home/marvilla/Dropbox/Neurospora/mut_ac/SNV/CNVnator
#EXTRACTING READ MAPPING FROM BAM/SAM FILES
cnvnator -root ${FILE}.root -tree ${SbPTH}/${FILE}_al.sort.bam 
 
 cnvnator -root ${FILE}.root -his 1670 -fasta ${REF}
 cnvnator -root ${FILE}.root -stat 1670
 cnvnator -root ${FILE}.root -eval 1670
 cnvnator -root ${FILE}.root -partition 1670
 #cnvnator -root ${FILE}.root -genotype 1670
 #cnvnator -root ${FILE}.root -view 1670
 cnvnator -root ${FILE}.root -call 1670 > ${FILE}_cnv_longbin

 #First time I ran CNVnator I ran a smaller bin size (75). It will be run a second time but now with a bigger bin size 1670 (average gene lenght)
