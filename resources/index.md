# Resources
A good model needs good input data!  
A pretty important component of modelling species responses to enviromental variables are the environmental variables themselves. Keeping with the example of climate, the climatic data for your mechanistic model is already half the input data required. Ideally you would have climatic data at the scale of the target organism, which I will generally refer to as **microclimate**, but this is often a challenge to acquire. But if you have access to climate data, e.g. gridded weather stations which I will refer to as **macroclimate**, then there are some solutions.

The good news is with the increasing ease of generating and storing big data, data is now more accessible than ever before!

***

# Macroclimate
If you don't have access to gridded weather station data, there are some publically available datasets online for various environmetal variables at various scales and resolutions:

* [WorldClim](http://www.worldclim.org/)
* [CliMond](https://www.climond.org/) with CLIMEX and Bioclim datasets 
* [Climatic Research Unit](http://www.cru.uea.ac.uk/)

# Microclimate
There are currently a few publically available datasets of pre-calculated microclimate grids:

* [microlim](https://www.nature.com/articles/sdata20146) for global scale
* [MicroclimOz](https://knb.ecoinformatics.org/knb/d1/mn/v2/object/knb.92484.39) for Australia only (the lucky country)

## Microclimate simulation packages for `R`
There are a few packages for `R` to simulate microclimates from gridded macroclimate data:

* [NicheMapR](https://github.com/mrke/nichemapr)
* [Microclima](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.13093)
* [TrenchR](https://trenchproject.github.io/tools/TrenchR/)

The one I used in my work is `NicheMapR`. By default `NicheMapR` has microclim data at a larger resolution which is derived from the Climatic Research Unit dataset. I used input data at a higher spatial and temporal resolution than the default setting, in addition to querying gridded soil type data. Although the input data to run my scripts is not available, `NicheMapR` was used to generate the microclim and MicroclimOz datasets which are publically available under certain soil type parameters. 

***

# Traits
There are even a few databases for organism trait data:

* The Insect Developmental Database ([IDD](https://nucleus.iaea.org/sites/naipc/twd/Lists/News/DispForm.aspx?ID=291&ContentTypeId=0x0100E051773707C04949A2F50750BBDBE134)) contains temperature-rate data for mostly insect species of agricultural interest 
* [GlobTherm](https://datadryad.org/resource/doi:10.5061/dryad.1cv08/7) is a great initiative but covers CtMax and Ctmin only.
* A few recent metaanalyses have combed through the thermal biology literature so you don't have to! Isn't open, reproducible science great? Here's a recent [example](https://datadryad.org/resource/doi:10.5061/dryad.56s5d84)

# R packages for modelling
In my PhD I wrote a custom function for my code to calculate development rate. But there is also a package for that!  
`devRate` is a package with commonly used temperature-rate functions, from statistical functions to biophysical ones. You can get it from [CRAN](https://cran.r-project.org/web/packages/devRate/index.html)

***

With the resources available you can pretty much develop a mechanistic model without collecting your own data.  
If there are other useful datasets or links not listed here, let me know!
