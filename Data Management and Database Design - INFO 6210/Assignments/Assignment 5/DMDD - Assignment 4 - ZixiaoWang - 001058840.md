<div style="text-align:right;">Assignment 4 For Data Management and Database Design</div>
<div style="text-align:right">Zixiao Wang 001058840</div>

# Assignment 4

## README

To communicate with SQL Databases from within a JupyterLab notebook, I can use the SQL "magic" provided by the [ipython-sql](https://github.com/catherinedevlin/ipython-sql) extension. "Magic" is JupyterLab's term for special commands that start with "%". Below, I'll use the _load_\__ext_ magic to load the ipython-sql extension. 


```python
%load_ext sql
```


```python
%sql mysql+pymysql://root:fjwwzx970814@localhost/world
```




    'Connected: root@world'



## Scheme Design

I am plannin to create three tables to store data.

1. Students table
    1. Index
    2. NUID
    3. Name
2. Teams table
    1. Index
    2. Team_name
3. Topics table
    1. Index
    2. Topic_name

The relationship between these tables:

1. Each student can have many topics
2. Each team can have many student as members.

So "Teams to Students" is "One to Many"  
"Students to Topics" is "One to Many"

### Create database


```python
%%sql
CREATE SCHEMA `DMDD_class` ;
```

### Create three table

Create students table


```python
%%sql
CREATE TABLE `DMDD_class`.`Students` (
  `idStudents` INT NOT NULL,
  `NUID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudents`),
  UNIQUE INDEX `NUID_UNIQUE` (`NUID` ASC));

```

Create Teams table


```python
%%sql
CREATE TABLE `DMDD_class`.`Teams` (
  `idTeams` INT NOT NULL,
  `Team_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTeams`));

```

Create the Topics table


```python
%%sql
CREATE TABLE `DMDD_class`.`Topics` (
  `idTopics` INT NOT NULL,
  `Topic_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTopics`));

```

### Add relationship to tables

Add "one to many" to "Team to Students"  
This means add a foreign key to students table, which point to teams id.


```python
%%sql
ALTER TABLE `DMDD_class`.`Students` 
ADD COLUMN `Student_Team` INT NULL AFTER `Name`,
ADD INDEX `Student_Team_idx` (`Student_Team` ASC);
ALTER TABLE `DMDD_class`.`Students` 
ADD CONSTRAINT `Student_Team`
  FOREIGN KEY (`Student_Team`)
  REFERENCES `DMDD_class`.`Teams` (`idTeams`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

```

Add "one to many" to "Student to Topics"  
This means add a foreign key to topics table, which point to student id.


```python
%%sql 
ALTER TABLE `DMDD_class`.`Topics` 
ADD COLUMN `Student_id` INT NULL AFTER `Topic_name`,
ADD INDEX `Student_id_idx` (`Student_id` ASC);
ALTER TABLE `DMDD_class`.`Topics` 
ADD CONSTRAINT `Student_id`
  FOREIGN KEY (`Student_id`)
  REFERENCES `DMDD_class`.`Students` (`idStudents`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

```

## Assignment Part 1


```python
%sql SHOW databases;
```

    * mysql+pymysql://root:***@localhost/world
    8 rows affected.





<table>
    <tr>
        <th>Database</th>
    </tr>
    <tr>
        <td>DMDD_class</td>
    </tr>
    <tr>
        <td>information_schema</td>
    </tr>
    <tr>
        <td>mysql</td>
    </tr>
    <tr>
        <td>performance_schema</td>
    </tr>
    <tr>
        <td>sakila</td>
    </tr>
    <tr>
        <td>sys</td>
    </tr>
    <tr>
        <td>test</td>
    </tr>
    <tr>
        <td>world</td>
    </tr>
</table>




```python
%sql USE world;
%sql SHOW tables;
```

    * mysql+pymysql://root:***@localhost/world
    0 rows affected.
     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Tables_in_world</th>
    </tr>
    <tr>
        <td>city</td>
    </tr>
    <tr>
        <td>country</td>
    </tr>
    <tr>
        <td>countrylanguage</td>
    </tr>
</table>



> I have import all world data

## Assignment Part 2

### 1. What is the World's Smallest surface area Nation?

How big is it?


```python
%sql SELECT * FROM country LIMIT 3;
```

    * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Continent</th>
        <th>Region</th>
        <th>SurfaceArea</th>
        <th>IndepYear</th>
        <th>Population</th>
        <th>LifeExpectancy</th>
        <th>GNP</th>
        <th>GNPOld</th>
        <th>LocalName</th>
        <th>GovernmentForm</th>
        <th>HeadOfState</th>
        <th>Capital</th>
        <th>Code2</th>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Aruba</td>
        <td>North America</td>
        <td>Caribbean</td>
        <td>193.00</td>
        <td>None</td>
        <td>103000</td>
        <td>78.4</td>
        <td>828.00</td>
        <td>793.00</td>
        <td>Aruba</td>
        <td>Nonmetropolitan Territory of The Netherlands</td>
        <td>Beatrix</td>
        <td>129</td>
        <td>AW</td>
    </tr>
    <tr>
        <td>AFG</td>
        <td>Afghanistan</td>
        <td>Asia</td>
        <td>Southern and Central Asia</td>
        <td>652090.00</td>
        <td>1919</td>
        <td>22720000</td>
        <td>45.9</td>
        <td>5976.00</td>
        <td>None</td>
        <td>Afganistan/Afqanestan</td>
        <td>Islamic Emirate</td>
        <td>Mohammad Omar</td>
        <td>1</td>
        <td>AF</td>
    </tr>
    <tr>
        <td>AGO</td>
        <td>Angola</td>
        <td>Africa</td>
        <td>Central Africa</td>
        <td>1246700.00</td>
        <td>1975</td>
        <td>12878000</td>
        <td>38.3</td>
        <td>6648.00</td>
        <td>7984.00</td>
        <td>Angola</td>
        <td>Republic</td>
        <td>José Eduardo dos Santos</td>
        <td>56</td>
        <td>AO</td>
    </tr>
</table>



> Base the above, I will use SurfaceArea column.


```python
%%sql 
SELECT name, SurfaceArea
FROM country 
WHERE SurfaceArea > 0 
ORDER BY SurfaceArea
LIMIT 3;
```

    * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>name</th>
        <th>SurfaceArea</th>
    </tr>
    <tr>
        <td>Holy See (Vatican City State)</td>
        <td>0.40</td>
    </tr>
    <tr>
        <td>Monaco</td>
        <td>1.50</td>
    </tr>
    <tr>
        <td>Gibraltar</td>
        <td>6.00</td>
    </tr>
</table>



> The smallest furface area nation is Holy See (Vatican City State).  
Its surface ares is 0.4

## 2. What is the most populous Country in Africa?
* Show the SQL
* How big is it?


```python
%%sql
SELECT * FROM country LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Continent</th>
        <th>Region</th>
        <th>SurfaceArea</th>
        <th>IndepYear</th>
        <th>Population</th>
        <th>LifeExpectancy</th>
        <th>GNP</th>
        <th>GNPOld</th>
        <th>LocalName</th>
        <th>GovernmentForm</th>
        <th>HeadOfState</th>
        <th>Capital</th>
        <th>Code2</th>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Aruba</td>
        <td>North America</td>
        <td>Caribbean</td>
        <td>193.00</td>
        <td>None</td>
        <td>103000</td>
        <td>78.4</td>
        <td>828.00</td>
        <td>793.00</td>
        <td>Aruba</td>
        <td>Nonmetropolitan Territory of The Netherlands</td>
        <td>Beatrix</td>
        <td>129</td>
        <td>AW</td>
    </tr>
    <tr>
        <td>AFG</td>
        <td>Afghanistan</td>
        <td>Asia</td>
        <td>Southern and Central Asia</td>
        <td>652090.00</td>
        <td>1919</td>
        <td>22720000</td>
        <td>45.9</td>
        <td>5976.00</td>
        <td>None</td>
        <td>Afganistan/Afqanestan</td>
        <td>Islamic Emirate</td>
        <td>Mohammad Omar</td>
        <td>1</td>
        <td>AF</td>
    </tr>
    <tr>
        <td>AGO</td>
        <td>Angola</td>
        <td>Africa</td>
        <td>Central Africa</td>
        <td>1246700.00</td>
        <td>1975</td>
        <td>12878000</td>
        <td>38.3</td>
        <td>6648.00</td>
        <td>7984.00</td>
        <td>Angola</td>
        <td>Republic</td>
        <td>José Eduardo dos Santos</td>
        <td>56</td>
        <td>AO</td>
    </tr>
</table>



> From above, I will use Region and Population.


```python
%%sql
SELECT Region, COUNT(Region) 
FROM country 
WHERE Region LIKE '%Africa%'
GROUP BY Region;
```

     * mysql+pymysql://root:***@localhost/world
    5 rows affected.





<table>
    <tr>
        <th>Region</th>
        <th>COUNT(Region)</th>
    </tr>
    <tr>
        <td>Central Africa</td>
        <td>9</td>
    </tr>
    <tr>
        <td>Eastern Africa</td>
        <td>20</td>
    </tr>
    <tr>
        <td>Western Africa</td>
        <td>17</td>
    </tr>
    <tr>
        <td>Southern Africa</td>
        <td>5</td>
    </tr>
    <tr>
        <td>Northern Africa</td>
        <td>7</td>
    </tr>
</table>



> From above, it show all Africa country counts.


```python
%%sql
SELECT Name, Region, Population
FROM country
WHERE Region LIKE '%Africa%'
ORDER BY Population DESC
LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Name</th>
        <th>Region</th>
        <th>Population</th>
    </tr>
    <tr>
        <td>Nigeria</td>
        <td>Western Africa</td>
        <td>111506000</td>
    </tr>
    <tr>
        <td>Egypt</td>
        <td>Northern Africa</td>
        <td>68470000</td>
    </tr>
    <tr>
        <td>Ethiopia</td>
        <td>Eastern Africa</td>
        <td>62565000</td>
    </tr>
</table>



> Nigeria has the most population in Africa, which is 111506000

## 3. What are the Poorest Countries in Asia?

* must have GNP data (GNP > 0)
* List 3 poorest nations.
* What is the GNP per person?

```
NOTE: GNP is measured in $1,000,000. So, Multiply your answer by 1,000,000 to get US$.
```


```python
%%sql
SELECT * FROM country LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Continent</th>
        <th>Region</th>
        <th>SurfaceArea</th>
        <th>IndepYear</th>
        <th>Population</th>
        <th>LifeExpectancy</th>
        <th>GNP</th>
        <th>GNPOld</th>
        <th>LocalName</th>
        <th>GovernmentForm</th>
        <th>HeadOfState</th>
        <th>Capital</th>
        <th>Code2</th>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Aruba</td>
        <td>North America</td>
        <td>Caribbean</td>
        <td>193.00</td>
        <td>None</td>
        <td>103000</td>
        <td>78.4</td>
        <td>828.00</td>
        <td>793.00</td>
        <td>Aruba</td>
        <td>Nonmetropolitan Territory of The Netherlands</td>
        <td>Beatrix</td>
        <td>129</td>
        <td>AW</td>
    </tr>
    <tr>
        <td>AFG</td>
        <td>Afghanistan</td>
        <td>Asia</td>
        <td>Southern and Central Asia</td>
        <td>652090.00</td>
        <td>1919</td>
        <td>22720000</td>
        <td>45.9</td>
        <td>5976.00</td>
        <td>None</td>
        <td>Afganistan/Afqanestan</td>
        <td>Islamic Emirate</td>
        <td>Mohammad Omar</td>
        <td>1</td>
        <td>AF</td>
    </tr>
    <tr>
        <td>AGO</td>
        <td>Angola</td>
        <td>Africa</td>
        <td>Central Africa</td>
        <td>1246700.00</td>
        <td>1975</td>
        <td>12878000</td>
        <td>38.3</td>
        <td>6648.00</td>
        <td>7984.00</td>
        <td>Angola</td>
        <td>Republic</td>
        <td>José Eduardo dos Santos</td>
        <td>56</td>
        <td>AO</td>
    </tr>
</table>



> From above, I will use Region GNP


```python
%%sql
SELECT Name, Region, GNP * 1000000 US$, GNP * 1000000/Population GNP_per_person
FROM country
WHERE Region LIKE '%Asia%' AND GNP > 0
ORDER BY GNP
LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Name</th>
        <th>Region</th>
        <th>US$</th>
        <th>GNP_per_person</th>
    </tr>
    <tr>
        <td>Maldives</td>
        <td>Southern and Central Asia</td>
        <td>199000000.00</td>
        <td>695.804196</td>
    </tr>
    <tr>
        <td>Bhutan</td>
        <td>Southern and Central Asia</td>
        <td>372000000.00</td>
        <td>175.141243</td>
    </tr>
    <tr>
        <td>Mongolia</td>
        <td>Eastern Asia</td>
        <td>1043000000.00</td>
        <td>391.810669</td>
    </tr>
</table>



> From above, it shows the poorest nations and its per person GNP.

##  In what countries is ‘english’ and ‘hindi’ spoken?


```python
%%sql
SELECT * FROM country LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Continent</th>
        <th>Region</th>
        <th>SurfaceArea</th>
        <th>IndepYear</th>
        <th>Population</th>
        <th>LifeExpectancy</th>
        <th>GNP</th>
        <th>GNPOld</th>
        <th>LocalName</th>
        <th>GovernmentForm</th>
        <th>HeadOfState</th>
        <th>Capital</th>
        <th>Code2</th>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Aruba</td>
        <td>North America</td>
        <td>Caribbean</td>
        <td>193.00</td>
        <td>None</td>
        <td>103000</td>
        <td>78.4</td>
        <td>828.00</td>
        <td>793.00</td>
        <td>Aruba</td>
        <td>Nonmetropolitan Territory of The Netherlands</td>
        <td>Beatrix</td>
        <td>129</td>
        <td>AW</td>
    </tr>
    <tr>
        <td>AFG</td>
        <td>Afghanistan</td>
        <td>Asia</td>
        <td>Southern and Central Asia</td>
        <td>652090.00</td>
        <td>1919</td>
        <td>22720000</td>
        <td>45.9</td>
        <td>5976.00</td>
        <td>None</td>
        <td>Afganistan/Afqanestan</td>
        <td>Islamic Emirate</td>
        <td>Mohammad Omar</td>
        <td>1</td>
        <td>AF</td>
    </tr>
    <tr>
        <td>AGO</td>
        <td>Angola</td>
        <td>Africa</td>
        <td>Central Africa</td>
        <td>1246700.00</td>
        <td>1975</td>
        <td>12878000</td>
        <td>38.3</td>
        <td>6648.00</td>
        <td>7984.00</td>
        <td>Angola</td>
        <td>Republic</td>
        <td>José Eduardo dos Santos</td>
        <td>56</td>
        <td>AO</td>
    </tr>
</table>




```python
%%sql
SELECT * FROM countrylanguage LIMIT 3;
```

     * mysql+pymysql://root:***@localhost/world
    3 rows affected.





<table>
    <tr>
        <th>CountryCode</th>
        <th>Language</th>
        <th>IsOfficial</th>
        <th>Percentage</th>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Dutch</td>
        <td>T</td>
        <td>5.3</td>
    </tr>
    <tr>
        <td>ABW</td>
        <td>English</td>
        <td>F</td>
        <td>9.5</td>
    </tr>
    <tr>
        <td>ABW</td>
        <td>Papiamento</td>
        <td>F</td>
        <td>76.7</td>
    </tr>
</table>



> Base on these tables, I will use CountryCode and Code as join attribution.


```python
%%sql
SELECT temp.Name FROM
(SELECT c.Name, COUNT(c.Name) num FROM Country c
JOIN CountryLanguage l
ON c.code = l.countrycode
WHERE l.Language = 'english' OR l.Language = 'hindi'
GROUP BY c.Name) AS temp
WHERE temp.num = 2
```

     * mysql+pymysql://root:***@localhost/world
    1 rows affected.





<table>
    <tr>
        <th>Name</th>
    </tr>
    <tr>
        <td>Trinidad and Tobago</td>
    </tr>
</table>



## 5. How many people speak English?
2 queries: 
* how many in each country
* total for world


```python
%%sql
SELECT c.Name, c.Population * l.Percentage *0.01 Population_speak_English FROM Country c
JOIN CountryLanguage l
ON c.code = l.countrycode
WHERE l.Language = 'english' AND l.Percentage > 0;
```

     * mysql+pymysql://root:***@localhost/world
    34 rows affected.





<table>
    <tr>
        <th>Name</th>
        <th>Population_speak_English</th>
    </tr>
    <tr>
        <td>Aruba</td>
        <td>9785.000</td>
    </tr>
    <tr>
        <td>Netherlands Antilles</td>
        <td>16926.000</td>
    </tr>
    <tr>
        <td>American Samoa</td>
        <td>2108.000</td>
    </tr>
    <tr>
        <td>Australia</td>
        <td>15335432.000</td>
    </tr>
    <tr>
        <td>Belize</td>
        <td>122428.000</td>
    </tr>
    <tr>
        <td>Bermuda</td>
        <td>65000.000</td>
    </tr>
    <tr>
        <td>Brunei</td>
        <td>10168.000</td>
    </tr>
    <tr>
        <td>Canada</td>
        <td>18812788.000</td>
    </tr>
    <tr>
        <td>Denmark</td>
        <td>15990.000</td>
    </tr>
    <tr>
        <td>United Kingdom</td>
        <td>58013568.200</td>
    </tr>
    <tr>
        <td>Gibraltar</td>
        <td>22225.000</td>
    </tr>
    <tr>
        <td>Guam</td>
        <td>63000.000</td>
    </tr>
    <tr>
        <td>Hong Kong</td>
        <td>149204.000</td>
    </tr>
    <tr>
        <td>Ireland</td>
        <td>3714698.400</td>
    </tr>
    <tr>
        <td>Japan</td>
        <td>126714.000</td>
    </tr>
    <tr>
        <td>Saint Lucia</td>
        <td>30800.000</td>
    </tr>
    <tr>
        <td>Macao</td>
        <td>2365.000</td>
    </tr>
    <tr>
        <td>Monaco</td>
        <td>2210.000</td>
    </tr>
    <tr>
        <td>Malta</td>
        <td>7984.200</td>
    </tr>
    <tr>
        <td>Northern Mariana Islands</td>
        <td>3744.000</td>
    </tr>
    <tr>
        <td>Malaysia</td>
        <td>355904.000</td>
    </tr>
    <tr>
        <td>Norway</td>
        <td>22392.500</td>
    </tr>
    <tr>
        <td>Nauru</td>
        <td>900.000</td>
    </tr>
    <tr>
        <td>New Zealand</td>
        <td>3359940.000</td>
    </tr>
    <tr>
        <td>Palau</td>
        <td>608.000</td>
    </tr>
    <tr>
        <td>Puerto Rico</td>
        <td>1833906.000</td>
    </tr>
    <tr>
        <td>Seychelles</td>
        <td>2926.000</td>
    </tr>
    <tr>
        <td>Trinidad and Tobago</td>
        <td>1210825.000</td>
    </tr>
    <tr>
        <td>United States</td>
        <td>239943734.000</td>
    </tr>
    <tr>
        <td>Virgin Islands, U.S.</td>
        <td>75981.000</td>
    </tr>
    <tr>
        <td>Vanuatu</td>
        <td>53770.000</td>
    </tr>
    <tr>
        <td>Samoa</td>
        <td>1080.000</td>
    </tr>
    <tr>
        <td>South Africa</td>
        <td>3432045.000</td>
    </tr>
    <tr>
        <td>Zimbabwe</td>
        <td>256718.000</td>
    </tr>
</table>




```python
%%sql
SELECT sum(c.Population * l.Percentage * 0.01) world_English_speaker
FROM Country c
JOIN CountryLanguage l
ON c.code = l.countrycode
WHERE l.language= "English"

```

     * mysql+pymysql://root:***@localhost/world
    1 rows affected.





<table>
    <tr>
        <th>world_English_speaker</th>
    </tr>
    <tr>
        <td>347077867.300</td>
    </tr>
</table>




```python

```
