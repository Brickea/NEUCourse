# Features Selection for ML

by Jason Brownlee on November 27, 2019 in [Python Machine Learning](https://machinelearningmastery.com/category/python-machine-learning/)

Overview
This tutorial is divided into 4 parts; they are:

- [Features Selection for ML](#features-selection-for-ml)
  - [Feature Selection Methods](#feature-selection-methods)
  - [Statistics for Filter-Based Feature Selection Methods](#statistics-for-filter-based-feature-selection-methods)
    - [Numerical Input, Numerical Output](#numerical-input-numerical-output)
    - [Numerical Input, Categorical Output](#numerical-input-categorical-output)
    - [Categorical Input, Numerical Output](#categorical-input-numerical-output)
    - [Categorical Input, Categorical Output](#categorical-input-categorical-output)
  - [Tips and Tricks for Feature Selection](#tips-and-tricks-for-feature-selection)
    - [Correlation Statistics](#correlation-statistics)
    - [Selection Method](#selection-method)
    - [Transform Variables](#transform-variables)
    - [What Is the Best Method?](#what-is-the-best-method)
  - [Worked Examples of Feature Selection](#worked-examples-of-feature-selection)
    - [Regression Feature Selection:](#regression-feature-selection)
    - [Classification Feature Selection:](#classification-feature-selection)
    - [For Categorical Input](#for-categorical-input)

## Feature Selection Methods

Feature selection methods are intended to reduce the number of input variables to those that are believed to be most useful to a model in order to predict the target variable.

Some predictive modeling problems have a large number of variables that can slow the development and training of models and require a large amount of system memory. Additionally, the performance of some models can degrade when including input variables that are not relevant to the target variable.

There are two main types of feature selection algorithms: wrapper methods and filter methods.

* Wrapper Feature Selection Methods.
* Filter Feature Selection Methods.

**Wrapper feature selection methods** create many models with different subsets of input features and select those features that result in the best performing model according to a performance metric. These methods are unconcerned with the variable types, although they can be computationally expensive. [RFE](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.RFE.html) is a good example of a wrapper feature selection method.

> Wrapper methods evaluate multiple models using procedures that add and/or remove predictors to find the optimal combination that maximizes model performance.

![](../../res/截屏2020-01-21下午12.38.05.png)

**Filter feature selection methods** use statistical techniques to evaluate the relationship between each input variable and the target variable, and these scores are used as the basis to choose (filter) those input variables that will be used in the model.

> Filter methods evaluate the relevance of the predictors outside of the predictive models and subsequently model only the predictors that pass some criterion.

It is common to use correlation type statistical measures between input and output variables as the basis for filter feature selection. As such, the choice of statistical measures is highly dependent upon the variable data types.

Common data types include numerical (such as height) and categorical (such as a label), although each may be further subdivided such as integer and floating point for numerical variables, and boolean, ordinal, or nominal for categorical variables.

Common input variable data types:

1. Numerical Variables
   1. Integer Variables.
   2. Floating Point Variables.
2. Categorical Variables.
   1. Boolean Variables (dichotomous).
   2. Ordinal Variables.
   3. Nominal Variables.

The more that is known about the data type of a variable, the easier it is to choose an appropriate statistical measure for a filter-based feature selection method.

In the next section, we will review some of the statistical measures that may be used for filter-based feature selection with different input and output variable data types.

## Statistics for Filter-Based Feature Selection Methods

In this section, we will consider two broad categories of variable types: numerical and categorical; also, the two main groups of variables to consider: input and output.

Input variables are those that are provided as input to a model. In feature selection, it is this group of variables that we wish to reduce in size. Output variables are those for which a model is intended to predict, often called the response variable.

The type of response variable typically indicates the type of predictive modeling problem being performed. For example, a numerical output variable indicates a regression predictive modeling problem, and a categorical output variable indicates a classification predictive modeling problem.

* Numerical Output: Regression predictive modeling problem.
* Categorical Output: Classification predictive modeling problem.

The statistical measures used in filter-based feature selection are generally calculated one input variable at a time with the target variable. As such, they are referred to as univariate statistical measures. This may mean that any interaction between input variables is not considered in the filtering process.

With this framework, let’s review some univariate statistical measures that can be used for filter-based feature selection.

![](../../res/How-to-Choose-Feature-Selection-Methods-For-Machine-Learning.png)

### Numerical Input, Numerical Output

This is a regression predictive modeling problem with numerical input variables.

The most common techniques are to use a correlation coefficient, such as Pearson’s for a linear correlation, or rank-based methods for a nonlinear correlation.

* Pearson’s correlation coefficient (linear).
* Spearman’s rank coefficient (nonlinear)

### Numerical Input, Categorical Output

This is a classification predictive modeling problem with numerical input variables.

This might be the most common example of a classification problem,

Again, the most common techniques are correlation based, although in this case, they must take the categorical target into account.

* ANOVA correlation coefficient (linear).
* Kendall’s rank coefficient (nonlinear).

Kendall does assume that the categorical variable is ordinal.

### Categorical Input, Numerical Output

This is a regression predictive modeling problem with categorical input variables.

This is a strange example of a regression problem (e.g. you would not encounter it often).

Nevertheless, you can use the same “Numerical Input, Categorical Output” methods (described above), but in reverse.

### Categorical Input, Categorical Output

This is a classification predictive modeling problem with categorical input variables.

The most common correlation measure for categorical data is the [chi-squared test](https://machinelearningmastery.com/chi-squared-test-for-machine-learning/). You can also use mutual information (information gain) from the field of information theory.

* Chi-Squared test (contingency tables).
* Mutual Information.

In fact, mutual information is a powerful method that may prove useful for both categorical and numerical data, e.g. it is agnostic to the data types.

## Tips and Tricks for Feature Selection
This section provides some additional considerations when using filter-based feature selection.

### Correlation Statistics
The scikit-learn library provides an implementation of most of the useful statistical measures.

For example:

* Pearson’s Correlation Coefficient: [f_regression()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.f_regression.html)
* ANOVA: [f_classif()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.f_classif.html)
* Chi-Squared: [chi2()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.chi2.html)
* Mutual Information: [mutual_info_classif()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.mutual_info_classif.html) and [mutual_info_regression()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.mutual_info_regression.html)

Also, the SciPy library provides an implementation of many more statistics, such as Kendall’s tau (kendalltau) and Spearman’s rank correlation (spearmanr).

### Selection Method
The scikit-learn library also provides many different filtering methods once statistics have been calculated for each input variable with the target.

Two of the more popular methods include:

* Select the top k variables: [SelectKBest](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.SelectKBest.html)
* Select the top percentile variables: [SelectPercentile](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.SelectPercentile.html)
I often use SelectKBest myself.

### Transform Variables
Consider transforming the variables in order to access different statistical methods.

For example, you can transform a categorical variable to ordinal, even if it is not, and see if any interesting results come out.

You can also make a numerical variable discrete (e.g. bins); try categorical-based measures.

Some statistical measures assume properties of the variables, such as Pearson’s that assumes a Gaussian probability distribution to the observations and a linear relationship. You can transform the data to meet the expectations of the test and try the test regardless of the expectations and compare results.

### What Is the Best Method?
There is no best feature selection method.

Just like there is no best set of input variables or best machine learning algorithm. At least not universally.

Instead, you must discover what works best for your specific problem using careful systematic experimentation.

Try a range of different models fit on different subsets of features chosen via different statistical measures and discover what works best for your specific problem.

## Worked Examples of Feature Selection
It can be helpful to have some worked examples that you can copy-and-paste and adapt for your own project.

This section provides worked examples of feature selection cases that you can use as a starting point.

### Regression Feature Selection:
*(Numerical Input, Numerical Output)*

This section demonstrates feature selection for a regression problem that as numerical inputs and numerical outputs.

This section demonstrates feature selection for a regression problem that as numerical inputs and numerical outputs.

A test regression problem is prepared using the [make_regression() function](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_regression.html).

Feature selection is performed using [Pearson’s Correlation Coefficient](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient) via the [f_regression()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.f_regression.html) function.

```python
# pearson's correlation feature selection for numeric input and numeric output
from sklearn.datasets import make_regression
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_regression
# generate dataset
X, y = make_regression(n_samples=100, n_features=100, n_informative=10)
# define feature selection
fs = SelectKBest(score_func=f_regression, k=10)
# apply feature selection
X_selected = fs.fit_transform(X, y)
print(X_selected.shape)
```

Running the example first creates the regression dataset, then defines the feature selection and applies the feature selection procedure to the dataset, returning a subset of the selected input features.

```python
(100, 10)
```

### Classification Feature Selection:
*(Numerical Input, Categorical Output)*

This section demonstrates feature selection for a classification problem that as numerical inputs and categorical outputs.

A test regression problem is prepared using the [make_classification()](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.htmlfunction.

Feature selection is performed using [ANOVA F measure](https://en.wikipedia.org/wiki/F-test) via the [f_classif()](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.f_classif.html) function.

```python
from sklearn.datasets import make_classification
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_classif
# generate dataset
X, y = make_classification(n_samples=100, n_features=20, n_informative=2)
# define feature selection
fs = SelectKBest(score_func=f_classif, k=2)
# apply feature selection
X_selected = fs.fit_transform(X, y)
print(X_selected.shape)
```

Running the example first creates the classification dataset, then defines the feature selection and applies the feature selection procedure to the dataset, returning a subset of the selected input features.

```python
(100, 2)
```

### [For Categorical Input](https://machinelearningmastery.com/feature-selection-with-categorical-data/)