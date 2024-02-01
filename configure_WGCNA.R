# configure for enrichment analyses

# clear the work space ####
rm(list=ls())
gc()

# set the initial time ####
T00 <- proc.time()

# update installed packages ####
PKG_UPDATE <- FALSE

# resolution for the plots ####
DPI <- 150

# project title ####
MY_TITLE <- "Enrichment results for WGCNA pollen results"

# parth to the directory containing the source files ####
SOURCE_DIR <- "/home/bullones/datos_bullones/Bioinformatica/Script/Script_R/enrichment_RSeqFlow/"

# path to the directory containing the data file ####
WD_DIR <- "/home/bullones/datos_bullones/Bioinformatica/RNA_Seq/muestras_picual_Juande/WGCNA_resultados_javier/"

# data file ####
FILE <- "gene_modules.tsv"

# orthology file ####
ORTHOLOGY_FILE <- "/home/bullones/datos_bullones/Bioinformatica/ortologia/picual-arabidopsis_OliveTreeDB_DIAMOND/orthology_picual-arabidopsis_OliveTreeDB_diamond.tsv"

# transcription factors file ####
# comment next line if you don't want to check for TF
TF_FILE <- "/media/datos/datos_bullones/Bioinformatica/RNA_Seq/muestras_picual_Juande/Olivo4Plants/Polen TR/Ath_TF_list.txt"

# other important genes file (e.g. hubs) ####
# comment next line if you don't want to check for other genes
# this file MUST have a header
OTHER_FILE <- "/media/datos/datos_bullones/Bioinformatica/RNA_Seq/muestras_picual_Juande/WGCNA_resultados_javier/hub_test.txt"

# detailed or short report ####
VERBOSE_MODE <- TRUE

# download stopwords or not ####
STOP_FILE <- FALSE

# remove duplicates genes or not (for example for DEGs)
DO_REMOVE_DUPS <- FALSE

# organism ####
# original organism
ORG_ORIG <- "Picual"
# don't touch
ORG_ORIG <- paste0("ID_", ORG_ORIG)
# organism for enrichment
ORG_ENRICH <- "Arabidopsis"
# don't touch
ORG_ENRICH <- paste0("ID_", ORG_ENRICH)
organism <- "org.At.tair.db" # arabidopsis
# más organismos disponibles en
# http://bioconductor.org/packages/release/BiocViews.html#___OrgDb
kegg_organism <- "ath"
# más organismos disponibles en
# https://www.genome.jp/kegg/catalog/org_list.html

# set seed for plots
# DON'T TOUCH
SEED <- 8

# values for enrichment ####
KEYTYPE <- "TAIR"
P_CUTOFF <- 0.05 # valor de corte de p
Q_CUTOFF <- 0.2 # valor de corte de q
P_ADJUST_METHOD <- "none"
MIN_GSSIZE <- 10
MIN_GSSIZE_GSEA <- 10
MAX_GSSIZE <- 500
N_PERM <- 1000
VERBOSE <- FALSE  # show or hide GSEA messages

# values for Fisher test ####
P_FISHER <- 0.05

# values for treeplot ####
# number of clusters to plot
# if it's 0, it will be calculated
NCLUST <- 0

# values for KEGG pathway analysis ####
# output id type for bitr
TO_TYPE <- "ENTREZID"
KEYTYPE_KEGG <- "ncbi-geneid"

# minimun number of genes for over-enrichment and KEGG representation
MIN_GENES <- 5
ENRICH_FACTOR <- 80 # bigger value, more processes to show

# minimum score for GSEA representation
MIN_SCORE <- 0.4

# ratio to calculate minimum frequency for wordclouds representation
MIN_RATIO <- 3

# variable to customise each working directory created ####
HOY <- format(Sys.time(), "%F_%H.%M.%S")

# directory to save results ####
SUB_DIR <- paste0(WD_DIR, "/results_enrichment_", HOY, "/")

# create directory to save results ####
dir.create(file.path(SUB_DIR), showWarnings = FALSE)

# load data ####
genes <- read.table(file = paste0(WD_DIR, FILE),
                    sep = "\t",
                    header = TRUE)

ort <- read.table(file = ORTHOLOGY_FILE,
                  sep = "\t",
                  header = TRUE)
# no row.names
                  #row.names = 1

# format the data ####
allContrasts <- unique(genes$colors)
genes_list <- list()
for (i in 1:length(allContrasts))
{
  tmp <- grep(paste0("^", allContrasts[i], "$"), genes[[2]])
  tmp <- genes[tmp,1]
  genes_list[[allContrasts[i]]] <- tmp
}

rm(genes, tmp)

# load/install libraries ####
fileToSource <- paste0(SOURCE_DIR, "libraries.R")
source(fileToSource)

# path to Rmd ####
render(input = paste0(SOURCE_DIR, "enrichment_color_test.Rmd"),
       output_dir = SUB_DIR,
       output_file = " Enrichment_report.html",
       quiet = TRUE)


