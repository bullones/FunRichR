# FunRichR

A comprehensive R markdown pipeline based on [clusterProfiler](https://doi.org/10.1016/j.xinn.2024.100722) package for functional enrichment analysis. It can be used for model and non-model organisms.

***

## Install

You will need a local copy of the GitHub _FunRichR_ repository on your machine. It can be done using git in the shell:

```bash
git clone git@github.com:bullones/FunRichR.git
```

Alternatively, you can go to <https://github.com/bullones/FunRichR/> and click on _Code_ button and then _Clone_, or select _Download ZIP_ or any other possibility you prefer. The cloned of unzipped directory `FunRichR` should be placed somewhere on your `$HOME` in Linux, macOS and Windows.

Then you can navigate inside _FunRichR_ using shell comands or window interface.

***

## Components

The GitHub repository and your local version will contain the following files and folders:

- `LICENSE`: details about the CC-BY license.
- `README.md`: this file.
- `configure.R`: a file containing all parameters necessary to execute _FunRichR_. This file can be located anywhere in your computer and is the only file that requires user intervention.
- `enrichment.Rmd`: a markdown file where other Rmd fragments are incorporated.
- `libraries.R`: a file that loads, installs and updates the required libraries.
- `parsing.R`: a file that constructs a table with the necessary information for the reference organisms.
- `Rmd`: a folder containing the Rmd fragments needed for the pipeline.

***

## Prerequisites and dependencies

Minimum **RAM** required (depending on dataset size): 16 GB. Recommended RAM: 32 GB+

_FunRichR_ has been developed with **R 4.5.2** on mac and linux computers. Older R releases my fail due to library obsolescence.

**R packages/libraries** required are listed in `libraries.R`. Do not worry for that since on the first _FunRichR_ run, it will check which libraries are not installed and will install them automatically. It may take for a very long time (up to 30 min, depending on the number of packages to be installed).

You should have some beginner experience with **bash** (Unix Shell) and R to execute this pipeline and transfer datasets to and from directories or computers.

***

## Quick Start

_FunRichR_ can be launched using R console or RStudio in macOS, linux or Windows as

```r
source("~/PATH_TO/configure.R")
```

or using the terminal as

```bash
Rscript ~/PATH_TO/configure.R 
```

If you try this just after downloading _FunRichR_, it will not work because you have to accommodate it to your computer environment. So, read carefully the next section before launching _FunRichR_ for the first time.

***

## Configuration

_FunRichR_ can be customised to your needs in the 'self-explained' `configure.R` file. Open this file and you will see an initial segment entitled `DON'T TOUCH: CLEAN START` marking the three commands that you must not modify. They will clean memory variables before a _FunRichR_ run.

After that, you will find all customisable parameters with a detailed explanation and exemplary values. In the following list, 

- **Compulsory** tag indicates that you have to customise the parameter to run _FunRichR_ for the first time or to read a specific experiment data.
- **Recommended** parameters will facilitate your analysis, but are not necessary to run _FunRichR_ in your computer.
- *Optional* parameters do not require customisation unless you detect a problem with your data. For example, you can have copies of the configure file with different set of optional parameters to compare the results.

Parameters customisable in the `configure.R`:

- `PKG_UPDATE`: `TRUE` if you want to update R packages before running _FunRichR_, or `FALSE`if you only want to install new packages. *Optional*
- `DPI`: resolution for plots. *Optional*
- `MY_TITLE`: the project name to easily identify your work. **Recommended**
- `SOURCE_DIR`: the path to the directory of _FunRichR_. **Compulsory**
- `MODEL_REFERENCE`: if your organism is one of the model references listed in the table. **Compulsory**
    + When you set `MODEL_REFERENCE` = FALSE, you have to uncomment
        - `ORG_ORIG`: provide a name to identify your organism. **Compulsory**
- `REFERENCE_ORG`: choose between a list of model references for your enrichment analysis. **Compulsory**
- `WD_DIR`: the path to the directory containing your data. **Compulsory**
- `FILE`: data table with the genes of interest. **Compulsory**
    + `EXPERIMENT`: choose an input file type from the list provided. *Compulsory*
        - When you set `EXPERIMENT` = 3, you have to uncomment
            + `FIRST_COND`: set a name for the first condition. **Compulsory**
            + `SECOND_COND`: set a name for the second condition. **Compulsory**
            + `COLFC`: define number of column with the Fold Change information. **Compulsory**
- When you set `MODEL_REFERENCE` = FALSE, you have to uncomment
    + `ORTHOLOGY_FILE`: provide the absolute path to your orthology file. **Compulsory**
    + `REFERENCE_COLUMN`: column to read from `ORTHOLOGY_FILE` with the model reference. **Compulsory**
    + `STUDY_COLUMN`: column to read from `ORTHOLOGY_FILE` with the study organism. **Compulsory**
- `KEYTYPE`: define the format of your input genes. **Compulsory**
- If you want to mark the transcription factors from your model reference, you have to uncomment
    + `TF_FILE`: provide the absolute path to your transcription factors file. *Optional*
- If you want to mark other important genes from your study organism, you have to uncomment
    + `OTHER_FILE`: provide the absolute path to your file with genes of interest. *Optional*
- `SHOW_CODE`: `TRUE` if you want the complete report showing code chunks, or `FALSE` if you want to hide (fold) code chunks. *Optional*
- `DO_REMOVE_DUPS`: `TRUE` if you want genes that are duplicated in both sides of your comparison, or `FALSE` if you want to keep them. *Optional*
- `P_ADJUST_METHOD`: statistical method used to adjust _P_-values. *Optional*
- `P_CUTOFF`: minimal _P_-value for significance in any statistical analysis. *Optional*
- `Q_CUTOFF`: minimal _Q_-value for significance in any statistical analysis. *Optional*
- `NCLUST_USER`: indicate the number of clusters that you want to obtain for treeplots. *Optional*
- `MIN_GENES`: minimum number of genes for a process to be plotted. *Optional*
- `SIGNODES`: significant number of enriched GOs to be plotted for hierarchical trees. *Optional*
- `MIN_GSSIZE_USER`: minimum number of genes that a GO term must have to be considered in the analysis. *Optional*
- `MAX_GSSIZE_USER`: maximum number of genes that a GO term must have to be considered in the analysis. *Optional*
- `DO_REMOVE_REDUNDANCY`: `TRUE` if you want to remove redundancy of enriched GO terms, or `FALSE` if you want to keep it. *Optional*
- `GO_LEVEL`: GO level to filter the enrichment results by. *Optional*
- `MAX_PLOT`: maximum number of processes to be plotted. *Optional*
- `MAXTOPGOS`: maximum number of Top GOs to be plotted as an expression heatmap. *Optional*
- `MIN_RATIO`: ratio to calculate the limit of the number of words that will be plotted in the wordclouds. *Optional*

As a result of this `configure.R` file customisation, you can have as many copies of this file as you want (with the name you prefer) for different data or different parameters. These copies can be located wherever you want in your computer. 

***

## Input file

***

## TF file (optional)

You can download the TF file in <http://planttfdb.gao-lab.org/>.

***

## Output files

***

### Possible compilation errors in Ubuntu

If you are using an Ubuntu system, it is highly recomendable that you execute:

```bash
$ sudo apt-get install libblas-dev liblapack-dev libarpack2-dev gfortran libnlopt-dev libxml2-dev libpoppler-cpp-dev cmake libzmq3-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev build-essential libcurl4-openssl-dev libxml2-dev libssl-dev libfontconfig1-dev libgmp-dev
```

in order to install possible missing tools that Ubuntu requires to compile R sucessfully.


***

## Release History

Version | Date      | Comments
:---    | :---      | :---

***

## Citation

Please, reference this pipeline and its documentation as follows:

***

## License

![](https://licensebuttons.net/l/by/3.0/88x31.png)
[CC-BY](https://creativecommons.org/licenses/by/4.0/)

**Authors**: Amanda Bullones and M. Gonzalo Claros

Any concern, suggestion, bug or whatelse can be addressed to [Amanda Bullones](mailto:amandabullones@uma.es)
