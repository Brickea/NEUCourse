
<div style="text-align: right">INFO 6105 Data Science Eng Methods and Tools, Lecture 5 Day 2</div>
<div style="text-align: right">Dino Konstantopoulos, 2 October 2019, with material from Philip Lewis, Department of Geography - University College London</div>

# Homework: Modeling Rainfall with the $\gamma$ distribution

Let's practice what we learned. Let's build a **Bayesian model** for a dataset, so we can extract precise statistics from the model itself, rather than the data. 

### How to build a Bayesian model?
* Look at the histogram of the data
* Pick an analytic probability densiy function matching the shape of the histogram
* Model its parameters (priors) as probability density functions
* Try different shape and values of these parameters (these are called *hyperparameters*)
* Run a probabilistic program to give us the posterior pdfs
* Plot the posterior means on top of the histogram and check if we get a good match!

Let's model rainfall data per calendar month for the city of Nashville, Tennessee. This is a classic problem in Bayesian estimation. Rainfall data is a great opportunity to introduce a new useful pdf to add to our portfolio: the $\gamma$ distribution. 

</br >
<center>
<img src="images/rainfall.jpeg" width=400 />
</center>




```python
%matplotlib inline
import numpy as np
import pandas as pd
import matplotlib.pylab as plt
import seaborn as sns
import pymc3 as pm
sns.set_context('notebook')

RANDOM_SEED = 20090425
```

    WARNING (theano.configdefaults): g++ not available, if using conda: `conda install m2w64-toolchain`
    D:\Users\admin\Anaconda3\lib\site-packages\theano\configdefaults.py:560: UserWarning: DeprecationWarning: there is no c++ compiler.This is deprecated and with Theano 0.11 a c++ compiler will be mandatory
      warnings.warn("DeprecationWarning: there is no c++ compiler."
    WARNING (theano.configdefaults): g++ not detected ! Theano will be unable to execute optimized C-implementations (for both CPU and GPU) and will default to Python implementations. Performance will be severely degraded. To remove this warning, set Theano flags cxx to an empty string.
    WARNING (theano.tensor.blas): Using NumPy C-API based implementation for BLAS functions.
    

## 1. The $\gamma$ distribution

This is the [gamma distribution](https://en.wikipedia.org/wiki/Gamma_distribution):

<div style="font-size: 120%;">  
$$\gamma(x) = \frac{\beta^\alpha x^{\alpha -1} e^{- \beta x}}{\Gamma (\alpha)}$$
</div>

</br >
<center>
<img src="images/ohnonotmath.png" width="300" />
</center>

How many parameters in the gamma function?

By the way, what is the $\Gamma()$ function? It [interpolates](https://en.wikipedia.org/wiki/Gamma_function) the factorial function to non-integer values!

This is what the $\gamma$ function for $x > 0$ and $\alpha, \beta > 0$ looks like:

</br >
<center>
<img src="https://upload.wikimedia.org/wikipedia/commons/e/e6/Gamma_distribution_pdf.svg" width="500" />
Gamma distribution
</center>

## 2. Dataset: Nashville Precipitation

The dataset `nashville_precip.txt` contains NOAA precipitation data for Nashville measured since 1871. Download it from blackboard and put it in the right folder (`C:/Users/<username>/data`). 
    
The $\gamma$ distribution happens to be a good fit to aggregated rainfall data, and will be our candidate model in this case. 

Let's peek at the data:


```python
precip = pd.read_table("data/nashville_precip.txt", index_col=0, na_values='NA', delim_whitespace=True)
precip.head()
```

    D:\Users\admin\Anaconda3\lib\site-packages\ipykernel_launcher.py:1: FutureWarning: read_table is deprecated, use read_csv instead, passing sep='\t'.
      """Entry point for launching an IPython kernel.
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Jan</th>
      <th>Feb</th>
      <th>Mar</th>
      <th>Apr</th>
      <th>May</th>
      <th>Jun</th>
      <th>Jul</th>
      <th>Aug</th>
      <th>Sep</th>
      <th>Oct</th>
      <th>Nov</th>
      <th>Dec</th>
    </tr>
    <tr>
      <th>Year</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1871</th>
      <td>2.76</td>
      <td>4.58</td>
      <td>5.01</td>
      <td>4.13</td>
      <td>3.30</td>
      <td>2.98</td>
      <td>1.58</td>
      <td>2.36</td>
      <td>0.95</td>
      <td>1.31</td>
      <td>2.13</td>
      <td>1.65</td>
    </tr>
    <tr>
      <th>1872</th>
      <td>2.32</td>
      <td>2.11</td>
      <td>3.14</td>
      <td>5.91</td>
      <td>3.09</td>
      <td>5.17</td>
      <td>6.10</td>
      <td>1.65</td>
      <td>4.50</td>
      <td>1.58</td>
      <td>2.25</td>
      <td>2.38</td>
    </tr>
    <tr>
      <th>1873</th>
      <td>2.96</td>
      <td>7.14</td>
      <td>4.11</td>
      <td>3.59</td>
      <td>6.31</td>
      <td>4.20</td>
      <td>4.63</td>
      <td>2.36</td>
      <td>1.81</td>
      <td>4.28</td>
      <td>4.36</td>
      <td>5.94</td>
    </tr>
    <tr>
      <th>1874</th>
      <td>5.22</td>
      <td>9.23</td>
      <td>5.36</td>
      <td>11.84</td>
      <td>1.49</td>
      <td>2.87</td>
      <td>2.65</td>
      <td>3.52</td>
      <td>3.12</td>
      <td>2.63</td>
      <td>6.12</td>
      <td>4.19</td>
    </tr>
    <tr>
      <th>1875</th>
      <td>6.15</td>
      <td>3.06</td>
      <td>8.14</td>
      <td>4.22</td>
      <td>1.73</td>
      <td>5.63</td>
      <td>8.12</td>
      <td>1.60</td>
      <td>3.79</td>
      <td>1.25</td>
      <td>5.46</td>
      <td>4.30</td>
    </tr>
  </tbody>
</table>
</div>



Let's do some data exploration..


```python
_ = precip.hist(sharex=True, sharey=True, grid=False)
plt.tight_layout()
```


![png](output_6_0.png)


The first step is recognizing what sort of distribution to fit our data to. A couple of observations:

1. The data is *skewed*, with a longer tail to the right than to the left
2. The data is *positive-valued*, since they are measuring rainfall
3. The data is *continuous*

There are a few possible choices, but a good option is the [gamma distribution](https://en.wikipedia.org/wiki/Gamma_distribution). If $x$ measures rainfall:

<div style="font-size: 120%;">  
$$x \sim \gamma(\alpha, \beta) = \frac{\beta^{\alpha}x^{\alpha-1}e^{-\beta x}}{\Gamma(\alpha)}$$
</div>

The gamma distribution is often used to model the size of [insurance claims](https://www.crcpress.com/Statistical-and-Probabilistic-Methods-in-Actuarial-Science/Boland/p/book/9781584886952) and [rainfalls](http://journals.tubitak.gov.tr/engineering/issues/muh-00-24-6/muh-24-6-7-9909-13.pdf). This means that aggregate insurance claims and the amount of rainfall accumulated in a reservoir are usually well modelled by a gamma process.


## 3. Data Cleansing 

Wait a sec.. There's something wrong with our data.. if you open it in a text editor, you will find a value of NA for October of 1963 (take a look!). So we have to do some data cleansing first (remember the first step in data science from Lecture 1?). Given what we are trying to do, it is sensible to fill in the missing value with the **average of the available values** (another option would have been the average of the months of September and November 1963).



```python
precip.fillna(value={'Oct': precip.Oct.mean()}, inplace=True)
precip
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Jan</th>
      <th>Feb</th>
      <th>Mar</th>
      <th>Apr</th>
      <th>May</th>
      <th>Jun</th>
      <th>Jul</th>
      <th>Aug</th>
      <th>Sep</th>
      <th>Oct</th>
      <th>Nov</th>
      <th>Dec</th>
    </tr>
    <tr>
      <th>Year</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1871</th>
      <td>2.76</td>
      <td>4.58</td>
      <td>5.01</td>
      <td>4.13</td>
      <td>3.30</td>
      <td>2.98</td>
      <td>1.58</td>
      <td>2.36</td>
      <td>0.95</td>
      <td>1.31</td>
      <td>2.13</td>
      <td>1.65</td>
    </tr>
    <tr>
      <th>1872</th>
      <td>2.32</td>
      <td>2.11</td>
      <td>3.14</td>
      <td>5.91</td>
      <td>3.09</td>
      <td>5.17</td>
      <td>6.10</td>
      <td>1.65</td>
      <td>4.50</td>
      <td>1.58</td>
      <td>2.25</td>
      <td>2.38</td>
    </tr>
    <tr>
      <th>1873</th>
      <td>2.96</td>
      <td>7.14</td>
      <td>4.11</td>
      <td>3.59</td>
      <td>6.31</td>
      <td>4.20</td>
      <td>4.63</td>
      <td>2.36</td>
      <td>1.81</td>
      <td>4.28</td>
      <td>4.36</td>
      <td>5.94</td>
    </tr>
    <tr>
      <th>1874</th>
      <td>5.22</td>
      <td>9.23</td>
      <td>5.36</td>
      <td>11.84</td>
      <td>1.49</td>
      <td>2.87</td>
      <td>2.65</td>
      <td>3.52</td>
      <td>3.12</td>
      <td>2.63</td>
      <td>6.12</td>
      <td>4.19</td>
    </tr>
    <tr>
      <th>1875</th>
      <td>6.15</td>
      <td>3.06</td>
      <td>8.14</td>
      <td>4.22</td>
      <td>1.73</td>
      <td>5.63</td>
      <td>8.12</td>
      <td>1.60</td>
      <td>3.79</td>
      <td>1.25</td>
      <td>5.46</td>
      <td>4.30</td>
    </tr>
    <tr>
      <th>1876</th>
      <td>6.41</td>
      <td>2.22</td>
      <td>5.28</td>
      <td>3.62</td>
      <td>3.40</td>
      <td>5.65</td>
      <td>7.15</td>
      <td>5.77</td>
      <td>2.52</td>
      <td>2.68</td>
      <td>1.26</td>
      <td>0.95</td>
    </tr>
    <tr>
      <th>1877</th>
      <td>4.05</td>
      <td>1.06</td>
      <td>4.98</td>
      <td>9.47</td>
      <td>1.25</td>
      <td>6.02</td>
      <td>3.25</td>
      <td>4.16</td>
      <td>5.40</td>
      <td>2.61</td>
      <td>4.93</td>
      <td>2.49</td>
    </tr>
    <tr>
      <th>1878</th>
      <td>3.34</td>
      <td>2.10</td>
      <td>3.48</td>
      <td>6.88</td>
      <td>2.33</td>
      <td>3.28</td>
      <td>9.43</td>
      <td>5.02</td>
      <td>1.28</td>
      <td>2.17</td>
      <td>3.20</td>
      <td>6.04</td>
    </tr>
    <tr>
      <th>1879</th>
      <td>6.32</td>
      <td>3.13</td>
      <td>3.81</td>
      <td>2.88</td>
      <td>2.88</td>
      <td>2.50</td>
      <td>8.47</td>
      <td>4.62</td>
      <td>5.18</td>
      <td>2.90</td>
      <td>5.85</td>
      <td>9.15</td>
    </tr>
    <tr>
      <th>1880</th>
      <td>3.74</td>
      <td>12.37</td>
      <td>8.16</td>
      <td>5.26</td>
      <td>4.13</td>
      <td>3.97</td>
      <td>5.69</td>
      <td>2.22</td>
      <td>5.39</td>
      <td>7.24</td>
      <td>5.77</td>
      <td>3.32</td>
    </tr>
    <tr>
      <th>1881</th>
      <td>3.54</td>
      <td>5.48</td>
      <td>2.79</td>
      <td>5.12</td>
      <td>3.67</td>
      <td>3.70</td>
      <td>0.86</td>
      <td>1.81</td>
      <td>6.57</td>
      <td>4.80</td>
      <td>4.89</td>
      <td>4.85</td>
    </tr>
    <tr>
      <th>1882</th>
      <td>14.51</td>
      <td>8.61</td>
      <td>9.38</td>
      <td>3.59</td>
      <td>7.38</td>
      <td>2.54</td>
      <td>4.06</td>
      <td>5.54</td>
      <td>1.61</td>
      <td>1.11</td>
      <td>3.60</td>
      <td>1.52</td>
    </tr>
    <tr>
      <th>1883</th>
      <td>3.76</td>
      <td>7.90</td>
      <td>3.98</td>
      <td>9.12</td>
      <td>4.82</td>
      <td>3.82</td>
      <td>4.94</td>
      <td>4.47</td>
      <td>2.23</td>
      <td>5.27</td>
      <td>3.11</td>
      <td>4.97</td>
    </tr>
    <tr>
      <th>1884</th>
      <td>7.20</td>
      <td>8.18</td>
      <td>8.89</td>
      <td>3.51</td>
      <td>3.58</td>
      <td>6.53</td>
      <td>3.18</td>
      <td>2.81</td>
      <td>2.36</td>
      <td>2.43</td>
      <td>1.57</td>
      <td>3.78</td>
    </tr>
    <tr>
      <th>1885</th>
      <td>6.29</td>
      <td>2.00</td>
      <td>2.33</td>
      <td>3.75</td>
      <td>4.36</td>
      <td>3.72</td>
      <td>5.26</td>
      <td>1.02</td>
      <td>5.60</td>
      <td>2.99</td>
      <td>2.73</td>
      <td>2.90</td>
    </tr>
    <tr>
      <th>1886</th>
      <td>5.18</td>
      <td>3.82</td>
      <td>4.76</td>
      <td>2.36</td>
      <td>2.10</td>
      <td>7.69</td>
      <td>1.90</td>
      <td>5.50</td>
      <td>3.68</td>
      <td>0.51</td>
      <td>5.76</td>
      <td>1.48</td>
    </tr>
    <tr>
      <th>1887</th>
      <td>5.13</td>
      <td>8.47</td>
      <td>3.36</td>
      <td>2.67</td>
      <td>3.43</td>
      <td>2.31</td>
      <td>3.77</td>
      <td>2.89</td>
      <td>6.85</td>
      <td>1.92</td>
      <td>2.29</td>
      <td>5.31</td>
    </tr>
    <tr>
      <th>1888</th>
      <td>6.29</td>
      <td>3.78</td>
      <td>6.46</td>
      <td>4.18</td>
      <td>2.97</td>
      <td>4.68</td>
      <td>2.36</td>
      <td>7.03</td>
      <td>3.82</td>
      <td>2.82</td>
      <td>4.33</td>
      <td>1.77</td>
    </tr>
    <tr>
      <th>1889</th>
      <td>3.83</td>
      <td>1.84</td>
      <td>2.47</td>
      <td>2.83</td>
      <td>5.30</td>
      <td>5.33</td>
      <td>2.74</td>
      <td>1.57</td>
      <td>6.81</td>
      <td>1.54</td>
      <td>6.88</td>
      <td>1.17</td>
    </tr>
    <tr>
      <th>1890</th>
      <td>8.10</td>
      <td>10.95</td>
      <td>8.64</td>
      <td>3.84</td>
      <td>4.16</td>
      <td>2.23</td>
      <td>0.46</td>
      <td>6.59</td>
      <td>5.86</td>
      <td>3.01</td>
      <td>2.01</td>
      <td>4.12</td>
    </tr>
    <tr>
      <th>1891</th>
      <td>6.15</td>
      <td>6.96</td>
      <td>10.31</td>
      <td>2.24</td>
      <td>2.39</td>
      <td>6.50</td>
      <td>1.49</td>
      <td>3.72</td>
      <td>1.25</td>
      <td>0.84</td>
      <td>6.71</td>
      <td>4.26</td>
    </tr>
    <tr>
      <th>1892</th>
      <td>2.81</td>
      <td>2.73</td>
      <td>4.10</td>
      <td>7.45</td>
      <td>4.03</td>
      <td>5.01</td>
      <td>5.13</td>
      <td>3.39</td>
      <td>4.78</td>
      <td>0.25</td>
      <td>3.91</td>
      <td>6.43</td>
    </tr>
    <tr>
      <th>1893</th>
      <td>1.27</td>
      <td>4.88</td>
      <td>3.37</td>
      <td>4.11</td>
      <td>7.31</td>
      <td>4.74</td>
      <td>2.12</td>
      <td>1.92</td>
      <td>6.43</td>
      <td>3.68</td>
      <td>2.97</td>
      <td>3.50</td>
    </tr>
    <tr>
      <th>1894</th>
      <td>4.28</td>
      <td>8.65</td>
      <td>2.69</td>
      <td>4.05</td>
      <td>2.53</td>
      <td>3.55</td>
      <td>5.45</td>
      <td>2.43</td>
      <td>3.07</td>
      <td>0.53</td>
      <td>1.92</td>
      <td>2.81</td>
    </tr>
    <tr>
      <th>1895</th>
      <td>5.71</td>
      <td>0.98</td>
      <td>5.09</td>
      <td>3.07</td>
      <td>2.05</td>
      <td>2.90</td>
      <td>7.14</td>
      <td>1.40</td>
      <td>6.69</td>
      <td>1.57</td>
      <td>2.14</td>
      <td>4.09</td>
    </tr>
    <tr>
      <th>1896</th>
      <td>1.37</td>
      <td>3.65</td>
      <td>6.45</td>
      <td>2.92</td>
      <td>4.05</td>
      <td>1.82</td>
      <td>7.33</td>
      <td>1.40</td>
      <td>2.74</td>
      <td>0.98</td>
      <td>5.71</td>
      <td>1.79</td>
    </tr>
    <tr>
      <th>1897</th>
      <td>3.13</td>
      <td>3.84</td>
      <td>8.49</td>
      <td>5.79</td>
      <td>1.22</td>
      <td>1.82</td>
      <td>8.53</td>
      <td>2.34</td>
      <td>0.19</td>
      <td>0.92</td>
      <td>2.83</td>
      <td>4.93</td>
    </tr>
    <tr>
      <th>1898</th>
      <td>9.46</td>
      <td>0.63</td>
      <td>5.36</td>
      <td>3.16</td>
      <td>1.80</td>
      <td>4.97</td>
      <td>4.50</td>
      <td>6.56</td>
      <td>4.87</td>
      <td>3.21</td>
      <td>3.09</td>
      <td>2.41</td>
    </tr>
    <tr>
      <th>1899</th>
      <td>5.59</td>
      <td>5.19</td>
      <td>7.81</td>
      <td>3.25</td>
      <td>3.36</td>
      <td>0.75</td>
      <td>6.44</td>
      <td>2.53</td>
      <td>1.50</td>
      <td>1.83</td>
      <td>1.55</td>
      <td>4.64</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>2.61</td>
      <td>3.80</td>
      <td>2.20</td>
      <td>4.04</td>
      <td>1.86</td>
      <td>10.35</td>
      <td>2.87</td>
      <td>1.24</td>
      <td>4.55</td>
      <td>3.93</td>
      <td>8.87</td>
      <td>2.22</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>6.50</td>
      <td>4.80</td>
      <td>3.00</td>
      <td>4.36</td>
      <td>4.19</td>
      <td>2.28</td>
      <td>5.47</td>
      <td>3.46</td>
      <td>3.23</td>
      <td>1.91</td>
      <td>3.87</td>
      <td>6.36</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>2.56</td>
      <td>2.93</td>
      <td>3.44</td>
      <td>6.80</td>
      <td>11.04</td>
      <td>3.93</td>
      <td>1.71</td>
      <td>1.36</td>
      <td>0.45</td>
      <td>2.77</td>
      <td>6.98</td>
      <td>7.75</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>1.79</td>
      <td>2.38</td>
      <td>5.14</td>
      <td>8.41</td>
      <td>9.68</td>
      <td>4.49</td>
      <td>6.63</td>
      <td>2.42</td>
      <td>0.97</td>
      <td>6.00</td>
      <td>6.20</td>
      <td>2.38</td>
    </tr>
    <tr>
      <th>1985</th>
      <td>3.02</td>
      <td>3.30</td>
      <td>2.70</td>
      <td>2.91</td>
      <td>2.65</td>
      <td>1.53</td>
      <td>2.00</td>
      <td>3.91</td>
      <td>2.52</td>
      <td>1.59</td>
      <td>3.81</td>
      <td>0.98</td>
    </tr>
    <tr>
      <th>1986</th>
      <td>0.19</td>
      <td>3.59</td>
      <td>2.29</td>
      <td>0.52</td>
      <td>3.36</td>
      <td>2.38</td>
      <td>0.77</td>
      <td>3.38</td>
      <td>2.19</td>
      <td>2.19</td>
      <td>7.43</td>
      <td>3.31</td>
    </tr>
    <tr>
      <th>1987</th>
      <td>1.61</td>
      <td>4.87</td>
      <td>1.18</td>
      <td>1.03</td>
      <td>4.41</td>
      <td>2.82</td>
      <td>2.56</td>
      <td>0.73</td>
      <td>1.95</td>
      <td>0.21</td>
      <td>3.40</td>
      <td>5.46</td>
    </tr>
    <tr>
      <th>1988</th>
      <td>3.73</td>
      <td>2.02</td>
      <td>2.18</td>
      <td>2.09</td>
      <td>1.86</td>
      <td>0.45</td>
      <td>3.26</td>
      <td>2.39</td>
      <td>2.45</td>
      <td>1.54</td>
      <td>5.49</td>
      <td>3.95</td>
    </tr>
    <tr>
      <th>1989</th>
      <td>4.52</td>
      <td>9.36</td>
      <td>5.31</td>
      <td>2.68</td>
      <td>4.61</td>
      <td>7.87</td>
      <td>3.18</td>
      <td>3.67</td>
      <td>6.30</td>
      <td>3.62</td>
      <td>3.94</td>
      <td>1.97</td>
    </tr>
    <tr>
      <th>1990</th>
      <td>2.76</td>
      <td>4.73</td>
      <td>3.26</td>
      <td>1.60</td>
      <td>2.80</td>
      <td>2.37</td>
      <td>4.86</td>
      <td>3.12</td>
      <td>2.13</td>
      <td>4.41</td>
      <td>4.29</td>
      <td>10.76</td>
    </tr>
    <tr>
      <th>1991</th>
      <td>2.92</td>
      <td>5.44</td>
      <td>4.25</td>
      <td>3.35</td>
      <td>5.63</td>
      <td>1.25</td>
      <td>2.82</td>
      <td>1.79</td>
      <td>5.47</td>
      <td>3.88</td>
      <td>2.87</td>
      <td>7.27</td>
    </tr>
    <tr>
      <th>1992</th>
      <td>2.97</td>
      <td>2.60</td>
      <td>4.50</td>
      <td>0.77</td>
      <td>3.12</td>
      <td>4.31</td>
      <td>5.89</td>
      <td>3.25</td>
      <td>3.45</td>
      <td>1.62</td>
      <td>4.48</td>
      <td>2.88</td>
    </tr>
    <tr>
      <th>1993</th>
      <td>2.76</td>
      <td>3.33</td>
      <td>5.50</td>
      <td>3.33</td>
      <td>4.50</td>
      <td>5.31</td>
      <td>3.64</td>
      <td>1.76</td>
      <td>2.90</td>
      <td>2.20</td>
      <td>2.53</td>
      <td>6.62</td>
    </tr>
    <tr>
      <th>1994</th>
      <td>4.36</td>
      <td>6.18</td>
      <td>7.56</td>
      <td>5.72</td>
      <td>3.76</td>
      <td>8.08</td>
      <td>4.82</td>
      <td>5.05</td>
      <td>4.20</td>
      <td>3.31</td>
      <td>4.04</td>
      <td>2.69</td>
    </tr>
    <tr>
      <th>1995</th>
      <td>5.61</td>
      <td>1.81</td>
      <td>3.87</td>
      <td>3.95</td>
      <td>7.66</td>
      <td>3.69</td>
      <td>1.95</td>
      <td>3.40</td>
      <td>5.00</td>
      <td>5.60</td>
      <td>3.98</td>
      <td>2.32</td>
    </tr>
    <tr>
      <th>1996</th>
      <td>3.82</td>
      <td>2.46</td>
      <td>5.15</td>
      <td>3.68</td>
      <td>4.48</td>
      <td>3.68</td>
      <td>5.45</td>
      <td>1.09</td>
      <td>4.88</td>
      <td>3.16</td>
      <td>6.00</td>
      <td>4.77</td>
    </tr>
    <tr>
      <th>1997</th>
      <td>4.19</td>
      <td>3.10</td>
      <td>9.64</td>
      <td>2.42</td>
      <td>4.92</td>
      <td>6.66</td>
      <td>3.26</td>
      <td>3.52</td>
      <td>5.75</td>
      <td>2.71</td>
      <td>6.59</td>
      <td>2.19</td>
    </tr>
    <tr>
      <th>1998</th>
      <td>3.68</td>
      <td>4.11</td>
      <td>3.13</td>
      <td>6.31</td>
      <td>4.46</td>
      <td>11.95</td>
      <td>4.63</td>
      <td>2.93</td>
      <td>1.39</td>
      <td>1.59</td>
      <td>1.30</td>
      <td>6.53</td>
    </tr>
    <tr>
      <th>1999</th>
      <td>9.28</td>
      <td>2.33</td>
      <td>4.27</td>
      <td>2.29</td>
      <td>4.35</td>
      <td>3.56</td>
      <td>3.19</td>
      <td>3.05</td>
      <td>1.97</td>
      <td>2.04</td>
      <td>2.99</td>
      <td>2.50</td>
    </tr>
    <tr>
      <th>2000</th>
      <td>3.52</td>
      <td>3.75</td>
      <td>3.34</td>
      <td>6.23</td>
      <td>7.66</td>
      <td>1.74</td>
      <td>2.25</td>
      <td>1.95</td>
      <td>1.90</td>
      <td>0.26</td>
      <td>6.39</td>
      <td>3.44</td>
    </tr>
    <tr>
      <th>2001</th>
      <td>3.21</td>
      <td>8.54</td>
      <td>2.73</td>
      <td>2.42</td>
      <td>5.54</td>
      <td>4.47</td>
      <td>2.77</td>
      <td>4.07</td>
      <td>1.79</td>
      <td>4.61</td>
      <td>5.09</td>
      <td>3.32</td>
    </tr>
    <tr>
      <th>2002</th>
      <td>4.93</td>
      <td>1.99</td>
      <td>9.40</td>
      <td>4.31</td>
      <td>3.98</td>
      <td>3.76</td>
      <td>5.64</td>
      <td>3.13</td>
      <td>6.29</td>
      <td>4.48</td>
      <td>2.91</td>
      <td>5.81</td>
    </tr>
    <tr>
      <th>2003</th>
      <td>1.59</td>
      <td>8.47</td>
      <td>2.30</td>
      <td>4.69</td>
      <td>10.73</td>
      <td>7.08</td>
      <td>2.87</td>
      <td>3.88</td>
      <td>8.70</td>
      <td>1.80</td>
      <td>4.17</td>
      <td>3.19</td>
    </tr>
    <tr>
      <th>2004</th>
      <td>3.60</td>
      <td>5.77</td>
      <td>4.81</td>
      <td>6.69</td>
      <td>6.90</td>
      <td>3.39</td>
      <td>3.19</td>
      <td>4.24</td>
      <td>4.55</td>
      <td>4.90</td>
      <td>5.21</td>
      <td>5.93</td>
    </tr>
    <tr>
      <th>2005</th>
      <td>4.42</td>
      <td>3.84</td>
      <td>3.90</td>
      <td>6.93</td>
      <td>1.03</td>
      <td>2.70</td>
      <td>2.39</td>
      <td>6.89</td>
      <td>1.44</td>
      <td>0.02</td>
      <td>3.29</td>
      <td>2.46</td>
    </tr>
    <tr>
      <th>2006</th>
      <td>6.57</td>
      <td>2.69</td>
      <td>2.90</td>
      <td>4.14</td>
      <td>4.95</td>
      <td>2.19</td>
      <td>2.64</td>
      <td>5.20</td>
      <td>4.00</td>
      <td>2.98</td>
      <td>4.05</td>
      <td>3.41</td>
    </tr>
    <tr>
      <th>2007</th>
      <td>3.32</td>
      <td>1.84</td>
      <td>2.26</td>
      <td>2.75</td>
      <td>3.30</td>
      <td>2.37</td>
      <td>1.47</td>
      <td>1.38</td>
      <td>1.99</td>
      <td>4.95</td>
      <td>6.20</td>
      <td>3.83</td>
    </tr>
    <tr>
      <th>2008</th>
      <td>4.76</td>
      <td>2.53</td>
      <td>5.56</td>
      <td>7.20</td>
      <td>5.54</td>
      <td>2.21</td>
      <td>4.32</td>
      <td>1.67</td>
      <td>0.88</td>
      <td>5.03</td>
      <td>1.75</td>
      <td>6.72</td>
    </tr>
    <tr>
      <th>2009</th>
      <td>4.59</td>
      <td>2.85</td>
      <td>2.92</td>
      <td>4.13</td>
      <td>8.45</td>
      <td>4.53</td>
      <td>6.03</td>
      <td>2.14</td>
      <td>11.08</td>
      <td>6.49</td>
      <td>0.67</td>
      <td>3.99</td>
    </tr>
    <tr>
      <th>2010</th>
      <td>4.13</td>
      <td>2.77</td>
      <td>3.52</td>
      <td>3.48</td>
      <td>16.43</td>
      <td>4.96</td>
      <td>5.86</td>
      <td>6.99</td>
      <td>1.17</td>
      <td>2.49</td>
      <td>5.41</td>
      <td>1.87</td>
    </tr>
    <tr>
      <th>2011</th>
      <td>2.31</td>
      <td>5.54</td>
      <td>4.59</td>
      <td>7.51</td>
      <td>4.38</td>
      <td>5.04</td>
      <td>3.46</td>
      <td>1.78</td>
      <td>6.20</td>
      <td>0.93</td>
      <td>6.15</td>
      <td>4.25</td>
    </tr>
  </tbody>
</table>
<p>141 rows × 12 columns</p>
</div>



## 4. Exploration

Let's calculate the **means** and **variances** of precipitation, month by month:


```python
precip_mean = precip.mean()
precip_mean
```




    Jan    4.523688
    Feb    4.097801
    Mar    4.977589
    Apr    4.204468
    May    4.325674
    Jun    3.873475
    Jul    3.895461
    Aug    3.367305
    Sep    3.377660
    Oct    2.610500
    Nov    3.685887
    Dec    4.176241
    dtype: float64




```python
precip_var = precip.var()
precip_var
```




    Jan    6.928862
    Feb    5.516660
    Mar    5.365444
    Apr    4.117096
    May    5.306409
    Jun    5.033206
    Jul    3.777012
    Aug    3.779876
    Sep    4.940099
    Oct    2.741659
    Nov    3.679274
    Dec    5.418022
    dtype: float64




```python
precip.Apr
```




    Year
    1871     4.13
    1872     5.91
    1873     3.59
    1874    11.84
    1875     4.22
    1876     3.62
    1877     9.47
    1878     6.88
    1879     2.88
    1880     5.26
    1881     5.12
    1882     3.59
    1883     9.12
    1884     3.51
    1885     3.75
    1886     2.36
    1887     2.67
    1888     4.18
    1889     2.83
    1890     3.84
    1891     2.24
    1892     7.45
    1893     4.11
    1894     4.05
    1895     3.07
    1896     2.92
    1897     5.79
    1898     3.16
    1899     3.25
    1900     4.04
            ...  
    1982     4.36
    1983     6.80
    1984     8.41
    1985     2.91
    1986     0.52
    1987     1.03
    1988     2.09
    1989     2.68
    1990     1.60
    1991     3.35
    1992     0.77
    1993     3.33
    1994     5.72
    1995     3.95
    1996     3.68
    1997     2.42
    1998     6.31
    1999     2.29
    2000     6.23
    2001     2.42
    2002     4.31
    2003     4.69
    2004     6.69
    2005     6.93
    2006     4.14
    2007     2.75
    2008     7.20
    2009     4.13
    2010     3.48
    2011     7.51
    Name: Apr, Length: 141, dtype: float64



Ok, now comes the most complicated part of Bayesian estimation: Let's pick pdfs for the $\gamma$ distribution's parameters $\alpha$ and $\beta$. We're taking numbers, and modeling them as distributions, so that we can take a probabilistic program to figure out the best values for these parameters. If you understand this, then you understand the most complicated part of Bayesian estimation theory!

Let's firt try to model rainfall for the month of April, only.



```python
precip.Apr.hist(normed=True, bins=30)
```

    D:\Users\admin\Anaconda3\lib\site-packages\pandas\plotting\_core.py:2477: MatplotlibDeprecationWarning: 
    The 'normed' kwarg was deprecated in Matplotlib 2.1 and will be removed in 3.1. Use 'density' instead.
      ax.hist(values, bins=bins, **kwds)
    




    <matplotlib.axes._subplots.AxesSubplot at 0x2a386bfb470>




![png](output_15_2.png)


### Exercise 1:

Start with the `Uniform` distribution. Rainfall for the month of April seems to go from 0 to 12 units, so let's pick the Uniform distribution to model the $\alpha$ parameter for our gamma function. The Uniform distribution also needs start and end parameters. We pick them to be wide enough to match the data. Then we model april rainfall with the Gamme distribution.

This is the modeling part:

```python
from pymc3 import Model, Uniform

with Model() as rainfall_model:
    ualpha = Uniform('ualpha', lower=0, upper=15)
    ubeta = Uniform('ubeta', lower=0, upper=15)
    
with rainfall_model:
    april_like = Gamma('april_like', alpha=ualpha, beta=ubeta, observed=precip.Apr)
```

This is the simulation part (the probabilistic program that yields the best values for parameters $\alpha$ and $\beta$). Be patient:
```python
from pymc3 import fit

with rainfall_model: 
    rainfall_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

And this is how we plot our posterior pdf for rainfall (our model for april):
```python
from pymc3 import plot_posterior

plot_posterior(rainfall_trace[100:], 
                varnames=['ualpha', 'ubeta'],
                color='#87ceeb');
```

Then we check if our posterior model matches our histogram. If it does, we say "we found a good model for April!"!

We can use the `gamma.pdf` function in `scipy.stats.distributions` to plot the distributions implied by the calculated alphas and betas. Yes, yes, I know, we have not introduced scipy official yet..

</br >
<center>
<img src="https://c402277.ssl.cf1.rackcdn.com/photos/14785/images/story_full_width/shutterstock_532108075.jpg" width=400 />
Lazy Professor!
</center>

```python
from scipy.stats.distributions import gamma

ualpha_posterior_mean = ...
ubeta_posterior_mean = ...

precip.Apr.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ualpha_posterior_mean, ubeta_posterior_mean))
```


```python
from pymc3 import Model, Uniform

with Model() as rainfall_model:
    ualpha = Uniform('ualpha', lower=0, upper=15)
    ubeta = Uniform('ubeta', lower=0, upper=15)

with rainfall_model:
    april_like = pm.Gamma('april_like', alpha=ualpha, beta=ubeta, observed=precip.Apr)
```

---
## Note--Gamma  in pymc3

[link](http://people.duke.edu/~ccc14/sta-663-2016/16c_pymc3.html)

## Note--Uniform in pymc3

[link](https://blog.csdn.net/qq_16000815/article/details/81481594)

---


```python
from pymc3 import fit

with rainfall_model: 
    rainfall_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 366.68: 100%|██████████| 10000/10000 [00:51<00:00, 193.73it/s]
    Finished [100%]: Average Loss = 366.52
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_trace[100:], 
                varnames=['ualpha', 'ubeta'],
                color='#87ceeb');
```

    D:\Users\admin\Anaconda3\lib\site-packages\pymc3\plots\__init__.py:40: UserWarning: Keyword argument `varnames` renamed to `var_names`, and will be removed in pymc3 3.8
      warnings.warn('Keyword argument `{old}` renamed to `{new}`, and will be removed in pymc3 3.8'.format(old=old, new=new))
    


![png](output_20_1.png)



```python
from scipy.stats.distributions import gamma

ualpha_posterior_mean = 11
ubeta_posterior_mean = 2.7

precip.Apr.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ualpha_posterior_mean, ubeta_posterior_mean))
```

    D:\Users\admin\Anaconda3\lib\site-packages\pandas\plotting\_core.py:2477: MatplotlibDeprecationWarning: 
    The 'normed' kwarg was deprecated in Matplotlib 2.1 and will be removed in 3.1. Use 'density' instead.
      ax.hist(values, bins=bins, **kwds)
    




    [<matplotlib.lines.Line2D at 0x2a3876608d0>]




![png](output_21_2.png)


Possible that some of my hyperparameters were not ideal. Hmm.. does anyone want to try different ones and improve on what professor's model using the Uniform distribution as a hyperparameter, for extra credit?

## How to optimize the model(For extra credit🤔)

First I check the distribution of Apirl rainfall


```python
precip.Apr.hist(normed=True, bins=30)
```




    <matplotlib.axes._subplots.AxesSubplot at 0x2a387647908>




![png](output_24_1.png)


Then I compare this distribution with gamma distribution

<img src="https://upload.wikimedia.org/wikipedia/commons/e/e6/Gamma_distribution_pdf.svg" width="300" />

So I find that gamma curve looks same with Apirl rainfall when α=9, β=0.5

Base on this, I reduce the range of ualpha and ubeta like (0,18) and (0,1)


```python
from pymc3 import Model, Uniform

with Model() as rainfall_model:
    ualpha = Uniform('ualpha', lower=0, upper=18) # I change the range here
    ubeta = Uniform('ubeta', lower=0, upper=1) # I change the range here

with rainfall_model:
    april_like = pm.Gamma('april_like', alpha=ualpha, beta=ubeta, observed=precip.Apr)
```


```python
from pymc3 import fit

with rainfall_model: 
    rainfall_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 301.85: 100%|██████████| 10000/10000 [00:49<00:00, 202.29it/s]
    Finished [100%]: Average Loss = 301.82
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_trace[100:], 
                varnames=['ualpha', 'ubeta'],
                color='#87ceeb');
```

    D:\Users\admin\Anaconda3\lib\site-packages\pymc3\plots\__init__.py:40: UserWarning: Keyword argument `varnames` renamed to `var_names`, and will be removed in pymc3 3.8
      warnings.warn('Keyword argument `{old}` renamed to `{new}`, and will be removed in pymc3 3.8'.format(old=old, new=new))
    


![png](output_30_1.png)



```python
from scipy.stats.distributions import gamma

ualpha_posterior_mean = 3.5
ubeta_posterior_mean = 0.82

precip.Apr.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ualpha_posterior_mean, ubeta_posterior_mean))
```




    [<matplotlib.lines.Line2D at 0x2a389d16b38>]




![png](output_31_1.png)


The model looks better!🤔

### Exercise 2:

Did the Uniform distribution work out well in your modeling exercise above? Well, it didn't for professor!

Let's try the `Normal` distribution instead. Please make sure to introduce **new** variables for your priors (xxxalpha, xxxbeta), as well as your simulation trace (xxxapril_like). Replace xxx with whatever you want.

What's the right support for the normal (the right mean and standard deviation)? Pick a mean that centers the gaussian around the peak of the month, and a standard deviation that allows the gaussian to cover all the data.

### Normal distribution

First I want to plot the Apirl rainfalls distribution 


```python
precip.Apr.hist(normed=True, bins=30)
```




    <matplotlib.axes._subplots.AxesSubplot at 0x2a389c0d7b8>




![png](output_36_1.png)



```python
from pymc3 import Model,Uniform, Normal

with Model() as rainfall_normal_model:
    nalpha = Normal('nalpha', 9, sd=10)
    nbeta = Normal('nbeta',4 ,sd = 10)
#     nbeta = Uniform('nbeta', lower = 0, upper = 1)

with rainfall_normal_model:
    normal_april_like = pm.Gamma('normal_april_like', alpha=nalpha, beta=nbeta, observed=precip.Apr)
```

    D:\Users\admin\Anaconda3\lib\site-packages\pymc3\distributions\continuous.py:88: UserWarning: The variable specified for alpha has negative support for Gamma, likely making it unsuitable for this parameter.
      warnings.warn(msg)
    D:\Users\admin\Anaconda3\lib\site-packages\pymc3\distributions\continuous.py:88: UserWarning: The variable specified for beta has negative support for Gamma, likely making it unsuitable for this parameter.
      warnings.warn(msg)
    


```python
from pymc3 import fit

with rainfall_normal_model: 
    rainfall_normal_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 336.89: 100%|██████████| 10000/10000 [00:47<00:00, 210.12it/s]
    Finished [100%]: Average Loss = 336.85
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_normal_trace[100:], 
                varnames=['nalpha', 'nbeta'],
                color='#87ceeb');
```


![png](output_39_0.png)



```python
from scipy.stats.distributions import gamma

nalpha_posterior_mean = 6.3
nbeta_posterior_mean = 1.6

precip.Apr.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), nalpha_posterior_mean, nbeta_posterior_mean))
```




    [<matplotlib.lines.Line2D at 0x2a388a63390>]




![png](output_40_1.png)


### Exercise 3: 

Let's try to accelerate things and try the exponential distribution, instead. Find the right number $x$ so that the distribution covers the range of possible precipitation values.  In other words, find the right value $y$ such that `Exponential.dist(1/3).random(size=10000)` covers from 0 to 12 for the month of April. Try different values out by plotting with:

```python
sns.distplot(Exponential.dist(1/3).random(size=10000), kde=False);
```



```python
from pymc3 import Model,Uniform, Exponential
sns.distplot(Exponential.dist(1/9).random(size=10000), kde=False);
```


![png](output_42_0.png)



```python


with Model() as rainfall_exponential_model:
    ealpha = Exponential('ealpha',1/5 )
    ebeta = Exponential('ebeta', 1/3)

with rainfall_exponential_model:
    exponential_april_like = pm.Gamma('exponential_april_like', alpha=ealpha, beta=ebeta, observed=precip.Apr)
```


```python
from pymc3 import fit

with rainfall_exponential_model: 
    rainfall_exponential_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 316.61: 100%|██████████| 10000/10000 [00:48<00:00, 204.54it/s]
    Finished [100%]: Average Loss = 316.47
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_exponential_trace[100:], 
                varnames=['ealpha', 'ebeta'],
                color='#87ceeb');
```


![png](output_45_0.png)



```python
from scipy.stats.distributions import gamma

ealpha_posterior_mean = 4.2
ebeta_posterior_mean = 1

precip.Apr.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ealpha_posterior_mean, ebeta_posterior_mean))
```




    [<matplotlib.lines.Line2D at 0x2a386f19358>]




![png](output_46_1.png)


### Exercise 4:

Do the month of January.


```python
sns.distplot(Exponential.dist(1/9).random(size=10000), kde=False);
```


![png](output_48_0.png)



```python
from pymc3 import Model,Uniform, Exponential

with Model() as rainfall_exponential_jan_model:
    ealpha = Exponential('ealpha',1/precip.Jan.mean() )
    ebeta = Exponential('ebeta', 1/3)

with rainfall_exponential_jan_model:
    exponential_april_like = pm.Gamma('exponential_april_like', alpha=ealpha, beta=ebeta, observed=precip.Apr)
```


```python
from pymc3 import fit

with rainfall_exponential_jan_model: 
    rainfall_exponential_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 316.74: 100%|██████████| 10000/10000 [00:48<00:00, 204.63it/s]
    Finished [100%]: Average Loss = 316.61
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_exponential_trace[100:], 
                varnames=['ealpha', 'ebeta'],
                color='#87ceeb');
```


![png](output_51_0.png)



```python
from scipy.stats.distributions import gamma

ealpha_posterior_mean = 2.8
ebeta_posterior_mean = 0.65

precip.Jan.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ealpha_posterior_mean, ebeta_posterior_mean))
```




    [<matplotlib.lines.Line2D at 0x2a388ae72b0>]




![png](output_52_1.png)


### (Deep thought) Exercise 5:

How would you model *all* months together (*one* model, *all* months)? Is that even possible?

Merge all months data into one column.


```python
precip_all=pd.concat(precip.iloc[:,i] for i in range(precip.shape[1]))
precip_all.head(10),len(precip_all)
```




    (Year
     1871    2.76
     1872    2.32
     1873    2.96
     1874    5.22
     1875    6.15
     1876    6.41
     1877    4.05
     1878    3.34
     1879    6.32
     1880    3.74
     dtype: float64, 1692)



Use all month dataset to train gamma module


```python
from pymc3 import Model,Uniform, Exponential

with Model() as rainfall_exponential_jan_model:
    ealpha = Exponential('ealpha',1/precip.Jan.mean() )
    ebeta = Exponential('ebeta', 1/3)

with rainfall_exponential_jan_model:
    exponential_april_like = pm.Gamma('exponential_april_like', alpha=ealpha, beta=ebeta, observed=precip_all)
```

This will take about 5 min.


```python
from pymc3 import fit

with rainfall_exponential_jan_model: 
    rainfall_exponential_trace = fit(random_seed=RANDOM_SEED).sample(1000)
```

    Average Loss = 3,863.8: 100%|██████████| 10000/10000 [06:59<00:00, 23.85it/s]
    Finished [100%]: Average Loss = 3,862.4
    


```python
from pymc3 import plot_posterior

plot_posterior(rainfall_exponential_trace[100:], 
                varnames=['ealpha', 'ebeta'],
                color='#87ceeb');
```


![png](output_60_0.png)



```python
from scipy.stats.distributions import gamma

ealpha_posterior_mean = 3.4
ebeta_posterior_mean = 0.9

precip_all.hist(normed=True, bins=20)
plt.plot(np.linspace(0, 25), gamma.pdf(np.linspace(0, 25), ealpha_posterior_mean, ebeta_posterior_mean))
```




    [<matplotlib.lines.Line2D at 0x2a387881358>]




![png](output_61_1.png)



```python
axs = precip.hist(normed=True, figsize=(12, 8), sharex=True, sharey=True, bins=15, grid=True)

for ax in axs.ravel():

    # Get month
    m = ax.get_title()

    # Plot fitted distribution
    x = np.linspace(*ax.get_xlim())
    ax.plot(x, gamma.pdf(x, ealpha_posterior_mean, ebeta_posterior_mean))

    # Annotate with parameter estimates
    label = 'alpha = {0:.2f}\nbeta = {1:.2f}'.format(ealpha_posterior_mean, ealpha_posterior_mean)
    ax.annotate(label, xy=(10, 0.2))

plt.tight_layout()
```


![png](output_62_0.png)

