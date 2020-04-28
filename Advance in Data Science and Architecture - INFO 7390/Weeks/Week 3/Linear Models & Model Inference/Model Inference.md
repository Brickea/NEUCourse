# Model Inference

- [Model Inference](#model-inference)
  - [Training](#training)
  - [Inference](#inference)
    - [In Machine Learning](#in-machine-learning)
    - [In Statistical Learning](#in-statistical-learning)

## Training

In machine learning, “training” usually refers to the process of preparing a machine learning model to be useful by feeding it data from which it can learn. “Training” may refer to the specific task of feeding that model with the expectation that the resulting model will be evaluated independently (e.g., on a separate “test” set), or it might refer to the general process of feeding it data with the intention of using it for something.

## Inference

### In Machine Learning 

I’ve seen “inference” used in the context of machine learning in two main senses. In one sense of the word, “inference” refers to the process of taking a model that’s already been trained (as above) and using that trained model to make useful predictions, as in NVidia’s page on the topic. Here, training and inference are completely distinct activities, and “inference” refers to the process of inferring things about the world by applying your model to new data.

### In Statistical Learning

In another sense of the word, especially in the subfields of Bayesian modeling and statistical learning, researchers may use the phrase “inference” to refer to the process of learning model parameters or random variables from data, as in Hastie and Tibsherani. You can think of this sense of inference as more closely aligning with the phrase “making inferences about the data” that are then reflected by the model parameters you’ve learned from the data. Here “inference” is more closely related to “training” above. “Training” in these fields is often used to refer to the process of estimating model parameters or random variables, though typically “training” is used in this context when it’s done to make predictions with the resulting model or to evaluate it rather than to draw conclusions about data using the model (other phrases might be “fitting” a model,” “estimating parameters,” “learning parameters,” and so on.