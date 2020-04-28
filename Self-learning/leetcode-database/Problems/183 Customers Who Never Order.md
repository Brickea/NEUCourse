# 183 Customers Who Never Order

## Description

Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.
```
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
```
Table: Orders.
```
+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
```
Using the above tables as example, return the following:
```
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```

## Result

Runtime: 984 ms, faster than 8.44% of MySQL online submissions for Customers Who Never Order.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customers Who Never Order.

```sql
select Customers.name as 'Customers' 
from Customers
where Customers.id not in (
    select Customerid from orders
)
```

## Approach 2

Use ```join`` to do this problem

Runtime: 683 ms, faster than 51.98% of MySQL online submissions for Customers Who Never Order.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customers Who Never Order.

```sql
SELECT Name AS 'Customers'
FROM Customers c
LEFT JOIN Orders o
ON c.Id = o.CustomerId
WHERE o.CustomerId IS NULL
```