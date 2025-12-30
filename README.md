# mRNA-seq-heatshock-snakemake

A reproducible **Snakemake workflow for bulk mRNA-seq analysis** using a heat shock experiment in the **K562 human leukemia cell line**, aligned to the **T2T-CHM13 v2.0 human reference genome**, as an example dataset.

---

## Example dataset

Bulk mRNA-seq data from the **K562 chronic myelogenous leukemia (CML) cell line** subjected to heat shock treatment.

- **Data source:** European Nucleotide Archive (ENA) / NCBI Sequence Read Archive (SRA)
- **BioProject:** `PRJNA527268`
- **Organism:** *Homo sapiens*
- **Cell line:** K562
- **Library strategy:** RNA-Seq (bulk mRNA-seq)
- **Library layout:** Paired-end
- **Sequencing platform:** Illumina NextSeq 500
- **Read type:** Poly(A)-enriched mRNA

---

## Experimental design

- **hs0:** 37 °C control condition (no heat shock)
- **hs60:** 42 °C heat shock for 45 minutes

Differential expression analysis is performed between **hs60 vs hs0** using DESeq2.

---

## Samples used in the example run

| Sample ID  | Condition | Run accession |
|-----------|----------|---------------|
| hs0_rep1  | hs0      | SRR11195434  |
| hs0_rep2  | hs0      | SRR11195435  |
| hs0_rep3  | hs0      | SRR11195436  |
| hs60_rep1 | hs60     | SRR11195422  |
| hs60_rep2 | hs60     | SRR11195423  |

---

## Read files

Paired-end FASTQ files were downloaded directly from the ENA FTP server:
SRR11195434_1.fastq.gz
SRR11195434_2.fastq.gz
SRR11195435_1.fastq.gz
SRR11195435_2.fastq.gz
SRR11195436_1.fastq.gz
SRR11195436_2.fastq.gz
SRR11195422_1.fastq.gz
SRR11195422_2.fastq.gz
SRR11195423_1.fastq.gz
SRR11195423_2.fastq.gz

---

## Reference genome

- **Reference:** Telomere-to-Telomere human genome assembly
- **Build:** **T2T-CHM13 v2.0**
- **Aligner:** HISAT2
- **Annotation:** Gene-level GTF compatible with T2T-CHM13

---

## Workflow overview

The pipeline performs the following steps:

1. Raw read quality control (FastQC)
2. Adapter and quality trimming (fastp)
3. Alignment to the human reference genome (HISAT2, T2T-CHM13 v2.0)
4. BAM processing and QC (samtools)
5. Gene-level quantification (featureCounts)
6. Differential expression analysis (DESeq2)

---

## Input specification

Samples are defined in a tab-separated file:
sample     condition    r1                                r2
hs0_rep1   hs0          data/raw/hs0_rep1_R1.fastq.gz     data/raw/hs0_rep1_R2.fastq.gz
hs0_rep2   hs0          data/raw/hs0_rep2_R1.fastq.gz     data/raw/hs0_rep2_R2.fastq.gz
hs0_rep3   hs0          data/raw/hs0_rep3_R1.fastq.gz     data/raw/hs0_rep3_R2.fastq.gz
hs60_rep1  hs60         data/raw/hs60_rep1_R1.fastq.gz    data/raw/hs60_rep1_R2.fastq.gz
hs60_rep2  hs60         data/raw/hs60_rep2_R1.fastq.gz    data/raw/hs60_rep2_R2.fastq.gz

---

## Output

Key outputs include:

- Gene count matrix
- DESeq2 differential expression results
- Normalized counts
- QC reports (FastQC, MultiQC)
- Session information for reproducibility

---

## Notes

The example dataset included in this repository is intended for **workflow demonstration and reproducibility testing**.
The workflow is **generalisable** to other bulk mRNA-seq datasets with arbitrary numbers of biological replicates, experimental conditions, and reference genomes.

## Statistical considerations

While the pipeline fully supports arbitrary numbers of biological replicates and complex experimental designs, the small number of samples used here limits statistical power for differential expression analysis. In practice, a larger number of biological replicates is recommended to obtain robust and well-powered results.

Future extensions of this repository may include additional biological replicates or alternative datasets to further demonstrate statistical robustness.