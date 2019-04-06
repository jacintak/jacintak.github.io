# Resources
A good model needs good input data!  
A pretty important component of modelling species responses to environmental variables are the environmental variables themselves. In fact, it's already half the data. Ideally, you would have climatic data at the scale of the target organism, which I will generally refer to as **microclimate**, but this is often a challenge to acquire. But if you have access to climate data, e.g. gridded weather stations which I will refer to as **macroclimate**, then there are some solutions for generating microclimate data.

Most experimental biologists will have access to plenty of data on organism traits but may not have the right environmental data for a model. The good news is with the increasing ease of generating and storing big data, data is now more accessible than ever before!

***

# Macroclimate
If you don't have access to gridded weather station data for your area of interest, there are some publicly available datasets online for various environmental variables at various scales and resolutions:

* [WorldClim](http://www.worldclim.org/)
* [CliMond](https://www.climond.org/) with CLIMEX and Bioclim datasets 
* [Climatic Research Unit](http://www.cru.uea.ac.uk/)

# Microclimate
There are currently a few publicly available datasets of pre-calculated microclimate grids:

* [microlim](https://www.nature.com/articles/sdata20146) for global scale
* [MicroclimOz](https://knb.ecoinformatics.org/knb/d1/mn/v2/object/knb.92484.39) for Australia only (the lucky country)

## Microclimate simulation packages for `R`
There are a few packages for `R` to simulate microclimates from gridded macroclimate data:

* [NicheMapR](https://github.com/mrke/nichemapr)
* [Microclima](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.13093)
* [TrenchR](https://trenchproject.github.io/tools/TrenchR/)

The one I used in my work is `NicheMapR`. The default function to generate microclimate in `NicheMapR` uses the Climatic Research Unit dataset to generate default microclimate output. I used input data at a higher spatial and temporal resolution than the default setting, in addition to querying gridded soil type data. Although the input data to run my scripts is not available, `NicheMapR` was used to generate the microclim and MicroclimOz datasets which are publicly available under certain soil type parameters. 

## Things to consider
Check if the environmental datasets are at the resolution and scale appropriate for your intended purposes. If you want to simulate microclimate, you need to make sure you have all the environmental variables needed for the microclimate package – temperature, precipitation, soil type, topography, wind speed, solar radiation etc. You may have to collate input data from multiple sources.

***

# Traits
There are even a few databases for organism trait data, some of these are only interested in thermal limits because that is what macrophysiology has been fixated on:

* The Insect Developmental Database ([IDD](https://nucleus.iaea.org/sites/naipc/twd/Lists/News/DispForm.aspx?ID=291&ContentTypeId=0x0100E051773707C04949A2F50750BBDBE134)) contains temperature-rate data for mostly insect species of agricultural interest 
* [GlobTherm](https://datadryad.org/resource/doi:10.5061/dryad.1cv08/7) is a great initiative but covers CtMax and CtMin only.
* A few recent metaanalyses have combed through the thermal biology literature so you don't have to! Then you can extract the information you want. Isn't open, reproducible science great? Here's a recent [example](https://datadryad.org/resource/doi:10.5061/dryad.56s5d84)

***

# R packages for modelling
In my PhD I wrote a custom function for my code to calculate development rate. But there is also a package for that!  
`devRate` is a package with commonly used temperature-rate functions, from statistical functions to biophysical ones. You can get it from [CRAN](https://cran.r-project.org/web/packages/devRate/index.html).

# International Symposium and Thematic School on DEB Theory for Metabolic Organisation
Interested in Dynamic Energy Budget modelling? There is an international symposium, tele-course and school/workshop that is an intensive course in DEB and its applications. The symposium is held every two years. The most recent one was [April 2019](https://deb2019.sciencesconf.org/).

***

With the resources available you can pretty much develop a mechanistic model without collecting your own data.  
If there are other useful datasets or links not listed here, let me know!
