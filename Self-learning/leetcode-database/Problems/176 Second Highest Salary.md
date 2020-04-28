# 176 Second Highest Salary

## Problem Description

Write a SQL query to get the second highest salary from the Employee table.
```
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

## Solution

Runtime: 381 ms, faster than 35.44% of MySQL online submissions for Second Highest Salary.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Second Highest Salary.

```sql
select(
    select distinct
        Salary
    from Employee
    order by Salary DESC
    limit 1 offset 1
)as SecondHighestSalary;
```

