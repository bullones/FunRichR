# configure for enrichment analyses
# 24/02/09

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# DON'T TOUCH: CLEAN START ####
#
# clear the work space
rm(list=ls())
gc()
# set the initial time
T00 <- proc.time()
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL BE PACKAGES UPDATED ####
#
# TRUE: old packages will be updated after installing the absent ones
# FALSE: only absent packages will be installed. No update of older ones

PKG_UPDATE = FALSE
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%
# RESOLUTION FOR PLOTS ####
#
# You must specify the Dots Per Inch (DPI) for graphical
# output. Margin: 72-1200
#
# Example:
# DPI = 150

DPI = 150
# /////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# GIVE A NAME TO YOUR PROJECT ####
#
# You should define a name to appear in the final report
#
# Example:
#   MY_TITLE = "My analysis on olive"

MY_TITLE = "Enrichment results for DEGs 'Koroneiki' control vs drought14d CPM = 0, FC = 1.2, P = 0.05"
# ////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO THE DIRECTORY CONTAINING THE SOURCE FILES ####
#
# You should include here the path where the code can be found on your computer
#
# Example:
#   SOURCE_DIR = "~/usr/local/mycodingfiles/"
# A final "/" in path is compulsory

SOURCE_DIR = "~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/"
# ///////////////////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# STUDY ORGANISM AND MODEL REFERENCE ####
#
# It is mandatory to use the gene IDs of a model reference for enrichment analysis
#
# %%%%
# IS YOUR STUDY ORGANISM A MODEL REFERENCE
# %%%%
# TRUE: your study organism is on the list
# 1. Arabidopsis thaliana
# 2.Zebrafish
# 3. Human
# FALSE: your study organism in not on the list

MODEL_REFERENCE = FALSE

# If your study organism if not a model reference, uncomment the ORG_ORIG line and provide a name to identify your organism in the result tables that will be generated
#
# Example:
#   ORG_ORIG = "Olive"

ORG_ORIG = "Picual"

# %%%%
# CHOOSE YOUR MODEL REFERENCE FOR ENRICHMENT ANALYSIS
# %%%%
# You must choose between:
# 1: Arabidopsis thaliana
# 2: Zebrafish
# 3: Human
#
# Example:
#   REFERENCE_ORG = 1

REFERENCE_ORG = 1
# ///////////////////////////////////////


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


# %%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR GENE TABLE ####
#
# Define your genes of interest data table
# File must be in tsv format
# File must be within the working directory (WD_DIR)
# REQUIRED: the first column must contain the gene IDs
# Example:
#   FILE = "my_file.tsv"

FILE = "AllGenes_allContrast_TREAT-P-0.05_FC-1.2_2024-01-11_12.52.04.tsv"

# Choose your type of input file (EXPERIMENT)
# 1: output table from RSeqFlow (AllGenes_allContrast)
# 2: gene IDs and cluster group
# 3: gene IDs and log(foldchange)
# 4: only gene IDs
# Example:
#   EXPERIMENT = 1

EXPERIMENT = 1

# if your experiment is type 3, uncomment next lines
# second condition
FIRST_COND = "AI15"
SECOND_COND = "CC15"
# number of column with the Fold Change information
COLFC = 3

# if your experiment is type 3 and you want to perform GSEA analyses, you must provide a full datatable with all the expressed genes and their log(foldchange) values (FILE), and a DEG list for the over-enrichment analyses (DEG-OE). Uncomment next line
DEG_OE = "~/datos_bullones/Bioinformatica/depurar/DEGs.txt"

# /////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR ORTHOLOGY TABLE ####
#
# In case your study organism is not a model organism, uncomment ORTHOLOGY_FILE and provide the absolute path to your orthology file
# File must be in tsv format
# REQUIRED: the first column must be the study organism gene IDs
# Example:
#   ORTHOLOGY_FILE = "~/Documents/orthology.tsv"

ORTHOLOGY_FILE = "~/datos_bullones/Bioinformatica/ortologia/picual-arabidopsis_new_ort/picual-tair10/results/best_hit_two-way_picual_tair10.tsv"

# In case your study organism is not a model organism, uncomment REFERENCE_COLUMN and STUDY_COLUMN to specify the column to read with the reference and the study organisms
# Example:
#   REFERENCE_COLUMN = 2
#   STUDY_COLUMN = 1

REFERENCE_COLUMN = 2
STUDY_COLUMN = 1

# Choose the ID source (TAIR, ENTREZID, SYMBOL, ENSEMBL, etc)
# Example:
#   KEYTYPE = "TAIR"

KEYTYPE = "TAIR"
# ///////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# TRANSCRIPTION FACTORS FOR STUDY ORGANISM ####
#
# You may want to mark the transcription factors from your reference organism. In this case, uncomment TF_FILE and specify the absolute path to your file
# File must be in tsv format
# REQUIRED: your file must have the following structure:
# First column = TF ID
# Second column = Gene ID
# Third column = Family
# REQUIRED: your TF and Gene ID columns must be of the reference organism
# Example:
#   TF_FILE = "~/Documents/tf_file.tsv"

TF_FILE = "~/datos_bullones/Bioinformatica/RNA_Seq/muestras_picual_Juande/Olivo4Plants/TF/Ath_TF_list.txt"
# /////////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%
# OTHER IMPORTANT GENES ####
#
# You may want to mark other important genes, for example hubs, from your study organism. In this case, uncomment OTHER_FILE and specify the absolute path to your file containing those genes
# File must be in tsv format
# REQUIRED: your file must have the following structure:
# First column = Identification tag
# Second column = Gene ID
# REQUIRED: your Gene ID column must be of the study organism
# Example:
#   OTHER_FILE = "~/Documents/important_genes.tsv"

# OTHER_FILE = "~/datos_bullones/Bioinformatica/sequia_olivo_ana/data_26_1_23_both/new_analysis_06-11-23/RSeqFlow1.02_results_2024-01-11_12.52.04_koroneiki_cpm0_fc1.2_p0.05/OutstandingGenes-2024-01-11_12.52.04.tsv"
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL THE REPORT INCLUDE CODE? ####
#
# TRUE: R code is shown
# FALSE: R code is hidden
# Example:
#   SHOW_CODE = TRUE

SHOW_CODE = TRUE
# //////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL DUPLICATES GENE BE REMOVED? ####
#
# In case you are studying DEGs, you may want to remove genes that are overexpressed and repressed at the same time in the same treatment-control analysis
# TRUE: duplicate genes will be removed
# FALSE: duplicate genes will not be removed
# Example:
#   DO_REMOVE_DUPS = TRUE

DO_REMOVE_DUPS = TRUE
# /////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# P-VALUE ADJUSTMENT METHOD ####
#
# You must specify the P-value adjustment method. Available options are: "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none"
# Example:
#   P_ADJUST_METHOD = "none"

P_ADJUST_METHOD = "BH"
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%
# THRESHOLD FOR P-VALUE ####
#
# You must specify the adjusted P-value cutoff on enrichment tests to report as significant
# Example:
#   P_CUTOFF = 0.05

P_CUTOFF = 0.05
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%
# THRESHOLD FOR Q-VALUE ####
#
# You must specify the Q-value cutoff on enrichment tests to report as significant
# Example:
#   Q_CUTOFF = 0.2

Q_CUTOFF = 0.2
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%
# NUMBER OF GENE CLUSTERS ####
#
# You can specify the number of clusters for treeplots as an integer
# If you want that value to be automatically calculated, set it to 0
# Example:
#   NCLUST_USER = 4

NCLUST_USER = 0
# ////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# MAXIMUM PROCESSES TO PLOT ####
#
# You need to set the maximum number of processes to be plotted. Too large a value will cause problems when plotting the graphs. GSEA results will have up to twice as many processes as over-enrichment and KEGGs.
#
# Example:
#   MAX_PLOT = 100

MAX_PLOT = 100
# //////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%
# MAXIMUM TOP GOS ######
#
# In the enrichment with enrichGO, we calculate the number of genes involved in a GO term in our dataset (Counts) and the number of genes involved in that process in the organism of interest (Background). We calculate the Counts/Background ratio to determine the most represented GOs (Top GOs). You must specify the maximum number of Top GOs to plot as an expression heatmap.
# Example:
#   MAXTOPGOS <- 100

MAXTOPGOS <- 100
# //////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# FREQUENCY FOR WORDCLOUDS ####
#
# In order to set a limit on the number of words that will be plotted in the wordclouds according to their frequency of occurrence, you need to provide a MIN_RATIO to make those calculations. Bigger value implies more terms to plot.
#                 Max frequency
# Min frequency = -------------
#                   MIN_RATIO
# Example:
#   MIN_RATIO = 3

MIN_RATIO = 3
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%
# END CONFIGURATION FILE ####
# %%%%%%%%%%%%%%%%%%%%%%%%%%%

# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# DO NOT TOUCH THE FOLLOWING
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%

# load parsing file ####
parsingToSource <- paste0(SOURCE_DIR, "parsing.R")
source(parsingToSource)


# load/install libraries ####
librariesToSource <- paste0(SOURCE_DIR, "libraries.R")
source(librariesToSource)


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
