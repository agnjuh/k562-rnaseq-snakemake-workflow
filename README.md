# Snakemake-based RNA-seq analysis workflow

This repository contains a reproducible, Snakemake-based workflow for
the analysis of paired-end human mRNA-seq data. The pipeline implements
standard RNA-seq quality control, read processing, and reporting steps,
and is designed to be modular, transparent, and fully reproducible
using tool-specific Conda environments.

The workflow is being developed incrementally following a published
RNA-seq vignette and is intended to cover the full analysis chain,
from raw sequencing reads to alignment and downstream analyses.

---

## Implemented workflow

The current version of the workflow includes the following components:

1. **Quality control of raw sequencing reads**
   - Tool: FastQC
   - Independent assessment of Read 1 and Read 2
   - Evaluation of base quality profiles, GC content, duplication levels,
     and potential technical artefacts

2. **Adapter and quality trimming**
   - Tool: fastp
   - Automatic adapter detection for paired-end reads
   - Quality-based read trimming and filtering
   - Generation of per-sample HTML and JSON reports

3. **Quality control of trimmed reads**
   - Tool: FastQC
   - Post-trimming reassessment of read quality and composition
   - Verification of improvements introduced by trimming

4. **Aggregated quality reporting**
   - Tool: MultiQC
   - Integrated overview of FastQC (raw and trimmed) and fastp results
   - Cross-sample comparison of quality metrics

5. **Reference genome preparation**
   - Tool: HISAT2
   - Construction of a splice-aware alignment index for the
     T2T-CHM13 v2.0 human reference genome

All steps are orchestrated using **Snakemake**, with tool-specific
**Conda environments** to ensure full computational reproducibility
across systems.

---

## Test dataset and biological context

The workflow has been developed and tested using publicly available
paired-end human mRNA-seq data derived from the **K562 human chronic
myelogenous leukemia (CML) cell line**, specifically the Sequence Read
Archive (SRA) run **SRR534301**.

The paired-end FASTQ files (`SRR534301_1.fastq.gz` and
`SRR534301_2.fastq.gz`) were downloaded from the SRA and processed within
this workflow. In the repository, this dataset is referred to as the
sample `test`.

K562 is a well-characterised human hematopoietic cell line originating
from a CML patient and is widely used as a reference system in
transcriptomics method development, benchmarking, and methodological
studies.

Although no formal differential expression analysis is performed at
this stage, the quality control results are **interpreted in a
biological and experimental context**, including:

- Assessment of sequencing quality relative to expected human mRNA-seq
  profiles
- Evaluation of GC content consistency with human transcriptomic data
- Verification that trimming does not introduce systematic biases
- Confirmation of the absence of major technical artefacts or
  contamination

These analyses provide confidence that the dataset is suitable for
downstream alignment and quantitative analyses.

---

## Repository structure
.
├── workflow/
│ ├── Snakefile
│ ├── config.yaml
│ ├── samples.tsv
│ └── envs/
│ ├── fastqc.yaml
│ ├── fastp.yaml
│ ├── multiqc.yaml
│ └── hisat2.yaml
├── data/
│ └── raw/ # input FASTQ files (not versioned)
├── results/ # generated outputs (not versioned)
└── README.md


---

## Requirements

- Conda or Miniconda
- Snakemake (≥ 7.x recommended)

All bioinformatics tools used in the workflow (FastQC, fastp, MultiQC,
HISAT2) are installed automatically via Conda when running the pipeline.

---

## Running the workflow

From the repository root, execute:

```bash
snakemake --cores 2 -s workflow/Snakefile --use-conda

On first execution, the required Conda environments will be created
automatically.
Scope and future extensions
This repository is intended to evolve into a complete RNA-seq analysis
workflow. Planned and ongoing extensions include:
Splice-aware read alignment (HISAT2)
BAM processing and indexing
Gene-level quantification
Differential expression analysis
Extended biological interpretation and visualisation
The modular Snakemake-based design allows these components to be added
incrementally while preserving full reproducibility.
