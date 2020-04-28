
<div style="text-align: right">INFO 6105 Data Sci Engineering Methods and Tools, Assignment 4</div>
<div style="text-align: right">Zixiao Wang, 27 September 2019</div>

# Assignment 4



## Requirements

1. Find a time-series dataset and predict future values using random forest regression. See how far into the future you can predict (with at least 75% accuracy on a test dataset).
2. Find a dataset and model it by guessing a pdf that matches its histogram. Then find the mist likely parameters of pdf using MLE.

Indicate the source of your dataset. Do not share your dataset with other team.

## 1. Find a time-series dataset and predict future values using random forest regression

### Goal

I will use FR to predict the ```PM2.5``` in Beijing from history recording in  ```PM2.5, DEWP,TEMP,PRES,Iws,Is,Ir```

I will firstly implement the RF which can predict next hour pm2.5

Then I will plot the accuracy of the model for every extra hour of prediction

### Data set information

[UCI Beijing PM2.5](https://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data)

#### Source:

Song Xi Chen, csx '@' gsm.pku.edu.cn, Guanghua School of Management, Center for Statistical Science, Peking University.

#### Data Set Information:

The data's time period is between Jan 1st, 2010 to Dec 31st, 2014. Missing data are denoted as NA.

#### Attribute Information:

```none
No: row number
year: year of data in this row
month: month of data in this row
day: day of data in this row
hour: hour of data in this row
pm2.5: PM2.5 concentration (ug/m^3)
DEWP: Dew Point (â„ƒ)
TEMP: Temperature (â„ƒ)
PRES: Pressure (hPa)
cbwd: Combined wind direction
Iws: Cumulated wind speed (m/s)
Is: Cumulated hours of snow
Ir: Cumulated hours of rain
```

#### Relevant Papers:

Liang, X., Zou, T., Guo, B., Li, S., Zhang, H., Zhang, S., Huang, H. and Chen, S. X. (2015). Assessing Beijing's PM2.5 pollution: severity, weather impact, APEC and winter heating. Proceedings of the Royal Society A, 471, 20150257.


#### Citation Request:

Liang, X., Zou, T., Guo, B., Li, S., Zhang, H., Zhang, S., Huang, H. and Chen, S. X. (2015). Assessing Beijing's PM2.5 pollution: severity, weather impact, APEC and winter heating. Proceedings of the Royal Society A, 471, 20150257.

## 1.1 Implement the RF which can predict next hour pm2.5

### 1.1.1 Import the data from csv


```python
import pandas as pd
import matplotlib.pyplot as plt
%matplotlib inline
```


```python
df = pd.read_csv('dataset/BeijingPM2.5DataDataSet2010.1.1-2014.12.31.csv')
```


```python
print("----First 10 recordings")
df.head(10)
```

    ----First 10 recordings
    




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
      <th>No</th>
      <th>year</th>
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>cbwd</th>
      <th>Iws</th>
      <th>Is</th>
      <th>Ir</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>NaN</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1021.0</td>
      <td>NW</td>
      <td>1.79</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>NaN</td>
      <td>-21</td>
      <td>-12.0</td>
      <td>1020.0</td>
      <td>NW</td>
      <td>4.92</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>NaN</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1019.0</td>
      <td>NW</td>
      <td>6.71</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>NaN</td>
      <td>-21</td>
      <td>-14.0</td>
      <td>1019.0</td>
      <td>NW</td>
      <td>9.84</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>NaN</td>
      <td>-20</td>
      <td>-12.0</td>
      <td>1018.0</td>
      <td>NW</td>
      <td>12.97</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>NaN</td>
      <td>-19</td>
      <td>-10.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>16.10</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>6</td>
      <td>NaN</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>19.23</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>7</td>
      <td>NaN</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>21.02</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>8</td>
      <td>NaN</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>24.15</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>9</td>
      <td>NaN</td>
      <td>-20</td>
      <td>-8.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>27.28</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
print("----Final 10 recordings")
df.tail(10)
```

    ----Final 10 recordings
    




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
      <th>No</th>
      <th>year</th>
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>cbwd</th>
      <th>Iws</th>
      <th>Is</th>
      <th>Ir</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>43814</th>
      <td>43815</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>14</td>
      <td>9.0</td>
      <td>-27</td>
      <td>1.0</td>
      <td>1032.0</td>
      <td>NW</td>
      <td>196.21</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43815</th>
      <td>43816</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>15</td>
      <td>11.0</td>
      <td>-26</td>
      <td>1.0</td>
      <td>1032.0</td>
      <td>NW</td>
      <td>205.15</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43816</th>
      <td>43817</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>16</td>
      <td>8.0</td>
      <td>-23</td>
      <td>0.0</td>
      <td>1032.0</td>
      <td>NW</td>
      <td>214.09</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43817</th>
      <td>43818</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>17</td>
      <td>9.0</td>
      <td>-22</td>
      <td>-1.0</td>
      <td>1033.0</td>
      <td>NW</td>
      <td>221.24</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43818</th>
      <td>43819</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>18</td>
      <td>10.0</td>
      <td>-22</td>
      <td>-2.0</td>
      <td>1033.0</td>
      <td>NW</td>
      <td>226.16</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43819</th>
      <td>43820</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>19</td>
      <td>8.0</td>
      <td>-23</td>
      <td>-2.0</td>
      <td>1034.0</td>
      <td>NW</td>
      <td>231.97</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43820</th>
      <td>43821</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>20</td>
      <td>10.0</td>
      <td>-22</td>
      <td>-3.0</td>
      <td>1034.0</td>
      <td>NW</td>
      <td>237.78</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43821</th>
      <td>43822</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>21</td>
      <td>10.0</td>
      <td>-22</td>
      <td>-3.0</td>
      <td>1034.0</td>
      <td>NW</td>
      <td>242.70</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43822</th>
      <td>43823</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>22</td>
      <td>8.0</td>
      <td>-22</td>
      <td>-4.0</td>
      <td>1034.0</td>
      <td>NW</td>
      <td>246.72</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>43823</th>
      <td>43824</td>
      <td>2014</td>
      <td>12</td>
      <td>31</td>
      <td>23</td>
      <td>12.0</td>
      <td>-21</td>
      <td>-3.0</td>
      <td>1034.0</td>
      <td>NW</td>
      <td>249.85</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df['pm2.5'].plot()
```




    <matplotlib.axes._subplots.AxesSubplot at 0x19cfea0d1d0>




![png](output_10_1.png)


### 1.1.2 Cleaning dataset

First check the data in dataset


```python
print('----------head---------')
print(df.head(5))
print('------information------')
print(df.info())
print('-----missing value-----')
print(df.isnull().sum())
print('--------nan value------')
print(df.isna().sum())
```

    ----------head---------
       No  year  month  day  hour  pm2.5  DEWP  TEMP    PRES cbwd    Iws  Is  Ir
    0   1  2010      1    1     0    NaN   -21 -11.0  1021.0   NW   1.79   0   0
    1   2  2010      1    1     1    NaN   -21 -12.0  1020.0   NW   4.92   0   0
    2   3  2010      1    1     2    NaN   -21 -11.0  1019.0   NW   6.71   0   0
    3   4  2010      1    1     3    NaN   -21 -14.0  1019.0   NW   9.84   0   0
    4   5  2010      1    1     4    NaN   -20 -12.0  1018.0   NW  12.97   0   0
    ------information------
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 43824 entries, 0 to 43823
    Data columns (total 13 columns):
    No       43824 non-null int64
    year     43824 non-null int64
    month    43824 non-null int64
    day      43824 non-null int64
    hour     43824 non-null int64
    pm2.5    41757 non-null float64
    DEWP     43824 non-null int64
    TEMP     43824 non-null float64
    PRES     43824 non-null float64
    cbwd     43824 non-null object
    Iws      43824 non-null float64
    Is       43824 non-null int64
    Ir       43824 non-null int64
    dtypes: float64(4), int64(8), object(1)
    memory usage: 4.3+ MB
    None
    -----missing value-----
    No          0
    year        0
    month       0
    day         0
    hour        0
    pm2.5    2067
    DEWP        0
    TEMP        0
    PRES        0
    cbwd        0
    Iws         0
    Is          0
    Ir          0
    dtype: int64
    --------nan value------
    No          0
    year        0
    month       0
    day         0
    hour        0
    pm2.5    2067
    DEWP        0
    TEMP        0
    PRES        0
    cbwd        0
    Iws         0
    Is          0
    Ir          0
    dtype: int64
    

Fill the data that are missing


```python
df = df.fillna(method = 'backfill', axis = 0)
print('-----missing value-----')
print(df.isnull().sum())
print('--------nan value------')
print(df.isna().sum())
df.head(10)
```

    -----missing value-----
    No       0
    year     0
    month    0
    day      0
    hour     0
    pm2.5    0
    DEWP     0
    TEMP     0
    PRES     0
    cbwd     0
    Iws      0
    Is       0
    Ir       0
    dtype: int64
    --------nan value------
    No       0
    year     0
    month    0
    day      0
    hour     0
    pm2.5    0
    DEWP     0
    TEMP     0
    PRES     0
    cbwd     0
    Iws      0
    Is       0
    Ir       0
    dtype: int64
    




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
      <th>No</th>
      <th>year</th>
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>cbwd</th>
      <th>Iws</th>
      <th>Is</th>
      <th>Ir</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1021.0</td>
      <td>NW</td>
      <td>1.79</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-12.0</td>
      <td>1020.0</td>
      <td>NW</td>
      <td>4.92</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1019.0</td>
      <td>NW</td>
      <td>6.71</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-14.0</td>
      <td>1019.0</td>
      <td>NW</td>
      <td>9.84</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>129.0</td>
      <td>-20</td>
      <td>-12.0</td>
      <td>1018.0</td>
      <td>NW</td>
      <td>12.97</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-10.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>16.10</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>6</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>19.23</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>7</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>21.02</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>8</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>24.15</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>2010</td>
      <td>1</td>
      <td>1</td>
      <td>9</td>
      <td>129.0</td>
      <td>-20</td>
      <td>-8.0</td>
      <td>1017.0</td>
      <td>NW</td>
      <td>27.28</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



### 1.1.3 Simplify the attributes

I only want to use below attributes to train module:

```
month: month of data in this row
day: day of data in this row
hour: hour of data in this row
pm2.5: PM2.5 concentration (ug/m^3)
DEWP: Dew Point (â„ƒ)
TEMP: Temperature (â„ƒ)
PRES: Pressure (hPa)
Iws: Cumulated wind speed (m/s)
Is: Cumulated hours of snow
Ir: Cumulated hours of rain
```


```python
cols = list(df.columns)
df_less = df[cols[2:9]+cols[10:11]]
df_less.head(10)
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
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>Iws</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1021.0</td>
      <td>1.79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-12.0</td>
      <td>1020.0</td>
      <td>4.92</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1019.0</td>
      <td>6.71</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>129.0</td>
      <td>-21</td>
      <td>-14.0</td>
      <td>1019.0</td>
      <td>9.84</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>129.0</td>
      <td>-20</td>
      <td>-12.0</td>
      <td>1018.0</td>
      <td>12.97</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-10.0</td>
      <td>1017.0</td>
      <td>16.10</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1</td>
      <td>1</td>
      <td>6</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>19.23</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>1</td>
      <td>7</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>21.02</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>1</td>
      <td>8</td>
      <td>129.0</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>24.15</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1</td>
      <td>1</td>
      <td>9</td>
      <td>129.0</td>
      <td>-20</td>
      <td>-8.0</td>
      <td>1017.0</td>
      <td>27.28</td>
    </tr>
  </tbody>
</table>
</div>



### 1.1.4 Rank the pm2.5

So I classify pm2.5 data

Each group indecates one kind of weather condition

```
rank_1 = 1	
0~35μg/m³

rank_2 = 2	
35~75μg/m³

rank_3 = 3
75~115μg/m³

rank_4 = 4
115~150μg/m³

rank_5 = 5
150~250μg/m³

rank_6 = 6
> 250μg/m³
```



```python
def divide_pm2_5(x):
    if x> 250:
        return 6
    elif x>150 and x<= 250:
        return 5
    elif x>115 and x<=150:
        return 4
    elif x > 75 and x <=115:
        return 3
    elif x>35 and x <=75:
        return 2
    elif x>0 and x<=35:
        return 1
    return 7
df_less['pm2.5'] = df_less['pm2.5'].apply(divide_pm2_5)
df_less.head(10)
```

    D:\Users\admin\Anaconda3\lib\site-packages\ipykernel_launcher.py:15: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      from ipykernel import kernelapp as app
    




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
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>Iws</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>4</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1021.0</td>
      <td>1.79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>-21</td>
      <td>-12.0</td>
      <td>1020.0</td>
      <td>4.92</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>4</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1019.0</td>
      <td>6.71</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>-21</td>
      <td>-14.0</td>
      <td>1019.0</td>
      <td>9.84</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>4</td>
      <td>-20</td>
      <td>-12.0</td>
      <td>1018.0</td>
      <td>12.97</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>4</td>
      <td>-19</td>
      <td>-10.0</td>
      <td>1017.0</td>
      <td>16.10</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1</td>
      <td>1</td>
      <td>6</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>19.23</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>1</td>
      <td>7</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>21.02</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>1</td>
      <td>8</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>24.15</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1</td>
      <td>1</td>
      <td>9</td>
      <td>4</td>
      <td>-20</td>
      <td>-8.0</td>
      <td>1017.0</td>
      <td>27.28</td>
    </tr>
  </tbody>
</table>
</div>



### 1.1.5 Train the module that can predict next day's pm2.5

Shift the data to next day


```python
 # Shift pm2.5 down to predict next day
series1=df_less['pm2.5'].shift(-1)
df_less.insert(0,'pm2.5_next',series1)
```


```python
df_less=df_less.dropna(axis=0)
```


```python
df_less.tail(10)
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
      <th>pm2.5_next</th>
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>Iws</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>43813</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>13</td>
      <td>1</td>
      <td>-27</td>
      <td>0.0</td>
      <td>1032.0</td>
      <td>186.38</td>
    </tr>
    <tr>
      <th>43814</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>14</td>
      <td>1</td>
      <td>-27</td>
      <td>1.0</td>
      <td>1032.0</td>
      <td>196.21</td>
    </tr>
    <tr>
      <th>43815</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>15</td>
      <td>1</td>
      <td>-26</td>
      <td>1.0</td>
      <td>1032.0</td>
      <td>205.15</td>
    </tr>
    <tr>
      <th>43816</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>16</td>
      <td>1</td>
      <td>-23</td>
      <td>0.0</td>
      <td>1032.0</td>
      <td>214.09</td>
    </tr>
    <tr>
      <th>43817</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>17</td>
      <td>1</td>
      <td>-22</td>
      <td>-1.0</td>
      <td>1033.0</td>
      <td>221.24</td>
    </tr>
    <tr>
      <th>43818</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>18</td>
      <td>1</td>
      <td>-22</td>
      <td>-2.0</td>
      <td>1033.0</td>
      <td>226.16</td>
    </tr>
    <tr>
      <th>43819</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>19</td>
      <td>1</td>
      <td>-23</td>
      <td>-2.0</td>
      <td>1034.0</td>
      <td>231.97</td>
    </tr>
    <tr>
      <th>43820</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>20</td>
      <td>1</td>
      <td>-22</td>
      <td>-3.0</td>
      <td>1034.0</td>
      <td>237.78</td>
    </tr>
    <tr>
      <th>43821</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>21</td>
      <td>1</td>
      <td>-22</td>
      <td>-3.0</td>
      <td>1034.0</td>
      <td>242.70</td>
    </tr>
    <tr>
      <th>43822</th>
      <td>1.0</td>
      <td>12</td>
      <td>31</td>
      <td>22</td>
      <td>1</td>
      <td>-22</td>
      <td>-4.0</td>
      <td>1034.0</td>
      <td>246.72</td>
    </tr>
  </tbody>
</table>
</div>



Extract the X and y


```python
cols = list(df_less.columns) 
X = df_less[cols[1:]]
y = df_less[cols[0]]

```


```python
y.head(10)
```




    0    4.0
    1    4.0
    2    4.0
    3    4.0
    4    4.0
    5    4.0
    6    4.0
    7    4.0
    8    4.0
    9    4.0
    Name: pm2.5_next, dtype: float64




```python
X.head(10)
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
      <th>month</th>
      <th>day</th>
      <th>hour</th>
      <th>pm2.5</th>
      <th>DEWP</th>
      <th>TEMP</th>
      <th>PRES</th>
      <th>Iws</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>4</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1021.0</td>
      <td>1.79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>-21</td>
      <td>-12.0</td>
      <td>1020.0</td>
      <td>4.92</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>4</td>
      <td>-21</td>
      <td>-11.0</td>
      <td>1019.0</td>
      <td>6.71</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>-21</td>
      <td>-14.0</td>
      <td>1019.0</td>
      <td>9.84</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>1</td>
      <td>4</td>
      <td>4</td>
      <td>-20</td>
      <td>-12.0</td>
      <td>1018.0</td>
      <td>12.97</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>4</td>
      <td>-19</td>
      <td>-10.0</td>
      <td>1017.0</td>
      <td>16.10</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1</td>
      <td>1</td>
      <td>6</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>19.23</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>1</td>
      <td>7</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>21.02</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>1</td>
      <td>8</td>
      <td>4</td>
      <td>-19</td>
      <td>-9.0</td>
      <td>1017.0</td>
      <td>24.15</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1</td>
      <td>1</td>
      <td>9</td>
      <td>4</td>
      <td>-20</td>
      <td>-8.0</td>
      <td>1017.0</td>
      <td>27.28</td>
    </tr>
  </tbody>
</table>
</div>



Make train and test dataset


```python
# Using Skicit-learn to split data into training and testing sets
from sklearn.model_selection import train_test_split

# Split the data into training and testing sets
train_features, test_features, train_labels, test_labels = train_test_split(X.values, y.values, test_size = 0.25,
                                                                           random_state = 42)
```

Use RF to predict the pm2.5


```python
from sklearn.ensemble import RandomForestRegressor
import numpy as np
```


```python
%%time
# Instantiate model 
rf = RandomForestRegressor(n_estimators=100, random_state=0, n_jobs=-1)

# Train the model on training data
rf.fit(train_features, train_labels)
# (len(train_features), len(train_labels))
```

    Wall time: 1.65 s
    




    RandomForestRegressor(bootstrap=True, criterion='mse', max_depth=None,
                          max_features='auto', max_leaf_nodes=None,
                          min_impurity_decrease=0.0, min_impurity_split=None,
                          min_samples_leaf=1, min_samples_split=2,
                          min_weight_fraction_leaf=0.0, n_estimators=100, n_jobs=-1,
                          oob_score=False, random_state=0, verbose=0,
                          warm_start=False)



Fitness of module and calculate the error

Let's score the model at how good it is if I only want to predict pm2.5 in one hour


```python
rf.score(test_features, test_labels)
```




    0.8943759476734829



## 1.2 Plot how far the module can predict

Predict the pm2.5 in next day,next next day and so on

Let's see the plot

It will take about 17s to train if the time = 40


```python
%%time
# How far you want to plot the module score
# The time unit in hour
# time = 100 means train module to predict the pm2.5 after 1~100 hour, and plot each module score
time = 40


# simply the attributes
cols = list(df.columns)
df_less = df[cols[2:9]+cols[10:11]]
df_less

# divide pm2.5
df_less['pm2.5'] = df_less['pm2.5'].apply(divide_pm2_5)
df_less.head(10)

# shift the column
series1=df_less['pm2.5'].shift(-1)
df_less.insert(0,'pm2.5_next',series1)

time_series = range(time)
score = []
for i in time_series:
    
    # data cleaning
    df_less = df_less.dropna(axis=0)

    # train module and return the score of the module
    cols = list(df_less.columns) 
    X = df_less[cols[1:]]
    y = df_less[cols[0]]

    # Split the data into training and testing sets
    train_features, test_features, train_labels, test_labels = train_test_split(X.values, y.values, test_size = 0.25,
                                                                           random_state = 42)
    # Instantiate model 
    rf = RandomForestRegressor(n_estimators=10, random_state=0, n_jobs=-1)

    # Train the model on training data
    rf.fit(train_features, train_labels)
    score.append(rf.score(test_features, test_labels))

    # shift the data
    # Shift pm2.5 down to predict next day
    series1=df_less.pop('pm2.5_next').shift(-1)
    df_less.insert(0,'pm2.5_next',series1)
    
plt.plot(time_series,score)
plt.ylabel("score")
plt.xlabel("How far the module predict (unit:hour)")
```

    D:\Users\admin\Anaconda3\lib\site-packages\ipykernel_launcher.py:13: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      del sys.path[0]
    

    Wall time: 14.6 s
    




    Text(0.5, 0, 'How far the module predict (unit:hour)')




![png](output_41_3.png)


As can be seen from the figure above, I can predict the data after three hours, and the accuracy is above 75%.

---
## 2.  Find the most likely parameters of pdf using MLE

Find a dataset and model it by guessing a pdf that matches its histogram. Then find the most likely parameters of pdf using MLE.

I will use pm2.5 above to find the most likely parameters of pdf by using MLE

### 2.1 Guess pm2.5 pdf

First plot the hist of pm2.5


```python
pm2_5 = df_less['pm2.5']

y = list(pm2_5)

plt.figure(0)
plt.plot(y)

plt.figure(1)
plt.title("PDF of y")
plt.hist(y,bins=np.arange(9),density=True)
plt.xlabel('y'); plt.ylabel('Pr(y)')
```




    Text(0, 0.5, 'Pr(y)')




![png](output_45_1.png)



![png](output_45_2.png)


### 2.2  Find the most likely parameters of pdf using MLE.

Base above plot, I guess the pm2.5 pdf as  Poisson distribution

Calculate likelihood of all y and find best λ of Poisson distribution

$$l = \prod_{i=1}^n Pr(y_i \;| \;\lambda)$$ 

$$L(y|\lambda) = \frac{e^{-\lambda} \lambda^y}{y!}$$


```python
poisson_like = lambda x, lam: np.exp(-lam) * (lam**x) / (np.arange(x)+1).prod()
```


```python
likelihood = [np.sum(poisson_like(yi, lam) for yi in set(y)) for lam in np.arange(0,6,0.01)]

lambdas = np.arange(0,6,0.01)
plt.plot(lambdas,likelihood)
plt.xlabel('$\lambda$')
plt.ylabel('L($\lambda$|y)')
fit_lambda = likelihood.index(np.max(likelihood)) * 0.01
```

    D:\Users\admin\Anaconda3\lib\site-packages\ipykernel_launcher.py:1: DeprecationWarning: Calling np.sum(generator) is deprecated, and in the future will give a different result. Use np.sum(np.fromiter(generator)) or the python sum builtin instead.
      """Entry point for launching an IPython kernel.
    


![png](output_49_1.png)


The best λ is about 3.38

### 2.3 Plot PDF of y and guess graph to see the fitness


```python
lam = fit_lambda
xvals = np.arange(15)

plt.title("PDF of y")
plt.hist(y,bins=np.arange(9),density=True,label='PDF of y')
plt.xlabel('y'); plt.ylabel('Pr(y)')

plt.plot(xvals, [poisson_like(x, lam) for x in xvals],'r',label='Poisson fit')
plt.xlabel('x')
plt.ylabel('Pr(X|$\lambda$={0})')

plt.legend()
```




    <matplotlib.legend.Legend at 0x19cc89ba048>




![png](output_52_1.png)

