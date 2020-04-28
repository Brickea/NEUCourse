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




## ============================================================================
## (A) LINEAR REGRESSION
## ============================================================================

## data prep
college <- read.csv("../data/College.csv")
rownames(college) <- college$X
college$X <- NULL
college <- college[college$Grad.Rate < 100,]


## Q: is there an association between the graduation rate by student / faculty ratio?

## what patterns do we see?
## library(ggplot2)
qplot(S.F.Ratio, Grad.Rate, data = college, geom=c("point", "smooth"), method=lm)

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


## is there an association between the number of top 10 percent HS
## students and graduation rate?
qplot(Top10perc, Grad.Rate, data = college, geom=c("point", "smooth"), method=lm)

lm.fit <- lm(Grad.Rate ~ Top10perc,data=college)
summary(lm.fit)

## what linear model have we learned?
coef(lm.fit)
confint(lm.fit)

## [prediction - see Supplement at bottom]

## linear regression diagnostic plots
## need some stats background...
par(mfrow=c(2,2))
plot(lm.fit)

par(mfrow=c(1,1))

## Multiple Regression (multiple independent variables)
lm.fit.mult <- lm(Grad.Rate ~ Top10perc + Private, data=college)
summary(lm.fit.mult)

par(mfrow=c(1,1))
plot(lm.fit.mult)

plot(college$Top10perc,college$Grad.Rate,col=ifelse(college$Private=="Yes",'red','blue'))
abline(lm.fit.mult,col='blue')
abline(a=coef(lm.fit.mult)[1] + coef(lm.fit.mult)[3], b= coef(lm.fit.mult)[2],col='red')
legend('bottomright',legend=c("Private (1)","Not Private (0)"),fill=c("red","blue"))

## what about just using every variable?
lm.fit.all <- lm(Grad.Rate ~ ., data=college)

## good fit, but probably "overfit", and all variables are correlated
summary(lm.fit.all) 




## ============================================================================
## (B) LOGISTIC REGRESSION
## ============================================================================

## guess/predict  if a college is private by its acceptance rate and size
qplot(Private,F.Undergrad, data=college, geom=c("boxplot", "jitter"))


college$AcceptanceRate <- college$Accept / college$Apps
glm.fit <- glm(Private ~ AcceptanceRate + F.Undergrad,data=college,family='binomial')

summary(glm.fit)
cbind(exp(cbind(OR = coef(glm.fit), confint(glm.fit))), pval=coef(summary(glm.fit))[,4])

## supplement on cbind
a <- c(62.3, 55.3, 65.3, 59.3, 67.3)
b <- c(2.2, 5.4, 1.3, 2.8, 5.4)
c <- c(0.1, 1.5, 1.6, 2.1, 0.3)
mydata <- cbind(a, b, c)
mydata

## prediction is below in the supplement

## Questions?

## (back to main README)




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



## (2) Logistic regression
## guess if a college is private by its acceptance rate and size
college$AcceptanceRate <- college$Accept / college$Apps
glm.fit <- glm(Private ~ AcceptanceRate + F.Undergrad,data=college,family='binomial')
predict(glm.fit,type='response')
## plot the results
p <- predict(glm.fit,type='response')
qplot(p[order(p)],col=ifelse(college$Private=="Yes",'red','blue')[order(p)],ylab="Probability of PrivateYes")
legend('bottomright',legend=c("PrivateYes","PrivateNo"),fill=c("red","blue"))
abline(h=0.5,lty=2)

## how often would we have been right?
table(PredictedPrivate=p > .5, isPrivate=college$Private)

## Cross validated model?
college$CV.index <- rep(1:10,length=nrow(college))
for(i in 1:10) {
  in.fold <- college$CV.index != i
  glm.fit.cv <- glm(Private ~ AcceptanceRate + F.Undergrad, data=college[in.fold,],family='binomial')
  p <- predict(glm.fit.cv,type='response',newdata=college[!in.fold,])
  college[!in.fold,'prediction'] <- p
}
table(PredictedPrivate=college$prediction > .5, isPrivate=college$Private)

install.packages("ROCR")
library("ROCR")
pred <- prediction(college$prediction,college$Private=="Yes")
perf <- performance(pred,measure='tpr',x.measure='fpr')
perf.auc <- performance(pred,measure='auc')
plot(perf)
abline(a=0,b=1,lty=3)
text(.5,.2,paste("AUC:",formatC(perf.auc@y.values[[1]])))
