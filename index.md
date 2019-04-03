# Jacinta Kong's GitHub page
PhD Candidate
School of BioSciences
The University of Melbourne
Parkville 3010
Australia
You can find my regular research site at https://jacintakongresearch.wordpress.com
Google Scholar: https://scholar.google.com.au/citations?user=EBtRPuwAAAAJ&hl=en&oi=ao

***

This site describes the structure of my GitHub and the code it houses.
On this site there is:

1. Code from my PhD on modelling the life cycle of matchstick grasshoppers

# My PhD
The framework of my PhD was to create a mechanistic model of species' development to use in modelling life cycles, phenology and distribution. I used the egg developmental traits of the matchstick grasshoppers (Orthoptera: Morabidae) in the genera *Warramaba* and *Vandiemenella*. This GitHub houses the code for my data pipeline from the raw physiological data on egg development to the final mechanistic model. The code primarily focuses on my work on *Warramaba* but the codes and the overall framework should be applicable to any ectotherm to which this analytical framework is suitable for.

# PhD repository structure
Currently the data pipeline for my PhD is organised in a multi-repository structure with each stage of the pipeline within its own repository. Each repository roughly corresponds with a publication but there is additional information which are not relevant to the corresponding publication but is relevant to the overall project. Hence each repository is not necessarily assigned a specific publication and DOI. Each repository for my PhD is labelled with "PhD" at the start.

## 1. PhD-raw-data
This repository contains the code to clean raw data from multiple experiments and generate clean .csv files. The raw data is not stored on GitHub. There were several experiments to characterise *Warramaba* egg development and some were repeated in different years. Each experiment is labelled with the year  and the experiment name which corresponds to the raw data. Each experiment has its own .rmd to conduct initial data exploration and to change variable names if legacy names were used. The "merging clean datasets.R" file merges the 2016 data into one .csv file.

The .csv files are called in as input in the subsequent repositories.

## 2. PhD-warramaba-traits
This repository analyses the cleaned dataset from PhD-1-raw-data. The statistical analyses are reported in publications. Egg development during desiccation and during dormancy at low temperature are calculated and stored as .rda files to be called in the mechanistic model of egg development in subsequent repositories. There is also code to simulate microclimates using NicheMapR.

## 3. PhD-warramaba-model
This is the main repository for the mechanistic model of egg development. It is modular and deals with general inputs. The primary dataset is egg development in sexually reproducing *Warramaba* characterised in 2016. Here, the parameters of the development model are estimated and development rate is validated against replicated datasets. The model is currently based on data frames and can be further optimised using functional programming approaches.

## 4. PhD-warramaba-virgo
This repository uses the mechanistic model in PhD-sexual-warramaba to simulate *Warramaba virgo* egg development. There are three types of coding using the same mechanistic modelling framework: single site modelling, raster, and cluster supercomputing.
