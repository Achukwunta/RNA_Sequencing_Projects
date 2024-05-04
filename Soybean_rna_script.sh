#!/bin/bash

SECONDS=0
# change working directory
cd /home/uche/rnapipeline

# STEP 1: Run fastqc for quality check on raw reads
fastqc raw_reads/*.fastq.gz -o raw_reads/fastq_report


# STEP 2: Aggregate fastqc raw files using multiqc
multiqc raw_reads/fastq_report/*_fastqc.zip -o raw_reads/multiqc_report


# STEP 3: run trimmomatic to trim poor quality

trimmomatic PE -threads 8\
 raw_reads/Control_T14_1_R1.fastq.gz raw_reads/Control_T14_1_R2.fastq.gz\
 trimmed_reads/control/Control_T14_1.trimmed.paired.R1.fastq.gz trimmed_reads/control/Control_T14_1.trimmed.unpaired.R1.fastq.gz\
 trimmed_reads/control/Control_T14_1.trimmed.paired.R2.fastq.gz trimmed_reads/control/Control_T14_1.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

trimmomatic PE -threads 8\
 raw_reads/Control_T14_2_R1.fastq.gz raw_reads/Control_T14_2_R2.fastq.gz\
 trimmed_reads/control/Control_T14_2.trimmed.paired.R1.fastq.gz trimmed_reads/control/Control_T14_2.trimmed.unpaired.R1.fastq.g\
 trimmed_reads/control/Control_T14_2.trimmed.paired.R2.fastq.gz trimmed_reads/control/Control_T14_2.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

trimmomatic PE -threads 8\
 raw_reads/Control_T14_3_R1.fastq.gz raw_reads/Control_T14_3_R2.fastq.gz\
 trimmed_reads/control/Control_T14_3.trimmed.paired.R1.fastq.gz trimmed_reads/control/Control_T14_3.trimmed.unpaired.R1.fastq.\
 trimmed_reads/control/Control_T14_3.trimmed.paired.R2.fastq.gz trimmed_reads/control/Control_T14_3.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36


trimmomatic PE -threads 8\
 raw_reads/Control_T14_4_R1.fastq.gz raw_reads/Control_T14_4_R2.fastq.gz\
 trimmed_reads/control/Control_T14_4.trimmed.paired.R1.fastq.gz trimmed_reads/control/Control_T14_4.trimmed.unpaired.R1.fastq.\
 trimmed_reads/control/Control_T14_4.trimmed.paired.R2.fastq.gz trimmed_reads/control/Control_T14_4.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36


echo "Trimmomatic finished running control reads!"

trimmomatic PE -threads 8\
 raw_reads/Alternaria_T14_1_R1.fastq.gz raw_reads/Alternaria_T14_1_R2.fastq.gz\
 trimmed_reads/treatment/Alternaria_T14_1.trimmed.paired.R1.fastq.gz trimmed_reads/treatment/Alternaria_T14_1.trimmed.unpaired.R1.fastq.\
 trimmed_reads/treatment/Alternaria_T14_1.trimmed.paired.R2.fastq.gz trimmed_reads/treatment/Alternaria_T14_1.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

trimmomatic PE -threads 8\
 raw_reads/Alternaria_T14_2_R1.fastq.gz raw_reads/Alternaria_T14_2_R2.fastq.gz\
 trimmed_reads/treatment/Alternaria_T14_2.trimmed.paired.R1.fastq.gz trimmed_reads/treatment/Alternaria_T14_2.trimmed.unpaired.R1.fastq.\
 trimmed_reads/treatment/Alternaria_T14_2.trimmed.paired.R2.fastq.gz trimmed_reads/treatment/Alternaria_T14_2.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

trimmomatic PE -threads 8\
 raw_reads/Alternaria_T14_3_R1.fastq.gz raw_reads/Alternaria_T14_3_R2.fastq.gz\
 trimmed_reads/treatment/Alternaria_T14_3.trimmed.paired.R1.fastq.gz trimmed_reads/treatment/Alternaria_T14_3.trimmed.unpaired.R1.fastq.\
 trimmed_reads/treatment/Alternaria_T14_3.trimmed.paired.R2.fastq.gz trimmed_reads/treatment/Alternaria_T14_3.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

trimmomatic PE -threads 8\
 raw_reads/Alternaria_T14_4_R1.fastq.gz raw_reads/Alternaria_T14_4_R2.fastq.gz\
 trimmed_reads/treatment/Alternaria_T14_4.trimmed.paired.R1.fastq.gz trimmed_reads/treatment/Alternaria_T14_4.trimmed.unpaired.R1.fastq.\
 trimmed_reads/treatment/Alternaria_T14_4.trimmed.paired.R2.fastq.gz trimmed_reads/treatment/Alternaria_T14_4.trimmed.unpaired.R2.fastq.gz\
 ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:2:True\
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36


echo "Trimmomatic finished running treatment reads!"


#STEP 4: Run fastqc for trimmed reads
fastqc trimmed_reads/control/*.fastq.gz -o trimmed_reads/fastq_report
fastqc trimmed_reads/treatment/*.fastq.gz -o trimmed_reads/fastq_report


#STEP 5: Aggregate trimmed reads using multiqc
multiqc trimmed_reads/fastq_report/*_fastqc.zip -o trimmed_reads/multiqc_report

#STEP 6: Generate genome index using STAR

#STAR --runThreadN 8\
 #--runMode genomeGenerate\
 #--genomeDir ref_genome\
 #--genomeFastaFiles ref_genome/GCF_000004515.6_Glycine_max_v4.0_genomic.fna\
 #--sjdbGTFfile ref_genome/genomic.gtf\
 #--genomeSAindexNbases 10


#echo "STAR finished indexing!"

#STEP 7: unzip the trimmed reads for STAR alignment
gzip -d trimmed_reads/control/*.fastq.gz
gzip -d trimmed_reads/treatment/*.fastq.gz

#STEP 8: Map rnaSequenced reads to reference genome using STAR

for file in trimmed_reads/control/Control_T14_1*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Control_T14_1; done


for file in trimmed_reads/control/Control_T14_2*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Control_T14_2; done

for file in trimmed_reads/control/Control_T14_3*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Control_T14_3; done

for file in trimmed_reads/control/Control_T14_4*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Control_T14_4; done


echo "STAR finished Control mapping!"



for file in trimmed_reads/treatment/Alternaria_T14_1*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Alternaria_T14_1; done


for file in trimmed_reads/treatment/Alternaria_T14_2*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Alternaria_T14_2; done

for file in trimmed_reads/treatment/Alternaria_T14_3*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Alternaria_T14_3; done


for file in trimmed_reads/treatment/Alternaria_T14_4*.fastq; do\
 STAR --runThreadN 8\
 --readFilesIn ${file}\
 --genomeDir ref_genome\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix mapped_reads/Alternaria_T14_4; done

echo "STAR finished Treatment mapping!"

#STEP 9: View aligned reads to the reference genome using multiqc
multiqc mapped_reads/*.final.out -o mapped_reads/multiqc_report




#STEP 10: sorting bam files using Samtools

samtools sort -@ 8 mapped_reads/Control_T14_1Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Control_T14_1.sorted.bam
samtools sort -@ 8 mapped_reads/Control_T14_2Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Control_T14_2.sorted.bam
samtools sort -@ 8 mapped_reads/Control_T14_3Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Control_T14_3.sorted.bam
samtools sort -@ 8 mapped_reads/Control_T14_4Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Control_T14_4.sorted.bam


samtools sort -@ 8 mapped_reads/Alternaria_T14_1Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Alternaria_T14_1.sorted.bam
samtools sort -@ 8 mapped_reads/Alternaria_T14_2Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Alternaria_T14_2.sorted.bam
samtools sort -@ 8 mapped_reads/Alternaria_T14_3Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Alternaria_T14_3.sorted.bam
samtools sort -@ 8 mapped_reads/Alternaria_T14_4Aligned.sortedByCoord.out.bam -o mapped_reads/sorted_reads/Alternaria_T14_4.sorted.bam


echo "Samtools finished sorting!"



#STEP 11: Index BAM file using Samtools

samtools index mapped_reads/sorted_reads/Control_T14_1.sorted.bam
samtools index mapped_reads/sorted_reads/Control_T14_2.sorted.bam
samtools index mapped_reads/sorted_reads/Control_T14_3.sorted.bam
samtools index mapped_reads/sorted_reads/Control_T14_4.sorted.bam


samtools index mapped_reads/sorted_reads/Alternaria_T14_1.sorted.bam
samtools index mapped_reads/sorted_reads/Alternaria_T14_2.sorted.bam
samtools index mapped_reads/sorted_reads/Alternaria_T14_3.sorted.bam
samtools index mapped_reads/sorted_reads/Alternaria_T14_4.sorted.bam

echo "Samtools finished indexing!"



#STEP 12: Run featureCounts - Quantification
featureCounts -t exon -g gene_id -a ref_genome/genomic.gtf\
 -o mapped_reads/counts/counts.txt -T 8 mapped_reads/sorted_reads/*.sorted.bam


echo "featureCounts finished running!"

#STEP 13: Perform differential Analysis using PyDESeq2











duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
