## Part 0: Introduction to R

## WE'LL BEGIN HERE:

## type getwd() in in RStudio's "Console" (bottom left)
## the output should end in:
## [...]/r-workshop-odsc-master/programs

## if not, navigate to this directory in RStudio with:
## Session - Set Working Directory - Choose Directory...



## ============================================================================
## INTRO
## ============================================================================

## "R is a free software environment for statistical computing and graphics"

## "The best way to learn a new language is to try out the commands"

## Q: what background do you have?


## 3 topics covered today:
## 1. data manipulation, including package `dplyr`
## 2. graphics, including package `ggplot2`
## 3. basic statistical models: linear and logistic regression


## References:
## James et al, p 42+ 


## ============================================================================
## BASIC OPERATIONS
## ============================================================================

## vectors are fundamental
x <- c(1,3,2,5)

x

y <- c(4,1,1,2)

y

## how does R add?
x+y

x-y

x*y


## some functions
length(x)

ls()

x <- rnorm(50)
y <- x+rnorm(50,mean=50,sd=.1)

cor(x,y)

mean(x)

sd(x)


## moving to two dimensions
mm <- matrix(1:16,nrow=4,ncol=4)

mm

dim(mm)

## subsetting/indexing etc
mm[2,]
mm[,2]

mm[-1,]

mm[c(1,2),]


mm[,c(1,3)]

mm[,-c(1,3)]

mm[,]

## exercise: select 2x2 subsection from the "bottom left" of matrix mm

## [your code here]

mm[c(3,4),c(1,2)]

## Q: anything specific you'd like to know about R?
