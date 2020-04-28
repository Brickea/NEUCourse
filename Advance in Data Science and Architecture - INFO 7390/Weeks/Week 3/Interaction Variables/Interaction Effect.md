# Interaction Effects in Regression

In regression, an interaction effect exists when the effect of an independent variable on a dependent variable changes, depending on the value(s) of one or more other independent variables.

## Interaction Effects in Equations

In a regression equation, an interaction effect is represented as the product of two or more independent variables. For example, here is a typical regression equation without an interaction:

ŷ = b0 + b1X1 + b2X2

where ŷ is the predicted value of a dependent variable, X1 and X2 are independent variables, and b0, b1, and b2 are regression coefficients.

And here is the same regression equation with an interaction:

ŷ = b0 + b1X1 + b2X2 + b3X1X2

Here, b3 is a regression coefficient, and X1X2 is the interaction. The interaction between X1 and X2 is called a two-way interaction, because it is the interaction between two independent variables. Higher-order interactions are possible, as illustrated by the three-way interaction in the following equation:

ŷ = b0 + b1X1 + b2X2 + b3X3 + b4X1X2 + b5X1X3 + b6X2X3 + b7X1X2X3

Analysts usually steer clear of higher-order interactions, like X1X2X3, since they can be hard to interpret.

Interaction Plots
An interaction plot is a line graph that reveals the presence or absence of interactions among independent variables. To create an interaction plot, do the following:

* Show the dependent variable on the vertical axis (i.e., the Y axis); and an independent variable, on the horizontal axis (i.e., the X axis).
* Plot mean scores on the dependent variable separately for each level of a potential interacting variable.
* Connect the mean scores, producing separate lines for each level of the interacting variable

To understand potential interaction effects, compare the lines from the interaction plot:

* If the lines are parallel, there is no interaction.
* If the lines are not parallel, there is an interaction.

For example, suppose researchers develop a drug to treat anxiety. The dependent variable is anxiety (plotted on the Y axis). The independent variable is dose (plotted on the X axis). Researchers might hypothesize an interaction effect, based on gender. To visualize the potential interaction, they would plot mean anxiety score by gender for each dose and connect the means with lines, as shown below:

![](../../res/scatter1.gif)

In the plot above, the lines are parallel. This suggests no intereaction effect, based on gender. The drug has the same effect on men as on women. For both men and women, 1 mg of drug lowers anxiety level by 0.2 units.

Suppose, however, the interaction plot looked like this:

![](../../res/scatter2.gif)

Here, the lines are not parallel. The line for women is steeper. This suggests a possible interaction effect, based on gender. The plot tells us that the drug reduces anxiety more effectively for women than for men. But is the reduction significant? To answer that question, we need to conduct a statistical test.

## Regression Analysis With Interaction Terms

In this section, we work through two problems to compare regression analysis with and without interaction terms. With each problem, the goal is to examine effects of drug dosage and gender on anxiety levels.

To conduct the analyses, we will use following data from eight subjects:

![](../../res/截屏2020-01-21下午12.22.13.png)

In the table, notice that we've expressed gender as a dummy variable, where 1 represents females and 0 represents non-females (in this case, males). Notice also that the variable in the fourth column (DG) is an interaction term, with a value equal to the product of dose times gender.

## Without Interaction
First, let's ignore the interaction term. When we regress dose and gender against anxiety, we get the following regression table.

![](../../res/excel14.gif)

We see that both dose and gender are statistically significant at the 0.05 level. And, with further analysis, we find that the [coefficient of multiple determination](Coefficient%20of%20Multiple%20Determination.md) is a respectable 0.80.

## With Interaction
Now, let's include the interaction term in our analysis. When we regress dose, gender, and the dose-gender interaction against anxiety, we get the following regression table.

![](../../res/excel15.gif)

We see that the interaction between dose and gender is statistically significant at the 0.001 level. When we examine the main effects, we see that dose is statistically significant, but gender isn't. And finally, the coefficient of multiple determination is 0.99.

## How to Interpret Results
Typically, when a regression equation includes an interaction term, the first question you ask is: Does the interaction term contribute in a meaningful way to the explanatory power of the equation? You can answer that question by:

Assessing the statistical significance of the interaction term.
Comparing the coefficient of determination with and without the interaction term.
If the interaction term is statistically significant, the interaction term is probably important. And if the coefficient of determination is also much bigger with the interaction term, it is definitely important. If neither of these outcomes are observed, the interaction term can be removed from the regression equation.

Results from our sample problem are summarized in the table below:

![](../../res/截屏2020-01-21下午12.23.51.png)

The interaction term is statistically significant (p = 0.000), and R2 is much bigger with the interaction term than without it (0.99 versus 0.80). Therefore, we conclude for this problem that the interaction term contributes in a meaningful way to the predictive ability of the regression equation.

When the interaction term is statistically significant, there's good news and bad news.

* First, the good news. A significant interaction term means a better fit to the data, and better predictions from the regression equation.
* Now, the bad news. A significant interaction term means uncertainty about the relative importance of main effects.

If your goal is to understand the relative importance of individual predictors, that goal will be harder to achieve when interaction effects are significant. When an interaction effect exists, the effect of one independent variable depends on the value(s) of one or more other independent variables.

For example, consider the interaction plot for our sample problem

![](../../res/scatter3.gif)

For males, drug dosage has a minimal effect on anxiety; but for females, the effect is dramatic. The effect of drug dose cannot be understood without accounting for the gender of the person receiving the medication.

**Bottom line**: When an interaction effect is significant, do not try to interpret the importance of main effects in isolation.