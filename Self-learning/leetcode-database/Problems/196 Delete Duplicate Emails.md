# 196 Delete Duplicate Emails

## Description

Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
```
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
```
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:
```
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
```
Note:

Your output is the whole Person table after executing your sql. Use delete statement.

## Result

Runtime: 1398 ms, faster than 39.68% of MySQL online submissions for Delete Duplicate Emails.

Memory Usage: 0B, less than 100.00% of MySQL online submissions for Delete Duplicate Emails.

```sql
delete p1 from Person p1, Person p2
where p1.email = p2.email and p1.id > p2.id;
```