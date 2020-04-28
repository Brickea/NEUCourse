# 182 Duplicate Emails

## Description

Write a SQL query to find all duplicate emails in a table named Person.
```
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
```
For example, your query should return the following for the above table:
```
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
```
Note: All emails are in lowercase.


## Result

Runtime: 531 ms, faster than 42.25% of MySQL online submissions for Duplicate Emails.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Duplicate Emails.

```sql
select Email from 
(
    select Email, count(Email) as num 
    from Person group by Email
) temp
where temp.num > 1;
```

## Approach 2

A more common used way to add a condition to a GROUP BY is to use the HAVING clause, which is much simpler and more efficient.

So we can rewrite the above solution to this one.

```sql
select Email
from Person
group by Email
having count(Email) > 1;
```