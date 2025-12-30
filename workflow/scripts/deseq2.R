suppressPackageStartupMessages({
  library("DESeq2")
  library("readr")
  library("tibble")
})

args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 7) {
  stop("Usage: Rscript deseq2.R <counts_tsv> <samples_tsv> <design> <factor> <numerator> <denominator> <out_prefix>")
}

counts_path     <- args[1]
samples_path    <- args[2]
design_str      <- args[3]
factor_name     <- args[4]
numerator       <- args[5]
denominator     <- args[6]
out_prefix      <- args[7]

counts <- read_tsv(counts_path, show_col_types = FALSE)
gene_ids <- counts$Geneid
count_mat <- as.matrix(counts[, -1])
rownames(count_mat) <- gene_ids

samples <- read_tsv(samples_path, show_col_types = FALSE)
stopifnot("sample" %in% colnames(samples))
stopifnot(factor_name %in% colnames(samples))

samples <- samples[match(colnames(count_mat), samples$sample), , drop = FALSE]
if (any(is.na(samples$sample))) {
  stop("Sample names in counts matrix do not match samples metadata.")
}

grp <- table(samples[[factor_name]])
if (any(grp < 2)) {
  message(
    "WARNING: Some groups have <2 replicates. DESeq2 can run, but inference is not reliable.\n",
    "Group sizes: ", paste(names(grp), grp, sep="=", collapse=", ")
  )
}

dds <- DESeqDataSetFromMatrix(
  countData = round(count_mat),
  colData   = as.data.frame(samples),
  design    = as.formula(design_str)
)

dds <- DESeq(dds)

res <- results(dds, contrast = c(factor_name, numerator, denominator))
res_tbl <- as_tibble(res, rownames = "Geneid")
write_tsv(res_tbl, paste0(out_prefix, ".results.tsv"))

norm_counts <- counts(dds, normalized = TRUE)
norm_tbl <- as_tibble(norm_counts, rownames = "Geneid")
write_tsv(norm_tbl, paste0(out_prefix, ".normalized_counts.tsv"))

sink(paste0(out_prefix, ".sessionInfo.txt"))
print(sessionInfo())
sink()
