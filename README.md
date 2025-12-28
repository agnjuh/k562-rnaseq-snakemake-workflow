# Snakemake-based RNA-seq analysis workflow

This repository contains a **fully reproducible Snakemake workflow** for
processing paired-end human **mRNA-seq** data, covering quality control,
read trimming, reference preparation, splice-aware alignment, and BAM
processing. All steps are executed in **tool-specific Conda environments**.

---

## Analysis steps

- Raw read quality control — **FastQC**
- Adapter and quality trimming — **fastp**
- Post-trimming quality control — **FastQC**
- Aggregated QC reporting — **MultiQC**
- Reference genome indexing — **HISAT2**
- Splice-aware read alignment — **HISAT2**
- BAM sorting and indexing — **samtools**

Reference genome: **T2T-CHM13 v2.0 (Homo sapiens)**

---

## Test dataset (exact specification)

The workflow was developed and validated using publicly available human
mRNA-seq data from the **K562 chronic myelogenous leukemia (CML) cell line**.

- **Data source:** NCBI Sequence Read Archive (SRA)
- **Run accession:** `SRR534301`
- **BioProject:** `PRJNA279664`
- **Organism:** *Homo sapiens*
- **Cell line:** K562
- **Library strategy:** RNA-Seq
- **Library layout:** Paired-end
- **Read files:**
  - `SRR534301_1.fastq.gz`
  - `SRR534301_2.fastq.gz`
- **Sample identifier used in workflow:** `test`

---

## Requirements

- **Conda / Miniconda**
- **Snakemake ≥ 7.x**

All tools (**FastQC, fastp, MultiQC, HISAT2, samtools**) are installed
automatically via Conda.

---

## Usage

From the repository root:

```bash
snakemake --cores 2 -s workflow/Snakefile --use-conda
