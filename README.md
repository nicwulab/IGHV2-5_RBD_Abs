# IGHV2-5

## Dependencies ##
* [python3](https://www.python.org/downloads/)
* [Igblast](https://github.com/ncbi/igblast)
* [MAFFT](https://mafft.cbrc.jp/alignment/software/)
* [PyIR](https://github.com/crowelab/PyIR)
* [BioPython](https://github.com/biopython/biopython)
* [Pandas](https://pandas.pydata.org/)
* [Openpyxl](https://openpyxl.readthedocs.io/en/stable/)
* [ANARCI](https://github.com/oxpig/ANARCI)
* [Logomaker](https://logomaker.readthedocs.io/en/latest/)
* [R](https://www.r-project.org/)

## Dependencies Installation ##
Install dependencies by conda:

```
conda create -n Abs -c bioconda -c anaconda -c conda-forge \
  python=3.9 \
  biopython \
  pandas \
  openpyxl \
  logomaker \
  igblast \
  anarci \
  mafft 
```

## Calculate the frequency of different IGHV2-5 alleles

1. Download antibody repertoire data for healthy donors from [cAb-Rep](https://www.frontiersin.org/articles/10.3389/fimmu.2019.02365/full).

2. Calculate the frequency of different IGHV2-5 alleles in healthy donors
``python3 code/Cal_repertoire_freq.py``

## Plotting

1. Plot neutralization data collected from literature
``Rscript code/neut_heatmap.R``

2. Plot IGHV2-5 allele frequency
``Rscript code/plot_allele.R``
