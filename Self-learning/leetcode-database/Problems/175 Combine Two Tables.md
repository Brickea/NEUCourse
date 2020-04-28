# 175 Combine Two Tables

## Problem Description


SQL Schema
Table: Person
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId is the primary key column for this table.
```

Table: Address
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId is the primary key column for this table.
```

Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:

```
FirstName, LastName, City, State
```

## Solution

Runtime: 422 ms, faster than 87.36% of MySQL online submissions for Combine Two Tables.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Combine Two Tables.

```sql
select FirstName,LastName,City,State 
from Person left join Address
on Person.PersonID = Address.AddressId 
```

