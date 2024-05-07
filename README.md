## Soybean Transcriptome Analysis

### Overview
This repository contains scripts and documentation for analyzing the transcriptome of soybean (*Glycine max*). This project provides insights into gene expression patterns and regulatory mechanisms in soybean under various time points (dpi1, dpi7, and dpi14).

### Dataset
The dataset used for this analysis consists of RNA sequencing (RNA-seq) data obtained from soybean samples from the Biology Department, Brandon University. The data includes reads generated from different tissues, developmental stages, and experimental treatments.

### Samples
- Control
- Treatment (Alternaria)

### Analysis Pipeline

#### Data Preprocessing and Quality Control
- **Read Trimming:** Removed low-quality bases and adapter sequences from raw sequencing reads using (e.g., FASTQ, Trimmomatic)
- **Read Alignment:** Mapped trimmed reads to a reference genome or transcriptome from the NCBI or Ensembl genome database using alignment software (e.g., STAR, HISAT2).
- **Read Alignment Quality Check:** Sorted, indexed, and filtered mapped trimmed reads for additional quality check using software (e.g., Samtools)
- **Quantification:** Estimated transcript abundance as reads per kilobase of transcript per million mapped reads (RPKM) or fragments per kilobase of transcript per million mapped reads (FPKM) using (e.g., FeatureCounts)

#### Differential Expression Analysis
- **Normalization:** Normalized expression data to account for sequencing depth and transcript length biases.
- **Statistical Analysis:** Identified differentially expressed genes between experimental conditions.
- **Visualization:** Generated plots (e.g., principal component analysis, volcano plots, heatmaps) to visualize gene expression changes.

### Functional Analysis
- **Gene Ontology (GO) Enrichment:** Determined overrepresented biological processes, molecular functions, and cellular components among differentially expressed genes using David Bioinformatics database.
- **Pathway Analysis:** Identified enriched biological pathways using databases such as KEGG and ShinyGO.

### Validation
**qPCR Validation:** Validated RNA-seq results by quantitative real-time PCR (qPCR) for selected genes of interest.

### Interpretation and Reporting
- **Biological Interpretation:** Interpreted RNA-seq results in the context of experimental objectives and biological significance.
- **Report Generation:** Compiled findings into research reports or manuscripts for publication.


### Dependencies
- FastQC
- Trimmomatic
- STAR
- samtools
- featureCounts
- PyDESeq2
- python packages for visualization (pca, ggplot2, pheatmap, valcano)
- Python packages (pandas, numpy, matplotlib, scanpy, bioinfokit, Seaborn)

