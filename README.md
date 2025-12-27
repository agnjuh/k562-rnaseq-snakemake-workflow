# Snakemake-based mRNA-seq preprocessing pipeline

This repository contains a reproducible, Snakemake-based preprocessing
pipeline for paired-end human mRNA-seq data. The workflow implements
standard best practices for RNA-seq quality control, read trimming,
and report aggregation, and is designed to be modular, transparent,
and fully reproducible using Conda environments.


## Implemented workflow

The current version of the pipeline performs the following steps:

1. **Quality control of raw reads**
   - Tool: FastQC
   - Independent quality assessment of Read 1 and Read 2

2. **Adapter and quality trimming**
   - Tool: fastp
   - Automatic adapter detection for paired-end reads
   - Quality filtering and trimming
   - Generation of HTML and JSON reports

3. **Quality control of trimmed reads**
   - Tool: FastQC
   - Assessment of sequencing quality after trimming

4. **Aggregated quality report**
   - Tool: MultiQC
   - Integrated summary of FastQC (raw and trimmed) and fastp results

All steps are orchestrated using **Snakemake**, with tool-specific
**Conda environments** to ensure full computational reproducibility
across systems.

---

## Test dataset and biological context

The preprocessing workflow was validated using publicly available
paired-end human mRNA-seq data derived from the **K562 human chronic
myelogenous leukemia (CML) cell line**, specifically the Sequence Read
Archive (SRA) run **SRR534301**.

For validation purposes, the paired-end FASTQ files
`SRR534301_1.fastq.gz` and `SRR534301_2.fastq.gz` were downloaded from
the SRA and processed end-to-end using this pipeline. Within this
repository, this dataset is referred to as the sample `test`.

K562 is a well-characterised human hematopoietic cell line originating
from a CML patient and is widely used as a reference system in
transcriptomics method development and benchmarking studies. The dataset
was used **exclusively for technical validation** of the preprocessing
workflow; no biological interpretation or differential analysis was
performed.

The resulting MultiQC report demonstrates:

- High per-base sequencing quality across both reads
- Minimal read loss during trimming
- Stable GC content consistent with human transcriptomic data
- No evidence of major technical artifacts or contamination

These results confirm that the preprocessing workflow behaves as
expected on real human mRNA-seq data.


## Repository structure
.
├── workflow/
│ ├── Snakefile
│ ├── config.yaml
│ ├── samples.tsv
│ └── envs/
│ ├── fastqc.yaml
│ ├── fastp.yaml
│ └── multiqc.yaml
├── data/
│ └── raw/ # input FASTQ files (not versioned)
├── results/ # generated outputs (not versioned)
└── README.md


---

## Requirements

- Conda or Miniconda
- Snakemake (≥ 7.x recommended)

All bioinformatics tools used in the workflow (FastQC, fastp, MultiQC)
are installed automatically via Conda when running the pipeline.

---

## Running the pipeline

From the repository root, execute:

```bash
snakemake --cores 2 -s workflow/Snakefile --use-conda


Scope and future extensions
This repository currently covers the preprocessing and quality control stage of an mRNA-seq analysis workflow. The modular pipeline structure allows straightforward extension with downstream steps such as:
Read alignment (e.g. HISAT2 or STAR)
BAM processing and indexing
Gene-level quantification
Differential expression analysis
Additional components can be integrated while preserving full
reproducibility.

