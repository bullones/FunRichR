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

#shinyAppFile("~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/Rmd/30_Shiny_TF_plot.R")
# render(input = "~/datos_bullones/Bioinformatica/Script/Script_R/FunRichR/Rmd/shiny.R",
#        output_dir = SUB_DIR,
#        output_file = " TF_report.html",
#        runtime = "shinyrmd")