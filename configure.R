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
#
# Example:
#   PKG_UPDATE = FALSE

PKG_UPDATE = FALSE
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%
# RESOLUTION FOR PLOTS ####
#
# You must specify the Dots Per Inch (DPI) for graphical
# output. Margin: 72-1200
#
# Example:
#   DPI = 150

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
# 2. Zebrafish
# 3. Human
# FALSE: your study organism in not on the list
#
# Example:
#   MODEL_REFERENCE = FALSE

MODEL_REFERENCE = FALSE

# If your study organism if not a model reference, uncomment the ORG_ORIG line and provide a name to identify your organism in the result tables that will be generated
# In the other case, comment the ORG_ORIG line
#
# Example:
#   ORG_ORIG = "Olive"

ORG_ORIG = "Olive"
# ///////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# CHOOSE YOUR MODEL REFERENCE FOR ENRICHMENT ANALYSIS
# Regardless of whether your organism is a model reference or not, you must choose between:
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

WD_DIR = "~/datos_bullones/Bioinformatica/data/"
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR GENE TABLE ####
#
# Define your genes of interest data table
# File must be in tsv format
# File must be within the working directory (WD_DIR)
# REQUIRED: the first column must contain the gene IDs
#
# Example:
#   FILE = "my_file.tsv"

FILE = "AllGenes_allContrast_TREAT-P-0.05_FC-1.2_2024-01-11_12.52.04.tsv"

# Choose your type of input file (EXPERIMENT)
# 1: output table from RSeqFlow (AllGenes_allContrast)
# 2: gene IDs and cluster group
# 3: gene IDs and log(foldchange)
# 4: only gene IDs
#
# Example:
#   EXPERIMENT = 1

EXPERIMENT = 1

# If you set EXPERIMENT = 3, uncomment the FIRST_COND, SECOND_COND, and COLFC lines
# In the other case, comment FIRST_COND, SECOND_COND, and COLFC lines
#
# Set a name for the first condition
#
# Example:
#   FIRST_COND = "AI15"

# FIRST_COND = "AI15"

# Set a name for the second condition
#
# Example:
#   SECOND_COND = "CC15"

# SECOND_COND = "CC15"

# Define number of column with the Fold Change information
#
# Example:
#   COLFC = 3

# COLFC = 3

# If your experiment is type 3 and you want to perform GSEA analyses, you must provide a full datatable with all the expressed genes and their log(foldchange) values (FILE), and a DEG list for the over-enrichment analyses (DEG-OE). Uncomment next line
# DEG_OE = "~/datos_bullones/Bioinformatica/depurar/DEGs.txt"
# /////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# LOAD YOUR ORTHOLOGY TABLE ####
#
# In case your study organism is not a model organism, uncomment ORTHOLOGY_FILE, REFERENCE_COLUMN, and STUDY_COLUMN lines
# In the other case, comment ORTHOLOGY_FILE, REFERENCE_COLUMN, and STUDY_COLUMN lines
#
# Absolute path to your orthology file
# File must be in tsv format
# REQUIRED: the file MUST have a header
#
# Example:
#   ORTHOLOGY_FILE = "~/Documents/orthology.tsv"

ORTHOLOGY_FILE = "~/datos_bullones/Bioinformatica/ortologia/best_hit_two-way_picual_tair10.tsv"

# Specify the column to read from ORTHOLOGY_FILE with the model reference
#
# Example:
#   REFERENCE_COLUMN = 2

REFERENCE_COLUMN = 2

# Specify the column to read from ORTHOLOGY_FILE with the study organism
#   STUDY_COLUMN = 1

STUDY_COLUMN = 1
# //////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%
# GENE IDENTIFIER FORMAT ####
#

# Choose the format of your input genes (TAIR, ENTREZID, SYMBOL, ENSEMBL, etc) for clusterProfiler to properly identify them
# Use library(org.At.tair.db) and keytypes(org.At.tair.db), or your specific OrdDb (https://bioconductor.org/packages/release/BiocViews.html#___OrgDb) to list all supported options
#
# Example:
#   KEYTYPE = "TAIR"

KEYTYPE = "TAIR"
# ///////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# TRANSCRIPTION FACTORS FOR STUDY ORGANISM ####
#
# You may want to mark the transcription factors from your model reference. In this case, uncomment TF_FILE and specify the absolute path to your file
# File must be in tsv format
# REQUIRED: your file must have the following structure:
# First column = TF ID
# Second column = Gene ID
# Third column = Family
# REQUIRED: your TF and Gene ID columns must be of the model reference
#
# Example:
#   TF_FILE = "~/Documents/tf_file.tsv"

TF_FILE = "~/datos_bullones/Bioinformatica/TF/Ath_TF_list.txt"
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
#
# Example:
#   OTHER_FILE = "~/Documents/important_genes.tsv"

OTHER_FILE = "~/datos_bullones/Bioinformatica/OutstandingGenes-2024-01-11_12.52.04.tsv"
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL THE REPORT INCLUDE CODE? ####
#
# TRUE: R code is shown
# FALSE: R code is hidden
#
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
#
# Example:
#   DO_REMOVE_DUPS = TRUE

DO_REMOVE_DUPS = TRUE
# /////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# P-VALUE ADJUSTMENT METHOD ####
#
# You must select the statistical method used to adjust P-values,. Available options are: "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none"
#
# Example:
#   P_ADJUST_METHOD = "BH"

P_ADJUST_METHOD = "BH"
# //////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%
# THRESHOLD FOR P-VALUE ####
#
# You must specify the adjusted P-value cutoff on enrichment tests to report as significant
#
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
# 
# Example:
#   NCLUST_USER = 0

NCLUST_USER = 0
# ////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# MINIMUM NUMBER OF GENES TO PLOT ####
#
# You need to set the minimum number of genes for a process to be plotted
# You can set it to 0 if you want to plot the process regardless the number or genes
# This parameter will only be applied to over-enrichment analyses
#
# Example:
#   MIN_GENES = 0

MIN_GENES = 5
# ////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# SIGNIFICANT NODES TO PLOT ####
#
# For the hierarchical trees you can set the significant number of enriched GOs to be plotted. You can set it to 0 if you want it to be automatically calculated.
#
# Example:
#   SIGNODES = 0

SIGNODES = 0
# //////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# SIZE OF GENES FOR CLUSTERPROFILER ####
#
# You can set the minimal and maximal size of genes annotated for clusterProfiler analyses (over-enrichment, KEGG and GSEA).
# MINGSSIZE defines the minimum number of genes that a GO term must have to be considered in the analysis, discarding terms that are below. This avoids GO terms with too few genes, which may not be statistically significant or too specific
# MAXGSSIZE defines the maximum number of genes that a GO term must have to be considered in the analysis, discarding terms that are above. This filters overly general GO terms (which include many genes)
# If you set them to 0, they will be automatically calculated.
#
# Example:
#   MIN_GSSIZE_USER = 0
#   MAX_GSSIZE_USER = 0

MIN_GSSIZE_USER = 0
MAX_GSSIZE_USER = 0
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL REDUNDANCY OF GO TERMS BE REMOVED? ####
#
# You may want to remove redundancy of enriched GO terms.
# TRUE: redundancy will be removed
# FALSE: redundancy will not be removed
# 
# Example:
#   DO_REMOVE_REDUNDANCY = TRUE

DO_REMOVE_REDUNDANCY = TRUE
# ////////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL GO TERMS BE FILTERED? ####
#
# You may want to filter GO enriched results at specific GO level. That way you remove GO parent terms, which are more general terms within the GO hierarchy that group together more specific terms (children terms)
# Set the GO level you want to filter the enrichment by. Higher values will be closer to the children terms
# Values between 1 and 7
# If you set it to 0, no filter will be applied
#
# Example:
#   GO_LEVEL = 4

GO_LEVEL = 0
# ///////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# MAXIMUM PROCESSES TO PLOT ####
#
# You need to set the maximum number of processes to be plotted. Too large a value will cause problems when plotting the graphs. GSEA results will have up to twice as many processes as over-enrichment and KEGGs
#
# Example:
#   MAX_PLOT = 100

MAX_PLOT = 100
# //////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%
# MAXIMUM TOP GOS ######
#
# In the enrichment with enrichGO, we calculate the number of genes involved in a GO term in our dataset (Counts) and the number of genes involved in that process in the organism of interest (Background). We calculate the Counts/Background ratio to determine the most represented GOs (Top GOs). You must specify the maximum number of Top GOs to be plotted as an expression heatmap
#
# Example:
#   MAXTOPGOS = 100

MAXTOPGOS = 100
# //////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# FREQUENCY FOR WORDCLOUDS ####
#
# In order to set a limit of the number of words that will be plotted in the wordclouds according to their frequency of occurrence, you need to provide a MIN_RATIO to make those calculations. Bigger value implies more terms to be plotted
#                 Max frequency
# Min frequency = -------------
#                   MIN_RATIO
#
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
