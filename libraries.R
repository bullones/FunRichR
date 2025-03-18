#libraries -> FunRichR

# already installed packages ####
installed_libs <- rownames(installed.packages())

# %%%%%%%%%%%%%%
# FROM CRAN ####
# %%%%%%%%%%%%%%

## listing packages as vectors ####
writeLines("\n*** Checking CRAN libraries that must be installed ***")
from_CRAN <- c("ggplot2", "igraph", "tidyverse", "tidygraph", "dplyr", "data.table", "ggvenn", "rmarkdown", "knitr", "plotly", "venn", "tm", "wordcloud", "shiny", "factoextra", "cluster", "dynamicTreeCut", "devtools", "RColorBrewer", "pheatmap", "reshape2")

## obtain libraries that must be installed ####
new_libs_CRAN <- from_CRAN[!(from_CRAN %in% installed_libs)]

## install and/or update CRAN libraries
if (length(new_libs_CRAN)) {
  install.packages(new_libs_CRAN, dependencies = TRUE)
  writeLines(paste("Following", length(new_libs_CRAN), "CRAN libraries were installed at\n    ", R.home()))
  writeLines(new_libs_CRAN, sep = ", ")
} else if (PKG_UPDATE) {
  update.packages(ask = FALSE, checkBuilt = TRUE)
} else {
  message("Everything is updated")
}

# %%%%%%%%%%%%%%%%%%%
# FROM BIOCONDUCTOR #
# %%%%%%%%%%%%%%%%%%%

writeLines("\n*** Checking Bioconductor libraries that must be installed ***")

## install BiocManager before installing any BioConductor library ####
if (!("BiocManager" %in% installed_libs)) install.packages("BiocManager")

## BiocManager installation or update ####
if (PKG_UPDATE) {
  BiocManager::install(ask = FALSE)
}

# installed BioConductor version
VERSION_BIOC <- BiocManager::version()

## vector with required BioConductor packages ####
from_BioC <- c("ggtree", "edgeR", "clusterProfiler", "enrichplot", "DOSE", "pathview", organism)

## obtain libraries that must be installed ####
nuevos_BioC <- from_BioC[!(from_BioC %in% installed_libs)]

## install and/or update BioConductor libraries ####
if (length(nuevos_BioC)) {
  BiocManager::install(nuevos_BioC, ask = FALSE)
  writeLines(paste(sep = "", "installed ", length(nuevos_BioC), " BioConductor libraries ", VERSION_BIOC))
  writeLines(nuevos_BioC, sep = ", ")
} else {
  message(paste(sep="", "BioConductor ", VERSION_BIOC, " update not required"))
}

# load libraries ####
sapply(from_CRAN, require, character.only = TRUE)
sapply(from_BioC, require, character.only = TRUE)

# remove useless variables ####
rm(from_CRAN, new_libs_CRAN, installed_libs, from_BioC, nuevos_BioC)

message("All libraries installed and loaded\n")
