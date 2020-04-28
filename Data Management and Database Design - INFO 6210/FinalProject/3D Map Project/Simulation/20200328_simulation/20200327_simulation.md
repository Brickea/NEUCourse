
<div style='text-align:right;'>DMDD Final Project Simulation</div>
<div style='text-align:right;'>Zixiao 20200328</div>

# Simulation

## Content

* [Abstract](#Abstract)
* [Connect to database](#Connect-to-database)
* [Map and user data simulation and test](#Map-and-user-data-simulation-and-test)

## Abstract

In this simulation, we didn't consider multithreading, which means we assume there is only one cumstomer is using the application.

So the main goal for this simulatio is to test if the database can store the data and interact with each other correctly.

The database for this simulation is as following:

![](20200329_ERD_Zixiao.png)


This simulation include following things:
* 1. Test if the database can store right data into tables:
    * Map data simulation
        * ```building```
        * ```floorMap```
        * ```floorMapPoints```
        * ```locationToVisit```
        * ```locationToChangeFloor```
        * ```beacons```
    * User information simulation
        * ```adminUser```
        * ```customer```
* 2. Test if the connections between device and beacon are generated correctly
    * ```device```
    * ```deviceBeaconConnection```
* 3. Test if the positioning is updated correctly
    * ```deviceCurrentPosition```
* 4. Test if the navigation is generated correctly
    * ```navigationRequest```
* 5. Test if the paths are generated correctly
    * ```singleFloorPath```
    * ```singleFloorPathPoints```
    * ```floorAlongtheWay```
    * ```floorPathCollection```
    * ```floorPath```
* 6. Test if the system is update correctly when navigation request is over
    * ```navigationComplete```
    * ```navigationRequest```

## Connect to database


```python
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
# import the magic code for using sql in jupyter notebook
%load_ext sql
# local database
# %sql mysql+pymysql://root:fjwwzx970814@localhost/mydb
# remote database
%sql mysql+pymysql://brickea_mac:fjwWZX970814@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
```

    The sql extension is already loaded. To reload it, use:
      %reload_ext sql
    




    'Connected: brickea_mac@mydb'




```python
%%sql
show tables
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    18 rows affected.
    




<table>
    <tr>
        <th>Tables_in_mydb</th>
    </tr>
    <tr>
        <td>adminuser</td>
    </tr>
    <tr>
        <td>beacons</td>
    </tr>
    <tr>
        <td>building</td>
    </tr>
    <tr>
        <td>customer</td>
    </tr>
    <tr>
        <td>device</td>
    </tr>
    <tr>
        <td>devicebeaconconnection</td>
    </tr>
    <tr>
        <td>devicecurrentposition</td>
    </tr>
    <tr>
        <td>flooralongtheway</td>
    </tr>
    <tr>
        <td>floormap</td>
    </tr>
    <tr>
        <td>floormappoints</td>
    </tr>
    <tr>
        <td>floorpath</td>
    </tr>
    <tr>
        <td>floorpathcollection</td>
    </tr>
    <tr>
        <td>locationtochangefloor</td>
    </tr>
    <tr>
        <td>locationtovisit</td>
    </tr>
    <tr>
        <td>navigationcomplete</td>
    </tr>
    <tr>
        <td>navigationrequest</td>
    </tr>
    <tr>
        <td>singlefloorpath</td>
    </tr>
    <tr>
        <td>singlefloorpathpoints</td>
    </tr>
</table>




```python
import sqlalchemy as sqlManager
```


```python
# Create connection with database
connection = sqlManager.create_engine('mysql+pymysql://brickea_mac:fjwWZX970814@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb?charset=utf8')
```

## Map and user data simulation and test

### Map data simulation

Because I only got one map sample as following

So I will use it as a template to generate 5 different floor maps for 2 different buildings

And I assume the coordinate original in the map is at its top left

The map is 20 X 21

![](res/simulation_floor_map.png)

Here I assume 

* points within green line is a wall
* points within red circle is an elevator
* points within purple circle is a stair
* elevator and stair are in the same position for every floor
* elevator and stair can help human move to any floor

### building - table test

![](res/simulation_floor_map.png)


```python
# Generate building data
building = pd.DataFrame([
    [1,'building_1','address_1','description'],
    [2,'building_2','address_2','description'],
],columns=['idbuilding','name','address','description'])
building
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
      <th>idbuilding</th>
      <th>name</th>
      <th>address</th>
      <th>description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>building_1</td>
      <td>address_1</td>
      <td>description</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>building_2</td>
      <td>address_2</td>
      <td>description</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Insert data into database
pd.io.sql.to_sql(building,'building',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from building
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    2 rows affected.
    




<table>
    <tr>
        <th>idbuilding</th>
        <th>name</th>
        <th>address</th>
        <th>description</th>
    </tr>
    <tr>
        <td>1</td>
        <td>building_1</td>
        <td>address_1</td>
        <td>description</td>
    </tr>
    <tr>
        <td>2</td>
        <td>building_2</td>
        <td>address_2</td>
        <td>description</td>
    </tr>
</table>



### floorMap - table test


```python
def generate_floor_info(floor_number=[]):
    result = []
    floor_id = 0
    for building in range(len(floor_number)):
        for floor in range(floor_number[building]):
            result.append([floor_id+1,building+1,floor+1,('building_'+str(building+1)+'_floor_'+str(floor+1)),True])
            floor_id+=1
    return result
    
```


```python
floor_data = generate_floor_info(floor_number=[3,2])
floor_data
```




    [[1, 1, 1, 'building_1_floor_1', True],
     [2, 1, 2, 'building_1_floor_2', True],
     [3, 1, 3, 'building_1_floor_3', True],
     [4, 2, 1, 'building_2_floor_1', True],
     [5, 2, 2, 'building_2_floor_2', True]]




```python
floor_columns = ['idfloorMap','idbuilding','floorNumber','excelMap','ifupdate']
```


```python
# Generate floor data for each building
floor = pd.DataFrame(data=floor_data,columns=floor_columns)
floor
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
      <th>idfloorMap</th>
      <th>idbuilding</th>
      <th>floorNumber</th>
      <th>excelMap</th>
      <th>ifupdate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>building_1_floor_1</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
      <td>2</td>
      <td>building_1_floor_2</td>
      <td>True</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>1</td>
      <td>3</td>
      <td>building_1_floor_3</td>
      <td>True</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2</td>
      <td>1</td>
      <td>building_2_floor_1</td>
      <td>True</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2</td>
      <td>2</td>
      <td>building_2_floor_2</td>
      <td>True</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Insert data into database
pd.io.sql.to_sql(floor,'floorMap',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from floorMap
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    5 rows affected.
    




<table>
    <tr>
        <th>idfloorMap</th>
        <th>idbuilding</th>
        <th>floorNumber</th>
        <th>excelMap</th>
        <th>ifupdate</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>b&#x27;building_1_floor_1&#x27;</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>1</td>
        <td>2</td>
        <td>b&#x27;building_1_floor_2&#x27;</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>1</td>
        <td>3</td>
        <td>b&#x27;building_1_floor_3&#x27;</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>2</td>
        <td>1</td>
        <td>b&#x27;building_2_floor_1&#x27;</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>2</td>
        <td>2</td>
        <td>b&#x27;building_2_floor_2&#x27;</td>
        <td>1</td>
    </tr>
</table>



### floorMapPoints - table test

Here I assume bottom left is the coordinate original point


```python
np.zeros((3,3))
```




    array([[0., 0., 0.],
           [0., 0., 0.],
           [0., 0., 0.]])




```python
def generate_floor_basic_points(x_len,y_len):
    return np.zeros((x_len,y_len))
```


```python
# The map is 20 X 21 (unit:meter)
floor_map_data = generate_floor_basic_points(20,21)
```


```python
def generate_wall(floor_map,wall=[]):
    # wall should input coordinate of start point and end point
    # wall = [(start_x,start_y),(end_x,end_y)]
    start = wall[0]
    end = wall[1]
    for list_x in range(start[1],end[1]+1):
        for list_y in range(start[0],end[0]+1):
            floor_map[list_x][list_y] = 1
    return floor_map
```


```python
# Generate wall
floor_map_data = generate_wall(floor_map_data,wall = [(2,2),(9,2)])
floor_map_data = generate_wall(floor_map_data,wall = [(9,2),(9,8)])
floor_map_data = generate_wall(floor_map_data,wall = [(2,2),(2,18)])
floor_map_data = generate_wall(floor_map_data,wall = [(2,18),(9,18)])
floor_map_data = generate_wall(floor_map_data,wall = [(2,10),(9,10)])
floor_map_data = generate_wall(floor_map_data,wall = [(9,13),(9,16)])
floor_map_data = generate_wall(floor_map_data,wall = [(9,16),(17,16)])
floor_map_data = generate_wall(floor_map_data,wall = [(11,2),(17,2)])
floor_map_data = generate_wall(floor_map_data,wall = [(17,2),(17,16)])
floor_map_data = generate_wall(floor_map_data,wall = [(14,4),(17,4)])
floor_map_data = generate_wall(floor_map_data,wall = [(12,4),(12,7)])
floor_map_data = generate_wall(floor_map_data,wall = [(12,7),(17,7)])
```


```python
plt.imshow(floor_map_data)
```




    <matplotlib.image.AxesImage at 0x2ae4576a208>




![png](output_31_1.png)



```python
def generate_floor_map_point(floor_map,floor_id_list):
    result = []
    id_coordinate = 1
    for floor_id in floor_id_list:
        for y, y_values in enumerate(floor_map):
            for x, value in enumerate(y_values):
                passable = True if value == 0 else False
                result.append([id_coordinate,floor_id,x,y,passable])
                id_coordinate+=1
    return result
```


```python
floor_map_points_data = generate_floor_map_point(floor_map_data,[1,2,3,4,5])
floor_map_points_columns = ['coordinatePoint','idfloorMap','x','y','ifpassable']
```


```python
len(floor_map_points_data)
```




    2100




```python
20*21*5
```




    2100




```python
floor_map_points = pd.DataFrame(data = floor_map_points_data,columns=floor_map_points_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(floor_map_points,'floorMapPoints',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from floorMapPoints
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    2100 rows affected.
    




<table>
    <tr>
        <th>coordinatePoint</th>
        <th>idfloorMap</th>
        <th>x</th>
        <th>y</th>
        <th>ifpassable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>0</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>1</td>
        <td>1</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>3</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>1</td>
        <td>4</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>1</td>
        <td>5</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>1</td>
        <td>6</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>1</td>
        <td>7</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>1</td>
        <td>8</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>1</td>
        <td>9</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>1</td>
        <td>10</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>1</td>
        <td>11</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1</td>
        <td>12</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>1</td>
        <td>13</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>1</td>
        <td>14</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>1</td>
        <td>15</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>1</td>
        <td>16</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>1</td>
        <td>17</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>1</td>
        <td>18</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>1</td>
        <td>19</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>1</td>
        <td>20</td>
        <td>0</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>1</td>
        <td>0</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>1</td>
        <td>2</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>1</td>
        <td>3</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>26</td>
        <td>1</td>
        <td>4</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>27</td>
        <td>1</td>
        <td>5</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>1</td>
        <td>6</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>1</td>
        <td>7</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>1</td>
        <td>8</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>1</td>
        <td>9</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>1</td>
        <td>10</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>33</td>
        <td>1</td>
        <td>11</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>34</td>
        <td>1</td>
        <td>12</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>35</td>
        <td>1</td>
        <td>13</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>36</td>
        <td>1</td>
        <td>14</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>37</td>
        <td>1</td>
        <td>15</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>...</td>
    </tr>
    <tr>
        <td>2093</td>
        <td>5</td>
        <td>13</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2094</td>
        <td>5</td>
        <td>14</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2095</td>
        <td>5</td>
        <td>15</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2096</td>
        <td>5</td>
        <td>16</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2097</td>
        <td>5</td>
        <td>17</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2098</td>
        <td>5</td>
        <td>18</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2099</td>
        <td>5</td>
        <td>19</td>
        <td>19</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2100</td>
        <td>5</td>
        <td>20</td>
        <td>19</td>
        <td>1</td>
    </tr>
</table>



## locationToVisit - table test

The location in building 1 floor 1 is as follow

Coordinate of location 1 and location 2:

* location 1: (9,9)
* location 2: (9,11)
* location 3: (9,17)

![](../res/simulation_floor_map_floor_1_locationToVisited.png)


```python
floor = 1
x = 9
y= 17
sql = 'select * from'\
' (select * from floorMapPoints fmp'\
' where fmp.idfloorMap = ' + str(floor) + ') fp'\
' where fp.x = ' + str(x) + ' and fp.y = '+ str(y)

print(sql)
df = pd.read_sql(sql,connection)['coordinatePoint'][0]
df
```

    select * from (select * from floorMapPoints fmp where fmp.idfloorMap = 1) fp where fp.x = 9 and fp.y = 17
    




    367




```python
# Generate locations for building 1 floor 1
def generate_location_to_visited(floor=[], locations_coordinate=[]):
    result = []
    id_location = 1
    for floor_id in floor:
        for location_coordinate in locations_coordinate:
            floor = floor_id
            x = location_coordinate[0]
            y = location_coordinate[1]
            location_no = len(locations_coordinate) if id_location % len(locations_coordinate)==0 else id_location % len(locations_coordinate)
            
            sql = 'select * from'\
            ' (select * from floorMapPoints fmp'\
            ' where fmp.idfloorMap = ' + str(floor) + ') fp'\
            ' where fp.x = ' + str(x) + ' and fp.y = '+ str(y)
            map_point_id = pd.read_sql(sql,connection)['coordinatePoint'][0]
            
            result.append([id_location,map_point_id,'floor_'+str(floor)+'_location_'+str(location_no),'floor_'+str(floor)+'_location_'+str(location_no)+'_description'])
            id_location+=1
            
    return result
```


```python
location_to_visited_data = generate_location_to_visited(floor=[1,2,3,4,5],locations_coordinate=[(9,9),(9,11),(9,17)])
```


```python
location_to_visited_columns = ['idlocationToVisiti','coordinatePoint','name','description']
location_to_visited = pd.DataFrame(data=location_to_visited_data,columns=location_to_visited_columns)
```


```python
pd.io.sql.to_sql(location_to_visited,'locationToVisited',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from locationToVisited
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    15 rows affected.
    




<table>
    <tr>
        <th>idlocationToVisiti</th>
        <th>coordinatePoint</th>
        <th>name</th>
        <th>description</th>
    </tr>
    <tr>
        <td>1</td>
        <td>199</td>
        <td>floor_1_location_1</td>
        <td>floor_1_location_1_description</td>
    </tr>
    <tr>
        <td>2</td>
        <td>241</td>
        <td>floor_1_location_2</td>
        <td>floor_1_location_2_description</td>
    </tr>
    <tr>
        <td>3</td>
        <td>367</td>
        <td>floor_1_location_3</td>
        <td>floor_1_location_3_description</td>
    </tr>
    <tr>
        <td>4</td>
        <td>619</td>
        <td>floor_2_location_1</td>
        <td>floor_2_location_1_description</td>
    </tr>
    <tr>
        <td>5</td>
        <td>661</td>
        <td>floor_2_location_2</td>
        <td>floor_2_location_2_description</td>
    </tr>
    <tr>
        <td>6</td>
        <td>787</td>
        <td>floor_2_location_3</td>
        <td>floor_2_location_3_description</td>
    </tr>
    <tr>
        <td>7</td>
        <td>1039</td>
        <td>floor_3_location_1</td>
        <td>floor_3_location_1_description</td>
    </tr>
    <tr>
        <td>8</td>
        <td>1081</td>
        <td>floor_3_location_2</td>
        <td>floor_3_location_2_description</td>
    </tr>
    <tr>
        <td>9</td>
        <td>1207</td>
        <td>floor_3_location_3</td>
        <td>floor_3_location_3_description</td>
    </tr>
    <tr>
        <td>10</td>
        <td>1459</td>
        <td>floor_4_location_1</td>
        <td>floor_4_location_1_description</td>
    </tr>
    <tr>
        <td>11</td>
        <td>1501</td>
        <td>floor_4_location_2</td>
        <td>floor_4_location_2_description</td>
    </tr>
    <tr>
        <td>12</td>
        <td>1627</td>
        <td>floor_4_location_3</td>
        <td>floor_4_location_3_description</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1879</td>
        <td>floor_5_location_1</td>
        <td>floor_5_location_1_description</td>
    </tr>
    <tr>
        <td>14</td>
        <td>1921</td>
        <td>floor_5_location_2</td>
        <td>floor_5_location_2_description</td>
    </tr>
    <tr>
        <td>15</td>
        <td>2047</td>
        <td>floor_5_location_3</td>
        <td>floor_5_location_3_description</td>
    </tr>
</table>



## locationToChangeFloor - table test

**Building 1 floor 1 2 3**

![](../res/simulation_floor_map_building_1_floor_1.png)

In building 1:

* elevator: (13,4)
* start: (13,14)

**Building 2 floor 1 2**

![](../res/simulation_floor_map_building_2_floor_1.png)

In building 2:

* elevator: (4,16)
* stair: (4,4)


```python
# Generate locationToChangeFloor for building 1 floor 1
def generate_location_to_change_floor(floor=[], name=[], locations_coordinate=[]):
    result = []
    id_location = 1
    for floor_id in floor:
        for location_coordinate in locations_coordinate:
            floor = floor_id
            x = location_coordinate[0]
            y = location_coordinate[1]
            location_no = len(locations_coordinate) if id_location % len(locations_coordinate)==0 else id_location % len(locations_coordinate)
            location_type = name[location_no-1]
            is_friendly = True if name[location_no-1] == 'elevator' else False
            timeCost = 5 if is_friendly else 10
            
            sql = 'select * from'\
            ' (select * from floorMapPoints fmp'\
            ' where fmp.idfloorMap = ' + str(floor) + ') fp'\
            ' where fp.x = ' + str(x) + ' and fp.y = '+ str(y)
            map_point_id = pd.read_sql(sql,connection)['coordinatePoint'][0]
            
            result.append([id_location,
                           map_point_id,
                           'floor_'+str(floor)+'_location_to_change_floor_'+str(location_no)+'_'+name[location_no-1],
                           location_type,
                           is_friendly,
                           timeCost])
            id_location+=1
            
    return result
```


```python
location_to_change_floor_data = generate_location_to_change_floor(floor=[1,2,3],name=['elevator','stair'], locations_coordinate=[(13,4),(13,14)])
```


```python
location_to_change_floor_columns = ['idlocationToChangeFloor','coordinatePoint','name','type','isdisabilityFriendly','timeCost']
location_to_change_floor = pd.DataFrame(data=location_to_change_floor_data,columns=location_to_change_floor_columns)
location_to_change_floor
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
      <th>idlocationToChangeFloor</th>
      <th>coordinatePoint</th>
      <th>name</th>
      <th>type</th>
      <th>isdisabilityFriendly</th>
      <th>timeCost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>98</td>
      <td>floor_1_location_to_change_floor_1_elevator</td>
      <td>elevator</td>
      <td>True</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>308</td>
      <td>floor_1_location_to_change_floor_2_stair</td>
      <td>stair</td>
      <td>False</td>
      <td>10</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>518</td>
      <td>floor_2_location_to_change_floor_1_elevator</td>
      <td>elevator</td>
      <td>True</td>
      <td>5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>728</td>
      <td>floor_2_location_to_change_floor_2_stair</td>
      <td>stair</td>
      <td>False</td>
      <td>10</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>938</td>
      <td>floor_3_location_to_change_floor_1_elevator</td>
      <td>elevator</td>
      <td>True</td>
      <td>5</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>1148</td>
      <td>floor_3_location_to_change_floor_2_stair</td>
      <td>stair</td>
      <td>False</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.io.sql.to_sql(location_to_change_floor,'locationToChangeFloor',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from locationToChangeFloor
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    6 rows affected.
    




<table>
    <tr>
        <th>idlocationToChangeFloor</th>
        <th>coordinatePoint</th>
        <th>name</th>
        <th>type</th>
        <th>isdisabilityFriendly</th>
        <th>timeCost</th>
    </tr>
    <tr>
        <td>1</td>
        <td>98</td>
        <td>floor_1_location_to_change_floor_1_elevator</td>
        <td>elevator</td>
        <td>1</td>
        <td>5</td>
    </tr>
    <tr>
        <td>2</td>
        <td>308</td>
        <td>floor_1_location_to_change_floor_2_stair</td>
        <td>stair</td>
        <td>0</td>
        <td>10</td>
    </tr>
    <tr>
        <td>3</td>
        <td>518</td>
        <td>floor_2_location_to_change_floor_1_elevator</td>
        <td>elevator</td>
        <td>1</td>
        <td>5</td>
    </tr>
    <tr>
        <td>4</td>
        <td>728</td>
        <td>floor_2_location_to_change_floor_2_stair</td>
        <td>stair</td>
        <td>0</td>
        <td>10</td>
    </tr>
    <tr>
        <td>5</td>
        <td>938</td>
        <td>floor_3_location_to_change_floor_1_elevator</td>
        <td>elevator</td>
        <td>1</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>1148</td>
        <td>floor_3_location_to_change_floor_2_stair</td>
        <td>stair</td>
        <td>0</td>
        <td>10</td>
    </tr>
</table>



## beacons - table test

![](../res/simulation_floor_map_floor_1_beacons.png)

These are beacons positions inside floors

I assume all floors use the same pattern

The position:

* (4,4)
* (7,5)
* (4,7)
* (7,8)
* (11,3)
* (15,3)
* (11,6)
* (11,9)
* (11,12)
* (15,11)
* (15,14)


```python
# Generate beacon for all floor
def generate_beacon_location(floor=[], beacons_locations_coordinate=[]):
    result = []
    id_location = 1
    for floor_id in floor:
        for location_coordinate in beacons_locations_coordinate:
            floor = floor_id
            x = location_coordinate[0]
            y = location_coordinate[1]
            location_no = len(beacons_locations_coordinate) if id_location % len(beacons_locations_coordinate)==0 else id_location % len(beacons_locations_coordinate)
            
            sql = 'select * from'\
            ' (select * from floorMapPoints fmp'\
            ' where fmp.idfloorMap = ' + str(floor) + ') fp'\
            ' where fp.x = ' + str(x) + ' and fp.y = '+ str(y)
            map_point_id = pd.read_sql(sql,connection)['coordinatePoint'][0]
            
            result.append([id_location,
                           map_point_id,
                           'floor_'+str(floor)+'_beacon_model_'+str(location_no),
                           'floor_'+str(floor)+'_beacon_'+str(location_no)+'_description',
                           True])
            id_location+=1
            
    return result
```


```python
beacon_location_data = generate_beacon_location(floor=[1,2,3,4,5],beacons_locations_coordinate=[(4,4),(7,5),(4,7),(7,8),(11,3),(15,3),(11,6),(11,9),(11,12),(15,11),(15,14)])
```


```python
beacon_location_columns = ['idbeacon','coordinatePoint','beaconModel','description','ifwork']
beacon_location = pd.DataFrame(data=beacon_location_data,columns=beacon_location_columns)
```


```python
pd.io.sql.to_sql(beacon_location,'beacons',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from beacons
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    55 rows affected.
    




<table>
    <tr>
        <th>idbeacon</th>
        <th>coordinatePoint</th>
        <th>beaconModel</th>
        <th>description</th>
        <th>ifwork</th>
    </tr>
    <tr>
        <td>1</td>
        <td>89</td>
        <td>floor_1_beacon_model_1</td>
        <td>floor_1_beacon_1_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>113</td>
        <td>floor_1_beacon_model_2</td>
        <td>floor_1_beacon_2_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>152</td>
        <td>floor_1_beacon_model_3</td>
        <td>floor_1_beacon_3_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>176</td>
        <td>floor_1_beacon_model_4</td>
        <td>floor_1_beacon_4_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>75</td>
        <td>floor_1_beacon_model_5</td>
        <td>floor_1_beacon_5_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>79</td>
        <td>floor_1_beacon_model_6</td>
        <td>floor_1_beacon_6_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>138</td>
        <td>floor_1_beacon_model_7</td>
        <td>floor_1_beacon_7_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>201</td>
        <td>floor_1_beacon_model_8</td>
        <td>floor_1_beacon_8_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>264</td>
        <td>floor_1_beacon_model_9</td>
        <td>floor_1_beacon_9_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>247</td>
        <td>floor_1_beacon_model_10</td>
        <td>floor_1_beacon_10_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>310</td>
        <td>floor_1_beacon_model_11</td>
        <td>floor_1_beacon_11_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>509</td>
        <td>floor_2_beacon_model_1</td>
        <td>floor_2_beacon_1_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>533</td>
        <td>floor_2_beacon_model_2</td>
        <td>floor_2_beacon_2_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>572</td>
        <td>floor_2_beacon_model_3</td>
        <td>floor_2_beacon_3_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>596</td>
        <td>floor_2_beacon_model_4</td>
        <td>floor_2_beacon_4_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>495</td>
        <td>floor_2_beacon_model_5</td>
        <td>floor_2_beacon_5_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>499</td>
        <td>floor_2_beacon_model_6</td>
        <td>floor_2_beacon_6_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>558</td>
        <td>floor_2_beacon_model_7</td>
        <td>floor_2_beacon_7_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>621</td>
        <td>floor_2_beacon_model_8</td>
        <td>floor_2_beacon_8_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>684</td>
        <td>floor_2_beacon_model_9</td>
        <td>floor_2_beacon_9_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>667</td>
        <td>floor_2_beacon_model_10</td>
        <td>floor_2_beacon_10_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>730</td>
        <td>floor_2_beacon_model_11</td>
        <td>floor_2_beacon_11_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>929</td>
        <td>floor_3_beacon_model_1</td>
        <td>floor_3_beacon_1_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>953</td>
        <td>floor_3_beacon_model_2</td>
        <td>floor_3_beacon_2_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>992</td>
        <td>floor_3_beacon_model_3</td>
        <td>floor_3_beacon_3_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>26</td>
        <td>1016</td>
        <td>floor_3_beacon_model_4</td>
        <td>floor_3_beacon_4_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>27</td>
        <td>915</td>
        <td>floor_3_beacon_model_5</td>
        <td>floor_3_beacon_5_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>919</td>
        <td>floor_3_beacon_model_6</td>
        <td>floor_3_beacon_6_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>978</td>
        <td>floor_3_beacon_model_7</td>
        <td>floor_3_beacon_7_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>1041</td>
        <td>floor_3_beacon_model_8</td>
        <td>floor_3_beacon_8_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>1104</td>
        <td>floor_3_beacon_model_9</td>
        <td>floor_3_beacon_9_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>1087</td>
        <td>floor_3_beacon_model_10</td>
        <td>floor_3_beacon_10_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>33</td>
        <td>1150</td>
        <td>floor_3_beacon_model_11</td>
        <td>floor_3_beacon_11_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>34</td>
        <td>1349</td>
        <td>floor_4_beacon_model_1</td>
        <td>floor_4_beacon_1_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>35</td>
        <td>1373</td>
        <td>floor_4_beacon_model_2</td>
        <td>floor_4_beacon_2_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>36</td>
        <td>1412</td>
        <td>floor_4_beacon_model_3</td>
        <td>floor_4_beacon_3_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>37</td>
        <td>1436</td>
        <td>floor_4_beacon_model_4</td>
        <td>floor_4_beacon_4_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>38</td>
        <td>1335</td>
        <td>floor_4_beacon_model_5</td>
        <td>floor_4_beacon_5_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>39</td>
        <td>1339</td>
        <td>floor_4_beacon_model_6</td>
        <td>floor_4_beacon_6_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>1398</td>
        <td>floor_4_beacon_model_7</td>
        <td>floor_4_beacon_7_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>41</td>
        <td>1461</td>
        <td>floor_4_beacon_model_8</td>
        <td>floor_4_beacon_8_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>42</td>
        <td>1524</td>
        <td>floor_4_beacon_model_9</td>
        <td>floor_4_beacon_9_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>43</td>
        <td>1507</td>
        <td>floor_4_beacon_model_10</td>
        <td>floor_4_beacon_10_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>44</td>
        <td>1570</td>
        <td>floor_4_beacon_model_11</td>
        <td>floor_4_beacon_11_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>45</td>
        <td>1769</td>
        <td>floor_5_beacon_model_1</td>
        <td>floor_5_beacon_1_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>46</td>
        <td>1793</td>
        <td>floor_5_beacon_model_2</td>
        <td>floor_5_beacon_2_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>47</td>
        <td>1832</td>
        <td>floor_5_beacon_model_3</td>
        <td>floor_5_beacon_3_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>48</td>
        <td>1856</td>
        <td>floor_5_beacon_model_4</td>
        <td>floor_5_beacon_4_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>49</td>
        <td>1755</td>
        <td>floor_5_beacon_model_5</td>
        <td>floor_5_beacon_5_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>50</td>
        <td>1759</td>
        <td>floor_5_beacon_model_6</td>
        <td>floor_5_beacon_6_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>51</td>
        <td>1818</td>
        <td>floor_5_beacon_model_7</td>
        <td>floor_5_beacon_7_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>52</td>
        <td>1881</td>
        <td>floor_5_beacon_model_8</td>
        <td>floor_5_beacon_8_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>53</td>
        <td>1944</td>
        <td>floor_5_beacon_model_9</td>
        <td>floor_5_beacon_9_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>54</td>
        <td>1927</td>
        <td>floor_5_beacon_model_10</td>
        <td>floor_5_beacon_10_description</td>
        <td>1</td>
    </tr>
    <tr>
        <td>55</td>
        <td>1990</td>
        <td>floor_5_beacon_model_11</td>
        <td>floor_5_beacon_11_description</td>
        <td>1</td>
    </tr>
</table>



### User information simulation

* adminUser
* customer


```python
# Add admin user data
admin_user_data = [[1,'admin','admin']]
```


```python
admin_user_columns = ['idadminUser','name','password']
admin_user = pd.DataFrame(data = admin_user_data,columns=admin_user_columns)
```


```python
pd.io.sql.to_sql(admin_user,'adminUser',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from adminUser
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    1 rows affected.
    




<table>
    <tr>
        <th>idadminUser</th>
        <th>name</th>
        <th>password</th>
    </tr>
    <tr>
        <td>1</td>
        <td>admin</td>
        <td>admin</td>
    </tr>
</table>




```python
# Add customer user data
customer_user_data = []
for i in range(10):
    customer_user_data.append([
        i+1,
        'user_name_'+str(i),
        'password_'+str(i),
        'first_name_'+str(i),
        'last_name_'+str(i),
        False
    ])
customer_user_data.append([
    11,
    'disability_1',
    'password_'+str(i),
    'first_name_'+str(i),
    'last_name_'+str(i),
    True
])
```


```python
customer_user_columns = ['idcustomer','userName','password','firstName','lastName','isdisability']
customer_user = pd.DataFrame(data = customer_user_data,columns=customer_user_columns)
```


```python
pd.io.sql.to_sql(customer_user,'customer',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from customer
```

     * mysql+pymysql://brickea_mac:***@rm-0xih4pk94w41k3c5j8o.mysql.rds.aliyuncs.com/mydb
       mysql+pymysql://root:***@localhost/mydb
    11 rows affected.
    




<table>
    <tr>
        <th>idcustomer</th>
        <th>userName</th>
        <th>password</th>
        <th>firstName</th>
        <th>lastName</th>
        <th>isdisability</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_name_0</td>
        <td>password_0</td>
        <td>first_name_0</td>
        <td>last_name_0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_name_1</td>
        <td>password_1</td>
        <td>first_name_1</td>
        <td>last_name_1</td>
        <td>0</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_name_2</td>
        <td>password_2</td>
        <td>first_name_2</td>
        <td>last_name_2</td>
        <td>0</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_name_3</td>
        <td>password_3</td>
        <td>first_name_3</td>
        <td>last_name_3</td>
        <td>0</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_name_4</td>
        <td>password_4</td>
        <td>first_name_4</td>
        <td>last_name_4</td>
        <td>0</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_name_5</td>
        <td>password_5</td>
        <td>first_name_5</td>
        <td>last_name_5</td>
        <td>0</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_name_6</td>
        <td>password_6</td>
        <td>first_name_6</td>
        <td>last_name_6</td>
        <td>0</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_name_7</td>
        <td>password_7</td>
        <td>first_name_7</td>
        <td>last_name_7</td>
        <td>0</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_name_8</td>
        <td>password_8</td>
        <td>first_name_8</td>
        <td>last_name_8</td>
        <td>0</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_name_9</td>
        <td>password_9</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>0</td>
    </tr>
    <tr>
        <td>11</td>
        <td>disability_1</td>
        <td>password_9</td>
        <td>first_name_9</td>
        <td>last_name_9</td>
        <td>1</td>
    </tr>
</table>


