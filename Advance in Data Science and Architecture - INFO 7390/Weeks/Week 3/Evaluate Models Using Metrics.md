# Evaluate Models Using Metrics

While debugging a ML model can seem daunting, model metrics show you where to start. The following sections discuss how to evaluate performance using metrics.

[11 Important Model Evaluation Metrics for Machine Learning Everyone should know](https://www.analyticsvidhya.com/blog/2019/08/11-important-model-evaluation-error-metrics/)

## Evaluate Quality Using Model Metrics

To evaluate your model’s quality, commonly-used metrics are:

* [loss](https://developers.google.com/machine-learning/crash-course/descending-into-ml/training-and-loss)
* [accuracy](https://developers.google.com/machine-learning/crash-course/classification/accuracy)
* [precision & recall](https://developers.google.com/machine-learning/crash-course/classification/precision-and-recall)
* [area under the ROC curve (AUC)](https://developers.google.com/machine-learning/crash-course/classification/roc-and-auc)


|  Problem |  Evaluating Quality |
|---|---|
| Regression  |  Besides reducing your absolute [Mean Square Error](https://developers.google.com/machine-learning/crash-course/descending-into-ml/training-and-loss) (MSE), reduce your MSE relative to your label values. For example, assume you're predicting prices of two items that have mean prices of 5 and 100. In both cases, assume your MSE is 5. In the first case, the MSE is 100% of your mean price, which is clearly a large error. In the second case, the MSE is 5% of your mean price, which is a reasonable error. |
| Multiclass classification  |  If you're predicting a small number of classes, look at per-class metrics individually. When predicting on many classes, you can average the per-class metrics to track overall classification metrics. Alternatively, you can prioritize specific quality goals depending on your needs. For example, if you're classifying objects in images, then you might prioritize the classification quality for people over other objects. |

## Check Metrics for Important Data Slices

After you have a high-quality model, your model might still perform poorly on subsets of your data. For example, your unicorn predictor must predict well both in the Sahara desert and in New York City, and at all times of the day. However, you have less training data for the Sahara desert. Therefore, you want to track model quality specifically for the Sahara desert. Such subsets of data, like the subset corresponding to the Sahara desert, are called data slices. You should separately monitor data slices where performance is especially important or where your model might perform poorly.

Use your understanding of the data to identify data slices of interest. Then compare model metrics for data slices against the metrics for your entire data set. Checking that your model performs across all data slices helps remove bias. For more, see [Fairness: Evaluating for Bias](https://developers.google.com/machine-learning/crash-course/fairness/evaluating-for-bias).