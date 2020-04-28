## Part 3: statistics

## ============================================================================
## INTRO
## ============================================================================

## We use statistical analysis for:
## * inference - making conclusions based on data
## * prediction - what will happen when I observe new data?

## ...and we create models to do both of those things.

## "All models are wrong - some are useful."

## Fundamentals:
## model selection - which model is good/best?
## model diagnostics/validation - is my current model reasonable and
##   does it work?
## uncertainty is always part of the final product



## References:
## James et al, p 15 [statistical modeling]
## James et al, p 59+ [Linear regression]
## James et al, p 130+ [Logistic regression]
## An Introduction to Statistical Learning with Applications in R, 
## by James et al:http://www-bcf.usc.edu/~gareth/ISL/
  




## ============================================================================
## (A) LINEAR REGRESSION
## ============================================================================

## data prep
college <- read.csv("../data/College.csv")
rownames(college) <- college$X
college$X <- NULL

## Here we get rid of all party schoold (grad rate = 100%)
college <- college[college$Grad.Rate < 100,]


## Q: is there an association between the graduation rate by student / faculty ratio?

## what patterns do we see?
## Firt, install ggplot2 by menu: Tools | Install Packages | ggplot2
# Then: Bring the library into scope:
library(ggplot2)

## and plot the data with the linear regression line
qplot(S.F.Ratio, Grad.Rate, data = college, geom=c("point", "smooth"), method=lm)

## get more information about the linear regression..
lm.fit <- lm(Grad.Rate ~ S.F.Ratio,data=college)
summary(lm.fit)

## Interpreting R’s Regression Output (from http://www.learnbymarketing.com/tutorials/linear-regression-in-r/)

## Residuals: The section summarizes the residuals, the error between the prediction of the model
## and the actual results.  Smaller residuals are better.

## Coefficients: For each variable and the intercept, a weight is produced and that weight has 
## other attributes like the standard error, a t-test value and significance.

## Estimate: This is the weight given to the variable.  In the simple regression case 
## (one variable plus the intercept), for every one dollar increase in Spend, the model 
## predicts an increase of $10.6222.

## Std. Error: Tells you how precisely was the estimate measured.  It’s really only useful for 
## calculating the t-value.

## t-value and Pr(>[t]): The t-value is calculated by taking the coefficient divided by the 
## Std. Error.  It is then used to test whether or not the coefficient is significantly 
## different from zero.  If it isn’t significant, then the coefficient really isn’t adding 
## anything to the model and could be dropped or investigated further.  
## Pr(>|t|) is the significance level.

## Performance Measures: Three sets of measurements are provided.
## Residual Standard Error: This is the standard deviation of the residuals.  Smaller is better.
## Multiple / Adjusted R-Square: For one variable, the distinction doesn’t really matter.  
## R-squared shows the amount of variance explained by the model.  Adjusted R-Square takes into 
## account the number of variables and is most useful for multiple-regression.
## F-Statistic: The F-test checks if at least one variable’s weight is significantly different than zero.  This is a global test to help asses a model.  If the p-value is not significant (e.g. greater than 0.05) than your model is essentially not doing anything.

## All terms above are standard statistical terminology. But don;t worry about all that for now :-)
## You just fit a line into a cloud of points. Well done!

## is there an association between the number of top 10 percent HS
## students and graduation rate?
qplot(Top10perc, Grad.Rate, data = college, geom=c("point", "smooth"), method=lm)

lm.fit <- lm(Grad.Rate ~ Top10perc,data=college)
summary(lm.fit)

## what linear model have we learned?
coef(lm.fit)
confint(lm.fit)

## [prediction - see Supplement at bottom]



## ============================================================================
## SUPPLEMENT
## ============================================================================

## (1) Linear regression
## can we predict the number of top 10 percent HS students predicting graduation rate?
qplot(Top10perc, Grad.Rate, data = college, geom=c("point", "smooth"), method=lm)

lm.fit <- lm(Grad.Rate ~ Top10perc,data=college)
summary(lm.fit)

## what if we had 4 all new colleges? Could we guess their graudation rate?
newcolleges <- data.frame(
  CollegeName=c("MattU","PavoTech","ApoorvaCollege","SheamusInstitute"),
  Top10perc=c(50,60,99,5)
)
rownames(newcolleges) <- newcolleges$CollegeName
predict(lm.fit,newdata=newcolleges)
predict(lm.fit,newdata=newcolleges,interval="prediction")

## Ok, so you predicted the S.F Ratio based on the linear model you previously learned.
## That's called statistical Machine Learning!!
