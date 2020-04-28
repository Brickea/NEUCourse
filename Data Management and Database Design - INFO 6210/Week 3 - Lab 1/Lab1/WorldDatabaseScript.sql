-- ONE RELATION QUERIES

-- What is the population of the USA?
SELECT Population
FROM Country
WHERE Code = 'USA';

-- Which countries gained independence after 1989?
SELECT Name, IndepYear
FROM Country
WHERE IndepYear >= '1990';

-- Return all the attributes for cities with population over 1 million in the US
SELECT *
FROM City
WHERE Population >= '1000000' AND CountryCode = 'USA';

-- This query returns only the name of these cities, and renames the attribute
-- Name to LargeUSACity
SELECT Name AS LargeUSACities, population
FROM City
WHERE Population >= '1000000' AND CountryCode = 'USA';

-- Cities with population over 5 million (changing the unit to millions)
SELECT Name, (Population / 1000000) AS PopulationInMillion
FROM City
WHERE Population >= '5000000';

-- Find the countries that have a form of goverment related to monarchy
SELECT Name, GovernmentForm
FROM Country
WHERE GovernmentForm LIKE '%Monarchy%';


SELECT GovernmentForm
FROM Country ;
-- Find all forms of goverment (the below query IS NOT CORRECT !!)

-- Hmmm, the above query keeps multiple copies of the same value.
-- Add the DISTINCT keyword to remove all the duplicates
SELECT DISTINCT GovernmentForm
FROM Country ;

-- We can use ORDER BY to order the city population by decreasing population
SELECT Name, (Population / 1000000) AS PopulationInMillion
FROM City
WHERE Population >= '5000000'
ORDER BY PopulationInMillion DESC;

-- Find the top two most populated cities!
-- Here we can use LIMIT to limit the output
SELECT Name, (Population / 1000000) AS PopulationInMillion
FROM City
ORDER BY PopulationInMillion DESC
LIMIT 2;

-- Which is the first country that became independent?
SELECT Name, IndepYear
FROM Country
ORDER BY IndepYear ASC
LIMIT 1;
-- above query is incorrect because it gave us null values
-- Instead the correct way is to filter out the NULL values by using NOT NULL
SELECT Name, IndepYear
FROM Country
WHERE IndepYear IS NOT NULL
ORDER BY IndepYear ASC
LIMIT 1;

-- 10.a
CREATE TABLE Citybackup1 as SELECT * FROM city;

-- 10.b
CREATE TABLE Citybackup2 LIKE city; 

-- 10.c
CREATE TABLE Citybackup3 LIKE city; 
INSERT Citybackup3 SELECT * FROM city;

-- What countries speak Thai?

#subquery exmaple
SELECT NAME , code FROM 
COUNTRY
WHERE Code IN
(SELECT CountryCode FROM  countrylanguage
WHERE Language = "THAI");

#join example
SELECT c.code, c.name, l.Language 
FROM country c
JOIN
countrylanguage l
WHERE c.Code = l.CountryCode AND l.Language = "THAI"
