<div style='text-align:right;'>DMDD final project positioning</div>
<div style='text-align:right;'>Zixiao 20200405</div>

# Positioning


```python
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
# import the magic code for using sql in jupyter notebook
%load_ext sql
# local database
# %sql mysql+pymysql://root:fjwwzx970814@localhost/mydb
# remote database
```


```python
%sql mysql+pymysql://brickea_mac:fjwWZX970814@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
```




    'Connected: brickea_mac@mydb'




```python
%sql mysql+pymysql://nity:BravoNity123@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
```




    'Connected: nity@mydb'




```python
import sqlalchemy as sqlManager
```


```python
# Create connection with database
connection = sqlManager.create_engine('mysql+pymysql://brickea_mac:fjwWZX970814@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb?charset=utf8')
```


```python
connection = sqlManager.create_engine('mysql+pymysql://nity:BravoNity123@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb?charset=utf8')
```

## Procedures and View test


```python
%%sql
# View get_user_and_device
SELECT * FROM get_user_and_device
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    15 rows affected.





<table>
    <tr>
        <th>idcustomer</th>
        <th>firstName</th>
        <th>lastName</th>
        <th>iddevice</th>
        <th>deviceType</th>
        <th>NumConnectionsAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>2</td>
        <td>Phone</td>
        <td>3</td>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>6</td>
        <td>Laptop</td>
        <td>0</td>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>7</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>2</td>
        <td>first_name_1</td>
        <td>last_name_1</td>
        <td>3</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>2</td>
        <td>first_name_1</td>
        <td>last_name_1</td>
        <td>9</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>3</td>
        <td>first_name_2</td>
        <td>last_name_2</td>
        <td>15</td>
        <td>Phone</td>
        <td>0</td>
    </tr>
    <tr>
        <td>4</td>
        <td>first_name_3</td>
        <td>last_name_3</td>
        <td>4</td>
        <td>Phone</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>first_name_3</td>
        <td>last_name_3</td>
        <td>8</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>5</td>
        <td>first_name_4</td>
        <td>last_name_4</td>
        <td>5</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>first_name_5</td>
        <td>last_name_5</td>
        <td>10</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>7</td>
        <td>first_name_6</td>
        <td>last_name_6</td>
        <td>11</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>8</td>
        <td>first_name_7</td>
        <td>last_name_7</td>
        <td>12</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>9</td>
        <td>first_name_8</td>
        <td>last_name_8</td>
        <td>13</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>10</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>14</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>11</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>1</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
</table>




```python
%%sql
SELECT * FROM deviceBeaconConnection dc
WHERE dc.iddevice = 2
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    3 rows affected.





<table>
    <tr>
        <th>idconnection</th>
        <th>iddevice</th>
        <th>idbeacon</th>
        <th>distance</th>
        <th>beaconRankbyDist</th>
    </tr>
    <tr>
        <td>6</td>
        <td>2</td>
        <td>7</td>
        <td>8.062</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>2</td>
        <td>3</td>
        <td>14.318</td>
        <td>3</td>
    </tr>
    <tr>
        <td>8</td>
        <td>2</td>
        <td>2</td>
        <td>12.083</td>
        <td>2</td>
    </tr>
</table>




```python
%%sql
# Procedure get_current_best_3_connections
CALL get_current_best_3_connections(2,@number,@c1,@c2,@c3);
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    1 rows affected.





<table>
    <tr>
        <th>num_available_connections</th>
        <th>connection_1</th>
        <th>connection_2</th>
        <th>connection_3</th>
    </tr>
    <tr>
        <td>3</td>
        <td>6</td>
        <td>8</td>
        <td>7</td>
    </tr>
</table>




```python
%%sql
SELECT x,y,distance FROM 
(SELECT b.coordinatePoint,dc.distance FROM beacons b
INNER JOIN deviceBeaconConnection dc
ON b.idbeacon = dc.idbeacon AND dc.idconnection = 6) bd
INNER JOIN floorMapPoints fmp
ON fmp.coordinatePoint = bd.coordinatePoint;
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    1 rows affected.





<table>
    <tr>
        <th>x</th>
        <th>y</th>
        <th>distance</th>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>8.062</td>
    </tr>
</table>




```python
%%sql
SELECT x,y,distance FROM 
(SELECT b.coordinatePoint,dc.distance FROM beacons b
INNER JOIN deviceBeaconConnection dc
ON b.idbeacon = dc.idbeacon AND dc.idconnection = 7) bd
INNER JOIN floorMapPoints fmp
ON fmp.coordinatePoint = bd.coordinatePoint;
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    1 rows affected.





<table>
    <tr>
        <th>x</th>
        <th>y</th>
        <th>distance</th>
    </tr>
    <tr>
        <td>4</td>
        <td>13</td>
        <td>14.318</td>
    </tr>
</table>




```python
%%sql
SELECT x,y,distance FROM 
(SELECT b.coordinatePoint,dc.distance FROM beacons b
INNER JOIN deviceBeaconConnection dc
ON b.idbeacon = dc.idbeacon AND dc.idconnection = 8) bd
INNER JOIN floorMapPoints fmp
ON fmp.coordinatePoint = bd.coordinatePoint;
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    1 rows affected.





<table>
    <tr>
        <th>x</th>
        <th>y</th>
        <th>distance</th>
    </tr>
    <tr>
        <td>7</td>
        <td>15</td>
        <td>12.083</td>
    </tr>
</table>




```python
%%sql
CALL get_3_connected_beacons_coordinate_and_distance(6,7,8)
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    3 rows affected.





<table>
    <tr>
        <th>x</th>
        <th>y</th>
        <th>distance</th>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>8</td>
    </tr>
    <tr>
        <td>4</td>
        <td>13</td>
        <td>14</td>
    </tr>
    <tr>
        <td>7</td>
        <td>15</td>
        <td>12</td>
    </tr>
</table>



## Positing test

### Trilateration Positioning Algorithm


```python
# Trilateration Positioning Algorithm
def trilateration(beacons=None,distance=None):
    A = 2*(beacons.iloc[2].y - beacons.iloc[0].y)
    A_ = 2*(beacons.iloc[1].y - beacons.iloc[0].y)
    B = 2*(beacons.iloc[2].x - beacons.iloc[0].x)
    B_ = 2*(beacons.iloc[1].x - beacons.iloc[0].x)
    
    delta_1 = np.square(distance[0]) - np.square(distance[2]) + np.square(beacons.iloc[2].y) - np.square(beacons.iloc[0].y) + np.square(beacons.iloc[2].x) - np.square(beacons.iloc[0].x)
    delta_2 = np.square(distance[0]) - np.square(distance[1]) + np.square(beacons.iloc[1].y) - np.square(beacons.iloc[0].y) + np.square(beacons.iloc[1].x) - np.square(beacons.iloc[0].x)
    
    device_x = (delta_1 * A_ - delta_2 * A)/(B * A_ - B_ * A)
    device_y = (delta_1 * B_ - delta_2 * B)/(B_ * A - B * A_)
    
    return (round(device_x),round(device_y))
```

### Get a particular device current position


```python
%%sql
select * from get_user_and_device;
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    15 rows affected.





<table>
    <tr>
        <th>idcustomer</th>
        <th>firstName</th>
        <th>lastName</th>
        <th>iddevice</th>
        <th>deviceType</th>
        <th>NumConnectionsAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>2</td>
        <td>Phone</td>
        <td>3</td>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>6</td>
        <td>Laptop</td>
        <td>0</td>
    </tr>
    <tr>
        <td>1</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>7</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>2</td>
        <td>first_name_1</td>
        <td>last_name_1</td>
        <td>3</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>2</td>
        <td>first_name_1</td>
        <td>last_name_1</td>
        <td>9</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>3</td>
        <td>first_name_2</td>
        <td>last_name_2</td>
        <td>15</td>
        <td>Phone</td>
        <td>0</td>
    </tr>
    <tr>
        <td>4</td>
        <td>first_name_3</td>
        <td>last_name_3</td>
        <td>4</td>
        <td>Phone</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>first_name_3</td>
        <td>last_name_3</td>
        <td>8</td>
        <td>Ipad</td>
        <td>0</td>
    </tr>
    <tr>
        <td>5</td>
        <td>first_name_4</td>
        <td>last_name_4</td>
        <td>5</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>first_name_5</td>
        <td>last_name_5</td>
        <td>10</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>7</td>
        <td>first_name_6</td>
        <td>last_name_6</td>
        <td>11</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>8</td>
        <td>first_name_7</td>
        <td>last_name_7</td>
        <td>12</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>9</td>
        <td>first_name_8</td>
        <td>last_name_8</td>
        <td>13</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
    <tr>
        <td>10</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>14</td>
        <td>Phone</td>
        <td>4</td>
    </tr>
    <tr>
        <td>11</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>1</td>
        <td>Phone</td>
        <td>5</td>
    </tr>
</table>




```python
# Get best 3 connections for a particular device
iddevice = 2
sql = 'CALL get_current_best_3_connections('+str(iddevice)+',@number,@c1,@c2,@c3);'
best_3_connection = pd.read_sql(sql,connection)
best_3_connection
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
      <th>num_available_connections</th>
      <th>connection_1</th>
      <th>connection_2</th>
      <th>connection_3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3</td>
      <td>6</td>
      <td>8</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
%%sql
select * from devicebeaconconnection
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
    42 rows affected.





<table>
    <tr>
        <th>idconnection</th>
        <th>iddevice</th>
        <th>idbeacon</th>
        <th>distance</th>
        <th>beaconRankbyDist</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>5</td>
        <td>7.211</td>
        <td>4</td>
    </tr>
    <tr>
        <td>2</td>
        <td>1</td>
        <td>6</td>
        <td>10.0</td>
        <td>5</td>
    </tr>
    <tr>
        <td>3</td>
        <td>1</td>
        <td>1</td>
        <td>5.831</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>2</td>
        <td>4.0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>1</td>
        <td>7</td>
        <td>5.0</td>
        <td>2</td>
    </tr>
    <tr>
        <td>6</td>
        <td>2</td>
        <td>7</td>
        <td>8.062</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>2</td>
        <td>3</td>
        <td>14.318</td>
        <td>3</td>
    </tr>
    <tr>
        <td>8</td>
        <td>2</td>
        <td>2</td>
        <td>12.083</td>
        <td>2</td>
    </tr>
    <tr>
        <td>9</td>
        <td>3</td>
        <td>26</td>
        <td>6.403</td>
        <td>2</td>
    </tr>
    <tr>
        <td>10</td>
        <td>3</td>
        <td>30</td>
        <td>6.0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>3</td>
        <td>32</td>
        <td>8.944</td>
        <td>3</td>
    </tr>
    <tr>
        <td>12</td>
        <td>3</td>
        <td>31</td>
        <td>9.0</td>
        <td>4</td>
    </tr>
    <tr>
        <td>13</td>
        <td>4</td>
        <td>19</td>
        <td>8.944</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>4</td>
        <td>21</td>
        <td>12.806</td>
        <td>3</td>
    </tr>
    <tr>
        <td>15</td>
        <td>4</td>
        <td>20</td>
        <td>11.705</td>
        <td>2</td>
    </tr>
    <tr>
        <td>16</td>
        <td>5</td>
        <td>17</td>
        <td>8.602</td>
        <td>5</td>
    </tr>
    <tr>
        <td>17</td>
        <td>5</td>
        <td>12</td>
        <td>5.657</td>
        <td>4</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>13</td>
        <td>3.162</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>5</td>
        <td>18</td>
        <td>3.606</td>
        <td>2</td>
    </tr>
    <tr>
        <td>20</td>
        <td>5</td>
        <td>14</td>
        <td>4.123</td>
        <td>3</td>
    </tr>
    <tr>
        <td>21</td>
        <td>11</td>
        <td>27</td>
        <td>6.083</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>11</td>
        <td>28</td>
        <td>6.708</td>
        <td>3</td>
    </tr>
    <tr>
        <td>23</td>
        <td>11</td>
        <td>23</td>
        <td>9.434</td>
        <td>4</td>
    </tr>
    <tr>
        <td>24</td>
        <td>11</td>
        <td>24</td>
        <td>6.403</td>
        <td>2</td>
    </tr>
    <tr>
        <td>25</td>
        <td>12</td>
        <td>38</td>
        <td>9.849</td>
        <td>3</td>
    </tr>
    <tr>
        <td>26</td>
        <td>12</td>
        <td>39</td>
        <td>9.0</td>
        <td>2</td>
    </tr>
    <tr>
        <td>27</td>
        <td>12</td>
        <td>34</td>
        <td>13.601</td>
        <td>5</td>
    </tr>
    <tr>
        <td>28</td>
        <td>12</td>
        <td>35</td>
        <td>10.63</td>
        <td>4</td>
    </tr>
    <tr>
        <td>29</td>
        <td>12</td>
        <td>40</td>
        <td>7.211</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>13</td>
        <td>47</td>
        <td>9.22</td>
        <td>5</td>
    </tr>
    <tr>
        <td>31</td>
        <td>13</td>
        <td>48</td>
        <td>6.403</td>
        <td>4</td>
    </tr>
    <tr>
        <td>32</td>
        <td>13</td>
        <td>52</td>
        <td>4.0</td>
        <td>2</td>
    </tr>
    <tr>
        <td>33</td>
        <td>13</td>
        <td>54</td>
        <td>4.472</td>
        <td>3</td>
    </tr>
    <tr>
        <td>34</td>
        <td>13</td>
        <td>53</td>
        <td>1.0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>35</td>
        <td>14</td>
        <td>4</td>
        <td>3.162</td>
        <td>2</td>
    </tr>
    <tr>
        <td>36</td>
        <td>14</td>
        <td>8</td>
        <td>2.236</td>
        <td>1</td>
    </tr>
    <tr>
        <td>37</td>
        <td>14</td>
        <td>10</td>
        <td>6.403</td>
        <td>4</td>
    </tr>
    <tr>
        <td>38</td>
        <td>14</td>
        <td>9</td>
        <td>5.099</td>
        <td>3</td>
    </tr>
    <tr>
        <td>39</td>
        <td>10</td>
        <td>25</td>
        <td>12.649</td>
        <td>4</td>
    </tr>
    <tr>
        <td>40</td>
        <td>10</td>
        <td>26</td>
        <td>9.487</td>
        <td>3</td>
    </tr>
    <tr>
        <td>41</td>
        <td>10</td>
        <td>30</td>
        <td>5.385</td>
        <td>2</td>
    </tr>
    <tr>
        <td>42</td>
        <td>10</td>
        <td>32</td>
        <td>1.0</td>
        <td>1</td>
    </tr>
</table>




```python
# get connected 3 beacons coordinate and distance
sql = 'CALL get_3_connected_beacons_coordinate_and_distance('\
                    +str(best_3_connection.connection_1[0])+','\
                    +str(best_3_connection.connection_2[0])+','\
                    +str(best_3_connection.connection_3[0])+')'
coordinate_distance = pd.read_sql(sql,connection)
coordinate_distance
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
      <th>x</th>
      <th>y</th>
      <th>distance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>11</td>
      <td>14</td>
      <td>8</td>
    </tr>
    <tr>
      <th>1</th>
      <td>7</td>
      <td>15</td>
      <td>12</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4</td>
      <td>13</td>
      <td>14</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Trilateration Positioning Algorithm
def trilateration(beacons=None,distance=None):
    A = 2*(beacons.iloc[2].y - beacons.iloc[0].y)
    A_ = 2*(beacons.iloc[1].y - beacons.iloc[0].y)
    B = 2*(beacons.iloc[2].x - beacons.iloc[0].x)
    B_ = 2*(beacons.iloc[1].x - beacons.iloc[0].x)
    
    delta_1 = np.square(distance[0]) - np.square(distance[2]) + np.square(beacons.iloc[2].y) - np.square(beacons.iloc[0].y) + np.square(beacons.iloc[2].x) - np.square(beacons.iloc[0].x)
    delta_2 = np.square(distance[0]) - np.square(distance[1]) + np.square(beacons.iloc[1].y) - np.square(beacons.iloc[0].y) + np.square(beacons.iloc[1].x) - np.square(beacons.iloc[0].x)
    
    device_x = (delta_1 * A_ - delta_2 * A)/(B * A_ - B_ * A)
    device_y = (delta_1 * B_ - delta_2 * B)/(B_ * A - B * A_)
    
    return (round(device_x),round(device_y))
```


```python
current_x,current_y = trilateration(beacons = coordinate_distance,distance = coordinate_distance.distance)
(current_x,current_y)
```




    (18.0, 9.0)




```python
# Plot the current position
plt.figure(figsize=(10,10))
circle = plt.Circle((coordinate_distance.x[0], coordinate_distance.y[0]), coordinate_distance.distance[0], color='y', fill=False)
plt.gcf().gca().add_artist(circle)
circle = plt.Circle((coordinate_distance.x[1], coordinate_distance.y[1]), coordinate_distance.distance[1], color='r', fill=False)
plt.gcf().gca().add_artist(circle)
circle = plt.Circle((coordinate_distance.x[2], coordinate_distance.y[2]), coordinate_distance.distance[2], color='b', fill=False)
plt.gcf().gca().add_artist(circle)

plt.scatter(coordinate_distance.x,coordinate_distance.y)
plt.scatter(current_x,current_y)
plt.xlim(0, 25)
plt.ylim(0, 25)
```




    (0, 25)




![png](output_26_1.png)


7	12
11	11
11	8


```python
# Plot the current position
plt.figure(figsize=(10,10))
circle = plt.Circle((4, 16), 5.83, color='y', fill=False)
plt.gcf().gca().add_artist(circle)
circle = plt.Circle((7, 15), 4, color='r', fill=False)
plt.gcf().gca().add_artist(circle)
circle = plt.Circle((11, 14), 5, color='b', fill=False)
plt.gcf().gca().add_artist(circle)

plt.scatter(7,11)
plt.scatter(current_x,current_y)
plt.xlim(0, 25)
plt.ylim(0, 25)
```




    (0, 25)




![png](output_28_1.png)



```python

```
