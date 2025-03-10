# FunRichR



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

- `README.md`: this file
-

***

## Quick Start

***

## Configuration

***

## Input file

***

## TF file (optional)

You can download the TF file in <http://planttfdb.gao-lab.org/>.

***

## Output files

***

## Fixing bugs

If you are executing FunRichR on a Windows or macOS system, please re-install _ggtree_ and _ggtreeExtra_ packages using BiocManager because their binaries were built with old _tidytree_.

```R
> BiocManager::install("ggtree", force=T, type = 'source')
> BiocManager::install("ggtreeExtra", force=T, type = 'source')
```

The package _venn_ has some issues on version 1.12, as well as _igraph_ on version 2.0.1, and _tidygraph_ on version 1.3.1. You can check which version you have installed with:

```R
> packageVersion("package")
```

 If you experience some issues with those packages, please manually downgrade:

```R
> library(devtools)
> install_version("venn", version = "1.11", repos = "http://cran.r-project.org")
> install_version("igraph", version = "1.5.1", repos = "http://cran.r-project.org")
> install_version("tidygraph", version = "1.2.3", repos = "http://cran.r-project.org")
```

If you experience issues with another CRAN package, you can try to uninstall it:

```R
> remove.packages("package-to-remove")
```

and reinstall it either by launching _FunRichR_ again or by:

```R
>install.packages("package-to-install")
```

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
