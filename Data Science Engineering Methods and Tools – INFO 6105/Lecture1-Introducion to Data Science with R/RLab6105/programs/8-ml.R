## Part 8: Machine Learning in R

## ============================================================================
## 1. Install Packages
## ============================================================================

Install the packages we are going to use today. 
Packages are third party add-ons or libraries that we can 
use in R.

install.packages("caret")

UPDATE: We may need other packages, and we'll install them
along the way, but caret should ask us if we want to load 
them. 

If you are having problems with  packages, you can install 
the caret packages and allpackages that you might need by typing:
  
install.packages("caret", dependencies=c("Depends", "Suggests"))

Now, let's load the package that we are going to use in this
tutorial, the caret package.

library(caret)

The caret package provides a consistent interface into 
hundreds of machine learning algorithms and provides useful 
convenience methods for data visualization, data resampling,
model tuning and model comparison, among other features. 
It's a must have tool for machine learning projects in R.

For more information about the caret R package see the caret 
package homepage at http://topepo.github.io/caret/index.html

## ============================================================================
## 2. Load the data
## ============================================================================

We are going to use the iris flowers dataset. 
This dataset is famous because it is used as the 
"hello world" dataset in machine learning and statistics 
by pretty much everyone.

The dataset contains 150 observations of iris flowers. 
There are four columns of measurements of the flowers in 
centimeters. 
The fifth column is the species of the flower observed. 
All observed flowers belong to one of three species.
You can learn more about this dataset on Wikipedia, at
https://en.wikipedia.org/wiki/Iris_flower_data_set

Here is what we are going to do in this step:
  
Load the iris data the easy way.
Load the iris data from CSV (optional, for purists).
Separate the data into a training dataset and a validation 
dataset.
Choose your preferred way to load data or try both methods.

## ============================================================================
## 2.1 Load Data The Easy Way
## ============================================================================

Fortunately, the R platform provides the iris dataset for us.
Load the dataset as follows:
  
# attach the iris dataset to the environment
data(iris)

# rename the dataset
dataset <- iris

You now have the iris data loaded in R and accessible via 
the dataset variable.

## ============================================================================
## 2.2 Load From CSV
## ============================================================================

Maybe your a purist and you want to load the data just like
you would on your own machine learning project, from a CSV 
file.

Download the iris dataset from the UCI Machine Learning 
Repository (here is the direct link).

Save the file as iris.csv your project directory.

Load the dataset from the CSV file as follows:
  
# define the filename
filename <- "iris.csv"

# load the CSV file from the local directory
dataset <- read.csv(filename, header=FALSE)

# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

You now have the iris data loaded in R and accessible via 
the "dataset" variable.

## ============================================================================
## 2.3. Create a Validation Dataset
## ============================================================================

We need to know that the model we created is any good.

Later, we will use statistical methods to estimate the 
accuracy of the models that we create on unseen data. 
We also want a more concrete estimate of the accuracy of 
the best model on unseen data by evaluating it on actual 
unseen data. That is, we are going to hold back some data 
that the algorithms will not get to see and we will use 
this data to get a second and independent idea of how 
accurate the best model might actually be.

We will split the loaded dataset into two, 80% of which we 
will use to train our models and 20% that we will hold back
on as a validation dataset.

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

# select 20% of the data for validation
validation <- dataset[-validation_index,]

# use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]

You now have training data in the dataset variable and a 
validation set we will use later in the validation variable.

Note that we replaced our dataset variable with the 80% 
sample of the dataset. This was an attempt to keep the 
rest of the code simpler and readable.

## ============================================================================
## 3. Summarize dataset
## ============================================================================

we are going to take a look at the data a few different ways:
  
Dimensions of the dataset.
Types of the attributes.
Peek at the data itself.
Levels of the class attribute.
Breakdown of the instances in each class.
Statistical summary of all attributes.
Don't worry, each look at the data is one command. 
These are useful commands that you can use again and again 
on future projects.

## 3.1 Dimensions of Dataset
We can get a quick idea of how many instances (rows) and 
how many attributes (columns) the data contains with the 
dim function.

# dimensions of dataset
dim(dataset)
You should see 120 instances and 5 attributes:
  
[1] 120 5

Instances are also called "observations", or "datapoints", or "rows" of data.
Features are also called "dimensions", or "attributes", or "columns" of data.

## 3.2 Types of Attributes
It is a good idea to get an idea of the types of the 
attributes. They could be doubles, integers, strings, 
factors and other types.

Knowing the types is important as it will give you an idea 
of how to better summarize the data you have and the types 
of transforms you might need to use to prepare the data 
before you model it.

# list types for each attribute
sapply(dataset, class)
You should see that all of the inputs are double and that 
the class value is a factor:
  
Sepal.Length Sepal.Width Petal.Length Petal.Width Species 
"numeric" "numeric" "numeric" "numeric" "factor"

## 3.3 Peek at the Data
It is also always a good idea to actually eyeball your data.

# take a peek at the first 5 rows of the data
head(dataset)
You should see the first 5 rows of the data:
  
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1 5.1 3.5 1.4 0.2 setosa
2 4.9 3.0 1.4 0.2 setosa
3 4.7 3.2 1.3 0.2 setosa
5 5.0 3.6 1.4 0.2 setosa
6 5.4 3.9 1.7 0.4 setosa
7 4.6 3.4 1.4 0.3 setosa

## 3.4 Levels of the Class
The class variable is a factor. A factor is a class that 
has multiple class labels or levels. Let's look at the 
levels:
  
# list the levels for the class
levels(dataset$Species)

Notice above how we can refer to an attribute by name as a 
property of the dataset. In the results we can see that the
class has 3 different labels:
  
[1] "setosa" "versicolor" "virginica"
This is a multi-class or a multinomial classification problem. 
If there were two levels, it would be a binary classification problem.

## 3.5 Class Distribution
Let's now take a look at the number of instances (rows) that 
belong to each class. We can view this as an absolute count
and as a percentage.

# summarize the class distribution
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

We can see that each class has the same number of instances
(40, or 33% of the dataset)

freq percentage
setosa     40 33.33333
versicolor 40 33.33333
virginica  40 33.33333

## 3.6 Statistical Summary
Now finally, we can take a look at a summary of each 
attribute.

This includes the mean, the min and max values as well as 
some percentiles (25th, 50th or media and 75th e.g. values 
at this points if we ordered all the values for an attribute).

# summarize attribute distributions
summary(dataset)
We can see that all of the numerical values have the same 
scale (centimeters) and similar ranges [0,8] centimeters.
This is going to be a very important preprocessing step in ML.

Sepal.Length  Sepal.Width  Petal.Length  Petal.Width   Species 
Min.   :4.300 Min.   :2.00 Min.   :1.000 Min.   :0.100 setosa    :40 
1st Qu.:5.100 1st Qu.:2.80 1st Qu.:1.575 1st Qu.:0.300 versicolor:40 
Median :5.800 Median :3.00 Median :4.300 Median :1.350 virginica :40 
Mean   :5.834 Mean   :3.07 Mean   :3.748 Mean   :1.213 
3rd Qu.:6.400 3rd Qu.:3.40 3rd Qu.:5.100 3rd Qu.:1.800 
Max.   :7.900 Max.   :4.40 Max.   :6.900 Max.   :2.500

## ============================================================================
## 4. Visualize dataset
## ============================================================================

We now have a basic idea about the data. We need to extend 
that with some visualizations.

We are going to look at two types of plots:
  
Univariate plots to better understand each attribute.
Multivariate plots to better understand the relationships 
between attributes.

## 4.1 Univariate Plots
We start with some univariate plots, that is, plots of each
individual variable.

It is helpful with visualization to have a way to refer to 
just the input attributes and just the output attributes. 
Let's set that up and call the inputs attributes x and the 
output attribute (or class) y.

# split input and output
x <- dataset[,1:4]
y <- dataset[,5]

Given that the input variables are numeric, we can create 
box and whisker plots of each.

# boxplot for each attribute on one image
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}

This gives us a much clearer idea of the distribution of 
the input attributes:
  
  Box and Whisker Plots in R

We can also create a barplot of the Species class variable 
to get a graphical representation of the class distribution
(generally uninteresting in this case because they're even).

# barplot for class breakdown
plot(y)

This confirms what we learned in the last section, that the
instances are evenly distributed across the three class:
  
  Bar Plot of Iris Flower Species

## 4.2 Multivariate Plots
Now we can look at the interactions between the variables.

First let's look at scatterplots of all pairs of attributes
and color the points by class. In addition, because the 
scatterplots show that points for each class are generally 
separate, we can draw ellipses around them.

# scatterplot matrix
install.packages("ISLR")
install.packages("stringi")
library(ISLR); library(ggplot2); library(caret);
featurePlot(x=x, y=y)
featurePlot(x=x, y=y, plot="pairs")


We can see some clear relationships between the input 
attributes (trends) and between attributes and the class 
values (ellipses). That is also what your brain does to
learn to distinguish different classes in your life. Say,
the difference between a sabeertooth tiger and a yummy
yummy antelope. Very important for the survival of our
ancestors!
  
  Scatterplot Matrix of Iris Data in R

We can also look at box and whisker plots of each input 
variable again, but this time broken down into separate 
plots for each class. This can help to tease out obvious 
linear separations between the classes.

# box and whisker plots for each attribute
featurePlot(x=x, y=y, plot="box")

This is useful to see that there are clearly different 
distributions of the attributes for each class value.

Box and Whisker Plot of Iris data by Class Value

Next we can get an idea of the distribution of each attribute, 
again like the box and whisker plots, broken down by class 
value. Sometimes histograms are good for this, but in this 
case we will use some probability density plots to give nice 
smooth lines for each distribution.

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

Like The boxplots, we can see the difference in distribution
of each attribute by class value. We can also see the 
Gaussian-like distribution (bell curve) of each attribute.


## ============================================================================
## 4. Evaluate ML algorithms
## ============================================================================

Now it is time to create some models of the data and estimate their accuracy on unseen data.

Here is what we are going to cover in this step:
  
Set-up the test harness to use 10-fold cross validation.
Build 3 different models to predict species from flower 
measurements. Select the best model.

5.1 Test Harness
We will 10-fold crossvalidation to estimate accuracy.

This will split our dataset into 10 parts, train in 9 and 
test on 1 and release for all combinations of train-test 
splits. We will also repeat the process 3 times for each 
algorithm with different splits of the data into 10 groups,
in an effort to get a more accurate estimate.

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

We are using the metric of "Accuracy" to evaluate models. 
This is a ratio of the number of correctly predicted 
instances divided by the total number of instances in the 
dataset, multiplied by 100 to give a percentage 
(e.g. 95% accurate). 

We will be using the metric variable when we run build and 
evaluate each model next.

5.2 Build Models
We don't know which algorithms would be good on this 
problem or what configurations to use. 

We get an idea from the plots that some of the classes are 
partially linearly separable in some dimensions, so we are 
expecting generally good results.

Let's evaluate 3 different algorithms:
  
Linear Discriminant Analysis (LDA)
k-Nearest Neighbors (kNN).
Random Forest (RF)

This is a good mixture of simple linear (LDA), 
nonlinear (kNN) and complex nonlinear methods (RF). 
We reset the random number seed before reach run to ensure 
that the evaluation of each algorithm is performed using 
exactly the same data splits. It ensures the results are 
directly comparable.

Let's build our three models:
  
# a) linear algorithms
install.packages("e1071")
library(e1071)
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)

# b) nonlinear algorithms
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)

# c) advanced algorithms
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

Caret does support the configuration and tuning of the 
configuration of each model, but we are not going to cover 
that here.

5.3 Select Best Model
We now have 3 models and accuracy estimations for each. 
We need to compare the models to each other and select the 
most accurate.

We can report on the accuracy of each model by first 
creating a list of the created models and using the 
summary function.

# summarize accuracy of models
results <- resamples(list(lda=fit.lda, knn=fit.knn, rf=fit.rf))
summary(results)

We can see the accuracy of each classifier and also other 
metrics like Kappa:
  
Models: lda, knn, rf 
Number of resamples: 10 

Accuracy 
Min. 1st Qu. Median   Mean 3rd Qu. Max. NA's
lda  0.9167  0.9375 1.0000 0.9750       1    1    0
knn  0.8333  0.9167 1.0000 0.9583       1    1    0
rf   0.8333  0.9167 0.9583 0.9500       1    1    0

Kappa 
      Min. 1st Qu. Median   Mean 3rd Qu. Max. NA's
lda  0.875  0.9062 1.0000 0.9625       1    1    0
knn  0.750  0.8750 1.0000 0.9375       1    1    0
rf   0.750  0.8750 0.9375 0.9250       1    1    0

We can also create a plot of the model evaluation results 
and compare the spread and the mean accuracy of each model. There is a population of accuracy measures for each algorithm because each algorithm was evaluated 10 times (10 fold cross validation).

# compare accuracy of models
dotplot(results)

We can see that the most accurate model in this case was 
LDA:
  
Comparison of Machine Learning Algorithms on Iris Dataset in R

The results for just the LDA model can be summarized.

# summarize Best Model
print(fit.lda)

This gives a nice summary of what was used to train the 
model and the mean and standard deviation (SD) accuracy 
achieved, specifically 97.5% accuracy +/- 4%
  
  Linear Discriminant Analysis 

120 samples
4 predictor
3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 108, 108, 108, 108, 108, 108, ... 
Resampling results

Accuracy  Kappa   Accuracy SD  Kappa SD  
0.975     0.9625  0.04025382   0.06038074

the kappa statistic is a measure of how closely the 
instances classified by the machine learning classifier 
matched the data labeled as ground truth, controlling for 
the accuracy of a random classifier as measured by the 
expected accuracy. The kappa statistic for one model is 
directly comparable to the kappa statistic for any other 
model used for the same classification task.

Read here below for more detail on the kappa statistic:
  
The Kappa statistic (or value) is a metric that compares an
Observed Accuracy with an Expected Accuracy (random chance). 
The kappa statistic is used not only to evaluate a single 
classifier, but also to evaluate classifiers amongst 
themselves. In addition, it takes into account random 
chance (agreement with a random classifier), which generally
means it is less misleading than simply using accuracy as 
a metric (an Observed Accuracy of 80% is a lot less 
impressive with an Expected Accuracy of 75% versus an 
Expected Accuracy of 50%). 

Computation of Observed Accuracy and Expected Accuracy is 
integral to comprehension of the kappa statistic, and is 
most easily illustrated through use of a confusion matrix. 
Lets begin with a simple confusion matrix from a simple 
binary classification of Cats and Dogs:
  
  Computation

Cats Dogs
Cats| 10 | 7  |
Dogs| 5  | 8  |
  
Assume that a model was built using supervised machine 
learning on labeled data. This doesn't always have to be 
the case; the kappa statistic is often used as a measure 
of reliability between two human raters. Regardless, 
columns correspond to one "rater" while rows correspond to 
another "rater". In supervised machine learning, one 
"rater" reflects ground truth (the actual values of each 
instance to be classified), obtained from labeled data, 
and the other "rater" is the machine learning classifier 
used to perform the classification. Ultimately it doesn't 
matter which is which to compute the kappa statistic, but 
for clarity's sake lets say that the columns reflect ground
truth and the rows reflect the machine learning classifier 
classifications.

From the confusion matrix we can see there are 30 instances
total (10 + 7 + 5 + 8 = 30). According to the first column 
15 were labeled as Cats (10 + 5 = 15), and according to the
second column 15 were labeled as Dogs (7 + 8 = 15). We can 
also see that the model classified 17 instances as Cats (10
+ 7 = 17) and 13 instances as Dogs (5 + 8 = 13).

Observed Accuracy is simply the number of instances that 
were classified correctly throughout the entire confusion 
matrix, i.e. the number of instances that were labeled as 
Cats via ground truth and then classified as Cats by the 
machine learning classifier, or labeled as Dogs via ground 
truth and then classified as Dogs by the machine learning 
classifier. To calculate Observed Accuracy, we simply add 
the number of instances that the machine learning classifier
agreed with the ground truth label, and divide by the total
number of instances. For this confusion matrix, this would 
be 0.6 ((10 + 8) / 30 = 0.6).

Before we get to the equation for the kappa statistic, one 
more value is needed: the Expected Accuracy. This value is 
defined as the accuracy that any random classifier would be 
expected to achieve based on the confusion matrix. 
The Expected Accuracy is directly related to the number of 
instances of each class (Cats and Dogs), along with the 
number of instances that the machine learning classifier 
agreed with the ground truth label. To calculate Expected 
Accuracy for our confusion matrix, first multiply the 
marginal frequency of Cats for one "rater" by the marginal 
frequency of Cats for the second "rater", and divide by the 
total number of instances. The marginal frequency for a 
certain class by a certain "rater" is just the sum of all 
instances the "rater" indicated were that class. In our 
case, 15 (10 + 5 = 15) instances were labeled as Cats 
according to ground truth, and 17 (10 + 7 = 17) instances 
were classified as Cats by the machine learning classifier. This results in a value of 8.5 (15 * 17 / 30 = 8.5). This is then done for the second class as well (and can be repeated for each additional class if there are more than 2). 15 (7 + 8 = 15) instances were labeled as Dogs according to ground truth, and 13 (8 + 5 = 13) instances were classified as Dogs by the machine learning classifier. This results in a value of 6.5 (15 * 13 / 30 = 6.5). The final step is to add all these values together, and finally divide again by the total number of instances, resulting in an Expected Accuracy of 0.5 ((8.5 + 6.5) / 30 = 0.5). In our example, the Expected Accuracy turned out to be 50%, as will always be the case when either "rater" classifies each class with the same frequency in a binary classification (both Cats and Dogs contained 15 instances according to ground truth labels in our confusion matrix).

The kappa statistic can then be calculated using both the 
Observed Accuracy (0.60) and the Expected Accuracy (0.50) 
and the formula:

Kappa = (observed accuracy - expected accuracy)/(1 - expected accuracy)
So, in our case, the kappa statistic equals: (0.60 - 0.50)/(1 - 0.50) = 0.20.

Reference: https://stats.stackexchange.com/questions/82162/cohens-kappa-in-plain-english


## ============================================================================
## 6. Make predictions
## ============================================================================

The LDA was the most accurate model. Now we want to get an 
idea of the accuracy of the model on our validation set.

This will give us an independent final check on the 
accuracy of the best model. It is valuable to keep a 
validation set just in case you made a slip during such 
as overfitting to the training set or a data leak. 
Both will result in an overly optimistic result.

We can run the LDA model directly on the validation set 
and summarize the results in a confusion matrix.

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

We can see that the accuracy is 100%. 
It was a small validation dataset (20%), but this result 
is within our expected margin of 97% +/-4% suggesting we 
may have an accurate and a reliably accurate model.

You Can Do Machine Learning in R!

You do not need to understand everything. (at least not right now) Your goal is to run through the tutorial end-to-end and get a result. You do not need to understand everything on the first pass. List down your questions as you go. Make heavy use of the ?FunctionName help syntax in R to learn about all of the functions that you're using.

You do not need to know how the algorithms work, for now.

You do not need to be an R programmer. The syntax of the R 
language can be confusing. Just like other languages, focus
on function calls (e.g. function()) and assignments 
(e.g. a <- "b"). We start our class with R to get you used  
to running algorithms on massive data (rows = observations,
columns = features), instead of on a single datapoint. After
your homework for next week, you'll be comfortable with this
and we shift to python!

You do not need to be a machine learning expert. 
You can learn about the benefits and limitations of 
various algorithms later!
  
Now, for the important part: your homework! Repeat this lab
with a different dataset. You are free to download your own,
or to use CRAN-built-in datasets, such as for example:
data(diamonds)

Remember, observations are simply data points along the 
rows. It's the events that you depend on to learn about the
world. Features are the variables along the columns, they
are the independent variables that describe the datapoint.

