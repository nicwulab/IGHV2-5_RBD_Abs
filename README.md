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
