# Generalised linear models



***

## Overall lecture aims

* Identify the structure of general linear models
* Describe how linear models are parametrized
* Understand how to use linear models
* Understand how to interpret and evaluate linear models

### By the end of this lecture you should:
 
* Conduct and interpret a generalised linear model in R

***

## Some data are never normal

* Non-linear data - e.g. exponential growth of bacteria, human populations
* Counts or proportions, number of cells in petri dish, proportion of animals that survive
* Categorical data

Simple linear regressions aren't the most appropriate for these data and may give distorted results.  
*But* we can use linear regression to analyse these data if we relax our assumptions a bit...called "general linear models"

> *General linear models*, or just linear models (LM), refer to linear regression of data following a normal probability distribution, fixed or random. If we do a linear regression on based on a non-normal probability distribution that's called a _general**ised** linear model_ (usually abbreviated to GLM).  

There are many types but we will briefly describe two common probability distributions:  

* Binomial regression - for binomial data following a binomial distribution
    * yes/no
    * alive/dead
* Poisson regression - for count or contingency table data following a Poisson distribution

In `R` GLMs are done using `glm(Y ~ X, data, family = <insert here>)`. `family` refers to the underlying probability distribution. Using `family = gaussian` is the same as `lm()` for a normal distribution. So:

* `poisson` for a Poisson distribution
* `binomial` for a binomial distribution

But the model outputs are interpreted differently to normal distributions because they *link* the relationship between the predictor and the response differently.

***

## Poisson regression

* Uses a log linear link function where the response variable (counts) is on a log scale
* Interpretation is similar to lm with estimates for the intercept, slopes and differences in estimates among groups
    * Estimates are the **log of the expected count** as a function of the predictor variables
    * Cannot have negative or 0 values because log(0) does not work - must deal with them. How?
* Test overall effects of predictors by comparing models with different predictors representing null and alternative hypotheses
* See later lectures about Chi-Squared tests ($\chi^2$).

### Number of Oystercatchers (wetland birds) in South Africa
Data is `waders` from `MASS`. I have maniuplated the data so it is suitable for analysis - code below.


```r
# create data set of oystercatcher counts (column 1) and site labels
waders <- data.frame(Oystercatcher = MASS::waders[,1],
                     site = letters[1:15])
# poisson regression
summary(glm(Oystercatcher + 1 ~ site, waders, family = poisson))
```

```

Call:
glm(formula = Oystercatcher + 1 ~ site, family = poisson, data = waders)

Deviance Residuals: 
 [1]  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)   2.5649     0.2774   9.248  < 2e-16 ***
siteb         2.0402     0.2948   6.920 4.51e-12 ***
sitec         2.7233     0.2863   9.512  < 2e-16 ***
sited        -2.5649     1.0377  -2.472   0.0134 *  
sitee         1.7918     0.2996   5.981 2.22e-09 ***
sitef         0.4308     0.3563   1.209   0.2266    
siteg         4.3665     0.2791  15.645  < 2e-16 ***
siteh         1.9124     0.2971   6.436 1.23e-10 ***
sitei         4.1058     0.2796  14.683  < 2e-16 ***
sitej         1.8539     0.2983   6.215 5.12e-10 ***
sitek         3.5984     0.2811  12.800  < 2e-16 ***
sitel         1.7918     0.2996   5.981 2.22e-09 ***
sitem         0.5705     0.3470   1.644   0.1001    
siten        -2.5649     1.0377  -2.472   0.0134 *  
siteo        -2.5649     1.0377  -2.472   0.0134 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for poisson family taken to be 1)

    Null deviance: 5.3666e+03  on 14  degrees of freedom
Residual deviance: 1.6653e-14  on  0  degrees of freedom
AIC: 114.06

Number of Fisher Scoring iterations: 3
```

Why did I add 1 to the variable Oystercatcher in the poisson regression?

```{.r .fold-hide}
1 is a dummy variable to remove 0s from the counts - or log(0) will mess up the estimation of parameters
```

What is the link function for a poisson regression?

```{.r .fold-hide}
(natural) log link
```

What is the expected number of Oystercatchers at site k?

```{.r .fold-hide}
474 oystercatchers

Remember in linear regression (and by extension GLMs) the Intercept estimate is the estimated coefficient for the first site (site a) and the rest are the difference between site a and the respective site. So for site k you need to add the estimated coefficients together.

Coefficient for k:  2.5649 + 3.5984 = 6.1633
But remember this is log counts so you need to transform it back to regular counts:
  exp(6.1633) = 474.993
Then remember we added a dummy variable so you need to subtract that from our estimate:
  474.993 - 1 = 473.993 which rounded to the nearest whole number (as counts are discrete variables) is 474!
```

***

## Binomial (logistic) regression

* Uses a logit link function so the response variable is the **log odds** 
* Estimates are log odds and the probability of an event
    * Intercept is log odds of first group
    * Estimates for other groups are the ratio of log odds
    * Transform from log odds to odds using `exp()`

What is the function to conduct an Poisson regression in R?

```{.r .fold-hide}
glm(Y ~ X, data, family = poisson)
```

### Melanoma tumor thickness and survival
Data is `Melanoma` from `MASS`. I have maniuplated the data so it is suitable for analysis - code below.

```r
Melanoma <- MASS::Melanoma
Melanoma <- subset(Melanoma, Melanoma$status != 3) # remove observations of other causes of death
Melanoma$status <- Melanoma$status - 1 # create binary variables: 0 = died, 1 = alive

# binary regression
model <- glm(status ~ thickness, Melanoma, family = binomial)
summary(model)
```

```

Call:
glm(formula = status ~ thickness, family = binomial, data = Melanoma)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.8588  -1.2162   0.6729   0.7485   1.8844  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)  1.61134    0.25496   6.320 2.62e-10 ***
thickness   -0.24853    0.06354  -3.911 9.18e-05 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 232.84  on 190  degrees of freedom
Residual deviance: 213.45  on 189  degrees of freedom
AIC: 217.45

Number of Fisher Scoring iterations: 4
```

```r
plot(status ~ thickness, Melanoma, pch = 19) # plot
# plot binomial regression in blue
newdat <- data.frame(thickness=seq(min(Melanoma$thickness), max(Melanoma$thickness),len=100))
newdat$status <- predict(model, newdata=newdat, type="response")
lines(status ~ thickness, newdat, col="blue", lwd=2)
```

<img src="04-GLM_files/figure-html/Melanoma-1.png" width="300" style="display: block; margin: auto;" />

Is there a relationship between Melanoma tumor thickness (mm) and whether a patient survives?

```{.r .fold-hide}
Yes. The thicker the tumour, the greater the odds of death. The P value of the slope of the binomial regression is significantly different from 0. P < 0.001.
```

What does the coefficient estimate of `-0.24853` for the variable `thickness` represent?

```{.r .fold-hide}
The estimate represents the log odds of survival as a function of tumour thickness. In other words, we expect the log odds of survival to decrease by 0.25 for a 1 mm increase in tumour thickness. 

We can transform log odds to odds by taking the exponential: exp(-0.24853) = 0.7799465. 1 - 0.7799465 = 0.22, so for every 1 mm increase in tumour thickness we expect the odds of survival to decrease by 22 %
```

What is the probability of survival with a tumor 5 mm thick?

```{.r .fold-hide}
The logit formula is logit = p/(1-p) and the regression equation is logit(p) = 1.61134 - 0.24853 * thickness
so logit(p) =  1.61134 - 0.24853 * 5 = 0.36869

and to turn logit p into probability (p):
p = exp(logit(p))/(1 + exp(logit(p)))
  = exp(0.36869)/(1 + exp(0.36869))
  = 0.5911424

The probability of surviving is 59 %
```

Wear sunscreen!

***
