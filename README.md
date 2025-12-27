# mRNA-seq analysis pipeline

This repository provides a Snakemake-based pipeline for the analysis of
paired-end human mRNA-seq data, covering quality control, read trimming,
genome alignment, gene-level quantification, and differential expression
analysis in a fully reproducible workflow.

The workflow is implemented using **Snakemake** and is designed to be fully
reproducible and modular.

## Workflow overview

1. Quality control (FastQC, MultiQC)
2. Adapter and quality trimming (fastp)
3. Read alignment to reference genome (HISAT2)
4. BAM processing (samtools)
5. Gene-level read counting (featureCounts)
6. Differential expression analysis (DESeq2)

## Repository structure

- `workflow/` — Snakemake workflow, configs, environments, scripts
- `data/` — input data (not versioned)
- `results/` — generated outputs (not versioned)

## Requirements

- Snakemake
- Conda / Mamba
- Standard RNA-seq tools (FastQC, fastp, HISAT2, samtools, featureCounts)

