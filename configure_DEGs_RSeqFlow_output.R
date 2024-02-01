# configure for enrichment analyses
# 24/02/01

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# DON'T TOUCH: CLEAN START ####
#
# clear the work space
rm(list=ls())
gc()
# set the initial time
T00 <- proc.time()
# ////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL BE PACKAGES UPDATED ####
#
# TRUE: old packages will be updated after installing the absent ones
# FALSE: only absent packages will be installed. No update of older ones

PKG_UPDATE = FALSE
# /////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%
# RESOLUTION FOR PLOTS ####
#
# You must specify the Dots Per Inch (DPI) for graphical
# output. Margin: 72-1200
#
# Example:
# DPI = 150

DPI = 150
# ///////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# GIVE A NAME TO YOUR PROJECT ####
#
# You should define a name to appear in the final report
#
# Example:
#   MY_TITLE = "My analysis on olive"

MY_TITLE = "Enrichment results for DEGs 'Koroneiki' control vs drought14d CPM = 0, FC = 1.2, P = 0.05"
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO THE DIRECTORY CONTAINING THE SOURCE FILES ####
#
# You should include here the path where the code can be found on your computer
#
# Example:
#   SOURCE_DIR = "~/usr/local/mycodingfiles/"
# A final "/" in path is compulsory

SOURCE_DIR = "~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/"
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# STUDY ORGANISM AND MODEL REFERENCE ####
# Para hacer enriquecimiento funcional, hay que pasar los IDs de los genes al de referencia
# original organism
ORG_ORIG <- "Picual"
# organism for enrichment
# You must choose between:
# 1: Arabidopsis thaliana
# 2: Zebrafish
# 3: Human
REFERENCE_ORG <- 1
## IMPORTANTE: CAMBIAR POR ORG_ENRICH ##
## IMPORTANTE: CARGAR org.At.tair.db EN EL SETUP ##


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO DATA-CONTAINING DIRECTORY ####
#
# You should include here the path where this file is on your computer
# This file should be side-by-side with the input data
# Output files and folders will be created there
#
# Example:
#   WD_DIR = "~/Documents/My_MA_data/this_experiment/"
# A final "/" in path is compulsory

WD_DIR = "~/datos_bullones/Bioinformatica/sequia_olivo_ana/data_26_1_23_both/new_analysis_06-11-23/RSeqFlow1.02_results_2024-01-11_12.52.04_koroneiki_cpm0_fc1.2_p0.05/"
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR GENE TABLE ####
#
# Files containing genes of interest must be in tsv format
# The file must be within the working directory (WD_DIR)
# REQUIRED: the first column must contain the gene IDs

FILE = "AllGenes_allContrast_TREAT-P-0.05_FC-1.2_2024-01-11_12.52.04.tsv"

# Choose your type of input file (EXPERIMENT)
# 1: output table from RSeqFlow (AllGenes_allContrast)
# 2: gene IDs and cluster group
# 3: gene IDs and log(foldchange)
# 4: only gene IDs

EXPERIMENT = 1

## IMPORTANTE : generar un nuevo Rmd para la carga. En cada chunck, acabar con un message para informar del tipo de carga que se ha utilizado
# ///////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR ORTHOLOGY TABLE ####
#
# Se debe especificar la ruta completa, incluso aunque esté en el WD

ORTHOLOGY_FILE = "~/datos_bullones/Bioinformatica/ortologia/picual-arabidopsis_new_ort/picual-tair10/results/best_hit_two-way_picual_tair10.tsv"
#
# define columns to read from each file
# The first column must be the study organism gene IDs
# The column to read with the reference organism

REFERENCE_COLUMN = 2

# Choose the ID source (TAIR, ENTREZID, SYMBOL, ENSEMBL, etc)

KEYTYPE = "TAIR"
# ///////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%
# TRANSCRIPTION FACTORS FOR STUDY ORGANISM ####
#
# You may want to mark the transcription factors from your reference organism. In this case, uncomment the TF_FILE line and add the absolute path to your file
#

TF_FILE <- "~/datos_bullones/Bioinformatica/RNA_Seq/muestras_picual_Juande/Olivo4Plants/Polen TR/Ath_TF_list.txt"
# ///////////////////////////////////////
## AL README: EL ARCHIVO DE TF SE DESCARGA DE
## http://planttfdb.gao-lab.org/


# other important genes file (e.g. hubs) ####
# comment next line if you don't want to check for other genes
# this file MUST have a header
# OTHER_FILE <- paste0(WD, "OutstandingGenes-2024-01-11_12.52.04.tsv")


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL BE THE REPORT INCLUDE CODE? ####
#
# TRUE: R code is shown
# FALSE: R code is hidden

SHOW_CODE = TRUE
# //////////////////////////////////////////


# remove duplicates genes or not (for example for DEGs)
DO_REMOVE_DUPS <- TRUE


# values for enrichment ####
P_CUTOFF <- 0.05 # valor de corte de p
Q_CUTOFF <- 0.2 # valor de corte de q
MIN_GSSIZE <- 10
MIN_GSSIZE_GSEA <- 10
MAX_GSSIZE <- 500
N_PERM <- 1000

# REVISAR SI SE PUEDE ELIMINAR
# values for Fisher test ####
P_FISHER <- 0.05


# values for treeplot ####
# number of clusters to plot
# if it's 0, it will be calculated
NCLUST <- 0


# minimun number of genes for over-enrichment and KEGG representation
MIN_GENES <- 5
ENRICH_FACTOR <- 100 # bigger value, more processes to show

# minimum score for GSEA representation
MIN_SCORE <- 0.4

# ratio to calculate minimum frequency for wordclouds representation
MIN_RATIO <- 3


# %%%%%%%%%%%%%%%%%%%%%%%%%%%
# END CONFIGURATION FILE ####
# %%%%%%%%%%%%%%%%%%%%%%%%%%%

# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# DO NOT TOUCH THE FOLLOWING
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%

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
                    # row.names = 1

ort <- read.table(file = ORTHOLOGY_FILE,
                  sep = "\t",
                  header = FALSE)
# no row.names because we have duplicated IDs
                  #row.names = 1

# give format to the data ####
# nos quedamos con las columnas Coef y Results de la variable genes.
keep <- 1 # gene ID column
keep <- append(keep, grep("^Results", colnames(genes)))
keep <- append(keep, grep("^Coef", colnames(genes)))
genes <- genes[, keep]

# definimos las comparaciones
# si hay un solo contraste, hay un problema por el nombre de las columnas
# debería solucionarse con el ifelse
if (length(genes) == 3) {
  allContrasts <- c("contrast")
} else {
  allContrasts <- colnames(genes)
  allContrasts <- allContrasts[-1] # remove gene ID column
  allContrasts <- gsub("Results.", "", allContrasts)
  allContrasts <- gsub("Coef.", "", allContrasts)
  allContrasts <- unique(allContrasts)
}

# creamos una lista vacía
genes_list <- list()

# r va a ser Results, que empieza en 2
r <- 2
# j va a ser Coef, que empieza en r + length(allContrasts)
j <- r+length(allContrasts)

# rellenamos la lista con los genes
for (i in r:(length(allContrasts)+1))
{
  # guardamos en una variable las columnas Results y Coef de i y j
  tmp <- genes[, c(1, i, j)] # keep column 1 for gene ID
  # eliminamos los 0 de Results
  tmp <- tmp[tmp[2]!=0, ]
  
  # los separamos en
  # genes up
  tmp_up <- tmp[tmp[2] == 1, ]
  # eliminamos segunda columna
  tmp_up[2] <- NULL
  # y genes down
  tmp_down <- tmp[tmp[2] == -1, ]
  # eliminamos segunda columna
  tmp_down[2] <- NULL
  
  # guardamos los genes separados en la lista
  name <- paste0(allContrasts[i-1], "_up")
  genes_list[[name]] <- tmp_up
  name <- paste0(allContrasts[i-1], "_down")
  genes_list[[name]] <- tmp_down
  
  # sumamos un 1 a j
  j <- j+1
}

# eliminamos variables innecesarias
rm(genes, tmp, tmp_down, tmp_up)

# load/install libraries ####
fileToSource <- paste0(SOURCE_DIR, "libraries.R")
source(fileToSource)

# path to Rmd ####
render(input = paste0(SOURCE_DIR, "enrichment.Rmd"),
       output_dir = SUB_DIR,
       output_file = " Enrichment_report.html",
       output_format = html_document(theme = "simplex",
                                     number_sections = FALSE,
                                     code_folding = "hide",
                                     toc = TRUE,
                                     toc_depth = 4,
                                     toc_float = TRUE,
                                     keep_md = TRUE),
       quiet = TRUE)
#shinyAppFile("/home/bullones/datos_bullones/Bioinformatica/Script/Script_R/enrichment_RSeqFlow/Rmd/30_Shiny_TF_plot.R")
# render(input = "/home/bullones/datos_bullones/Bioinformatica/Script/Script_R/enrichment_RSeqFlow/Rmd/shiny.R",
#        output_dir = SUB_DIR,
#        output_file = " TF_report.html",
#        runtime = "shinyrmd")
