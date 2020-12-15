# Answers {#answers}

## Chapter 2

**Question 1** - What types of variables are used in simple linear regression?
```
Both the response and predictor variable should be continuous. (Categorical predictor variables are also allowed as we will see in later lectures)
```

**Question 2** - What is the method for parameterising linear models called?
```
Ordinary least squares regression. The aim is to minimise the sum of squared residuals.
```

**Question 3** - What is random error in linear regression?
```
The variation in data that cannot be explained by the linear model. i.e. the difference between the predicted value of the model and the observations: the residuals. Denoted ε.
```

**Question 4** - What is the function in R to conduct a linear regression?
```
The function is lm().
```

**Question 5** - How do you find a predicted value of a response for a given predictor value using a parameterised linear model?
```
Substitute the value of the predictor in the parameterised linear model and solve it.

if Y = 10 * X + 6 and X = 2:
   Y = 10 * 2 + 6 = 20 + 6
   Y = 26 
```

**Question 6** - What is the probability distribution function of linear regression?
```
The normal distribution. Also called Gaussian.
```

***

## Chapter 3

**Question 1** - What is the significance of fixed and random variables for drawing conclusions?
```
It changes the inferred conclusion. In fixed models, the identities of the groupings are the main level of inference whereas in random models we consider the identity of the group to be randomly selected from a wider pool of candidates. Thus we can generalise our findings beyond our selected groups in random models but are limited to the groups we selected in fixed models. 

For example, if we counted the population of 5 towns in Ireland and analysed the data using a fixed model, then we could only state our conclusion for those 5 towns and cannot draw conclusions for the whole of Ireland.

With a random model, we consider those 5 towns to be representitive of the whole of Ireland, we are not interested in those 5 towns in particular, thus we can generalise our conclusions to the whole of Ireland. E.g. those 5 towns were randomly selected from all the candidate towns to survey.
```

**Question 2** - What is the function to conduct an Analysis of Variance in R?
```
Either summary(aov()) or anova(lm()) will do a Type I ANOVA. Type II and Type III models require additional packages.
```

**Question 3** - How many groups were in the categorical predictor variable in this one-way analysis of variance? $F_{5,24} = 14.23, P < 0.001$
```
6 groups. The degree of freedom for group is 5 and this is calculated from the number of groups - 1. So 5 + 1 = 6.
```

**Question 4** - What is the difference between an additive and interactive linear model? 
```
An additive model does not describe an interaction between the two predictor variables. An interactive model describes that the effect of one predictor variable on the response variable is dependent on the second predictor variable.
```

**Question 5** - What is the function to conduct an interactive multiple regression model in R?
```
lm(Y ~ A * B, data) where A & B are the two predictor variables. * denotes the interaction.
```

**Question 6** - A multiple regression of crab shell width (response) with crab body depth (continuous predictor) for two species (categorical predictor: B or O) and their interaction had the following coefficients:  


|            |          x|
|:-----------|----------:|
|(Intercept) |  2.6942643|
|BD          |  2.5449206|
|spO         | -1.2531624|
|BD:spO      | -0.1756934|

  
What is the predicted shell length (mm) of a species O crab with a body depth of 15mm?

```
Answer: 36.97951 mm

Because B is alphabetically before O, the first parameter coefficients refer to species B. 
The intercept for species O is 2.6942643-1.2531624 = 1.441102
The slope for species O is  2.5449206-0.1756934 = 2.369227
Thus the whole model for species O is:
  shell length = 2.369227 * body depth + 1.441102

Using a value of 15 for body depth:
  shell length = 2.369227 * 15 + 1.441102
               = 36.97951 mm
```

***

## Chapter 4

**Question 1** - What is the error that tells us how much variation the line is (H1) explaining relative to our null hypothesis (H0)? 
```
SSR - Sum of squares of the regression.
```

**Question 2** - What is the error that tells us the total variation in our data?
```
SSY - Sum of squares of the error. Sometimes called SST - total sum of squares
```

**Question 3** - Why can't we use SSE as the denominator?
```
SSE depends on the total variation of Y. We could have more variation simply by having more data but the ratio values are the same. So using sum of squares does not tell us about how much variation is explained by our model in a way that is unbiased. 
```

**Question 4** - What would you expect to see if our observations followed a normal distribution?
```
Observations to fall along a straight line at approx a 45 degree angle
```

**Question 5** - What is the main difference between the Q-Q plots of the continuous and discrete data?
```
You can see the discrete nature of the observations in the clustered groupings in the QQ plot - the staircase pattern
```

**Question 6** - What would you expect to see in a bar plot showing means and standard deviation for the assumption of homogeneity of variance to be met?
```
We want the variation across our grouped observations to be similar so the error bars of standard deviation should also be similar.
```

**Question 7** - What would you expect to see in a scatter plot for the assumption of homogeneity of variance to be met?
```
We want the variation across our grouped observations to be similar so the spread of observations along they axis (vertically) across the values of x (horizontally) should be similar.
```

***

## Chapter 5

**Question 1** - Why did I add 1 to the variable Oystercatcher in the poisson regression?
```
1 is a dummy variable to remove 0s from the counts - or log(0) will mess up the estimation of parameters
```

**Question 2** - What is the link function for a poisson regression?
```
(natural) log link
```

**Question 4** - What is the expected number of Oystercatchers at site k?
```
474 oystercatchers

Remember in linear regression (and by extension GLMs) the Intercept estimate is the estimated coefficient for the first site (site a) and the rest are the difference between site a and the respective site. So for site k you need to add the estimated coefficients together.

Coefficient for k:  2.5649 + 3.5984 = 6.1633
But remember this is log counts so you need to transform it back to regular counts:
  exp(6.1633) = 474.993
Then remember we added a dummy variable so you need to subtract that from our estimate:
  474.993 - 1 = 473.993 which rounded to the nearest whole number (as counts are discrete variables) is 474!
```

**Question 4** - What is the function to conduct an Poisson regression in R?
```
glm(Y ~ X, data, family = poisson)
```

**Question 5** - Is there a relationship between Melanoma tumour thickness (mm) and whether a patient survives?
```
Yes. The thicker the tumour, the greater the odds of death. The P value of the slope of the binomial regression is significantly different from 0. P < 0.001.
```

**Question 6** - What does the coefficient estimate of `-0.24853` for the variable `thickness` represent?
```
The estimate represents the log odds of survival as a function of tumour thickness. In other words, we expect the log odds of survival to decrease by 0.25 for a 1 mm increase in tumour thickness. 

We can transform log odds to odds by taking the exponential: exp(-0.24853) = 0.7799465. 1 - 0.7799465 = 0.22, so for every 1 mm increase in tumour thickness we expect the odds of survival to decrease by 22 %
```

**Question 7** - What is the probability of survival with a tumour 5 mm thick?
```
The logit formula is logit = p/(1-p) and the regression equation is logit(p) = 1.61134 - 0.24853 * thickness
so logit(p) =  1.61134 - 0.24853 * 5 = 0.36869

and to turn logit p into probability (p):
p = exp(logit(p))/(1 + exp(logit(p)))
  = exp(0.36869)/(1 + exp(0.36869))
  = 0.5911424

The probability of surviving is 59 %
```
