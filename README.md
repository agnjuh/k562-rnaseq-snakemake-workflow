# Snakemake-based RNA-seq analysis workflow

This repository contains a reproducible, **Snakemake-based workflow** for the
analysis of paired-end human **mRNA-seq** data. The pipeline implements standard
RNA-seq quality control, read processing, reference preparation, and alignment
steps, and is designed to be **modular**, **transparent**, and **fully
reproducible** using tool-specific **Conda environments**.

The workflow is developed as a methodological RNA-seq analysis project with an
emphasis on best-practice workflow design, computational reproducibility, and
clear separation of processing steps. It is intended both as a reference
implementation of a modern Snakemake-based RNA-seq pipeline and as a foundation
for downstream transcriptomic analyses.

---

## Implemented workflow

The current version of the workflow includes the following components:

### 1. Quality control of raw sequencing reads
- **Tool:** FastQC  
- Independent assessment of Read 1 and Read 2  
- Evaluation of base quality profiles, GC content, duplication levels, and
  potential technical artefacts

### 2. Adapter and quality trimming
- **Tool:** fastp  
- Automatic adapter detection for paired-end reads  
- Quality-based read trimming and filtering  
- Generation of per-sample **HTML** and **JSON** reports

### 3. Quality control of trimmed reads
- **Tool:** FastQC  
- Post-trimming reassessment of read quality and composition  
- Verification of improvements introduced by trimming

### 4. Aggregated quality reporting
- **Tool:** MultiQC  
- Integrated overview of FastQC (raw and trimmed) and fastp results  
- Cross-sample comparison of quality metrics

### 5. Reference genome preparation
- **Tool:** HISAT2  
- Construction of a splice-aware alignment index for the
  **T2T-CHM13 v2.0 human reference genome**

### 6. Splice-aware read alignment
- **Tool:** HISAT2  
- Alignment of trimmed paired-end reads to the CHM13 v2.0 reference genome  
- Generation of BAM alignment files

### 7. BAM processing
- **Tool:** samtools  
- Coordinate sorting of alignment files  
- BAM index generation for downstream compatibility

All steps are orchestrated using **Snakemake**, with tool-specific **Conda
environments** to ensure full computational reproducibility across systems.

---

## Test dataset and biological context

The workflow has been developed and tested using publicly available paired-end
human mRNA-seq data derived from the **K562 human chronic myelogenous leukemia
(CML) cell line**, specifically the Sequence Read Archive (SRA) run
**SRR534301**.

The paired-end FASTQ files (`SRR534301_1.fastq.gz` and
`SRR534301_2.fastq.gz`) were downloaded from the SRA and processed within this
workflow. Within the repository, this dataset is referred to as the sample
`test`.

K562 is a well-characterised human hematopoietic cell line originating from a
CML patient and is widely used as a reference system in transcriptomics method
development, benchmarking, and methodological studies.

Although no formal differential expression analysis is performed at this stage,
the quality control and alignment results are interpreted in a **biological and
experimental context**, including:

- Assessment of sequencing quality relative to expected human mRNA-seq profiles  
- Evaluation of GC content consistency with human transcriptomic data  
- Verification that trimming does not introduce systematic biases  
- Confirmation of high overall alignment rates and the absence of major
  technical artefacts or contamination

These analyses provide confidence that the dataset is suitable for downstream
quantitative and comparative transcriptomic analyses.

---

## Repository structure
# Snakemake-based RNA-seq analysis workflow

This repository contains a reproducible, **Snakemake-based workflow** for the
analysis of paired-end human **mRNA-seq** data. The pipeline implements standard
RNA-seq quality control, read processing, reference preparation, and alignment
steps, and is designed to be **modular**, **transparent**, and **fully
reproducible** using tool-specific **Conda environments**.

The workflow is developed as a methodological RNA-seq analysis project with an
emphasis on best-practice workflow design, computational reproducibility, and
clear separation of processing steps. It is intended both as a reference
implementation of a modern Snakemake-based RNA-seq pipeline and as a foundation
for downstream transcriptomic analyses.

---

## Implemented workflow

The current version of the workflow includes the following components:

### 1. Quality control of raw sequencing reads
- **Tool:** FastQC  
- Independent assessment of Read 1 and Read 2  
- Evaluation of base quality profiles, GC content, duplication levels, and
  potential technical artefacts

### 2. Adapter and quality trimming
- **Tool:** fastp  
- Automatic adapter detection for paired-end reads  
- Quality-based read trimming and filtering  
- Generation of per-sample **HTML** and **JSON** reports

### 3. Quality control of trimmed reads
- **Tool:** FastQC  
- Post-trimming reassessment of read quality and composition  
- Verification of improvements introduced by trimming

### 4. Aggregated quality reporting
- **Tool:** MultiQC  
- Integrated overview of FastQC (raw and trimmed) and fastp results  
- Cross-sample comparison of quality metrics

### 5. Reference genome preparation
- **Tool:** HISAT2  
- Construction of a splice-aware alignment index for the
  **T2T-CHM13 v2.0 human reference genome**

### 6. Splice-aware read alignment
- **Tool:** HISAT2  
- Alignment of trimmed paired-end reads to the CHM13 v2.0 reference genome  
- Generation of BAM alignment files

### 7. BAM processing
- **Tool:** samtools  
- Coordinate sorting of alignment files  
- BAM index generation for downstream compatibility

All steps are orchestrated using **Snakemake**, with tool-specific **Conda
environments** to ensure full computational reproducibility across systems.

---

## Test dataset and biological context

The workflow has been developed and tested using publicly available paired-end
human mRNA-seq data derived from the **K562 human chronic myelogenous leukemia
(CML) cell line**, specifically the Sequence Read Archive (SRA) run
**SRR534301**.

The paired-end FASTQ files (`SRR534301_1.fastq.gz` and
`SRR534301_2.fastq.gz`) were downloaded from the SRA and processed within this
workflow. Within the repository, this dataset is referred to as the sample
`test`.

K562 is a well-characterised human hematopoietic cell line originating from a
CML patient and is widely used as a reference system in transcriptomics method
development, benchmarking, and methodological studies.

Although no formal differential expression analysis is performed at this stage,
the quality control and alignment results are interpreted in a **biological and
experimental context**, including:

- Assessment of sequencing quality relative to expected human mRNA-seq profiles  
- Evaluation of GC content consistency with human transcriptomic data  
- Verification that trimming does not introduce systematic biases  
- Confirmation of high overall alignment rates and the absence of major
  technical artefacts or contamination

These analyses provide confidence that the dataset is suitable for downstream
quantitative and comparative transcriptomic analyses.

---

## Repository structure
# Snakemake-based RNA-seq analysis workflow

This repository contains a reproducible, **Snakemake-based workflow** for the
analysis of paired-end human **mRNA-seq** data. The pipeline implements standard
RNA-seq quality control, read processing, reference preparation, and alignment
steps, and is designed to be **modular**, **transparent**, and **fully
reproducible** using tool-specific **Conda environments**.

The workflow is developed as a methodological RNA-seq analysis project with an
emphasis on best-practice workflow design, computational reproducibility, and
clear separation of processing steps. It is intended both as a reference
implementation of a modern Snakemake-based RNA-seq pipeline and as a foundation
for downstream transcriptomic analyses.

---

## Implemented workflow

The current version of the workflow includes the following components:

### 1. Quality control of raw sequencing reads
- **Tool:** FastQC  
- Independent assessment of Read 1 and Read 2  
- Evaluation of base quality profiles, GC content, duplication levels, and
  potential technical artefacts

### 2. Adapter and quality trimming
- **Tool:** fastp  
- Automatic adapter detection for paired-end reads  
- Quality-based read trimming and filtering  
- Generation of per-sample **HTML** and **JSON** reports

### 3. Quality control of trimmed reads
- **Tool:** FastQC  
- Post-trimming reassessment of read quality and composition  
- Verification of improvements introduced by trimming

### 4. Aggregated quality reporting
- **Tool:** MultiQC  
- Integrated overview of FastQC (raw and trimmed) and fastp results  
- Cross-sample comparison of quality metrics

### 5. Reference genome preparation
- **Tool:** HISAT2  
- Construction of a splice-aware alignment index for the
  **T2T-CHM13 v2.0 human reference genome**

### 6. Splice-aware read alignment
- **Tool:** HISAT2  
- Alignment of trimmed paired-end reads to the CHM13 v2.0 reference genome  
- Generation of BAM alignment files

### 7. BAM processing
- **Tool:** samtools  
- Coordinate sorting of alignment files  
- BAM index generation for downstream compatibility

All steps are orchestrated using **Snakemake**, with tool-specific **Conda
environments** to ensure full computational reproducibility across systems.

---

## Test dataset and biological context

The workflow has been developed and tested using publicly available paired-end
human mRNA-seq data derived from the **K562 human chronic myelogenous leukemia
(CML) cell line**, specifically the Sequence Read Archive (SRA) run
**SRR534301**.

The paired-end FASTQ files (`SRR534301_1.fastq.gz` and
`SRR534301_2.fastq.gz`) were downloaded from the SRA and processed within this
workflow. Within the repository, this dataset is referred to as the sample
`test`.

K562 is a well-characterised human hematopoietic cell line originating from a
CML patient and is widely used as a reference system in transcriptomics method
development, benchmarking, and methodological studies.

Although no formal differential expression analysis is performed at this stage,
the quality control and alignment results are interpreted in a **biological and
experimental context**, including:

- Assessment of sequencing quality relative to expected human mRNA-seq profiles  
- Evaluation of GC content consistency with human transcriptomic data  
- Verification that trimming does not introduce systematic biases  
- Confirmation of high overall alignment rates and the absence of major
  technical artefacts or contamination

These analyses provide confidence that the dataset is suitable for downstream
quantitative and comparative transcriptomic analyses.

---

## Repository structure
.
├── workflow/
│ ├── Snakefile
│ └── envs/
│ ├── fastqc.yaml
│ ├── fastp.yaml
│ ├── multiqc.yaml
│ └── hisat2.yaml
├── data/
│ ├── raw/ # input FASTQ files (not versioned)
│ └── reference/ # reference data and indices (not versioned)
├── results/ # generated outputs (not versioned)
├── config.yaml
├── samples.tsv
└── README.md


---

## Requirements

- **Conda** or **Miniconda**  
- **Snakemake** (≥ 7.x recommended)

All bioinformatics tools used in the workflow (**FastQC**, **fastp**,
**MultiQC**, **HISAT2**, **samtools**) are installed automatically via Conda
when running the pipeline.

---

## Running the workflow

From the repository root, execute:

```bash
snakemake --cores 2 -s workflow/Snakefile --use-conda


---

## Requirements

- **Conda** or **Miniconda**  
- **Snakemake** (≥ 7.x recommended)

All bioinformatics tools used in the workflow (**FastQC**, **fastp**,
**MultiQC**, **HISAT2**, **samtools**) are installed automatically via Conda
when running the pipeline.

---

## Running the workflow

From the repository root, execute:

```bash
snakemake --cores 2 -s workflow/Snakefile --use-conda

