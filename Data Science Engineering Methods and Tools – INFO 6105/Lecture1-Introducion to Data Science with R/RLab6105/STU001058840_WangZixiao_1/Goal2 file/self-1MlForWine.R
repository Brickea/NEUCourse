## ML script for wine dataset
## Author: Wang Zixiao
## The dataset is from http://archive.ics.uci.edu/ml/datasets/Wine
## Date: 20190905

install.packages("caret")
library(lattice)
library(ggplot2)
library(caret)

## ===============================================
## Part1 load the data and name the col
## ===============================================

# set the file direction
fileDirection <- "../data/wine.csv"

# get the data from csv file
dataSet <- read.csv(fileDirection,header=FALSE)

# move the first classification column to the final column
temp <- dataSet[,1]
dataSet <- cbind(dataSet[2:14],temp)
dataSet


# set all columns names
colnames(dataSet) <- c("alcohol","malicAcid","ash","alcalinityOfAsh","magnesium","totalPhenols","flavanoids",
                      "nonflavanoidPhenols","proanthocyanins","colorIntensity","hue","diluted","proline","classIdentifier")

# Important
# You need to make sure your dataset has factor module!!!
# Ortherwise the feature plot will only show NULL
# is.factor() can show if dataset has factor
# as.factor() can make attribute be factor 
dataSet$classIdentifier <- as.factor(dataSet$classIdentifier)
is.factor(dataSet)

## ===============================================
## Part2 create validation set
## ===============================================

# create a list of 80%?of the rows in the original dataset we can use for training
validation_index <- createDataPartition(dataSet$classIdentifier, p=0.80, list=FALSE)

# select 20% of the data for validation
validation <- dataSet[-validation_index,]

# use the remaining 80% of data to ?raining and testing the models
dataSet <- dataSet[validation_index,]

## ===============================================
## Part3 Summarize dataset
## ===============================================

# Dimension of dataset and validation set
dim(dataSet)
dim(validation)

# Types for each attribute
sapply(dataSet, class)

# Peek of data
head(dataSet)

# Levels of class
levels(dataSet$classIdentifier)

# Distributation of data
percentage <- prop.table(table(dataSet$classIdentifier)) * 100
cbind(freq=table(dataSet$classIdentifier), percentage=percentage)

# Statistical Summary
summary(dataSet)

## ===============================================
## Part4 Visualize dataset
## ===============================================

# split input and output
x <- dataSet[,1:4]
y <- dataSet[,14]

# boxplot for each attribute on one image
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(dataSet)[i])
}

# barplot for class breakdown
plot(y)

# scatterplot matrix
install.packages("ISLR")
install.packages("stringi")
library(ISLR); library(ggplot2); library(caret);
featurePlot(x=x, y=y)
featurePlot(x=x, y=y, plot="pairs")

# box and whisker plots for each attribute
featurePlot(x=x, y=y, plot="box")

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

## ===============================================
## Part5 Evaluate ML algorithms
## ===============================================



# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# a) linear algorithms
install.packages("e1071")
library(e1071)
set.seed(7)
fit.lda <- train(classIdentifier~., data=dataSet, method="lda", metric=metric, trControl=control)

# b) nonlinear algorithms
# kNN
set.seed(7)
fit.knn <- train(classIdentifier~., data=dataSet, method="knn", metric=metric, trControl=control)

# c) advanced algorithms
# Random Forest
set.seed(7)
fit.rf <- train(classIdentifier~., data=dataSet, method="rf", metric=metric, trControl=control)

# Select Best Model
results <- resamples(list(lda=fit.lda, knn=fit.knn, rf=fit.rf))
summary(results)
dotplot(results)

# summarize Best Model
print(fit.lda)

## ===============================================
## Part6 Make Predictions
## ===============================================

validation$classIdentifier <- as.factor(validation$classIdentifier)

predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$classIdentifier)