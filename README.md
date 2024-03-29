[![DOI](https://zenodo.org/badge/492647805.svg)](https://zenodo.org/badge/latestdoi/492647805)

## Analysis of SARS-CoV-2 RBD antibodies encoded by IGHV2-5/IGLV2-14

### Dependencies
* [python3](https://www.python.org/downloads/)
* [Igblast](https://github.com/ncbi/igblast)
* [PyIR](https://github.com/crowelab/PyIR)
* [BioPython](https://github.com/biopython/biopython)
* [Pandas](https://pandas.pydata.org/)
* [Openpyxl](https://openpyxl.readthedocs.io/en/stable/)
* [R](https://www.r-project.org/)

### Dependencies Installation
Install dependencies by conda:

```
conda create -n Abs -c bioconda -c anaconda -c conda-forge \
  python=3.9 \
  biopython \
  pandas \
  openpyxl \
  igblast
```

### Input files
* [./data/neut.tsv](./data/neut.tsv): pseudovirus neutralization data (IC50) from literature
* [./data/cAb_donor_info.xlsx](./data/cAb_donor_info.xlsx): meta-information about antibody repertoire data for healthy donors
* [./data/HV_2-5_freq.tsv](./data/HV_2-5_freq.tsv): summary ofIGHV2-5 allele frequency in RBD antibodies and in antibody repertoire data 

### Calculate the frequency of different IGHV2-5 alleles

1. Download antibody repertoire data for healthy donors from [cAb-Rep](https://www.frontiersin.org/articles/10.3389/fimmu.2019.02365/full)

2. Calculate the frequency of different IGHV2-5 alleles in healthy donors   
``python3 code/Cal_repertoire_freq.py``

### Plotting

1. Plot neutralization data of IGHV2-5/IGLV2-14-encoded RBD antibodies that are collected from literature   
``Rscript code/neut_heatmap.R``

2. Plot IGHV2-5 allele frequency in IGHV2-5/IGLV2-14-encoded RBD antibodies and in antibody repertoire data
``Rscript code/plot_allele.R``

### ddG calculation

See README file in ``rosetta_simulation``
