# parsing -> RSeqFlow
# 2024/02/09

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# FUNCTIONAL DATA FOR REFERENCE ORGANISM ####
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# construct a table with the options available for REFERENCE_ORG ####
# https://bioconductor.org/packages/release/BiocViews.html#___OrgDb
OrgDb_custom <- data.frame("number" = 1:3,
                           "org_name" = c("A.thaliana", "Zebrafish", "Human"),
                           "package" = c("org.At.tair.db", "org.Dr.eg.db", "org.Hs.eg.db"), # package needed for enrichment
                           "kegg" = c("ath", "dre", "hsa")) # tag needed for KEGG analysis
# study organism
if (exists("ORG_ORIG")) {
  ORG_ORIG <- paste0("ID_", ORG_ORIG)
} else ORG_ORIG <- paste0("ID_", OrgDb_custom$org_name[REFERENCE_ORG])
# organism for enrichment
ORG_ENRICH <- paste0("ID_", OrgDb_custom$org_name[REFERENCE_ORG])
organism <- OrgDb_custom$package[REFERENCE_ORG]
# más organismos disponibles en
# http://bioconductor.org/packages/release/BiocViews.html#___OrgDb
kegg_organism <- OrgDb_custom$kegg[REFERENCE_ORG]
# más organismos disponibles en
# https://www.genome.jp/kegg/catalog/org_list.html

rm(OrgDb_custom)

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
                  header = TRUE)
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


#shinyAppFile("~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/Rmd/30_Shiny_TF_plot.R")
# render(input = "~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/Rmd/shiny.R",
#        output_dir = SUB_DIR,
#        output_file = " TF_report.html",
#        runtime = "shinyrmd")