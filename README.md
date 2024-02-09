# FunRichR

Explicación de lo que hace el script.

***

## Install

You will need a local copy of the GitHub _FunRichR_ repository on your machine. It can be done using git in the shell:

```bash
$ git clone git@github.com:bullones/FunRichR.git
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

## Aditional information

If you are executing FunRichR on a Windows or macOS system, please re-install _ggtree_ and _ggtreeExtra_ packages using BiocManager because their binaries were built with old _tidytree_.

```R
> BiocManager::install("ggtree", force=T, type = 'source')
> BiocManager::install("ggtreeExtra", force=T, type = 'source')
```

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
