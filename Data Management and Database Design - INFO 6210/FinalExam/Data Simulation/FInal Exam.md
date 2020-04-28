<div style='text-align:right;'> DMDD Final Take Home Exam</div>
<div style='text-align:right;'> Zixiao Wang 20200412 </div>

# DMDD Final Take Home Exam

## Summary for this course

Zixiao:

For me, this is kind of an unforgettable experience.

In a mental view, I grow a lot. At first, I was just thinking about learning some basic SQL knowledge. From the beginning of this course, I was shocked by the ‘innovative final project’ requirement. At first, I thought that this course will only cover the database design and SQL knowledge. So it will be very difficult in order to finish this final project. Because some ‘innovative ideas’ sometimes combine with some cutting-edge technologies. So I have to learn a lot of knowledge by myself.

Gradually, I found that it is not the technology that is important, it is the idea. Some very old technology can also help you to implement your idea. Technology is just a kind of tool. So I gradually stopped focusing on the technology itself but focused on the idea. When I think this idea is worth paying for, I just go back and consider which technologies to use.
So ‘How to think’ is the first lesson I learned from this class.

Then, after me and my teammate decided on the topic. I found I was facing another problem: How to divide the work. At first, nobody knew how to implement our topic. It was like there were a large number of possible methods that we can use in our project.  

Starting from here, I found something called ‘roadmap’ from the class. I learned how to use this tool to divide the project and how to regulate the workflow for the project. This is because a roadmap can help everyone understand every single piece of the project, and during this period, the roadmap can also help us standardize the work data flow of each piece. This is like black-boxing the module. After that, we assigned work, and everyone could focus on the part that he was responsible for. Because the data input and output are standardized, in the end, we only need to stitch together everyone's achievements.
So ‘RoadMap’ is the second thing I learned from this class.

Then during the implementation, I learned how to use ERD, how to use MySQL. And because I was in charge of algorithms. I learned a lot of theories like BFS, Dijkstra’s algorithm, A* algorithm, WiFi-based indoor positioning tech, and beacon-based indoor positioning tech. And I used Python a lot before, so I got a chance to improve my Python skill during this time. I learned how to use the database connection, how to code with MySQL functions, store procedures, triggers, views. You know, writing more than one thousand rows of code really gives me a better understanding of Python.
So these are the third things I learned from this class.

Apart from these three things, I think the most important thing I learned is courage, the courage that gives me confidence and passion to overcome any kind of difficulties. 

Thanks for the friendship with my teammates, this was really an impressive experience.



```python
import pandas as pd
%load_ext sql
%sql mysql+pymysql://root:fjwwzx970814@localhost/mydb
```




    'Connected: root@mydb'




```python
import sqlalchemy as sqlManager
import random
from datetime import date
```


```python
# Create connection with database
connection = sqlManager.create_engine('mysql+pymysql://root:fjwwzx970814@localhost/mydb')
```

## Abstract

1. Create 4-6 Tables each with 25-50 records for the following demonstration. (You may use website that generate random data sample as needed) 
2. Create a simple ER diagram showing mapping and relationship of these tables. 
3. For each of the following topics, create a SQL-script (in MySQL or MS SQL) and a power point slide (1- 5 slides for each of the set below) explaining what the code does and its outcome. (Hint: Imagine you are a TA for INFO6210 and you are conducting a code demo for a new set of INFO6210 students, these would be what you provide to the students and demonstrate during class)
    1. Create DB, creates tables, create sample records/values/tuples, USE, and Drop DB 
    2. Use DB, create tables with table options (NULL, Key, etc.), data types, insert, index and set 
    3. Select – From – Where – Group By – Having - Order By – Limit 
    4. Select 10 functions in SQL statement of your choice (including but not limited to Comparison, control flow, cast, string, numeric, date/time manipulation, calculation, conversion, aggregate functions, etc.) 
    5. Perform JOIN operation including INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN operations and display the sample result using SELECT statement 
    6. Perform Queries and Sub-queries operations and display the result using SELECT statement 
    7. Create four different users (Admin, Tester, Developer and User) with different privilege settings and display access differentiation among four users. Use GRANT and REVOKE command to give/remove additional access/rights to DB. 
    8. Create two examples of STORED PROCEDURE and display the results. 
    9. Perform COMMIT and ROLLBACK operations with SAVEPOINT/ROLLBACK TO SAVEPOINT. Include the use of LOCK/UNLOCK Table operations. Display result of each operation. 
    10. Perform Triggers operations using INSERT, UPDATE, DELETE and display result 
    11. Perform three examples of VIEW operation (1) Simple, 2) and 3) with increasing Complexities) Create a backup plan of your choice, state your assumptions/constraints and explain your reasoning. Print your selection on a sample monthly calendar (say 30 day) with FB for Full Backup and IB for Incremental Backup 
4. Create 10 True or False questions with solution from any topic covered in this class 
5. Create 10 multiple choice questions including solution covering queries, subqueries, trigger, store procedures, math functions, backup, privilege and any other topics covered in the class. 
6. Create 3 questions including solution and associated diagrams that cover normalization from 1NF, 2NF, 3NF and BCNF 
7. Create 2 questions including solution and associated diagrams that cover ERD and EERD concepts 
8. Create 5 questions including solution and code covering the SQL coding skills and concept 
9. Write a team evaluation (for each of your team members—2-3 sentences for each team member) including who do you think is the most valuable team member and why; Who did what according to your own observations? Rank everyone on your team including yourself (1 is the best, 2 is 2nd best, etc.) and why they are ranked in that order (no equal contribution will be an acceptable answer); what works best for your team and what did not? Rank all the team in class including your team.
10. If you are given an opportunity to be a paid TA or non-paid/volunteer in Fall 2020/Spring 2021, would you be interested (Do include if you are interested in volunteer vs paid position?) If you are interested, what skillsets and quality would make you a successful TA or a part of the team?


## Content

* [1. Table Creation and Records Insertion](#Table-Creation-and-Records-Insertion)
* [2. ERD Diagram](#ERD-Diagram)
* [3. SQL Script for each Topic](#SQL-Script-for-each-Topic)
* [4. 10 True/False Question](#10-True/False-Question)
* [5. 10 Multiple choice questions](#10-Multiple-choice-question)
* [6. 3 Normalization questions](#3-Normalization-questions)
* [7. 2 ERD and EERD concepts questions](#2-ERD-and-EERD-concepts-questions)
* [8. 5 SQL coding skills and concept questions](#5-SQL-coding-skills-and-concept-questions)
* [9. Team Evaluation](#Team-Evaluation)
* [10. TA Opportunity](#TA-Opportunity)

## Table Creation and Records Insertion

![](../Travel&#32;Agent.png)

Basicly, I create 9 tables in order to complete travel agent system

### Table Creation

```sql
-- MySQL Script generated by MySQL Workbench
-- Mon Apr 13 12:23:21 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  INDEX `idUserForSupplier_idx` (`idUser` ASC),
  CONSTRAINT `idUserForSupplier`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flight` (
  `idFlight` INT NOT NULL AUTO_INCREMENT,
  `idSupplier` INT NOT NULL,
  `route` VARCHAR(45) NOT NULL,
  `filghtDate` DATE NOT NULL,
  `price` DECIMAL(45) NOT NULL,
  `ifAvailable` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idFlight`),
  INDEX `idSupplierForFlights_idx` (`idSupplier` ASC),
  CONSTRAINT `idSupplierForFlights`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `idRoom` INT NOT NULL AUTO_INCREMENT,
  `idSupplier` INT NOT NULL,
  `roomType` VARCHAR(45) NOT NULL,
  `roomDate` DATE NOT NULL,
  `price` DECIMAL(45) NOT NULL,
  `ifAvailable` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idRoom`),
  INDEX `idSupplierForRoom_idx` (`idSupplier` ASC),
  CONSTRAINT `idSupplierForRoom`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `idUserForAdmin_idx` (`idUser` ASC),
  CONSTRAINT `idUserForAdmin`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Guider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Guider` (
  `idGuider` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `currentState` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGuider`),
  INDEX `idUserForGuider_idx` (`idUser` ASC),
  CONSTRAINT `idUserForGuider`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `idUserForCustomer_idx` (`idUser` ASC),
  CONSTRAINT `idUserForCustomer`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TravelProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TravelProduct` (
  `idTravelProduct` INT NOT NULL AUTO_INCREMENT,
  `idFlight` INT NOT NULL,
  `idRoom` INT NOT NULL,
  `idGuider` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `platformProfit` DECIMAL(45) NOT NULL,
  PRIMARY KEY (`idTravelProduct`),
  INDEX `idFlightForTravelProduct_idx` (`idFlight` ASC),
  INDEX `idRoomForTravelProduct_idx` (`idRoom` ASC),
  INDEX `idGuiderForTravelProduct_idx` (`idGuider` ASC),
  CONSTRAINT `idFlightForTravelProduct`
    FOREIGN KEY (`idFlight`)
    REFERENCES `mydb`.`Flight` (`idFlight`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idRoomForTravelProduct`
    FOREIGN KEY (`idRoom`)
    REFERENCES `mydb`.`Room` (`idRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGuiderForTravelProduct`
    FOREIGN KEY (`idGuider`)
    REFERENCES `mydb`.`Guider` (`idGuider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `idCustomer` INT NOT NULL,
  `idTravelProduct` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idCustomerForOrder_idx` (`idCustomer` ASC),
  INDEX `idTravelProductFroOrder_idx` (`idTravelProduct` ASC),
  CONSTRAINT `idCustomerForOrder`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTravelProductFroOrder`
    FOREIGN KEY (`idTravelProduct`)
    REFERENCES `mydb`.`TravelProduct` (`idTravelProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

### Records Insertion

#### Records Insertion Results


```python
%%sql
select * from User;
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
</table>




```python
%%sql
select * from Admin
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idAdmin</th>
        <th>idUser</th>
    </tr>
    <tr>
        <td>11</td>
        <td>11</td>
    </tr>
    <tr>
        <td>12</td>
        <td>12</td>
    </tr>
    <tr>
        <td>13</td>
        <td>13</td>
    </tr>
    <tr>
        <td>14</td>
        <td>14</td>
    </tr>
    <tr>
        <td>15</td>
        <td>15</td>
    </tr>
</table>




```python
%%sql
select * from Customer
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
    </tr>
</table>




```python
%%sql
select * from Supplier
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idSupplier</th>
        <th>idUser</th>
        <th>company</th>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>company_16</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>company_17</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>company_18</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>company_19</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>company_20</td>
    </tr>
</table>




```python
%%sql
select * from Guider
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idGuider</th>
        <th>idUser</th>
        <th>currentState</th>
    </tr>
    <tr>
        <td>21</td>
        <td>21</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>22</td>
        <td>22</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>23</td>
        <td>23</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>24</td>
        <td>24</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>25</td>
        <td>25</td>
        <td>Not working</td>
    </tr>
</table>




```python
%%sql
select * from Flight
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idFlight</th>
        <th>idSupplier</th>
        <th>route</th>
        <th>flightDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>16044</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>17</td>
        <td>China-America</td>
        <td>2020-06-10</td>
        <td>11384</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-25</td>
        <td>12000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-04-19</td>
        <td>17422</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>20</td>
        <td>China-America</td>
        <td>2020-06-19</td>
        <td>15136</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-10</td>
        <td>10575</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>17</td>
        <td>China-Japen</td>
        <td>2020-05-21</td>
        <td>16731</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-13</td>
        <td>15579</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
        <td>19223</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-06-10</td>
        <td>14325</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>16</td>
        <td>China-France</td>
        <td>2020-04-15</td>
        <td>10000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-05-24</td>
        <td>12045</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-04-11</td>
        <td>13643</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>19</td>
        <td>China-America</td>
        <td>2020-04-13</td>
        <td>11813</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-06-27</td>
        <td>14727</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-05</td>
        <td>14129</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-30</td>
        <td>13298</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>13064</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-05-27</td>
        <td>10642</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
        <td>14763</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>China-Japen</td>
        <td>2020-05-06</td>
        <td>18436</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-28</td>
        <td>11112</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
        <td>17515</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-04-14</td>
        <td>13450</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-04-25</td>
        <td>11585</td>
        <td>1</td>
    </tr>
</table>




```python
%%sql
select * from Room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
    </tr>
</table>




```python
%%sql
select * from CustomerOrder
```

     * mysql+pymysql://root:***@localhost/mydb
    50 rows affected.





<table>
    <tr>
        <th>idOrder</th>
        <th>idCustomer</th>
        <th>idTravelProduct</th>
    </tr>
    <tr>
        <td>1</td>
        <td>6</td>
        <td>18</td>
    </tr>
    <tr>
        <td>2</td>
        <td>9</td>
        <td>14</td>
    </tr>
    <tr>
        <td>3</td>
        <td>4</td>
        <td>18</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td>7</td>
        <td>18</td>
    </tr>
    <tr>
        <td>6</td>
        <td>8</td>
        <td>14</td>
    </tr>
    <tr>
        <td>7</td>
        <td>6</td>
        <td>3</td>
    </tr>
    <tr>
        <td>8</td>
        <td>9</td>
        <td>15</td>
    </tr>
    <tr>
        <td>9</td>
        <td>6</td>
        <td>17</td>
    </tr>
    <tr>
        <td>10</td>
        <td>5</td>
        <td>17</td>
    </tr>
    <tr>
        <td>11</td>
        <td>10</td>
        <td>14</td>
    </tr>
    <tr>
        <td>12</td>
        <td>2</td>
        <td>14</td>
    </tr>
    <tr>
        <td>13</td>
        <td>8</td>
        <td>18</td>
    </tr>
    <tr>
        <td>14</td>
        <td>9</td>
        <td>5</td>
    </tr>
    <tr>
        <td>15</td>
        <td>3</td>
        <td>19</td>
    </tr>
    <tr>
        <td>16</td>
        <td>5</td>
        <td>9</td>
    </tr>
    <tr>
        <td>17</td>
        <td>7</td>
        <td>16</td>
    </tr>
    <tr>
        <td>18</td>
        <td>4</td>
        <td>2</td>
    </tr>
    <tr>
        <td>19</td>
        <td>5</td>
        <td>3</td>
    </tr>
    <tr>
        <td>20</td>
        <td>1</td>
        <td>3</td>
    </tr>
    <tr>
        <td>21</td>
        <td>2</td>
        <td>16</td>
    </tr>
    <tr>
        <td>22</td>
        <td>2</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>5</td>
        <td>19</td>
    </tr>
    <tr>
        <td>24</td>
        <td>7</td>
        <td>9</td>
    </tr>
    <tr>
        <td>25</td>
        <td>10</td>
        <td>1</td>
    </tr>
    <tr>
        <td>26</td>
        <td>6</td>
        <td>8</td>
    </tr>
    <tr>
        <td>27</td>
        <td>4</td>
        <td>20</td>
    </tr>
    <tr>
        <td>28</td>
        <td>9</td>
        <td>19</td>
    </tr>
    <tr>
        <td>29</td>
        <td>5</td>
        <td>13</td>
    </tr>
    <tr>
        <td>30</td>
        <td>1</td>
        <td>18</td>
    </tr>
    <tr>
        <td>31</td>
        <td>1</td>
        <td>2</td>
    </tr>
    <tr>
        <td>32</td>
        <td>1</td>
        <td>7</td>
    </tr>
    <tr>
        <td>33</td>
        <td>5</td>
        <td>8</td>
    </tr>
    <tr>
        <td>34</td>
        <td>8</td>
        <td>9</td>
    </tr>
    <tr>
        <td>35</td>
        <td>10</td>
        <td>4</td>
    </tr>
    <tr>
        <td>36</td>
        <td>1</td>
        <td>7</td>
    </tr>
    <tr>
        <td>37</td>
        <td>4</td>
        <td>13</td>
    </tr>
    <tr>
        <td>38</td>
        <td>7</td>
        <td>12</td>
    </tr>
    <tr>
        <td>39</td>
        <td>8</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>2</td>
        <td>8</td>
    </tr>
    <tr>
        <td>41</td>
        <td>3</td>
        <td>10</td>
    </tr>
    <tr>
        <td>42</td>
        <td>1</td>
        <td>11</td>
    </tr>
    <tr>
        <td>43</td>
        <td>5</td>
        <td>11</td>
    </tr>
    <tr>
        <td>44</td>
        <td>7</td>
        <td>14</td>
    </tr>
    <tr>
        <td>45</td>
        <td>2</td>
        <td>11</td>
    </tr>
    <tr>
        <td>46</td>
        <td>1</td>
        <td>19</td>
    </tr>
    <tr>
        <td>47</td>
        <td>10</td>
        <td>8</td>
    </tr>
    <tr>
        <td>48</td>
        <td>2</td>
        <td>20</td>
    </tr>
    <tr>
        <td>49</td>
        <td>4</td>
        <td>18</td>
    </tr>
    <tr>
        <td>50</td>
        <td>3</td>
        <td>2</td>
    </tr>
</table>




```python
%%sql
select * from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>idFlight</th>
        <th>idRoom</th>
        <th>idGuider</th>
        <th>description</th>
        <th>platformProfit</th>
    </tr>
    <tr>
        <td>1</td>
        <td>19</td>
        <td>30</td>
        <td>25</td>
        <td>Good</td>
        <td>628</td>
    </tr>
    <tr>
        <td>2</td>
        <td>12</td>
        <td>22</td>
        <td>21</td>
        <td>Mid</td>
        <td>449</td>
    </tr>
    <tr>
        <td>3</td>
        <td>20</td>
        <td>21</td>
        <td>25</td>
        <td>Good</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>7</td>
        <td>25</td>
        <td>Mid</td>
        <td>761</td>
    </tr>
    <tr>
        <td>5</td>
        <td>6</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>520</td>
    </tr>
    <tr>
        <td>6</td>
        <td>17</td>
        <td>29</td>
        <td>25</td>
        <td>Perfect</td>
        <td>437</td>
    </tr>
    <tr>
        <td>7</td>
        <td>14</td>
        <td>28</td>
        <td>25</td>
        <td>Mid</td>
        <td>633</td>
    </tr>
    <tr>
        <td>8</td>
        <td>22</td>
        <td>14</td>
        <td>23</td>
        <td>Mid</td>
        <td>416</td>
    </tr>
    <tr>
        <td>9</td>
        <td>23</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>518</td>
    </tr>
    <tr>
        <td>10</td>
        <td>5</td>
        <td>13</td>
        <td>25</td>
        <td>Perfect</td>
        <td>483</td>
    </tr>
    <tr>
        <td>11</td>
        <td>20</td>
        <td>40</td>
        <td>23</td>
        <td>Perfect</td>
        <td>338</td>
    </tr>
    <tr>
        <td>12</td>
        <td>23</td>
        <td>19</td>
        <td>23</td>
        <td>Good</td>
        <td>431</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1</td>
        <td>7</td>
        <td>22</td>
        <td>Mid</td>
        <td>432</td>
    </tr>
    <tr>
        <td>14</td>
        <td>2</td>
        <td>15</td>
        <td>23</td>
        <td>Perfect</td>
        <td>676</td>
    </tr>
    <tr>
        <td>15</td>
        <td>23</td>
        <td>21</td>
        <td>21</td>
        <td>Good</td>
        <td>452</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>24</td>
        <td>Mid</td>
        <td>552</td>
    </tr>
    <tr>
        <td>17</td>
        <td>9</td>
        <td>7</td>
        <td>22</td>
        <td>Good</td>
        <td>717</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>15</td>
        <td>25</td>
        <td>Mid</td>
        <td>307</td>
    </tr>
    <tr>
        <td>19</td>
        <td>18</td>
        <td>30</td>
        <td>23</td>
        <td>Mid</td>
        <td>662</td>
    </tr>
    <tr>
        <td>20</td>
        <td>2</td>
        <td>41</td>
        <td>25</td>
        <td>Mid</td>
        <td>425</td>
    </tr>
</table>




```python
%%sql
show tables
```

     * mysql+pymysql://root:***@localhost/mydb
    11 rows affected.





<table>
    <tr>
        <th>Tables_in_mydb</th>
    </tr>
    <tr>
        <td>Admin</td>
    </tr>
    <tr>
        <td>Customer</td>
    </tr>
    <tr>
        <td>CustomizedTravelPlan</td>
    </tr>
    <tr>
        <td>Flight</td>
    </tr>
    <tr>
        <td>Guider</td>
    </tr>
    <tr>
        <td>Order</td>
    </tr>
    <tr>
        <td>Room</td>
    </tr>
    <tr>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>Suuplier</td>
    </tr>
    <tr>
        <td>TravelProduct</td>
    </tr>
    <tr>
        <td>User</td>
    </tr>
</table>



### The code I used for simulation and insertion 

#### User insertion

Customers


```python
user_data = []
for i in range(10):
    user_data.append(
        ['user_'+str(i+1),'password_'+str(i+1),'Customer']
    )
user_columns = ['userName','password','role']
```


```python
user_df = pd.DataFrame(data = user_data,columns = user_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(user_df,'User',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from User
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
</table>




```python
customer_data = []
for i in range(10):
    customer_data.append(
        [i+1,i+1]
    )
customer_columns = ['idCustomer','idUser']
```


```python
customer_df = pd.DataFrame(data = customer_data,columns = customer_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(customer_df,'Customer',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from Customer
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
    </tr>
</table>



Admin


```python
admin_data = []
for i in range(10,15):
    admin_data.append(
        ['user_'+str(i+1),'password_'+str(i+1),'Admin']
    )
admin_columns = ['userName','password','role']
```


```python
admin_df = pd.DataFrame(data = admin_data,columns = admin_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(admin_df,'User',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from User
```

     * mysql+pymysql://root:***@localhost/mydb
    15 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
</table>




```python
admin_data = []
for i in range(10,15):
    admin_data.append(
        [i+1,i+1]
    )
admin_columns = ['idAdmin','idUser']
```


```python
admin_df = pd.DataFrame(data = admin_data,columns = admin_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(admin_df,'admin',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from admin
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idAdmin</th>
        <th>idUser</th>
    </tr>
    <tr>
        <td>11</td>
        <td>11</td>
    </tr>
    <tr>
        <td>12</td>
        <td>12</td>
    </tr>
    <tr>
        <td>13</td>
        <td>13</td>
    </tr>
    <tr>
        <td>14</td>
        <td>14</td>
    </tr>
    <tr>
        <td>15</td>
        <td>15</td>
    </tr>
</table>



Supplier


```python
supplier_data = []
for i in range(15,20):
    supplier_data.append(
        ['user_'+str(i+1),'password_'+str(i+1),'supplier']
    )
supplier_columns = ['userName','password','role']
```


```python
supplier_df = pd.DataFrame(data = supplier_data,columns = supplier_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(supplier_df,'User',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from User
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
</table>




```python
supplier_data = []
for i in range(15,20):
    supplier_data.append(
        [i+1,i+1,'company_'+str(i+1)]
    )
supplier_columns = ['idSupplier','idUser','company']
```


```python
supplier_df = pd.DataFrame(data = supplier_data,columns = supplier_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(supplier_df,'supplier',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from Supplier
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idSupplier</th>
        <th>idUser</th>
        <th>company</th>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>company_16</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>company_17</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>company_18</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>company_19</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>company_20</td>
    </tr>
</table>



Guider


```python
guider_data = []
for i in range(20,25):
    guider_data.append(
        ['user_'+str(i+1),'password_'+str(i+1),'Guider']
    )
guider_columns = ['userName','password','role']
```


```python
guider_df = pd.DataFrame(data = guider_data,columns = guider_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(guider_df,'User',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from User
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
</table>




```python
guider_data = []
for i in range(20,25):
    guider_data.append(
        [i+1,i+1,'Not working']
    )
guider_columns = ['idGuider','idUser','currentState']
```


```python
guider_df = pd.DataFrame(data = guider_data,columns = guider_columns)
```


```python
# Insert data into database
pd.io.sql.to_sql(guider_df,'Guider',connection,schema='mydb',if_exists='append',index=False)
```


```python
%%sql
select * from Guider
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idGuider</th>
        <th>idUser</th>
        <th>currentState</th>
    </tr>
    <tr>
        <td>21</td>
        <td>21</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>22</td>
        <td>22</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>23</td>
        <td>23</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>24</td>
        <td>24</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>25</td>
        <td>25</td>
        <td>Not working</td>
    </tr>
</table>



#### Room & Flight Insertion

room


```python
%%sql
select * from Supplier
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idSupplier</th>
        <th>idUser</th>
        <th>company</th>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>company_16</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>company_17</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>company_18</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>company_19</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>company_20</td>
    </tr>
</table>




```python
sql = 'select idSupplier from Supplier'
idSupplier = pd.read_sql(sql,connection)
```


```python
month = [i for i in range(4,7)]
day = [i for i in range(1,31)]
```


```python
for supplier in idSupplier.idSupplier:
    roomType = random.choice(['single','double'])
    random_date = date(2020,random.choice(month),random.choice(day))
    price = random.randint(100,500)
    sql = 'call insert_room('+str(supplier)+',"'+str(roomType)+'","'+str(random_date)+'",'+str(price)+');'
    print(sql)
```

    call insert_room(16,"single","2020-06-18",338);
    call insert_room(17,"double","2020-06-25",215);
    call insert_room(18,"double","2020-04-15",135);
    call insert_room(19,"single","2020-06-05",274);
    call insert_room(20,"double","2020-06-06",307);


Flight


```python
%%sql
select * from Supplier
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idSupplier</th>
        <th>idUser</th>
        <th>company</th>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>company_16</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>company_17</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>company_18</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>company_19</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>company_20</td>
    </tr>
</table>




```python
month = [i for i in range(4,7)]
day = [i for i in range(1,31)]
```


```python
for supplier in idSupplier.idSupplier:
    route = random.choice(['China-America','China-Japen','China-France'])
    random_date = date(2020,random.choice(month),random.choice(day))
    price = random.randint(10000,20000)
    sql = 'call insert_flight('+str(supplier)+',"'+str(route)+'","'+str(random_date)+'",'+str(price)+');'
    print(sql)
```

    call insert_flight(16,"China-Japen","2020-05-06",18436);
    call insert_flight(17,"China-France","2020-04-28",11112);
    call insert_flight(18,"China-Japen","2020-06-22",17515);
    call insert_flight(19,"China-France","2020-04-14",13450);
    call insert_flight(20,"China-France","2020-04-25",11585);


#### Travel product Insertion


```python
%%sql
select * from room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
    </tr>
</table>




```python
%%sql
select * from flight
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idFlight</th>
        <th>idSupplier</th>
        <th>route</th>
        <th>flightDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>16044</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>17</td>
        <td>China-America</td>
        <td>2020-06-10</td>
        <td>11384</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-25</td>
        <td>12000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-04-19</td>
        <td>17422</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>20</td>
        <td>China-America</td>
        <td>2020-06-19</td>
        <td>15136</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-10</td>
        <td>10575</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>17</td>
        <td>China-Japen</td>
        <td>2020-05-21</td>
        <td>16731</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-13</td>
        <td>15579</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
        <td>19223</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-06-10</td>
        <td>14325</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>16</td>
        <td>China-France</td>
        <td>2020-04-15</td>
        <td>10000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-05-24</td>
        <td>12045</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-04-11</td>
        <td>13643</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>19</td>
        <td>China-America</td>
        <td>2020-04-13</td>
        <td>11813</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-06-27</td>
        <td>14727</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-05</td>
        <td>14129</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-30</td>
        <td>13298</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>13064</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-05-27</td>
        <td>10642</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
        <td>14763</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>China-Japen</td>
        <td>2020-05-06</td>
        <td>18436</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-28</td>
        <td>11112</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
        <td>17515</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-04-14</td>
        <td>13450</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-04-25</td>
        <td>11585</td>
        <td>1</td>
    </tr>
</table>




```python
%%sql
select * from Guider
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idGuider</th>
        <th>idUser</th>
        <th>currentState</th>
    </tr>
    <tr>
        <td>21</td>
        <td>21</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>22</td>
        <td>22</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>23</td>
        <td>23</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>24</td>
        <td>24</td>
        <td>Not working</td>
    </tr>
    <tr>
        <td>25</td>
        <td>25</td>
        <td>Not working</td>
    </tr>
</table>




```python
sql = 'select idFlight from Flight'
flights = pd.read_sql(sql,connection).idFlight
```


```python
sql = 'select idRoom from Room'
rooms = pd.read_sql(sql,connection).idRoom
```


```python
sql = 'select idGuider from Guider'
guiders = pd.read_sql(sql,connection).idGuider
```


```python
for i in range(20):
    room = random.choice(rooms)
    flight = random.choice(flights)
    guider = random.choice(guiders)
    profit = random.randint(300,800)
    description = random.choice(['Good','Mid','Perfect'])
    
    sql = 'call insert_travel_product('+str(flight)+','+str(room)+','+str(guider)+',"'+description+'",'+str(profit)+');' 
    print(sql)
```

    call insert_travel_product(19,30,25,"Good",628);
    call insert_travel_product(12,22,21,"Mid",449);
    call insert_travel_product(20,21,25,"Good",658);
    call insert_travel_product(1,7,25,"Mid",761);
    call insert_travel_product(6,15,25,"Good",520);
    call insert_travel_product(17,29,25,"Perfect",437);
    call insert_travel_product(14,28,25,"Mid",633);
    call insert_travel_product(22,14,23,"Mid",416);
    call insert_travel_product(23,15,25,"Good",518);
    call insert_travel_product(5,13,25,"Perfect",483);
    call insert_travel_product(20,40,23,"Perfect",338);
    call insert_travel_product(23,19,23,"Good",431);
    call insert_travel_product(1,7,22,"Mid",432);
    call insert_travel_product(2,15,23,"Perfect",676);
    call insert_travel_product(23,21,21,"Good",452);
    call insert_travel_product(19,19,24,"Mid",552);
    call insert_travel_product(9,7,22,"Good",717);
    call insert_travel_product(5,15,25,"Mid",307);
    call insert_travel_product(18,30,23,"Mid",662);
    call insert_travel_product(2,41,25,"Mid",425);


#### Order Insertion


```python
%%sql
select * from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>idFlight</th>
        <th>idRoom</th>
        <th>idGuider</th>
        <th>description</th>
        <th>platformProfit</th>
    </tr>
    <tr>
        <td>1</td>
        <td>19</td>
        <td>30</td>
        <td>25</td>
        <td>Good</td>
        <td>628</td>
    </tr>
    <tr>
        <td>2</td>
        <td>12</td>
        <td>22</td>
        <td>21</td>
        <td>Mid</td>
        <td>449</td>
    </tr>
    <tr>
        <td>3</td>
        <td>20</td>
        <td>21</td>
        <td>25</td>
        <td>Good</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>7</td>
        <td>25</td>
        <td>Mid</td>
        <td>761</td>
    </tr>
    <tr>
        <td>5</td>
        <td>6</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>520</td>
    </tr>
    <tr>
        <td>6</td>
        <td>17</td>
        <td>29</td>
        <td>25</td>
        <td>Perfect</td>
        <td>437</td>
    </tr>
    <tr>
        <td>7</td>
        <td>14</td>
        <td>28</td>
        <td>25</td>
        <td>Mid</td>
        <td>633</td>
    </tr>
    <tr>
        <td>8</td>
        <td>22</td>
        <td>14</td>
        <td>23</td>
        <td>Mid</td>
        <td>416</td>
    </tr>
    <tr>
        <td>9</td>
        <td>23</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>518</td>
    </tr>
    <tr>
        <td>10</td>
        <td>5</td>
        <td>13</td>
        <td>25</td>
        <td>Perfect</td>
        <td>483</td>
    </tr>
    <tr>
        <td>11</td>
        <td>20</td>
        <td>40</td>
        <td>23</td>
        <td>Perfect</td>
        <td>338</td>
    </tr>
    <tr>
        <td>12</td>
        <td>23</td>
        <td>19</td>
        <td>23</td>
        <td>Good</td>
        <td>431</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1</td>
        <td>7</td>
        <td>22</td>
        <td>Mid</td>
        <td>432</td>
    </tr>
    <tr>
        <td>14</td>
        <td>2</td>
        <td>15</td>
        <td>23</td>
        <td>Perfect</td>
        <td>676</td>
    </tr>
    <tr>
        <td>15</td>
        <td>23</td>
        <td>21</td>
        <td>21</td>
        <td>Good</td>
        <td>452</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>24</td>
        <td>Mid</td>
        <td>552</td>
    </tr>
    <tr>
        <td>17</td>
        <td>9</td>
        <td>7</td>
        <td>22</td>
        <td>Good</td>
        <td>717</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>15</td>
        <td>25</td>
        <td>Mid</td>
        <td>307</td>
    </tr>
    <tr>
        <td>19</td>
        <td>18</td>
        <td>30</td>
        <td>23</td>
        <td>Mid</td>
        <td>662</td>
    </tr>
    <tr>
        <td>20</td>
        <td>2</td>
        <td>41</td>
        <td>25</td>
        <td>Mid</td>
        <td>425</td>
    </tr>
</table>




```python
%%sql
select * from Customer
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
    </tr>
</table>




```python
sql = 'select idCustomer from Customer'
customers = pd.read_sql(sql,connection).idCustomer
```


```python
sql = 'select idTravelProduct from TravelProduct'
travel_products = pd.read_sql(sql,connection).idTravelProduct
```


```python
for i in range(50):
    customer = random.choice(customers)
    travel_product = random.choice(travel_products)
    
    sql = 'call insert_order('+str(customer)+','+str(travel_product)+');'
    print(sql)
```

    call insert_order(6,18);
    call insert_order(9,14);
    call insert_order(4,18);
    call insert_order(1,4);
    call insert_order(7,18);
    call insert_order(8,14);
    call insert_order(6,3);
    call insert_order(9,15);
    call insert_order(6,17);
    call insert_order(5,17);
    call insert_order(10,14);
    call insert_order(2,14);
    call insert_order(8,18);
    call insert_order(9,5);
    call insert_order(3,19);
    call insert_order(5,9);
    call insert_order(7,16);
    call insert_order(4,2);
    call insert_order(5,3);
    call insert_order(1,3);
    call insert_order(2,16);
    call insert_order(2,1);
    call insert_order(5,19);
    call insert_order(7,9);
    call insert_order(10,1);
    call insert_order(6,8);
    call insert_order(4,20);
    call insert_order(9,19);
    call insert_order(5,13);
    call insert_order(1,18);
    call insert_order(1,2);
    call insert_order(1,7);
    call insert_order(5,8);
    call insert_order(8,9);
    call insert_order(10,4);
    call insert_order(1,7);
    call insert_order(4,13);
    call insert_order(7,12);
    call insert_order(8,1);
    call insert_order(2,8);
    call insert_order(3,10);
    call insert_order(1,11);
    call insert_order(5,11);
    call insert_order(7,14);
    call insert_order(2,11);
    call insert_order(1,19);
    call insert_order(10,8);
    call insert_order(2,20);
    call insert_order(4,18);
    call insert_order(3,2);


## ERD Diagram

![](../Travel&#32;Agent.png)

## SQL Script for each Topic

1. Create DB, creates tables, create sample records/values/tuples, USE, and Drop DB 
2. Use DB, create tables with table options (NULL, Key, etc.), data types, insert, index and set 
3. Select – From – Where – Group By – Having - Order By – Limit 
4. Select 10 functions in SQL statement of your choice (including but not limited to Comparison, control flow, cast, string, numeric, date/time manipulation, calculation, conversion, aggregate functions, etc.) 
5. Perform JOIN operation including INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN operations and display the sample result using SELECT statement 
6. Perform Queries and Sub-queries operations and display the result using SELECT statement 
7. Create four different users (Admin, Tester, Developer and User) with different privilege settings and display access differentiation among four users. Use GRANT and REVOKE command to give/remove additional access/rights to DB. 
8. Create two examples of STORED PROCEDURE and display the results. 
9. Perform COMMIT and ROLLBACK operations with SAVEPOINT/ROLLBACK TO SAVEPOINT. Include the use of LOCK/UNLOCK Table operations. Display result of each operation. 
10. Perform Triggers operations using INSERT, UPDATE, DELETE and display result 
11. Perform three examples of VIEW operation (1) Simple, 2) and 3) with increasing Complexities) Create a backup plan of your choice, state your assumptions/constraints and explain your reasoning. Print your selection on a sample monthly calendar (say 30 day) with FB for Full Backup and IB for Incremental Backup 

### 1. Create DB, creates tables, create sample records/values/tuples, USE, and Drop DB

Abstract example:

```sql
-- Create DB, use DB and drop DB
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
DROP DATABASE `mydb`;

-- Create tables. Take 'User' table as example
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
  
-- Create records in tables. Take 'User' table as example
INSERT INTO `mydb`.`User` (`idUser`, `userName`, `password`, `role`) VALUES ('26', 'user_26', 'password_26', 'Guider');

```

#### 1.1 Create DB

Statement:
```sql
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
```

Here is a basic creation for DB


```python
%%sql
create schema test;
```

     * mysql+pymysql://root:***@localhost/mydb
    (pymysql.err.ProgrammingError) (1007, "Can't create database 'test'; database exists")
    [SQL: create schema test;]
    (Background on this error at: http://sqlalche.me/e/f405)


Then we can check if our database has been created


```python
%%sql
show databases;
```

     * mysql+pymysql://root:***@localhost/mydb
    6 rows affected.





<table>
    <tr>
        <th>Database</th>
    </tr>
    <tr>
        <td>information_schema</td>
    </tr>
    <tr>
        <td>mydb</td>
    </tr>
    <tr>
        <td>mysql</td>
    </tr>
    <tr>
        <td>performance_schema</td>
    </tr>
    <tr>
        <td>sys</td>
    </tr>
    <tr>
        <td>test</td>
    </tr>
</table>



And if you are not sure if the database is exist


```python
%%sql
-- if we create database directly, we will got a error 'Can't create database 'test'; database exists'
create schema `test`
```

     * mysql+pymysql://root:***@localhost/mydb
    (pymysql.err.ProgrammingError) (1007, "Can't create database 'test'; database exists")
    [SQL: -- if we create database directly, we will got a error 'Can't create database 'test'; database exists'
    create schema `test`]
    (Background on this error at: http://sqlalche.me/e/f405)



```python
%%sql
-- so we can use 'if not exists' to help us
create schema if not exists `test`
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





    []



Drop database


```python
%%sql
drop schema `test`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []



Use database


```python
%%sql
use `test`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []



#### 1.2 Create tables

Statement:

```sql
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    (create_definition,...)
```


```python
%%sql
create table if not exists `test`.`test_table`(
    `idUser` INT NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idUser`))
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
select * from test_table
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
</table>



### 2. Use DB, create tables with table options (NULL, Key, etc.), data types, insert, index and set

Abstract example:

```sql
-- Use DB
USE `mydb` ;

-- Create tables with table options (NULL, Key, etc.),data types
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
  
-- Insert
INSERT INTO `mydb`.`User` (`idUser`, `userName`, `password`, `role`) VALUES ('26', 'user_26', 'password_26', 'Guider');

-- Index
-- Enables use of statements that create or drop (remove) indexes. INDEX applies to existing tables. If you have the CREATE privilege for a table, you can include index definitions in the CREATE TABLE statement.
CREATE INDEX indexName ON mytable(username(length)); 
ALTER table tableName ADD INDEX indexName(columnName);
CREATE TABLE mytable(  
ID INT NOT NULL,   
username VARCHAR(16) NOT NULL,  
INDEX [indexName] (username(length))  
);  
DROP INDEX [indexName] ON mytable; 

-- Set
-- A SET column can have a maximum of 64 distinct members.
CREATE TABLE myset (col SET('a', 'b', 'c', 'd'));

INSERT INTO myset (col) VALUES 
('a,d'), ('d,a'), ('a,d,a'), ('a,d,d'), ('d,a,d');

SELECT col FROM myset;
+------+
| col  |
+------+
| a,d  |
| a,d  |
| a,d  |
| a,d  |
| a,d  |
+------+
5 rows in set (0.04 sec)
```

#### 2.1 Use DB


```python
%%sql
use `test`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []



#### 2.2 Create tables with table options (NULL, Key, etc.), data types

Statement:

```sql
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    (column_name column_type)
```

Creata a table with columns and data types


```python
%%sql
CREATE TABLE IF NOT EXISTS `test_tbl`(
   `test_id` INT UNSIGNED AUTO_INCREMENT,
   `test_title` VARCHAR(100) NOT NULL,
   `test_author` VARCHAR(40) NOT NULL,
   `submission_date` DATE,
   PRIMARY KEY ( `test_id` )
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []



* If you don't want the field to be NULL, you can set the field's attribute to NOT NULL. If you enter the field's data as NULL when operating the database, you will get an error.
* AUTO_INCREMENT defines the column as a self-increasing attribute, which is generally used for the primary key, and the value will automatically increase by 1.
* The PRIMARY KEY keyword is used to define the column as the primary key. You can use multiple columns to define the primary key, separated by commas.
* ENGINE sets the storage engine, and CHARSET sets the encoding.


```python
%%sql
select * from `test_tbl`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





<table>
    <tr>
        <th>test_id</th>
        <th>test_title</th>
        <th>test_author</th>
        <th>submission_date</th>
    </tr>
</table>



Insert data into table

Statement:

```sql
INSERT INTO table_name ( field1, field2,...fieldN )
                       VALUES
                       ( value1, value2,...valueN );
```

#### 2.3 Insertion

Let's insert one row into test_tbl table


```python
%%sql
insert into `test_tbl` (test_id,test_title,test_author,submission_date)
values (1,'title','author','2020-04-14')
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





    []




```python
%%sql
select * from `test_tbl`
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>test_id</th>
        <th>test_title</th>
        <th>test_author</th>
        <th>submission_date</th>
    </tr>
    <tr>
        <td>1</td>
        <td>title</td>
        <td>author</td>
        <td>2020-04-14</td>
    </tr>
</table>



#### 2.4 Index

Create index

```sql
CREATE INDEX indexName ON mytable(columnName(length)); 
```
> If it is CHAR, VARCHAR type, length can be less than the actual length of the field; if it is BLOB and TEXT types, length must be specified.

Change table structure to add index

```sql
ALTER table tableName ADD INDEX indexName(columnName)
```

Create index while creating tables

```sql
CREATE TABLE mytable(  
ID INT NOT NULL,   
username VARCHAR(16) NOT NULL,  
INDEX [indexName] (columnName(length))  
);  
```

Delete index

```sql
DROP INDEX [indexName] ON mytable; 
```


```python
%%sql
create index test_index on `test_tbl`(test_id);
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
show index from `test_tbl`
```

     * mysql+pymysql://root:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>Table</th>
        <th>Non_unique</th>
        <th>Key_name</th>
        <th>Seq_in_index</th>
        <th>Column_name</th>
        <th>Collation</th>
        <th>Cardinality</th>
        <th>Sub_part</th>
        <th>Packed</th>
        <th>Null</th>
        <th>Index_type</th>
        <th>Comment</th>
        <th>Index_comment</th>
        <th>Visible</th>
        <th>Expression</th>
    </tr>
    <tr>
        <td>test_tbl</td>
        <td>0</td>
        <td>PRIMARY</td>
        <td>1</td>
        <td>test_id</td>
        <td>A</td>
        <td>1</td>
        <td>None</td>
        <td>None</td>
        <td></td>
        <td>BTREE</td>
        <td></td>
        <td></td>
        <td>YES</td>
        <td>None</td>
    </tr>
    <tr>
        <td>test_tbl</td>
        <td>1</td>
        <td>test_index</td>
        <td>1</td>
        <td>test_id</td>
        <td>A</td>
        <td>1</td>
        <td>None</td>
        <td>None</td>
        <td></td>
        <td>BTREE</td>
        <td></td>
        <td></td>
        <td>YES</td>
        <td>None</td>
    </tr>
</table>




```python
%%sql
drop index test_index on `test_tbl`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
show index from `test_tbl`
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>Table</th>
        <th>Non_unique</th>
        <th>Key_name</th>
        <th>Seq_in_index</th>
        <th>Column_name</th>
        <th>Collation</th>
        <th>Cardinality</th>
        <th>Sub_part</th>
        <th>Packed</th>
        <th>Null</th>
        <th>Index_type</th>
        <th>Comment</th>
        <th>Index_comment</th>
        <th>Visible</th>
        <th>Expression</th>
    </tr>
    <tr>
        <td>test_tbl</td>
        <td>0</td>
        <td>PRIMARY</td>
        <td>1</td>
        <td>test_id</td>
        <td>A</td>
        <td>1</td>
        <td>None</td>
        <td>None</td>
        <td></td>
        <td>BTREE</td>
        <td></td>
        <td></td>
        <td>YES</td>
        <td>None</td>
    </tr>
</table>



#### 2.5 Set

A SET is a string object that can have zero or more values, each of which must be chosen from a list of permitted values specified when the table is created. SET column values that consist of multiple set members are specified with members separated by commas (,). A consequence of this is that SET member values should not themselves contain commas.


```python
%%sql
create table `myset` (col set('a','b','c','d'));
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
insert into myset (col) values 
('a,d'), ('d,a'), ('a,d,a'), ('a,d,d'), ('d,a,d');
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





    []




```python
%%sql
select col from myset;
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>col</th>
    </tr>
    <tr>
        <td>a,d</td>
    </tr>
    <tr>
        <td>a,d</td>
    </tr>
    <tr>
        <td>a,d</td>
    </tr>
    <tr>
        <td>a,d</td>
    </tr>
    <tr>
        <td>a,d</td>
    </tr>
</table>



### 3. Select – From – Where – Group By – Having - Order By – Limit 

Abstract statement

```sql
-- select-from. 
-- This statement can allow you to extract some particular columns from some particular tables
SELECT field1, field2,...fieldN FROM table_name1, table_name2...

-- select-from-where
-- This statement can allow you to extract some data based on particular condition
SELECT field1, field2,...fieldN FROM table_name1, table_name2...
[WHERE condition1 [AND [OR]] condition2.....
 
-- select-from-where-group by
-- The GROUP BY statement groups the result set based on one or more columns.
SELECT column_name, function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;
 
-- having
-- The reason for adding the HAVING clause in SQL is that the WHERE keyword cannot be used with aggregate functions.
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value;
 
-- order by
-- The ORDER BY keyword is used to sort the result set by one column or multiple columns.
SELECT column_name,column_name
FROM table_name
ORDER BY column_name,column_name ASC|DESC;
 
-- limit
-- The LIMIT clause is used to limit the amount of data returned by the SELECT statement.
SELECT column1, column2, columnN 
FROM table_name
LIMIT [no of rows]
```


```python
%%sql
use `mydb`
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
show tables
```

     * mysql+pymysql://root:***@localhost/mydb
    9 rows affected.





<table>
    <tr>
        <th>Tables_in_mydb</th>
    </tr>
    <tr>
        <td>Admin</td>
    </tr>
    <tr>
        <td>Customer</td>
    </tr>
    <tr>
        <td>CustomerOrder</td>
    </tr>
    <tr>
        <td>Flight</td>
    </tr>
    <tr>
        <td>Guider</td>
    </tr>
    <tr>
        <td>Room</td>
    </tr>
    <tr>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>TravelProduct</td>
    </tr>
    <tr>
        <td>User</td>
    </tr>
</table>



#### 3.1 select-from


```python
%%sql
-- '*' means selec all columns from tables
select * from User;
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
</table>



#### 3.2 select-from-where


```python
%%sql
select * from User
where idUser = 2;
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
</table>



#### 3.3 select-from-where-group by


```python
%%sql
select role,count(*) from User
where idUser < 21
group by role
```

     * mysql+pymysql://root:***@localhost/mydb
    3 rows affected.





<table>
    <tr>
        <th>role</th>
        <th>count(*)</th>
    </tr>
    <tr>
        <td>Customer</td>
        <td>10</td>
    </tr>
    <tr>
        <td>Admin</td>
        <td>5</td>
    </tr>
    <tr>
        <td>Supplier</td>
        <td>5</td>
    </tr>
</table>



#### 3.4 having


```python
%%sql
select role,count(*) number from User
where idUser < 21
group by role
having number < 10
```

     * mysql+pymysql://root:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>role</th>
        <th>number</th>
    </tr>
    <tr>
        <td>Admin</td>
        <td>5</td>
    </tr>
    <tr>
        <td>Supplier</td>
        <td>5</td>
    </tr>
</table>



#### 3.5 order by


```python
%%sql
select * from User
order by idUser desc
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
</table>



#### 3.6 limit


```python
%%sql
select * from User
limit 5
```

     * mysql+pymysql://root:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idUser</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
</table>



### 4. Select 10 functions in SQL statement of your choice

(including but not limited to Comparison, control flow, cast, string, numeric, date/time manipulation, calculation, conversion, aggregate functions, etc.) 

#### 4.1 Comparison


|Operator| Function|
|--|--|
=| Equal to
<=>| Safe equal
<>| Or! = Not equal
<=| Less than or equal to
\>=| Greater than or equal to
\>| Greater than
IS NULL or ISNULL| to determine whether a value is empty
IS NOT NULL| judge whether a value is not empty
BETWEEN AND| determines whether a value falls between two values

Greater ```>```


```python
%%sql
select * from TravelProduct
where platformProfit > 200
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>idFlight</th>
        <th>idRoom</th>
        <th>idGuider</th>
        <th>description</th>
        <th>platformProfit</th>
    </tr>
    <tr>
        <td>1</td>
        <td>19</td>
        <td>30</td>
        <td>25</td>
        <td>Good</td>
        <td>628</td>
    </tr>
    <tr>
        <td>2</td>
        <td>12</td>
        <td>22</td>
        <td>21</td>
        <td>Mid</td>
        <td>449</td>
    </tr>
    <tr>
        <td>3</td>
        <td>20</td>
        <td>21</td>
        <td>25</td>
        <td>Good</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>7</td>
        <td>25</td>
        <td>Mid</td>
        <td>761</td>
    </tr>
    <tr>
        <td>5</td>
        <td>6</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>520</td>
    </tr>
    <tr>
        <td>6</td>
        <td>17</td>
        <td>29</td>
        <td>25</td>
        <td>Perfect</td>
        <td>437</td>
    </tr>
    <tr>
        <td>7</td>
        <td>14</td>
        <td>28</td>
        <td>25</td>
        <td>Mid</td>
        <td>633</td>
    </tr>
    <tr>
        <td>8</td>
        <td>22</td>
        <td>14</td>
        <td>23</td>
        <td>Mid</td>
        <td>416</td>
    </tr>
    <tr>
        <td>9</td>
        <td>23</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>518</td>
    </tr>
    <tr>
        <td>10</td>
        <td>5</td>
        <td>13</td>
        <td>25</td>
        <td>Perfect</td>
        <td>483</td>
    </tr>
    <tr>
        <td>11</td>
        <td>20</td>
        <td>40</td>
        <td>23</td>
        <td>Perfect</td>
        <td>338</td>
    </tr>
    <tr>
        <td>12</td>
        <td>23</td>
        <td>19</td>
        <td>23</td>
        <td>Good</td>
        <td>431</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1</td>
        <td>7</td>
        <td>22</td>
        <td>Mid</td>
        <td>432</td>
    </tr>
    <tr>
        <td>14</td>
        <td>2</td>
        <td>15</td>
        <td>23</td>
        <td>Perfect</td>
        <td>676</td>
    </tr>
    <tr>
        <td>15</td>
        <td>23</td>
        <td>21</td>
        <td>21</td>
        <td>Good</td>
        <td>452</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>24</td>
        <td>Mid</td>
        <td>552</td>
    </tr>
    <tr>
        <td>17</td>
        <td>9</td>
        <td>7</td>
        <td>22</td>
        <td>Good</td>
        <td>717</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>15</td>
        <td>25</td>
        <td>Mid</td>
        <td>307</td>
    </tr>
    <tr>
        <td>19</td>
        <td>18</td>
        <td>30</td>
        <td>23</td>
        <td>Mid</td>
        <td>662</td>
    </tr>
    <tr>
        <td>20</td>
        <td>2</td>
        <td>41</td>
        <td>25</td>
        <td>Mid</td>
        <td>425</td>
    </tr>
</table>



```between and``` comparison operator


```python
%%sql
select * from TravelProduct
where platformProfit between 300 and 400
```

     * mysql+pymysql://root:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>idFlight</th>
        <th>idRoom</th>
        <th>idGuider</th>
        <th>description</th>
        <th>platformProfit</th>
    </tr>
    <tr>
        <td>11</td>
        <td>20</td>
        <td>40</td>
        <td>23</td>
        <td>Perfect</td>
        <td>338</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>15</td>
        <td>25</td>
        <td>Mid</td>
        <td>307</td>
    </tr>
</table>



#### 4.2 Control flow

There are four Control Flow functions in MySQL - CASE operator, IF/ELSE construct, IFNULL, and NULLIF.

#### 4.2.1 CASE

Version 1:

```sql
CASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN result ...] [ELSE result] END
```

In this version, result is returned when value is equal to compare_value. If nothing is matched, the result after ELSE is returned, or NULL is returned if there is no ELSE part.

Version 2:

```sql
CASE WHEN [condition] THEN result [WHEN [condition] THEN result ...] [ELSE result] END
```

In this version, if condition is true, result is returned. If nothing is matched, the result after ELSE is returned, or NULL is returned if there is no ELSE part.

Let's make a summary to check the number of each interval of the travel product profit.  


```python
%%sql
select 
    case
        when platformProfit between 1 and 300
            then '(0,300]'
        when platformProfit between 301 and 600
            then '(300,600]'
        when platformProfit between 601 and 900
            then '(600,900]'
        else '(900,)' 
    end as profit_interval,
    count(idTravelProduct) product_number
from TravelProduct
group by profit_interval
order by profit_interval
```

     * mysql+pymysql://root:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>profit_interval</th>
        <th>product_number</th>
    </tr>
    <tr>
        <td>(300,600]</td>
        <td>13</td>
    </tr>
    <tr>
        <td>(600,900]</td>
        <td>7</td>
    </tr>
</table>



#### 4.2.2 IF/ELSE


```python
%%sql
select idTravelProduct, platformProfit, if(platformProfit > 500, 'high profit', 'low profit') profit_type
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>platformProfit</th>
        <th>profit_type</th>
    </tr>
    <tr>
        <td>1</td>
        <td>628</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>2</td>
        <td>449</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>3</td>
        <td>658</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>4</td>
        <td>761</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>5</td>
        <td>520</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>6</td>
        <td>437</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>7</td>
        <td>633</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>8</td>
        <td>416</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>9</td>
        <td>518</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>10</td>
        <td>483</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>11</td>
        <td>338</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>12</td>
        <td>431</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>13</td>
        <td>432</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>14</td>
        <td>676</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>15</td>
        <td>452</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>16</td>
        <td>552</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>17</td>
        <td>717</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>18</td>
        <td>307</td>
        <td>low profit</td>
    </tr>
    <tr>
        <td>19</td>
        <td>662</td>
        <td>high profit</td>
    </tr>
    <tr>
        <td>20</td>
        <td>425</td>
        <td>low profit</td>
    </tr>
</table>



#### 4.2.3 IFNULL

```sql
IFNULL(expr1,expr2)
```

If expr1 is not NULL, the function returns expr1. Otherwise it returns expr2.

#### 4.2.4 NULLIF

```sql
NULLIF(expr1,expr2)
```

Returns NULL if expr1 = expr2 is true, otherwise returns expr1.

#### 5. Cast

The CAST function converts any type of value to a value of the specified type

```sql
CAST(expression AS TYPE);
```

The CAST () function converts any type of value to a value of the specified type. 

The target type can be one of the following types: 

* BINARY
* CHAR
* DATE
* DATETIME
* TIME
* DECIMAL
* SIGNED
* UNSIGNED

Let's add 'price' as prefix of platformProfit

Here we can use concat function to concat two string


```python
%%sql
show columns from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    6 rows affected.





<table>
    <tr>
        <th>Field</th>
        <th>Type</th>
        <th>Null</th>
        <th>Key</th>
        <th>Default</th>
        <th>Extra</th>
    </tr>
    <tr>
        <td>idTravelProduct</td>
        <td>int</td>
        <td>NO</td>
        <td>PRI</td>
        <td>None</td>
        <td>auto_increment</td>
    </tr>
    <tr>
        <td>idFlight</td>
        <td>int</td>
        <td>NO</td>
        <td>MUL</td>
        <td>None</td>
        <td></td>
    </tr>
    <tr>
        <td>idRoom</td>
        <td>int</td>
        <td>NO</td>
        <td>MUL</td>
        <td>None</td>
        <td></td>
    </tr>
    <tr>
        <td>idGuider</td>
        <td>int</td>
        <td>NO</td>
        <td>MUL</td>
        <td>None</td>
        <td></td>
    </tr>
    <tr>
        <td>description</td>
        <td>varchar(45)</td>
        <td>NO</td>
        <td></td>
        <td>None</td>
        <td></td>
    </tr>
    <tr>
        <td>platformProfit</td>
        <td>decimal(45,0)</td>
        <td>NO</td>
        <td></td>
        <td>None</td>
        <td></td>
    </tr>
</table>



The 'platformProfit' is ```decimal```. So we can change the type as ```char``` first


```python
%%sql
select concat('price ',cast(platformProfit as char)) as profit
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>profit</th>
    </tr>
    <tr>
        <td>price 628</td>
    </tr>
    <tr>
        <td>price 449</td>
    </tr>
    <tr>
        <td>price 658</td>
    </tr>
    <tr>
        <td>price 761</td>
    </tr>
    <tr>
        <td>price 520</td>
    </tr>
    <tr>
        <td>price 437</td>
    </tr>
    <tr>
        <td>price 633</td>
    </tr>
    <tr>
        <td>price 416</td>
    </tr>
    <tr>
        <td>price 518</td>
    </tr>
    <tr>
        <td>price 483</td>
    </tr>
    <tr>
        <td>price 338</td>
    </tr>
    <tr>
        <td>price 431</td>
    </tr>
    <tr>
        <td>price 432</td>
    </tr>
    <tr>
        <td>price 676</td>
    </tr>
    <tr>
        <td>price 452</td>
    </tr>
    <tr>
        <td>price 552</td>
    </tr>
    <tr>
        <td>price 717</td>
    </tr>
    <tr>
        <td>price 307</td>
    </tr>
    <tr>
        <td>price 662</td>
    </tr>
    <tr>
        <td>price 425</td>
    </tr>
</table>



#### 6. String

String functions in MySQL

|Function|	Description|
|--|--|
ASCII|Returns the ASCII value for the specific character
CHAR_LENGTH|Returns the length of a string (in characters)
CHARACTER_LENGTH|Returns the length of a string (in characters)
CONCAT|Adds two or more expressions together
CONCAT_WS|Adds two or more expressions together with a separator
FIELD|Returns the index position of a value in a list of values
FIND_IN_SET|Returns the position of a string within a list of strings
FORMAT|Formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places
INSERT|Inserts a string within a string at the specified position and for a certain number of characters
INSTR|Returns the position of the first occurrence of a string in another string
LCASE|Converts a string to lower-case
LEFT|Extracts a number of characters from a string (starting from left)
LENGTH|Returns the length of a string (in bytes)
LOCATE|Returns the position of the first occurrence of a substring in a string
LOWER|Converts a string to lower-case
LPAD|Left-pads a string with another string, to a certain length
LTRIM|Removes leading spaces from a string
MID|Extracts a substring from a string (starting at any position)
POSITION|Returns the position of the first occurrence of a substring in a string
REPEAT|Repeats a string as many times as specified
REPLACE|Replaces all occurrences of a substring within a string, with a new substring
REVERSE|Reverses a string and returns the result
RIGHT|Extracts a number of characters from a string (starting from right)
RPAD|Right-pads a string with another string, to a certain length
RTRIM|Removes trailing spaces from a string
SPACE|Returns a string of the specified number of space characters
STRCMP|Compares two strings
SUBSTR|Extracts a substring from a string (starting at any position)
SUBSTRING|Extracts a substring from a string (starting at any position)
SUBSTRING_INDEX|Returns a substring of a string before a specified number of delimiter occurs
TRIM|Removes leading and trailing spaces from a string
UCASE|Converts a string to upper-case
UPPER|Converts a string to upper-case


```python
%%sql
select ucase('test')
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>ucase(&#x27;test&#x27;)</th>
    </tr>
    <tr>
        <td>TEST</td>
    </tr>
</table>




```python
%%sql
select format(platformProfit,2) 
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>format(platformProfit,2)</th>
    </tr>
    <tr>
        <td>628.00</td>
    </tr>
    <tr>
        <td>449.00</td>
    </tr>
    <tr>
        <td>658.00</td>
    </tr>
    <tr>
        <td>761.00</td>
    </tr>
    <tr>
        <td>520.00</td>
    </tr>
    <tr>
        <td>437.00</td>
    </tr>
    <tr>
        <td>633.00</td>
    </tr>
    <tr>
        <td>416.00</td>
    </tr>
    <tr>
        <td>518.00</td>
    </tr>
    <tr>
        <td>483.00</td>
    </tr>
    <tr>
        <td>338.00</td>
    </tr>
    <tr>
        <td>431.00</td>
    </tr>
    <tr>
        <td>432.00</td>
    </tr>
    <tr>
        <td>676.00</td>
    </tr>
    <tr>
        <td>452.00</td>
    </tr>
    <tr>
        <td>552.00</td>
    </tr>
    <tr>
        <td>717.00</td>
    </tr>
    <tr>
        <td>307.00</td>
    </tr>
    <tr>
        <td>662.00</td>
    </tr>
    <tr>
        <td>425.00</td>
    </tr>
</table>



#### 7. Numeric

Numberic functions in MySQL

|Function|Description|
|--|--|
ABS|Returns the absolute value of a number
ACOS|Returns the arc cosine of a number
ASIN|Returns the arc sine of a number
ATAN|Returns the arc tangent of one or two numbers
ATAN2|Returns the arc tangent of two numbers
AVG|Returns the average value of an expression
CEIL|Returns the smallest integer value that is >= to a number
CEILING|Returns the smallest integer value that is >= to a number
COS|Returns the cosine of a number
COT|Returns the cotangent of a number
COUNT|Returns the number of records returned by a select query
DEGREES|Converts a value in radians to degrees
DIV|Used for integer division
EXP|Returns e raised to the power of a specified number
FLOOR|Returns the largest integer value that is <= to a number
GREATEST|Returns the greatest value of the list of arguments
LEAST|Returns the smallest value of the list of arguments
LN|Returns the natural logarithm of a number
LOG|Returns the natural logarithm of a number, or the logarithm of a number to a specified base
LOG10|Returns the natural logarithm of a number to base 10
LOG2|Returns the natural logarithm of a number to base 2
MAX|Returns the maximum value in a set of values
MIN|Returns the minimum value in a set of values
MOD|Returns the remainder of a number divided by another number
PI|Returns the value of PI
POW|Returns the value of a number raised to the power of another number
POWER|Returns the value of a number raised to the power of another number
RADIANS|Converts a degree value into radians
RAND|Returns a random number
ROUND|Rounds a number to a specified number of decimal places
SIGN|Returns the sign of a number
SIN|Returns the sine of a number
SQRT|Returns the square root of a number
SUM|Calculates the sum of a set of values
TAN|Returns the tangent of a number
TRUNCATE|Truncates a number to the specified number of decimal places

Let's check the profit that we sold out all products


```python
%%sql
select sum(platformProfit)
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>sum(platformProfit)</th>
    </tr>
    <tr>
        <td>10495</td>
    </tr>
</table>



Let's chech the average profit


```python
%%sql
select sum(platformProfit)/count(*)
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>sum(platformProfit)/count(*)</th>
    </tr>
    <tr>
        <td>524.7500</td>
    </tr>
</table>




```python
%%sql
select avg(platformProfit)
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>avg(platformProfit)</th>
    </tr>
    <tr>
        <td>524.7500</td>
    </tr>
</table>



And we can do ```round``` to it


```python
%%sql
select round(avg(platformProfit))
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>round(avg(platformProfit))</th>
    </tr>
    <tr>
        <td>525</td>
    </tr>
</table>



#### 8. Date/time manipulation

|Function|Description|
|--|--|
ADDDATE|Adds a time/date interval to a date and then returns the date
ADDTIME|Adds a time interval to a time/datetime and then returns the time/datetime
CURDATE|Returns the current date
CURRENT_DATE|Returns the current date
CURRENT_TIME|Returns the current time
CURRENT_TIMESTAMP|Returns the current date and time
CURTIME|Returns the current time
DATE|Extracts the date part from a datetime expression
DATEDIFF|Returns the number of days between two date values
DATE_ADD|Adds a time/date interval to a date and then returns the date
DATE_FORMAT|Formats a date
DATE_SUB|Subtracts a time/date interval from a date and then returns the date
DAY|Returns the day of the month for a given date
DAYNAME|Returns the weekday name for a given date
DAYOFMONTH|Returns the day of the month for a given date
DAYOFWEEK|Returns the weekday index for a given date
DAYOFYEAR|Returns the day of the year for a given date
EXTRACT|Extracts a part from a given date
FROM_DAYS|Returns a date from a numeric datevalue
HOUR|Returns the hour part for a given date
LAST_DAY|Extracts the last day of the month for a given date
LOCALTIME|Returns the current date and time
LOCALTIMESTAMP|Returns the current date and time
MAKEDATE|Creates and returns a date based on a year and a number of days value
MAKETIME|Creates and returns a time based on an hour, minute, and second value
MICROSECOND|Returns the microsecond part of a time/datetime
MINUTE|Returns the minute part of a time/datetime
MONTH|Returns the month part for a given date
MONTHNAME|Returns the name of the month for a given date
NOW|Returns the current date and time
PERIOD_ADD|Adds a specified number of months to a period
PERIOD_DIFF|Returns the difference between two periods
QUARTER|Returns the quarter of the year for a given date value
SECOND|Returns the seconds part of a time/datetime
SEC_TO_TIME|Returns a time value based on the specified seconds
STR_TO_DATE|Returns a date based on a string and a format
SUBDATE|Subtracts a time/date interval from a date and then returns the date
SUBTIME|Subtracts a time interval from a datetime and then returns the time/datetime
SYSDATE|Returns the current date and time
TIME|Extracts the time part from a given time/datetime
TIME_FORMAT|Formats a time by a specified format
TIME_TO_SEC|Converts a time value into seconds
TIMEDIFF|Returns the difference between two time/datetime expressions
TIMESTAMP|Returns a datetime value based on a date or datetime value
TO_DAYS|Returns the number of days between a date and date "0000-00-00"
WEEK|Returns the week number for a given date
WEEKDAY|Returns the weekday number for a given date
WEEKOFYEAR|Returns the week number for a given date
YEAR|Returns the year part for a given date
YEARWEEK|Returns the year and week number for a given date


```python
%%sql
select *, month(roomDate), dayofmonth(roomDate) from room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
        <th>month(roomDate)</th>
        <th>dayofmonth(roomDate)</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
        <td>5</td>
        <td>9</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
        <td>6</td>
        <td>13</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
        <td>5</td>
        <td>9</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
        <td>4</td>
        <td>16</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
        <td>4</td>
        <td>24</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
        <td>6</td>
        <td>21</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
        <td>5</td>
        <td>25</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
        <td>5</td>
        <td>17</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
        <td>6</td>
        <td>26</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
        <td>4</td>
        <td>29</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
        <td>5</td>
        <td>13</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
        <td>5</td>
        <td>11</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
        <td>4</td>
        <td>3</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
        <td>5</td>
        <td>23</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
        <td>6</td>
        <td>18</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
        <td>6</td>
        <td>25</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
        <td>4</td>
        <td>15</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
        <td>6</td>
        <td>5</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
        <td>6</td>
        <td>6</td>
    </tr>
</table>



#### 9. Calculation

When data is retrieved from a MySQL database it is not always in the form we need it. For example, we may need to display a customer name and address as a single text string, but in reality the name and address are held in separate tables.


```python
%%sql
select * from room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
    </tr>
</table>



Let's say that for now we need to reduce 10 for any user that order a room. So let's check the price after using cupons


```python
%%sql
select *, price - 10 cupons
from room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
        <th>cupons</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
        <td>331</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
        <td>271</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
        <td>231</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
        <td>475</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
        <td>372</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
        <td>121</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
        <td>392</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
        <td>134</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
        <td>335</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
        <td>477</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
        <td>141</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
        <td>449</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
        <td>99</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
        <td>278</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
        <td>399</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
        <td>297</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
        <td>328</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
        <td>205</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
        <td>125</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
        <td>264</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
        <td>297</td>
    </tr>
</table>



#### 10. Conversion

MySQL Conversion Functions convert a value from one data type to another. Conversions can be conducted between string, date, and numeric type of data.
There are three Conversion Functions in MySQL: CONVERT, CAST, BINARY.

#### 10.1 CONVERT

CONVERT can be used in either of the following two forms:

Form 1: 

```sql
CONVERT(expr,type)
```

In this form, CONVERT takes a value in the form of expr and converts it to a value of type.

* BINARY
* CHAR
* DATE
* DATETIME
* TIME
* DECIMAL
* SIGNED
* UNSIGNED


```python
%%sql
SELECT CONVERT('1998-03-16 00:00:00', DATE) AS date1,
       CONVERT('98-03-16 00:00:00', DATE) AS date2,
       CONVERT('19980316', DATE) AS date3,
       CONVERT('980316', DATE) AS date4;
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>date1</th>
        <th>date2</th>
        <th>date3</th>
        <th>date4</th>
    </tr>
    <tr>
        <td>1998-03-16</td>
        <td>1998-03-16</td>
        <td>1998-03-16</td>
        <td>1998-03-16</td>
    </tr>
</table>



Form 2: 

```sql
CONVERT(expr USING transcoding_name)
```

In this form, CONVERT() with USING is used to convert data between different character sets (utf8, latin1, ...) In MySQL, transcoding names are the same as the corresponding character set names.


```python
%%sql
SELECT CONVERT('abc' USING UTF8MB4);
```

     * mysql+pymysql://root:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>CONVERT(&#x27;abc&#x27; USING UTF8MB4)</th>
    </tr>
    <tr>
        <td>abc</td>
    </tr>
</table>



#### 10.2 CAST

The CAST function converts any type of value to a value of the specified type

```sql
CAST(expression AS TYPE);
```

The CAST () function converts any type of value to a value of the specified type. 

The target type can be one of the following types: 

* BINARY
* CHAR
* DATE
* DATETIME
* TIME
* DECIMAL
* SIGNED
* UNSIGNED


```python
%%sql
select concat('price ',cast(platformProfit as char)) as profit
from TravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>profit</th>
    </tr>
    <tr>
        <td>price 628</td>
    </tr>
    <tr>
        <td>price 449</td>
    </tr>
    <tr>
        <td>price 658</td>
    </tr>
    <tr>
        <td>price 761</td>
    </tr>
    <tr>
        <td>price 520</td>
    </tr>
    <tr>
        <td>price 437</td>
    </tr>
    <tr>
        <td>price 633</td>
    </tr>
    <tr>
        <td>price 416</td>
    </tr>
    <tr>
        <td>price 518</td>
    </tr>
    <tr>
        <td>price 483</td>
    </tr>
    <tr>
        <td>price 338</td>
    </tr>
    <tr>
        <td>price 431</td>
    </tr>
    <tr>
        <td>price 432</td>
    </tr>
    <tr>
        <td>price 676</td>
    </tr>
    <tr>
        <td>price 452</td>
    </tr>
    <tr>
        <td>price 552</td>
    </tr>
    <tr>
        <td>price 717</td>
    </tr>
    <tr>
        <td>price 307</td>
    </tr>
    <tr>
        <td>price 662</td>
    </tr>
    <tr>
        <td>price 425</td>
    </tr>
</table>



#### 10.3 BINARY

BINARY str
BINARY is an operator rather than function. It casts a string following it to a binary string.

BINARY str is shorthand for CAST(str AS BINARY) or CONVERT(expr, BINARY)

#### 11. Aggregate functions

An aggregate function performs a calculation on multiple values and returns a single value.

|Aggregate function|Description|
|--|--|
AVG()|Return the average of non-NULL values.
BIT_AND()|Return bitwise AND.
BIT_OR()|Return bitwise OR.
BIT_XOR()|Return bitwise XOR.
COUNT()|Return the number of rows in a group, including rows with NULL values.
GROUP_CONCAT()|Return a concatenated string.
JSON_ARRAYAGG()|Return result set as a single JSON array.
JSON_OBJECTAGG()|Return result set as a single JSON object.
MAX()|Return the highest value (maximum) in a set of non-NULL values.
MIN()|Return the lowest value (minimum) in a set of non-NULL values.
STDEV()|Return the population standard deviation.
STDDEV_POP()|Return the population standard deviation.
STDDEV_SAMP()|Return the sample standard deviation.
SUM()|Return the summation of all non-NULL values a set.
VAR_POP()|Return the population standard variance.
VARP_SAM()|Return the sample variance.
VARIANCE()|Return the population standard variance.

Let's check the total profit for different interval


```python
%%sql
select sum(platformProfit) total_profit,
    case
        when platformProfit between 1 and 300
            then '(0,300]'
        when platformProfit between 301 and 600
            then '(300,600]'
        when platformProfit between 601 and 900
            then '(600,900]'
        else '(900,)' 
    end as profit_interval,
    count(idTravelProduct) product_number
from TravelProduct
group by profit_interval
order by profit_interval
```

     * mysql+pymysql://root:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>total_profit</th>
        <th>profit_interval</th>
        <th>product_number</th>
    </tr>
    <tr>
        <td>5760</td>
        <td>(300,600]</td>
        <td>13</td>
    </tr>
    <tr>
        <td>4735</td>
        <td>(600,900]</td>
        <td>7</td>
    </tr>
</table>



### 5. Perform JOIN operation 

(including INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN operations and display the sample result using SELECT statement)

![](https://www.guru99.com/images/CrossJoin.png)


```python
%%sql
select * from  Customer c
cross join User u
```

     * mysql+pymysql://root:***@localhost/mydb
    250 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
        <th>idUser_1</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
</table>



![](https://www.guru99.com/images/InnerJoin.png)


```python
%%sql
select * from  Customer c
inner join User u
on c.idUser = u.idUser
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
        <th>idUser_1</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
</table>



![](https://www.guru99.com/images/LeftOuterJoin.png)


```python
%%sql
select * from  Customer c
left join User u
on c.idUser = u.idUser
```

     * mysql+pymysql://root:***@localhost/mydb
    10 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
        <th>idUser_1</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
</table>



![](https://www.guru99.com/images/RightOuterJoin.png)


```python
%%sql
select * from  Customer c
right join User u
on c.idUser = u.idUser
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idCustomer</th>
        <th>idUser</th>
        <th>idUser_1</th>
        <th>userName</th>
        <th>password</th>
        <th>role</th>
    </tr>
    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>user_1</td>
        <td>password_1</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>2</td>
        <td>2</td>
        <td>2</td>
        <td>user_2</td>
        <td>password_2</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>3</td>
        <td>3</td>
        <td>3</td>
        <td>user_3</td>
        <td>password_3</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>4</td>
        <td>user_4</td>
        <td>password_4</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>5</td>
        <td>5</td>
        <td>5</td>
        <td>user_5</td>
        <td>password_5</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>6</td>
        <td>6</td>
        <td>6</td>
        <td>user_6</td>
        <td>password_6</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>7</td>
        <td>7</td>
        <td>7</td>
        <td>user_7</td>
        <td>password_7</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>8</td>
        <td>8</td>
        <td>8</td>
        <td>user_8</td>
        <td>password_8</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>9</td>
        <td>9</td>
        <td>9</td>
        <td>user_9</td>
        <td>password_9</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>10</td>
        <td>10</td>
        <td>10</td>
        <td>user_10</td>
        <td>password_10</td>
        <td>Customer</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>11</td>
        <td>user_11</td>
        <td>password_11</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>12</td>
        <td>user_12</td>
        <td>password_12</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>13</td>
        <td>user_13</td>
        <td>password_13</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>14</td>
        <td>user_14</td>
        <td>password_14</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>15</td>
        <td>user_15</td>
        <td>password_15</td>
        <td>Admin</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>16</td>
        <td>user_16</td>
        <td>password_16</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>17</td>
        <td>user_17</td>
        <td>password_17</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>18</td>
        <td>user_18</td>
        <td>password_18</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>19</td>
        <td>user_19</td>
        <td>password_19</td>
        <td>Supplier</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>20</td>
        <td>user_20</td>
        <td>password_20</td>
        <td>supplier</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>21</td>
        <td>user_21</td>
        <td>password_21</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>22</td>
        <td>user_22</td>
        <td>password_22</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>23</td>
        <td>user_23</td>
        <td>password_23</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>24</td>
        <td>user_24</td>
        <td>password_24</td>
        <td>Guider</td>
    </tr>
    <tr>
        <td>None</td>
        <td>None</td>
        <td>25</td>
        <td>user_25</td>
        <td>password_25</td>
        <td>Guider</td>
    </tr>
</table>



#### 6. Perform Queries and Sub-queries operations and display the result using SELECT statement 

Let's check the order detail from customer


```python
%%sql
select c.idOrder,t.idTravelProduct,t.idRoom,t.idFlight,t.platformprofit from CustomerOrder c
inner join TravelProduct t
on c.idTravelProduct = t.idTravelProduct
```

     * mysql+pymysql://root:***@localhost/mydb
    50 rows affected.





<table>
    <tr>
        <th>idOrder</th>
        <th>idTravelProduct</th>
        <th>idRoom</th>
        <th>idFlight</th>
        <th>platformprofit</th>
    </tr>
    <tr>
        <td>22</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>25</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>39</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>18</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>31</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>50</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>7</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>19</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>20</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
    </tr>
    <tr>
        <td>35</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
    </tr>
    <tr>
        <td>14</td>
        <td>5</td>
        <td>15</td>
        <td>6</td>
        <td>520</td>
    </tr>
    <tr>
        <td>32</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
    </tr>
    <tr>
        <td>36</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
    </tr>
    <tr>
        <td>26</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>33</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>40</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>47</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>16</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>24</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>34</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>41</td>
        <td>10</td>
        <td>13</td>
        <td>5</td>
        <td>483</td>
    </tr>
    <tr>
        <td>42</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>43</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>45</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>38</td>
        <td>12</td>
        <td>19</td>
        <td>23</td>
        <td>431</td>
    </tr>
    <tr>
        <td>29</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
    </tr>
    <tr>
        <td>37</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
    </tr>
    <tr>
        <td>2</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>6</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>12</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>44</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>8</td>
        <td>15</td>
        <td>21</td>
        <td>23</td>
        <td>452</td>
    </tr>
    <tr>
        <td>17</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
    </tr>
    <tr>
        <td>9</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
    </tr>
    <tr>
        <td>10</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
    </tr>
    <tr>
        <td>1</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>5</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>49</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>15</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>23</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>28</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>46</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>27</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
    </tr>
    <tr>
        <td>48</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
    </tr>
</table>



But what if I also want to check the room and filght detail?

Let's use sub-query


```python
%%sql
select o_r.idOrder,o_r.idTravelProduct,o_r.idRoom,o_r.idFlight,o_r.platformprofit,o_r.roomType,o_r.roomDate,f.route,f.flightDate from (
    select o.idOrder,o.idTravelProduct,o.idRoom,o.idFlight,o.platformprofit,r.roomType,r.roomDate from (
        select c.idOrder,t.idTravelProduct,t.idRoom,t.idFlight,t.platformprofit from CustomerOrder c
        inner join TravelProduct t
        on c.idTravelProduct = t.idTravelProduct) o
    inner join Room r
    on r.idRoom = o.idRoom) o_r
inner join Flight f
on f.idFlight = o_r.idFlight

```

     * mysql+pymysql://root:***@localhost/mydb
    50 rows affected.





<table>
    <tr>
        <th>idOrder</th>
        <th>idTravelProduct</th>
        <th>idRoom</th>
        <th>idFlight</th>
        <th>platformprofit</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>route</th>
        <th>flightDate</th>
    </tr>
    <tr>
        <td>22</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>25</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>39</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>18</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>31</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>50</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>7</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>19</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>20</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>35</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>14</td>
        <td>5</td>
        <td>15</td>
        <td>6</td>
        <td>520</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-04-10</td>
    </tr>
    <tr>
        <td>32</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>China-America</td>
        <td>2020-04-13</td>
    </tr>
    <tr>
        <td>36</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>China-America</td>
        <td>2020-04-13</td>
    </tr>
    <tr>
        <td>26</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>33</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>40</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>47</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>16</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>24</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>34</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>41</td>
        <td>10</td>
        <td>13</td>
        <td>5</td>
        <td>483</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>42</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>43</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>45</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>38</td>
        <td>12</td>
        <td>19</td>
        <td>23</td>
        <td>431</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>29</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>37</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>2</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>6</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>12</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>44</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>8</td>
        <td>15</td>
        <td>21</td>
        <td>23</td>
        <td>452</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>17</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>9</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
    </tr>
    <tr>
        <td>10</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
    </tr>
    <tr>
        <td>1</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>5</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>49</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>15</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>23</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>28</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>46</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>27</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>48</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
</table>



### 7. Create four different users (Admin, Tester, Developer and User) 

with different privilege settings and display access differentiation among four users. Use GRANT and REVOKE command to give/remove additional access/rights to DB. 

#### 7.1 Grant

Statement

```sql
-- Use ```create``` to create user
create user 'USERNAME'@'HOST' identified by 'PASSWORD';
```

```sql
-- Use ```grant``` to add new users and authorize them to access MySQL objects
GRANT privilege,[privilege],.. ON privilege_level
TO user [IDENTIFIED BYpassword]
[REQUIREtsl_option]
[WITH[GRANT_OPTION|resource_option]];
```

Grant admin user


```python
%%sql
create user 'admin'@'localhost' identified by 'admin';
grant all on mydb.* to 'admin'@'localhost';
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.
    0 rows affected.





    []



Grant customer user

They can only view these tables:
* Order
* TravelProduct


```python
%%sql
create user 'customer'@'localhost' identified by 'customer';
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
grant select on mydb.CustomerOrder to 'customer'@'localhost';
grant select on mydb.TravelProduct to 'customer'@'localhost';
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.
    0 rows affected.





    []



Grant supplier user

They can only view, update, delete, insert these tables:
* Room
* Flight


```python
%%sql
create user 'supplier'@'localhost' identified by 'supplier'
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
grant select,update,delete,insert on mydb.Room to 'supplier'@'localhost';
grant select,update,delete,insert on mydb.Flight to 'supplier'@'localhost';
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.
    0 rows affected.





    []



Grant guider user

They can only view table TravelProduct


```python
%%sql
create user 'guider'@'localhost' identified by 'guider';
```

     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
grant select on mydb.TravelProduct to 'guider'@'localhost';
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []



Let's check if the privilege is work

Take guider as example


```python
%sql mysql+pymysql://guider:guider@localhost/mydb
```




    'Connected: guider@mydb'




```python
%%sql
select * from TravelProduct
```

     * mysql+pymysql://guider:***@localhost/mydb
       mysql+pymysql://root:***@localhost/mydb
    20 rows affected.





<table>
    <tr>
        <th>idTravelProduct</th>
        <th>idFlight</th>
        <th>idRoom</th>
        <th>idGuider</th>
        <th>description</th>
        <th>platformProfit</th>
    </tr>
    <tr>
        <td>1</td>
        <td>19</td>
        <td>30</td>
        <td>25</td>
        <td>Good</td>
        <td>628</td>
    </tr>
    <tr>
        <td>2</td>
        <td>12</td>
        <td>22</td>
        <td>21</td>
        <td>Mid</td>
        <td>449</td>
    </tr>
    <tr>
        <td>3</td>
        <td>20</td>
        <td>21</td>
        <td>25</td>
        <td>Good</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>1</td>
        <td>7</td>
        <td>25</td>
        <td>Mid</td>
        <td>761</td>
    </tr>
    <tr>
        <td>5</td>
        <td>6</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>520</td>
    </tr>
    <tr>
        <td>6</td>
        <td>17</td>
        <td>29</td>
        <td>25</td>
        <td>Perfect</td>
        <td>437</td>
    </tr>
    <tr>
        <td>7</td>
        <td>14</td>
        <td>28</td>
        <td>25</td>
        <td>Mid</td>
        <td>633</td>
    </tr>
    <tr>
        <td>8</td>
        <td>22</td>
        <td>14</td>
        <td>23</td>
        <td>Mid</td>
        <td>416</td>
    </tr>
    <tr>
        <td>9</td>
        <td>23</td>
        <td>15</td>
        <td>25</td>
        <td>Good</td>
        <td>518</td>
    </tr>
    <tr>
        <td>10</td>
        <td>5</td>
        <td>13</td>
        <td>25</td>
        <td>Perfect</td>
        <td>483</td>
    </tr>
    <tr>
        <td>11</td>
        <td>20</td>
        <td>40</td>
        <td>23</td>
        <td>Perfect</td>
        <td>338</td>
    </tr>
    <tr>
        <td>12</td>
        <td>23</td>
        <td>19</td>
        <td>23</td>
        <td>Good</td>
        <td>431</td>
    </tr>
    <tr>
        <td>13</td>
        <td>1</td>
        <td>7</td>
        <td>22</td>
        <td>Mid</td>
        <td>432</td>
    </tr>
    <tr>
        <td>14</td>
        <td>2</td>
        <td>15</td>
        <td>23</td>
        <td>Perfect</td>
        <td>676</td>
    </tr>
    <tr>
        <td>15</td>
        <td>23</td>
        <td>21</td>
        <td>21</td>
        <td>Good</td>
        <td>452</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>24</td>
        <td>Mid</td>
        <td>552</td>
    </tr>
    <tr>
        <td>17</td>
        <td>9</td>
        <td>7</td>
        <td>22</td>
        <td>Good</td>
        <td>717</td>
    </tr>
    <tr>
        <td>18</td>
        <td>5</td>
        <td>15</td>
        <td>25</td>
        <td>Mid</td>
        <td>307</td>
    </tr>
    <tr>
        <td>19</td>
        <td>18</td>
        <td>30</td>
        <td>23</td>
        <td>Mid</td>
        <td>662</td>
    </tr>
    <tr>
        <td>20</td>
        <td>2</td>
        <td>41</td>
        <td>25</td>
        <td>Mid</td>
        <td>425</td>
    </tr>
</table>




```python
%%sql
select * from CustomerOrder
```

     * mysql+pymysql://guider:***@localhost/mydb
       mysql+pymysql://root:***@localhost/mydb
    (pymysql.err.OperationalError) (1142, "SELECT command denied to user 'guider'@'localhost' for table 'customerorder'")
    [SQL: select * from CustomerOrder]
    (Background on this error at: http://sqlalche.me/e/e3q8)



```python
%%sql
drop table TravelProduct;
```

     * mysql+pymysql://guider:***@localhost/mydb
       mysql+pymysql://root:***@localhost/mydb
    (pymysql.err.OperationalError) (1142, "DROP command denied to user 'guider'@'localhost' for table 'travelproduct'")
    [SQL: drop table TravelProduct;]
    (Background on this error at: http://sqlalche.me/e/e3q8)


#### 7.2 Revoke

Statement

```sql
REVOKE
    priv_type [(column_list)]
      [, priv_type [(column_list)]] ...
    ON [object_type] priv_level
    FROM user_or_role [, user_or_role] ...
```

Let's revoke the supplier privilege from table room


```python
%sql mysql+pymysql://root:fjwwzx970814@localhost/mydb
```




    'Connected: root@mydb'




```python
%%sql
revoke all privileges on mydb.room from 'supplier'@'localhost';
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
    0 rows affected.





    []




```python
%sql mysql+pymysql://supplier:supplier@localhost/mydb
```




    'Connected: supplier@mydb'




```python
%%sql
select * from room
```

       mysql+pymysql://guider:***@localhost/mydb
       mysql+pymysql://root:***@localhost/mydb
     * mysql+pymysql://supplier:***@localhost/mydb
    (pymysql.err.OperationalError) (1142, "SELECT command denied to user 'supplier'@'localhost' for table 'room'")
    [SQL: select * from room]
    (Background on this error at: http://sqlalche.me/e/e3q8)


The supplier cannot access to table room


```python
%%sql
select * from flight
```

       mysql+pymysql://guider:***@localhost/mydb
       mysql+pymysql://root:***@localhost/mydb
     * mysql+pymysql://supplier:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idFlight</th>
        <th>idSupplier</th>
        <th>route</th>
        <th>flightDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>16044</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>17</td>
        <td>China-America</td>
        <td>2020-06-10</td>
        <td>11384</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-25</td>
        <td>12000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-04-19</td>
        <td>17422</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>20</td>
        <td>China-America</td>
        <td>2020-06-19</td>
        <td>15136</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-10</td>
        <td>10575</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>17</td>
        <td>China-Japen</td>
        <td>2020-05-21</td>
        <td>16731</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-13</td>
        <td>15579</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
        <td>19223</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-06-10</td>
        <td>14325</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>16</td>
        <td>China-France</td>
        <td>2020-04-15</td>
        <td>10000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-05-24</td>
        <td>12045</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-04-11</td>
        <td>13643</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>19</td>
        <td>China-America</td>
        <td>2020-04-13</td>
        <td>11813</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-06-27</td>
        <td>14727</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-05</td>
        <td>14129</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-30</td>
        <td>13298</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>13064</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-05-27</td>
        <td>10642</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
        <td>14763</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>China-Japen</td>
        <td>2020-05-06</td>
        <td>18436</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-28</td>
        <td>11112</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
        <td>17515</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-04-14</td>
        <td>13450</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-04-25</td>
        <td>11585</td>
        <td>1</td>
    </tr>
</table>



### 8. Create two examples of STORED PROCEDURE and display the results. 

#### Room & Flight Insertion

room

```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_room`(
	IN idsupplier int,
    IN roomType varchar(45),
    IN roomDate date,
    IN price decimal(45)
)
BEGIN
	declare targetSupplier int;
    
    -- Find the target supplier id
    select s.idSupplier into targetSupplier
    from Supplier s
    where s.idSupplier = idsupplier;
    
    insert into Room (idSupplier,roomType,roomDate,price,ifAvailable) values (targetSupplier,roomType,roomDate,price,1);
    
    select 'succeed';

END
```


```python
%%sql
call insert_room(16,"single","2020-06-18",338);
call insert_room(17,"double","2020-06-25",215);
call insert_room(18,"double","2020-04-15",135);
call insert_room(19,"single","2020-06-05",274);
call insert_room(20,"double","2020-06-06",307);
```


```python
%%sql
select * from room
```

     * mysql+pymysql://root:***@localhost/mydb
    21 rows affected.





<table>
    <tr>
        <th>idRoom</th>
        <th>idSupplier</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>7</td>
        <td>16</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>341</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>16</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>281</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>241</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>485</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-05</td>
        <td>382</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>20</td>
        <td>double</td>
        <td>2020-04-16</td>
        <td>131</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>16</td>
        <td>single</td>
        <td>2020-04-24</td>
        <td>402</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>17</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>144</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>18</td>
        <td>single</td>
        <td>2020-05-25</td>
        <td>345</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>19</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>487</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>20</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>151</td>
        <td>1</td>
    </tr>
    <tr>
        <td>28</td>
        <td>16</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>459</td>
        <td>1</td>
    </tr>
    <tr>
        <td>29</td>
        <td>17</td>
        <td>single</td>
        <td>2020-05-13</td>
        <td>109</td>
        <td>1</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>288</td>
        <td>1</td>
    </tr>
    <tr>
        <td>31</td>
        <td>19</td>
        <td>single</td>
        <td>2020-04-03</td>
        <td>409</td>
        <td>1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>20</td>
        <td>single</td>
        <td>2020-05-23</td>
        <td>307</td>
        <td>1</td>
    </tr>
    <tr>
        <td>38</td>
        <td>16</td>
        <td>single</td>
        <td>2020-06-18</td>
        <td>338</td>
        <td>1</td>
    </tr>
    <tr>
        <td>39</td>
        <td>17</td>
        <td>double</td>
        <td>2020-06-25</td>
        <td>215</td>
        <td>1</td>
    </tr>
    <tr>
        <td>40</td>
        <td>18</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>135</td>
        <td>1</td>
    </tr>
    <tr>
        <td>41</td>
        <td>19</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>274</td>
        <td>1</td>
    </tr>
    <tr>
        <td>42</td>
        <td>20</td>
        <td>double</td>
        <td>2020-06-06</td>
        <td>307</td>
        <td>1</td>
    </tr>
</table>



Flight

```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_flight`(
	IN idsupplier int,
    IN route varchar(45),
    IN flightDate date,
    IN price decimal(45)
)
BEGIN

	declare targetSupplier int;
    
    -- Find the target supplier id
    select s.idSupplier into targetSupplier
    from Supplier s
    where s.idSupplier = idsupplier;
    
    insert into Flight (idSupplier,route,flightDate,price,ifAvailable) values (targetSupplier,route,flightDate,price,1);
    
    select 'succeed';
END
```


```python
%%sql
call insert_flight(16,"China-Japen","2020-05-06",18436);
call insert_flight(17,"China-France","2020-04-28",11112);
call insert_flight(18,"China-Japen","2020-06-22",17515);
call insert_flight(19,"China-France","2020-04-14",13450);
call insert_flight(20,"China-France","2020-04-25",11585);
```


```python
%%sql
select * from Flight
```

     * mysql+pymysql://root:***@localhost/mydb
    25 rows affected.





<table>
    <tr>
        <th>idFlight</th>
        <th>idSupplier</th>
        <th>route</th>
        <th>flightDate</th>
        <th>price</th>
        <th>ifAvailable</th>
    </tr>
    <tr>
        <td>1</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>16044</td>
        <td>1</td>
    </tr>
    <tr>
        <td>2</td>
        <td>17</td>
        <td>China-America</td>
        <td>2020-06-10</td>
        <td>11384</td>
        <td>1</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-25</td>
        <td>12000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-04-19</td>
        <td>17422</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>20</td>
        <td>China-America</td>
        <td>2020-06-19</td>
        <td>15136</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-10</td>
        <td>10575</td>
        <td>1</td>
    </tr>
    <tr>
        <td>7</td>
        <td>17</td>
        <td>China-Japen</td>
        <td>2020-05-21</td>
        <td>16731</td>
        <td>1</td>
    </tr>
    <tr>
        <td>8</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-05-13</td>
        <td>15579</td>
        <td>1</td>
    </tr>
    <tr>
        <td>9</td>
        <td>19</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
        <td>19223</td>
        <td>1</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-06-10</td>
        <td>14325</td>
        <td>1</td>
    </tr>
    <tr>
        <td>11</td>
        <td>16</td>
        <td>China-France</td>
        <td>2020-04-15</td>
        <td>10000</td>
        <td>1</td>
    </tr>
    <tr>
        <td>12</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-05-24</td>
        <td>12045</td>
        <td>1</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-04-11</td>
        <td>13643</td>
        <td>1</td>
    </tr>
    <tr>
        <td>14</td>
        <td>19</td>
        <td>China-America</td>
        <td>2020-04-13</td>
        <td>11813</td>
        <td>1</td>
    </tr>
    <tr>
        <td>15</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-06-27</td>
        <td>14727</td>
        <td>1</td>
    </tr>
    <tr>
        <td>16</td>
        <td>16</td>
        <td>China-America</td>
        <td>2020-04-05</td>
        <td>14129</td>
        <td>1</td>
    </tr>
    <tr>
        <td>17</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-30</td>
        <td>13298</td>
        <td>1</td>
    </tr>
    <tr>
        <td>18</td>
        <td>18</td>
        <td>China-America</td>
        <td>2020-06-17</td>
        <td>13064</td>
        <td>1</td>
    </tr>
    <tr>
        <td>19</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-05-27</td>
        <td>10642</td>
        <td>1</td>
    </tr>
    <tr>
        <td>20</td>
        <td>20</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
        <td>14763</td>
        <td>1</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>China-Japen</td>
        <td>2020-05-06</td>
        <td>18436</td>
        <td>1</td>
    </tr>
    <tr>
        <td>22</td>
        <td>17</td>
        <td>China-France</td>
        <td>2020-04-28</td>
        <td>11112</td>
        <td>1</td>
    </tr>
    <tr>
        <td>23</td>
        <td>18</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
        <td>17515</td>
        <td>1</td>
    </tr>
    <tr>
        <td>24</td>
        <td>19</td>
        <td>China-France</td>
        <td>2020-04-14</td>
        <td>13450</td>
        <td>1</td>
    </tr>
    <tr>
        <td>25</td>
        <td>20</td>
        <td>China-France</td>
        <td>2020-04-25</td>
        <td>11585</td>
        <td>1</td>
    </tr>
</table>



#### 9. Perform COMMIT and ROLLBACK operations with SAVEPOINT/ROLLBACK TO SAVEPOINT. 

(Include the use of LOCK/UNLOCK Table operations. Display result of each operation. )

#### 9.1 Transaction

* In MySQL, only databases or tables that use the Innodb database engine support transactions.
* Transaction processing can be used to maintain the integrity of the database, ensuring that batches of SQL statements are all executed or not executed at all.
* Transactions are used to manage insert, update, and delete statements

```sql
BEGIN -- start a transaction
ROLLBACK -- transaction rollback
COMMIT -- transaction confirmation

SAVEPOINT identifier -- SAVEPOINT allows you to create a savepoint in a transaction, there can be multiple SAVEPOINT in a transaction;
RELEASE SAVEPOINT identifier -- deletes the savepoint of a transaction. When there is no specified savepoint, executing this statement will throw an exception;
ROLLBACK TO identifier -- rolls back the transaction to the mark point;
```

lock unlock

```sql
LOCK TABLE table1 locktype, table2 locktype ...
UNLOCK TABLE[S]
```


```python
%sql mysql+pymysql://root:fjwwzx970814@localhost/mydb
```




    'Connected: root@mydb'



Let's try delete some data from a table and rollback

![](./res/1.png)  
![](./res/2.png)  
![](./res/3.png)

#### 9.2 Lock

There are four types of MySQL LOCK locks, each of which has a different scope:

READ  
All users can only read the locked table, and cannot modify the table (including the user who executes LOCK). When the table does not have a WRITE write lock, the READ read lock is executed.

READ LOCAL  
The lock performed is the same as READ except that the INSERT command is allowed.

WRITE  
Except that the current user is allowed to read and modify the locked table, all access by other users is completely blocked. A WRITE write lock is executed only when all other locks are canceled.

LOW PRIORITY WRITE  
Low-priority read locks, during the waiting time (waiting for other locks to be cancelled), other users' access will be considered to have executed the READ read lock, so the waiting time will increase

Note: MySQL lock cannot be used in functions and stored procedures


```python
%%sql
show open tables from mydb
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    9 rows affected.





<table>
    <tr>
        <th>Database</th>
        <th>Table</th>
        <th>In_use</th>
        <th>Name_locked</th>
    </tr>
    <tr>
        <td>mydb</td>
        <td>room</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customer</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>guider</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>admin</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>supplier</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>user</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>travelproduct</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customerorder</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>flight</td>
        <td>0</td>
        <td>0</td>
    </tr>
</table>



Let's lock the admin table as read only


```python
%%sql
lock tables admin read
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    0 rows affected.





    []



Let's check if it has been locked


```python
%%sql
show open tables from mydb
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    9 rows affected.





<table>
    <tr>
        <th>Database</th>
        <th>Table</th>
        <th>In_use</th>
        <th>Name_locked</th>
    </tr>
    <tr>
        <td>mydb</td>
        <td>room</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customer</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>guider</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>admin</td>
        <td>1</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>supplier</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>user</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>travelproduct</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customerorder</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>flight</td>
        <td>0</td>
        <td>0</td>
    </tr>
</table>




```python
%%sql
delete from admin where idadmin = 11
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb



    ---------------------------------------------------------------------------

    InternalError                             Traceback (most recent call last)

    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in _execute_context(self, dialect, constructor, statement, parameters, *args)
       1248                     self.dialect.do_execute(
    -> 1249                         cursor, statement, parameters, context
       1250                     )


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/default.py in do_execute(self, cursor, statement, parameters, context)
        579     def do_execute(self, cursor, statement, parameters, context=None):
    --> 580         cursor.execute(statement, parameters)
        581 


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/cursors.py in execute(self, query, args)
        169 
    --> 170         result = self._query(query)
        171         self._executed = query


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/cursors.py in _query(self, q)
        327         self._clear_result()
    --> 328         conn.query(q)
        329         self._do_get_result()


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in query(self, sql, unbuffered)
        516         self._execute_command(COMMAND.COM_QUERY, sql)
    --> 517         self._affected_rows = self._read_query_result(unbuffered=unbuffered)
        518         return self._affected_rows


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in _read_query_result(self, unbuffered)
        731             result = MySQLResult(self)
    --> 732             result.read()
        733         self._result = result


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in read(self)
       1074         try:
    -> 1075             first_packet = self.connection._read_packet()
       1076 


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in _read_packet(self, packet_type)
        683         packet = packet_type(buff, self.encoding)
    --> 684         packet.check_error()
        685         return packet


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/protocol.py in check_error(self)
        219             if DEBUG: print("errno =", errno)
    --> 220             err.raise_mysql_exception(self._data)
        221 


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/err.py in raise_mysql_exception(data)
        108     errorclass = error_map.get(errno, InternalError)
    --> 109     raise errorclass(errno, errval)
    

    InternalError: (1099, "Table 'admin' was locked with a READ lock and can't be updated")

    
    The above exception was the direct cause of the following exception:


    InternalError                             Traceback (most recent call last)

    <ipython-input-70-5b1b0d9659a2> in <module>
    ----> 1 get_ipython().run_cell_magic('sql', '', 'delete from admin where idadmin = 11\n')
    

    ~/opt/anaconda3/lib/python3.7/site-packages/IPython/core/interactiveshell.py in run_cell_magic(self, magic_name, line, cell)
       2357             with self.builtin_trap:
       2358                 args = (magic_arg_s, cell)
    -> 2359                 result = fn(*args, **kwargs)
       2360             return result
       2361 


    </Users/brickeawang/opt/anaconda3/lib/python3.7/site-packages/decorator.py:decorator-gen-157> in execute(self, line, cell, local_ns)


    ~/opt/anaconda3/lib/python3.7/site-packages/IPython/core/magic.py in <lambda>(f, *a, **k)
        185     # but it's overkill for just that one bit of state.
        186     def magic_deco(arg):
    --> 187         call = lambda f, *a, **k: f(*a, **k)
        188 
        189         if callable(arg):


    </Users/brickeawang/opt/anaconda3/lib/python3.7/site-packages/decorator.py:decorator-gen-156> in execute(self, line, cell, local_ns)


    ~/opt/anaconda3/lib/python3.7/site-packages/IPython/core/magic.py in <lambda>(f, *a, **k)
        185     # but it's overkill for just that one bit of state.
        186     def magic_deco(arg):
    --> 187         call = lambda f, *a, **k: f(*a, **k)
        188 
        189         if callable(arg):


    ~/opt/anaconda3/lib/python3.7/site-packages/sql/magic.py in execute(self, line, cell, local_ns)
         93 
         94         try:
    ---> 95             result = sql.run.run(conn, parsed['sql'], self, user_ns)
         96 
         97             if result is not None and not isinstance(result, str) and self.column_local_vars:


    ~/opt/anaconda3/lib/python3.7/site-packages/sql/run.py in run(conn, sql, config, user_namespace)
        338             else:
        339                 txt = sqlalchemy.sql.text(statement)
    --> 340                 result = conn.session.execute(txt, user_namespace)
        341             _commit(conn=conn, config=config)
        342             if result and config.feedback:


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in execute(self, object_, *multiparams, **params)
        986             raise exc.ObjectNotExecutableError(object_)
        987         else:
    --> 988             return meth(self, multiparams, params)
        989 
        990     def _execute_function(self, func, multiparams, params):


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/sql/elements.py in _execute_on_connection(self, connection, multiparams, params)
        285     def _execute_on_connection(self, connection, multiparams, params):
        286         if self.supports_execution:
    --> 287             return connection._execute_clauseelement(self, multiparams, params)
        288         else:
        289             raise exc.ObjectNotExecutableError(self)


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in _execute_clauseelement(self, elem, multiparams, params)
       1105             distilled_params,
       1106             compiled_sql,
    -> 1107             distilled_params,
       1108         )
       1109         if self._has_events or self.engine._has_events:


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in _execute_context(self, dialect, constructor, statement, parameters, *args)
       1251         except BaseException as e:
       1252             self._handle_dbapi_exception(
    -> 1253                 e, statement, parameters, cursor, context
       1254             )
       1255 


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in _handle_dbapi_exception(self, e, statement, parameters, cursor, context)
       1471                 util.raise_from_cause(newraise, exc_info)
       1472             elif should_wrap:
    -> 1473                 util.raise_from_cause(sqlalchemy_exception, exc_info)
       1474             else:
       1475                 util.reraise(*exc_info)


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/util/compat.py in raise_from_cause(exception, exc_info)
        396     exc_type, exc_value, exc_tb = exc_info
        397     cause = exc_value if exc_value is not exception else None
    --> 398     reraise(type(exception), exception, tb=exc_tb, cause=cause)
        399 
        400 


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/util/compat.py in reraise(tp, value, tb, cause)
        150             value.__cause__ = cause
        151         if value.__traceback__ is not tb:
    --> 152             raise value.with_traceback(tb)
        153         raise value
        154 


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/base.py in _execute_context(self, dialect, constructor, statement, parameters, *args)
       1247                 if not evt_handled:
       1248                     self.dialect.do_execute(
    -> 1249                         cursor, statement, parameters, context
       1250                     )
       1251         except BaseException as e:


    ~/opt/anaconda3/lib/python3.7/site-packages/sqlalchemy/engine/default.py in do_execute(self, cursor, statement, parameters, context)
        578 
        579     def do_execute(self, cursor, statement, parameters, context=None):
    --> 580         cursor.execute(statement, parameters)
        581 
        582     def do_execute_no_params(self, cursor, statement, context=None):


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/cursors.py in execute(self, query, args)
        168         query = self.mogrify(query, args)
        169 
    --> 170         result = self._query(query)
        171         self._executed = query
        172         return result


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/cursors.py in _query(self, q)
        326         self._last_executed = q
        327         self._clear_result()
    --> 328         conn.query(q)
        329         self._do_get_result()
        330         return self.rowcount


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in query(self, sql, unbuffered)
        515                 sql = sql.encode(self.encoding, 'surrogateescape')
        516         self._execute_command(COMMAND.COM_QUERY, sql)
    --> 517         self._affected_rows = self._read_query_result(unbuffered=unbuffered)
        518         return self._affected_rows
        519 


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in _read_query_result(self, unbuffered)
        730         else:
        731             result = MySQLResult(self)
    --> 732             result.read()
        733         self._result = result
        734         if result.server_status is not None:


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in read(self)
       1073     def read(self):
       1074         try:
    -> 1075             first_packet = self.connection._read_packet()
       1076 
       1077             if first_packet.is_ok_packet():


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/connections.py in _read_packet(self, packet_type)
        682 
        683         packet = packet_type(buff, self.encoding)
    --> 684         packet.check_error()
        685         return packet
        686 


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/protocol.py in check_error(self)
        218             errno = self.read_uint16()
        219             if DEBUG: print("errno =", errno)
    --> 220             err.raise_mysql_exception(self._data)
        221 
        222     def dump(self):


    ~/opt/anaconda3/lib/python3.7/site-packages/pymysql/err.py in raise_mysql_exception(data)
        107         errval = data[3:].decode('utf-8', 'replace')
        108     errorclass = error_map.get(errno, InternalError)
    --> 109     raise errorclass(errno, errval)
    

    InternalError: (pymysql.err.InternalError) (1099, "Table 'admin' was locked with a READ lock and can't be updated")
    [SQL: delete from admin where idadmin = 11]
    (Background on this error at: http://sqlalche.me/e/2j85)


As error message shown above, the admin table has been locked


```python
%%sql
unlock tables
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    0 rows affected.





    []




```python
%%sql
show open tables from mydb
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    9 rows affected.





<table>
    <tr>
        <th>Database</th>
        <th>Table</th>
        <th>In_use</th>
        <th>Name_locked</th>
    </tr>
    <tr>
        <td>mydb</td>
        <td>room</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customer</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>guider</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>admin</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>supplier</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>user</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>travelproduct</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>customerorder</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>mydb</td>
        <td>flight</td>
        <td>0</td>
        <td>0</td>
    </tr>
</table>



#### 10. Perform Triggers operations using INSERT, UPDATE, DELETE and display result 

I have create insert update delete trigger in admin table


```python
%%sql
delete from admin where idAdmin =11
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    1 rows affected.





    []




```python
%%sql
select * from AdminLog
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    1 rows affected.





<table>
    <tr>
        <th>idAdminLog</th>
        <th>idAdmin</th>
        <th>idUser</th>
        <th>message</th>
        <th>happendDate</th>
    </tr>
    <tr>
        <td>1</td>
        <td>11</td>
        <td>11</td>
        <td>delete</td>
        <td>2020-04-16</td>
    </tr>
</table>




```python
%%sql
insert into Admin (idAdmin,idUser) values(11,11)
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    1 rows affected.





    []




```python
%%sql
select * from AdminLog
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    2 rows affected.





<table>
    <tr>
        <th>idAdminLog</th>
        <th>idAdmin</th>
        <th>idUser</th>
        <th>message</th>
        <th>happendDate</th>
    </tr>
    <tr>
        <td>1</td>
        <td>11</td>
        <td>11</td>
        <td>delete</td>
        <td>2020-04-16</td>
    </tr>
    <tr>
        <td>2</td>
        <td>11</td>
        <td>11</td>
        <td>insert</td>
        <td>2020-04-16</td>
    </tr>
</table>




```python
%%sql
update Admin set idAdmin = 100 where idAdmin = 11
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    1 rows affected.





    []




```python
%%sql
select * from AdminLog
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    3 rows affected.





<table>
    <tr>
        <th>idAdminLog</th>
        <th>idAdmin</th>
        <th>idUser</th>
        <th>message</th>
        <th>happendDate</th>
    </tr>
    <tr>
        <td>1</td>
        <td>11</td>
        <td>11</td>
        <td>delete</td>
        <td>2020-04-16</td>
    </tr>
    <tr>
        <td>2</td>
        <td>11</td>
        <td>11</td>
        <td>insert</td>
        <td>2020-04-16</td>
    </tr>
    <tr>
        <td>3</td>
        <td>100</td>
        <td>11</td>
        <td>update</td>
        <td>2020-04-16</td>
    </tr>
</table>



#### 11. Perform three examples of VIEW operation simple, and with increasing Complexities

Check admin with user inforamtion

```sql
CREATE VIEW `check_admin` AS
select a.idadmin,a.iduser,u.username from admin a
inner join user u
on a.iduser = u.iduser
```

Check customer order detail

```sql
USE `mydb`;
CREATE  OR REPLACE VIEW `check_customer_order` AS
select c.idOrder,t.idTravelProduct,t.idRoom,t.idFlight,t.platformprofit from CustomerOrder c
inner join TravelProduct t
on c.idTravelProduct = t.idTravelProduct;;
```

Check travel product detail with room and flight information
```sql
USE `mydb`;
CREATE  OR REPLACE VIEW `check_travel_product_detail` AS
select o_r.idOrder,o_r.idTravelProduct,o_r.idRoom,o_r.idFlight,o_r.platformprofit,o_r.roomType,o_r.roomDate,f.route,f.flightDate from (
    select o.idOrder,o.idTravelProduct,o.idRoom,o.idFlight,o.platformprofit,r.roomType,r.roomDate from (
        select c.idOrder,t.idTravelProduct,t.idRoom,t.idFlight,t.platformprofit from CustomerOrder c
        inner join TravelProduct t
        on c.idTravelProduct = t.idTravelProduct) o
    inner join Room r
    on r.idRoom = o.idRoom) o_r
inner join Flight f
on f.idFlight = o_r.idFlight;
```


```python
%%sql
select * from check_admin
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    5 rows affected.





<table>
    <tr>
        <th>idadmin</th>
        <th>iduser</th>
        <th>username</th>
    </tr>
    <tr>
        <td>100</td>
        <td>11</td>
        <td>user_11</td>
    </tr>
    <tr>
        <td>12</td>
        <td>12</td>
        <td>user_12</td>
    </tr>
    <tr>
        <td>13</td>
        <td>13</td>
        <td>user_13</td>
    </tr>
    <tr>
        <td>14</td>
        <td>14</td>
        <td>user_14</td>
    </tr>
    <tr>
        <td>15</td>
        <td>15</td>
        <td>user_15</td>
    </tr>
</table>




```python
%%sql
select * from check_customer_order
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    50 rows affected.





<table>
    <tr>
        <th>idOrder</th>
        <th>idTravelProduct</th>
        <th>idRoom</th>
        <th>idFlight</th>
        <th>platformprofit</th>
    </tr>
    <tr>
        <td>22</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>25</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>39</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
    </tr>
    <tr>
        <td>18</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>31</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>50</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
    </tr>
    <tr>
        <td>7</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>19</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>20</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
    </tr>
    <tr>
        <td>35</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
    </tr>
    <tr>
        <td>14</td>
        <td>5</td>
        <td>15</td>
        <td>6</td>
        <td>520</td>
    </tr>
    <tr>
        <td>32</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
    </tr>
    <tr>
        <td>36</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
    </tr>
    <tr>
        <td>26</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>33</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>40</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>47</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
    </tr>
    <tr>
        <td>16</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>24</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>34</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
    </tr>
    <tr>
        <td>41</td>
        <td>10</td>
        <td>13</td>
        <td>5</td>
        <td>483</td>
    </tr>
    <tr>
        <td>42</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>43</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>45</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
    </tr>
    <tr>
        <td>38</td>
        <td>12</td>
        <td>19</td>
        <td>23</td>
        <td>431</td>
    </tr>
    <tr>
        <td>29</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
    </tr>
    <tr>
        <td>37</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
    </tr>
    <tr>
        <td>2</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>6</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>12</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>44</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
    </tr>
    <tr>
        <td>8</td>
        <td>15</td>
        <td>21</td>
        <td>23</td>
        <td>452</td>
    </tr>
    <tr>
        <td>17</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
    </tr>
    <tr>
        <td>9</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
    </tr>
    <tr>
        <td>10</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
    </tr>
    <tr>
        <td>1</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>5</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>49</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
    </tr>
    <tr>
        <td>15</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>23</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>28</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>46</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
    </tr>
    <tr>
        <td>27</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
    </tr>
    <tr>
        <td>48</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
    </tr>
</table>




```python
%%sql
select * from check_travel_product_detail
```

       mysql+pymysql://guider:***@localhost/mydb
     * mysql+pymysql://root:***@localhost/mydb
       mysql+pymysql://supplier:***@localhost/mydb
    50 rows affected.





<table>
    <tr>
        <th>idOrder</th>
        <th>idTravelProduct</th>
        <th>idRoom</th>
        <th>idFlight</th>
        <th>platformprofit</th>
        <th>roomType</th>
        <th>roomDate</th>
        <th>route</th>
        <th>flightDate</th>
    </tr>
    <tr>
        <td>22</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>25</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>39</td>
        <td>1</td>
        <td>30</td>
        <td>19</td>
        <td>628</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>18</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>31</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>50</td>
        <td>2</td>
        <td>22</td>
        <td>12</td>
        <td>449</td>
        <td>single</td>
        <td>2020-06-26</td>
        <td>China-France</td>
        <td>2020-05-24</td>
    </tr>
    <tr>
        <td>7</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>19</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>20</td>
        <td>3</td>
        <td>21</td>
        <td>20</td>
        <td>658</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>4</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>35</td>
        <td>4</td>
        <td>7</td>
        <td>1</td>
        <td>761</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>14</td>
        <td>5</td>
        <td>15</td>
        <td>6</td>
        <td>520</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-04-10</td>
    </tr>
    <tr>
        <td>32</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>China-America</td>
        <td>2020-04-13</td>
    </tr>
    <tr>
        <td>36</td>
        <td>7</td>
        <td>28</td>
        <td>14</td>
        <td>633</td>
        <td>double</td>
        <td>2020-04-29</td>
        <td>China-America</td>
        <td>2020-04-13</td>
    </tr>
    <tr>
        <td>26</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>33</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>40</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>47</td>
        <td>8</td>
        <td>14</td>
        <td>22</td>
        <td>416</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-France</td>
        <td>2020-04-28</td>
    </tr>
    <tr>
        <td>16</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>24</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>34</td>
        <td>9</td>
        <td>15</td>
        <td>23</td>
        <td>518</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>41</td>
        <td>10</td>
        <td>13</td>
        <td>5</td>
        <td>483</td>
        <td>double</td>
        <td>2020-06-13</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>42</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>43</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>45</td>
        <td>11</td>
        <td>40</td>
        <td>20</td>
        <td>338</td>
        <td>double</td>
        <td>2020-04-15</td>
        <td>China-Japen</td>
        <td>2020-04-23</td>
    </tr>
    <tr>
        <td>38</td>
        <td>12</td>
        <td>19</td>
        <td>23</td>
        <td>431</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>29</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>37</td>
        <td>13</td>
        <td>7</td>
        <td>1</td>
        <td>432</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>2</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>6</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>11</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>12</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>44</td>
        <td>14</td>
        <td>15</td>
        <td>2</td>
        <td>676</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>8</td>
        <td>15</td>
        <td>21</td>
        <td>23</td>
        <td>452</td>
        <td>single</td>
        <td>2020-05-17</td>
        <td>China-Japen</td>
        <td>2020-06-22</td>
    </tr>
    <tr>
        <td>17</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>21</td>
        <td>16</td>
        <td>19</td>
        <td>19</td>
        <td>552</td>
        <td>single</td>
        <td>2020-06-21</td>
        <td>China-France</td>
        <td>2020-05-27</td>
    </tr>
    <tr>
        <td>9</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
    </tr>
    <tr>
        <td>10</td>
        <td>17</td>
        <td>7</td>
        <td>9</td>
        <td>717</td>
        <td>single</td>
        <td>2020-05-09</td>
        <td>China-Japen</td>
        <td>2020-06-01</td>
    </tr>
    <tr>
        <td>1</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>3</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>5</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>13</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>30</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>49</td>
        <td>18</td>
        <td>15</td>
        <td>5</td>
        <td>307</td>
        <td>double</td>
        <td>2020-05-05</td>
        <td>China-America</td>
        <td>2020-06-19</td>
    </tr>
    <tr>
        <td>15</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>23</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>28</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>46</td>
        <td>19</td>
        <td>30</td>
        <td>18</td>
        <td>662</td>
        <td>double</td>
        <td>2020-05-11</td>
        <td>China-America</td>
        <td>2020-06-17</td>
    </tr>
    <tr>
        <td>27</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
    <tr>
        <td>48</td>
        <td>20</td>
        <td>41</td>
        <td>2</td>
        <td>425</td>
        <td>single</td>
        <td>2020-06-05</td>
        <td>China-America</td>
        <td>2020-06-10</td>
    </tr>
</table>



#### 12. Backup plan

Create a backup plan of your choice, state your assumptions/constraints and explain your reasoning. Print your selection on a sample monthly calendar (say 30 day) with FB for Full Backup and IB for Incremental Backup 

![](./res/Backup&#32;Plan.png)

## 10 True/False Question

1. CHAR column length is fixed to the length declared when creating the table VARCHAR column is of indefinite length, but it cannot exceed the declared length
* True

2. The primary key is also a candidate key. By convention, candidate keys can be designated as primary keys and can be used for any foreign key reference.
* True

3. Function ```FORMAT (X, D)``` -format number D in X format
* False  
Right:Function ```FORMAT (X, D)``` -format number X to D significant digit

4. When using ```order by```. The result, by default, it is sorted in ascending order.
* True

5. Use the percent character ```%``` in the LIKE clause to represent any character
* True

6. When using ```DELETE FROM table_name [WHERE Clause]```, if no WHERE clause is specified, the particular table in the MySQL will be deleted.
* False  
Right: When using ```DELETE FROM table_name [WHERE Clause]```, if no WHERE clause is specified, all records in the MySQL table will be deleted.

7. The TRUNCATE command permanently deletes one particular row from the table
* False  
Right: The TRUNCATE command permanently deletes each row from the table

8. ```BEGIN``` or ```START``` explicitly start a transaction;
* False  
Right: ```BEGIN``` or ```START TRANSACTION``` explicitly start a transaction;

9. By default, when you disconnect from the database, the temporary table will be automatically destroyed
* True

10. Find if the table column in the data table is ```NULL```, you can use ```IS NULL``` and ```IS NOT NULL``` or ```column = NULL``` and ```column <> NULL```
* False  
Right: Find if the runoob_test_tbl column in the data table is NULL, you must use IS NULL and IS NOT NULL

## 10 Multiple choice questions

1. The following is the trigger in the Mysql table
```
A. BEFORE INSERT
B. AFTER INSERT
C. AFTER CREATE
D. BEFORE UPDATE
```
Answer: A, B, D

2. The "show databases like‘ student% ’" command can display the following databases ()
```
A. student_my
B. studenty
C. mystudent
D. student
```
Answer: A, B, D

3. SQL language sets several functional modules into one, including ()
```
A. DCL
B. DML
C. DNL
D. DDL
```
Answer: A, B, D

4. The following statement is correct ()
```
A. alter table user drop column sex;
B. alter table user add sex varchar (20);
C. alter table user drop sex;
D. alter table user modify id int primary key;
```
Answer: A, B, C, D

5. Views are generally not used for which of the following statements ()
```
A. DELETE
B. SELECT
C. INSERT
D. UPDATE
```
Answer: A, C, D

6. Regarding the sorting of search results, the correct one is ()
```
A. The keyword DESC means descending order, ASC means ascending order
B. If you specify a multi-column sort, you can only use the ascending or descending keywords in the last column
C. If you specify multi-column sorting, you can use ascending or descending keywords in any column
D. The keyword ASC means descending, DESC means ascending
```
Answer: A, C

7. The statement select * from products where prod_name like '% se%' result set includes ()
```
A. Retrieve the data in the products table whose prod_name field ends with 'se'
B. Retrieve the data with the 'se' switch in the prod_name field in the products table
C. Retrieve the data containing 'se' in the prod_name field in the products table
D. Retrieve data where the prod_name field in the products table does not contain 'se'
```
Answer: A, B, C

8. In regular expressions, repeated metacharacters "*" means ()
```
A. No match
B. Match only 1
C. 0 matches
D. Multiple matches
```
Answer: C, D

9. The following description of union is correct ()
```
A. union only connects query statements with the exact same result set
B. union can connect multiple result sets with the same number of data types in the result set
C. union is the key word for filtering, and then operate on the result set
D. Any query can be connected using union
```
Answer: A, C, D

10. What logical operators does mySQL support
```
A. &&
B. ||
C. NOT
D. AND
```
Answer: C, D

## 3 Normalization questions

1. Please do 1NF normalization for following table

|StudentID| Name| Department| Course|
|--|--|--|--|
401| Akon| CSE| c1, c2
402| Bkon| CSE| c1, c2
403| Ckon| CSE| c1
404| Dkon| CSE| c2

Answer:

|StudentID| Name| Department| Course|
|--|--|--|--|
401|Akon|CSE|c1
402|Bkon|CSE|c1
401|Akon|CSE|c2
402|Bkon|CSE|c2
403|Ckon|CSE|c1
404|Dkon|CSE|c2

2. Please find partial functional dependency in this table

|StudentID|Name|CourseID|Score|Teacher|
|--|--|--|--|--|
001|A|L1|90|Mr.X
001|A|L2|80|Mr.Y
002|B|L2|910|Mr.Y

Answer:

[Student ID + Course ID] You can determine any score or student ID or teacher together, so [Student ID + Course ID] is the candidate key for this form.
A table can have multiple keys (key), generally we will choose one of them as the primary key.  
At this time, we can see that the attribute of the teacher is actually only determined by the course number, and the course number is only a part of the candidate key, so at this time we say that the teacher attribute has some functional dependencies.

3. Please do make the table meet the 3NF

|StudentID|Name|CourseID|Score|Teacher|
|--|--|--|--|--|
001|A|L1|90|Mr.X
001|A|L2|80|Mr.Y
002|B|L2|910|Mr.Y

Answer:

|StudentID| Name|
|--|--|
001| A
002| B

|CourseID| Teacher|
|--|--|
L1| Mr. X
L2| Mr. Y
L3| Mr. Y

|Teacher| Department|
|--|--|
Mr. X| CS
Mr. Y| EE

## 2 ERD and EERD concepts questions

1. What is the relationship between these two enities?

![](https://cdn.visual-paradigm.com/guide/data-modeling/what-is-erd/08-erd-one-to-many-example.png)

Answer: One Department has zero/one/many Student

2. What are the general constraints of ERD diagrams?

Answer:

* One to one
* One to many
* Many to many

## 5 SQL coding skills and concept questions

1. Please write the code to return the visit history of all websites

```
website table
+----+--------------+---------------------------+-------+---------+
| id | name         | url                       | alexa | country |
+----+--------------+---------------------------+-------+---------+
| 1  | Google       | https://www.google.cm/    | 1     | USA     |
| 2  | taobao       | https://www.taobao.com/   | 13    | CN      |
| 3  | ronoob       | http://www.runoob.com/    | 4689  | CN      |
| 4  | weibo        | http://weibo.com/         | 20    | CN      |
| 5  | Facebook     | https://www.facebook.com/ | 3     | USA     |
| 7  | stackoverflow| http://stackoverflow.com/ |   0   | IND     |
+----+---------------+---------------------------+-------+---------+
access_log table
+-----+---------+-------+------------+
| aid | site_id | count | date       |
+-----+---------+-------+------------+
|   1 |       1 |    45 | 2016-05-10 |
|   2 |       3 |   100 | 2016-05-13 |
|   3 |       1 |   230 | 2016-05-14 |
|   4 |       2 |    10 | 2016-05-14 |
|   5 |       5 |   205 | 2016-05-14 |
|   6 |       4 |    13 | 2016-05-15 |
|   7 |       3 |   220 | 2016-05-15 |
|   8 |       5 |   545 | 2016-05-16 |
|   9 |       3 |   201 | 2016-05-17 |
+-----+---------+-------+------------+
```

Answer:
```sql
SELECT websites.name, access_log.count, access_log.date
FROM websites
INNER JOIN access_log
ON Websites.id=access_log.site_id
ORDER BY access_log.count;
```

2. Use sql to define a table with column (ID not null, lastname not null, firstname, age can be null)

Answer:
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
```

3. Copy all columns from one table and insert into another existing table

Answer:
```sql
INSERT INTO table2
SELECT * FROM table1;
```

4. Use SQL statement selects all customers whose name starts with the letter "G"

```
website table
+----+--------------+---------------------------+-------+---------+
| id | name         | url                       | alexa | country |
+----+--------------+---------------------------+-------+---------+
| 1  | Google       | https://www.google.cm/    | 1     | USA     |
| 2  | taobao       | https://www.taobao.com/   | 13    | CN      |
| 3  | ronoob       | http://www.runoob.com/    | 4689  | CN      |
| 4  | weibo        | http://weibo.com/         | 20    | CN      |
| 5  | Facebook     | https://www.facebook.com/ | 3     | USA     |
| 7  | stackoverflow| http://stackoverflow.com/ |   0   | IND     |
+----+---------------+---------------------------+-------+---------+
```

Answer:

```sql
SELECT * FROM Websites
WHERE name LIKE 'G%';
```

5. Find websites with total visits greater than 200

```
website table
+----+--------------+---------------------------+-------+---------+
| id | name         | url                       | alexa | country |
+----+--------------+---------------------------+-------+---------+
| 1  | Google       | https://www.google.cm/    | 1     | USA     |
| 2  | taobao       | https://www.taobao.com/   | 13    | CN      |
| 3  | ronoob       | http://www.runoob.com/    | 4689  | CN      |
| 4  | weibo        | http://weibo.com/         | 20    | CN      |
| 5  | Facebook     | https://www.facebook.com/ | 3     | USA     |
| 7  | stackoverflow| http://stackoverflow.com/ |   0   | IND     |
+----+---------------+---------------------------+-------+---------+
access_log table
+-----+---------+-------+------------+
| aid | site_id | count | date       |
+-----+---------+-------+------------+
|   1 |       1 |    45 | 2016-05-10 |
|   2 |       3 |   100 | 2016-05-13 |
|   3 |       1 |   230 | 2016-05-14 |
|   4 |       2 |    10 | 2016-05-14 |
|   5 |       5 |   205 | 2016-05-14 |
|   6 |       4 |    13 | 2016-05-15 |
|   7 |       3 |   220 | 2016-05-15 |
|   8 |       5 |   545 | 2016-05-16 |
|   9 |       3 |   201 | 2016-05-17 |
+-----+---------+-------+------------+
```

Answer:

```sql
SELECT Websites.name, Websites.url, SUM(access_log.count) AS nums FROM (access_log
INNER JOIN Websites
ON access_log.site_id=Websites.id)
GROUP BY Websites.name
HAVING SUM(access_log.count) > 200;
```

## Team Evaluation

Write a team evaluation (for each of your team members—2-3 sentences for each team member) including who do you think is the most valuable team member and why; Who did what according to your own observations? Rank everyone on your team including yourself (1 is the best, 2 is 2nd best, etc.) and why they are ranked in that order (no equal contribution will be an acceptable answer); what works best for your team and what did not? Rank all the team in class including your team.

#### Zixiao(most valuable team member)

Rank: 1

I choose myself as the most valuable team member is because I think I almost participated in everything in this project.

Maybe evaluating myself like this will make others think I am arrogant.

But to be honest, I make two important breakthroughs (RoadMap, Multi-floor database design) on my own. 

I implement most of the code for the project, which includes map data import, positioning algorithm implementation, pathfinding algorithm implementation, and single-floor navigation simulation. And I familiar with every part in this project.

I drive a lot of my passion for this project and try to do as much as possible. And I will make this project to be a deliverable application if I have resource and time.

So this is why I choose myself as the most valuable team member.

#### Nityashree 

Rank: 2

Evaluation:

    Very motivated and very willing to learn knowledge in new fields. She has good skills in Excel and database design

Work during project:

    * Complete trigger implementation, some function implementation, some store procedure implementation and database user privilege management
    * Complete database backup plan
    * Contribute to ERD diagram design
    * Contribute to database implementation
    * Contribute to use case, sequence diagram design
    * Contribute to project proposal, final presentation and final report
    * Contribute to project research

#### Jalal

Rank: 3

Evaluation:

    Humor and optimism, not afraid of areas that are not familiar at. He has no experience in SQL coding before. But he still work hard to learn it.

Work during project:

    * Contribute to position technology research
    * Contribute to position algorithm research
    * Contribute to AutoCAD blueprint implementation and excel transfermation
    * Contribute to ERD diagram design
    * Contribute to database implementation
    * Contribute to use case, sequence diagram design
    * Contribute to project proposal, final presentation and final report
    * Contribute to project research

#### Saurin

Rank: 4

Evaluation:

    Optimistic and willing to contribute. He has many whimsical ideas.
    
Work during project:
    
    * First one to propose the 'indoor navigation' idea. (Actually I didn't quite remember who is the first one came out with this idea. But in my memary, he was)
    * Contribute to AutoCAD blueprint implementation and excel transfermation
    * Contribute to ERD diagram design
    * Contribute to database implementation
    * Contribute to use case, sequence diagram design
    * Contribute to project proposal, final presentation and final report
    * Contribute to project research

#### Vaishnav

Rank: 5

Evaluation:

    Vaishnav has ability to do a better job. But he did not invest enough time in the team project.

Work during project:
    
    * Complete UI design
    * Complete UI xd file

## TA Opportunity
If you are given an opportunity to be a paid TA or non-paid/volunteer in Fall 2020/Spring 2021, would you be interested (Do include if you are interested in volunteer vs paid position?) If you are interested, what skillsets and quality would make you a successful TA or a part of the team?

I'm interested in being a paid TA.

Skillsets:

* SQL
* MySQL
* WorkBench
* Database Design
* Database Management
* Program Design
* Python
* Java

Quality:

* Teaching experience (Used to be volunteer teach for supported education)
* Good English communication skill
* Patiently
* Time management
* Responsible

