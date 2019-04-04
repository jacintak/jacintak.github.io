# Contents
* [A basic model structure](#model-structure)
* [But what about species distributions?](#species-dist)
* [My mechanistic model](#my-mod)
* [My repository structure](#my-repo)
* [About the repositories](#about)

***

# A basic model structure {#model-structure}
The mechanistic model I'm describing is what I call a **basic** model. Meaning it documents a one-dimensional relationship between a single trait of an organism and a single characteristic of the environment for a single life stage. 

At its most fundamental, a mechanistic modelling framework consists of three components:

1. Input data
2. The development model itself
3. Model output

Let's break this down.

## Input data
This is the most important part of the model, in my opinion. There are two datasets to consider as input:

* The traits of an organism - in this example, development rate as a function of time
  * You can use any trait of interest, e.g. growth rate as a function of mass over time, but this may affect the choice of the model.
  * I generated my trait data from my laboratory experiments
* The environmental variables - in this example, soil temperature at 3 cm soil depth
  * Ideally you would use environmental variables at a scale and resolution appropriate to the question (microclimate)
  * I used the microclimate modelling package [NicheMapR](https://github.com/mrke/nichemapr) to generate microclimate data for my work, which I won't go into detail here
  * See the [Resources](https://jacintak.github.io/resources) page for some potentially helpful links
  
## The development model
There are many types of mechanistic models to use but they all have one thing in common - they are grounded in first principles. Their function is to quantify the relationship between the traits of the organism and the environment. There are more comprehensive mechanistic modelling approaches, such as characterising the thermodynamic niche of an organism or metabolic theory like Dynamic Energy Budget models. But we won't talk about those.

There are even several thermodynamically-grounded models one could use for a basic model that have been continuously developed and modified over the years. These have been recently been reviewed in the literature so I won't go into them here. The model I am using is based on the Sharpe-Schoolfield model (1981). Originally proposed by Sharpe and DeMichele in 1977, the model has been further modified by Schoolfield and colleagues in 1981 and as recently as 2005 by Ikemoto. Regardless of which model is used, one should be aware of the underlying assumptions and principles.

> as a side note, the models that entomologists and herpetologists use have a common history but the uptake and use of these models differs between these taxonomic groups. Marine biologists seem to be interested in a different aspect, i.e. growth and assimilation of mass, which have different patterns. 

### Incorporating adaptive responses
An important part of modelling life cycles, especially for insects, is to include their adaptive developmental responses to the environment. Insect development is not independent of their environment, they have dormancy responses that can have major consequences for the developmental trajectory through time. Modelling diapause responses is an ongoing and active body of work. Entomologists haven't gotten there yet but examples have been published recently.

### So how does the model work?

1. The development model is parameterised for the developmental traits of the target organism. For example, I was looking at variation within and among species so I had different model parameters for different species and the geographical regions they are found in. The units of development rate are % per hour.
2. The model works in time steps from the start (oviposition) and end (hatching) of development. For each unit of time (hour in this example), development rate at the is calculated based on the soil temperature at that time. Any adaptive responses that modify the calculated development rate, like dormancy, are applied at this step.
3. Development rate at each time step is cumulatively added until development has reached 100 %. The time at which this occurs is recorded.

In addition to the assumptions of the developmental model used to calculate development rate, this modelling approach has several assumptions to consider. Here are some examples:

* Development rate is a average response for a defined group of organisms for a given temperature and over time. It thus does not explicitly account for non-linear development over time
* Other environmental parameters are not considered. For example, moisture availability is crucial for the development of most insect eggs.
* Progression of development is additive (cumulative)

## Model output
: The model output depends on the research question.

There are three types of mechanistic modelling output I attempted in my own work:

1. Single site output
 * These are models that are run for a single location at a time. They can be run for any number of sites. This was the main type of modelling I used.
2. Raster based output
  * These are based on using rasters to store data, often for environmental data. The development function is applied to each cell in the raster to generate rasters of development rate.
3. Supercomputing
  * Using a supercomputer to do parallel processing becomes essential for larger scale modelling because mechanistic models become computationally intensive pretty quickly. It also is cool.
  
Examples of all three modelling outputs are found in my repositories.

***

# But what about species distributions? {#species-dist}
This is apparently a common misconception about mechanistic models for people trying it out themselves. They build a model but realise it's for a single site or time point. Really a mechanistic species distribution model requies a spatial component. This can be achieved either by using rasters or by repeatedly computing single sites across spatial grids, maybe using a supercomputer. 

## Extending mechanistic models
A beauty of mechanistic modelling is its modularity.

* It can be applied to many traits, organisms or environments
* You can use it for sensitivity analyses or investigating different scenarios
* It can also be linked across life stages to model whole life cycles or other models, like demographic population models
* It can integrate behavioural and physiological responses.

***

# My mechanistic model {#my-mod}
In most cases, single stage models won't be sufficient to capture all the processes important to an organisms' life cycle because ectotherms have complex life cycles and ecology is complex. But in simple cases or under certain scenarios that generate a bottleneck in the life cycle, a single stage model may effectively describe what is going on. 

***

# My repository structure {#my-repo}
The overall data pipeline should follow the three steps described above.

My PhD pipeline is organised as a multi-repository data pipeline in the following structure:

1. Handling raw data
  * This is for cleaning my trait data
2. Analysing my trait data
3. The mechanistic model for single site modelling of species phenology. Including the code 
4. The mechanistic model for single site modelling, raster modelling and supercomputer modelling of species distribution

## Single or multi repos?
Multi-repository structures have their disadvantages but were suitable for me. Each repository corresponds to a stage in my data pipeline . Because the mechanistic model was not the only component of my PhD research, there are data and analyses which were not relevant to the end model and which I wanted to separate from the modelling component. A single repository might be more efficient if the model is the main component of the model. 

## About the repositories {#about}
Repositories 1 and 2 are for processing my experimental data on the thermal response of egg development into a format for the model (Input data).  
Repositories 3 and 4 contain the model themselves. The outputs of repositories 1 and 2 are called in as input for the relevant model.  
You can check the documentation within each repository for details. A breif description is provided below.

### 1. PhD-raw-data
This repository contains the code to clean raw data from multiple experiments and generate clean .csv files. The raw data is not stored on GitHub. There were several experiments to characterise *Warramaba* egg development and some were repeated in different years. Each experiment is labelled with the year  and the experiment name which corresponds to the raw data. Each experiment has its own .rmd to conduct initial data exploration and to change variable names if legacy names were used. The "merging clean datasets.R" file merges the 2016 data into one .csv file.

The .csv files are called in as input in the subsequent repositories.

### 2. PhD-warramaba-traits
This repository analyses the cleaned dataset from PhD-1-raw-data. The statistical analyses are reported in publications. Egg development during desiccation and during dormancy at low temperature are calculated and stored as .rda files to be called in the mechanistic model of egg development in subsequent repositories. There is also code to simulate microclimates using `NicheMapR`.

### 3. PhD-warramaba-model
This is the main repository for the mechanistic model of egg development. It is modular and deals with general inputs. The primary dataset is egg development in sexually reproducing *Warramaba* characterised in 2016. Here, the parameters of the development model are estimated and development rate is validated against replicated datasets. The model is currently based on data frames and can be further optimised using functional programming approaches.

### 4. PhD-warramaba-virgo
This repository uses the mechanistic model in PhD-sexual-warramaba to simulate *Warramaba virgo* egg development. There are three types of coding using the same mechanistic modelling framework: single site modelling, raster, and cluster supercomputing.

***

# Literature cited
Ikemoto, T. (2005) Intrinsic optimum temperature for development of insects and mites. Environmental Entomology, 34, 1377-1387.  
Schoolfield, R.M., Sharpe, P.J. & Magnuson, C.E. (1981) Non-linear regression of biological temperature-dependent rate models based on absolute reaction-rate theory. Journal of Theoretical Biology, 88, 719-731.  
Sharpe, P.J. & DeMichele, D.W. (1977) Reaction kinetics of poikilotherm development. Journal of Theoretical Biology, 64, 649-670.
