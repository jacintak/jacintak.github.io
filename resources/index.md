# Resources
A pretty important component of modelling species responses to enviromental variables are the environmental variables themselves. Keeping with the example of climate, the climatic data for your mechanistic model is already half the input data required. Ideally you would have climatic data at the scale of the target organism, which I will generally refer to as **microclimate**, but this is often a challenge to acquire. But if you have access to climate data, e.g. gridded weather stations which I will refer to as **macroclimate**, then there are some solutions.

# Macroclimate
If you don't have access to gridded weather station data, there are some publically available datasets online at various scales and resolutions.

1. 

# Microclimate
If you have access to macroclimate data but want to use microclimate data, there are currently a few publically available packages for `R` to simulate microclimates using gridded macroclimate data. 

If you live in Australia, the lucky country, there are pre-calculated microclimate grids called [MicroclimOz](https://knb.ecoinformatics.org/knb/d1/mn/v2/object/knb.92484.39)[^1].

[^1]Kearney, M. R. (2019), MicroclimOz – A microclimate data set for Australia, with example applications. Austral Ecology. [doi:10.1111/aec.12689](https://doi:10.1111/aec.12689)
