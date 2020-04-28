# Feature selection — Correlation and P-value

With material from [here](https://towardsdatascience.com/feature-selection-correlation-and-p-value-da8921bfb3cf)

- [Feature selection — Correlation and P-value](#feature-selection--correlation-and-p-value)
  - [What is correlation?](#what-is-correlation)
  - [How does correlation help in feature selection?](#how-does-correlation-help-in-feature-selection)
  - [P-value](#p-value)
  - [What is p-value?](#what-is-p-value)
  - [How does p-value help in feature selection?](#how-does-p-value-help-in-feature-selection)
  - [p-value may not be able to select important features](#p-value-may-not-be-able-to-select-important-features)

Often when we get a dataset, we might find a plethora of features in the dataset. All of the features we find in the dataset might not be useful in building a machine learning model to make the necessary prediction. Using some of the features might even make the predictions worse. So, feature selection plays a huge role in building a machine learning model.


In this article we will explore two measures that we can use on the data to select the right features.

## What is correlation?
Correlation is a statistical term which in common usage refers to how close two variables are to having a linear relationship with each other.

**For example, two variables which are linearly dependent (say, x and y which depend on each other as x = 2y) will have a higher correlation than two variables which are non-linearly dependent (say, u and v which depend on each other as u = v2)**

## How does correlation help in feature selection?

Features with high correlation are more linearly dependent and hence have almost the same effect on the dependent variable. So, when two features have high correlation, we can drop one of the two features.

## P-value

Before we try to understand about about p-value, we need to know about the null hypothesis.

Null hypothesis is a general statement that there is no relationship between two measured phenomena.

> Testing (accepting, approving, rejecting, or disproving) the null hypothesis — and thus concluding that there are or are not grounds for believing that there is a relationship between two phenomena (e.g. that a potential treatment has a measurable effect) — is a central task in the modern practice of science; the field of statistics gives precise criteria for rejecting a null hypothesis.  
Source: Wikipedia

For more info about the null hypothesis check the above Wikipedia article

## What is p-value?

P-value or probability value or asymptotic significance is a probability value for a given statistical model that, if the null hypothesis is true, a set of statistical observations more commonly known as the statistical summary is greater than or equal in magnitude to the observed results.

In other words, P-value gives us the probability of finding an observation under an assumption that a particular hypothesis is true. This probability is used to accept or reject that hypothesis.

## How does p-value help in feature selection?

Removal of different features from the dataset will have different effects on the p-value for the dataset. We can remove different features and measure the p-value in each case. These measured p-values can be used to decide whether to keep a feature or not.

## p-value may not be able to select important features

Let me get one thing straight—p values don’t help in feature selection as p-values fail to detect important features!

Inferential statistics are not there to tell about the predictive power or importance of a variable. It is an abuse of these measurements to use them that way. There are much better options available for variable selection. I personally like to use RFECV (Recursive Feature Elimination with Cross-Validation)

RFECV-as its title suggests-recursively removes features, builds a model using the remaining attributes and calculates model accuracy.

Example (in Python):

```python

from sklearn.datasets import make_friedman1
from sklearn.feature_selection import RFECV
from sklearn.svm import SVR
X, y = make_friedman1(n_samples=50, n_features=10, random_state=0)
estimator = SVR(kernel="linear")
selector = RFECV(estimator, step=1, cv=5)
selector = selector.fit(X, y)
selector.support_ 
selector.ranking_
```

```python
array([1, 1, 1, 1, 1, 6, 4, 3, 2, 5])
```

It means that if there were 10 features, their ranks are 1, 1, 1, 1, 1, 6, 4, 3, 2, 5. Take the top 3 features, i.e, features with rank 1 (first 5 features) and with rank 2 (9th feature) and rank 3 (8th feature)