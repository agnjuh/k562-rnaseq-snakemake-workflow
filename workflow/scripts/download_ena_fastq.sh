#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   bash workflow/scripts/download_ena_fastq.sh SRR11195434 hs0_1
#   bash workflow/scripts/download_ena_fastq.sh SRR11195422 hs60_1

RUN="$1"
SAMPLE="$2"

OUTDIR="data/raw"
mkdir -p "$OUTDIR"

# Query ENA for fastq ftp links
TSV=$(curl -sG "https://www.ebi.ac.uk/ena/portal/api/filereport" \
  --data-urlencode "accession=${RUN}" \
  --data-urlencode "result=read_run" \
  --data-urlencode "fields=fastq_ftp" \
  --data-urlencode "format=tsv")

FTP=$(echo "$TSV" | tail -n 1 | cut -f1)

if [[ -z "${FTP}" || "${FTP}" == "fastq_ftp" ]]; then
  echo "ERROR: No fastq_ftp found for ${RUN}"
  exit 1
fi

# ENA returns ftp paths without scheme sometimes; wget works best with https
R1=$(echo "$FTP" | tr ';' '\n' | sed -n '1p')
R2=$(echo "$FTP" | tr ';' '\n' | sed -n '2p')

if [[ -z "${R2}" ]]; then
  echo "ERROR: ${RUN} does not look paired-end (only one FASTQ)."
  echo "fastq_ftp=${FTP}"
  exit 1
fi

# Add scheme if missing
[[ "$R1" =~ ^ftp\. ]] && R1="https://${R1}"
[[ "$R2" =~ ^ftp\. ]] && R2="https://${R2}"

echo "Downloading:"
echo "  ${R1}"
echo "  ${R2}"

wget -O "${OUTDIR}/${SAMPLE}_R1.fastq.gz" "$R1"
wget -O "${OUTDIR}/${SAMPLE}_R2.fastq.gz" "$R2"

echo "Saved:"
ls -lh "${OUTDIR}/${SAMPLE}_R1.fastq.gz" "${OUTDIR}/${SAMPLE}_R2.fastq.gz"
