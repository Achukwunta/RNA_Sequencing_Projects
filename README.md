**RNA-SEQ - Glycin max (Soybean)**  
  *Control at idp1, idp7, idp14* AND   
  *Sample - Alternaria at idp1, idp7, and idp14*

  **RNA-Seq Pipeline**

**This pipeline performs the following tasks:**

 *check the quality of FastQ raw-reads files (using FastQC) * 
 * aggregate fastqc raw files using (using MultiQC)
 * trim poor quality (using Trimmomatic)
 * generate genome index using STAR
 * align reads of each sample in a run against reference genome (using STAR) 
 perform quality control on generated BAM files (using Samtools) 
 count reads in features (using FeatureCounts) 
 normalize read counts (using pyDESeq) 
 calculate RPKMs  
 perform DE analysis for standard designs (using pyDESeq2) 
 variant calling, filtering and annotation 
 Perform PCA (using Scanpy) 
 Perform Heatmap(Using Seaborn) 
 Perform Volcano (using Bioinfokit) 
