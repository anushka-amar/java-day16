-- welcome to payroll_service Database
-- DAY16 Learning problem

--UC - 1
mysql> create database payroll_service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use payroll_service
Database changed

mysql> SELECT DATABASE();
+-----------------+
| DATABASE()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.01 sec)


--UC - 2
CREATE TABLE employee_payroll(
   id INT unsigned NOT NULL AUTO_INCREMENT,
   name VARCHAR(150) NOT NULL,
   salary DOUBLE NOT NULL,
   start DATE NOT NULL,
   PRIMARY KEY (id)
);
Query OK, 0 rows affected (0.09 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)


--UC - 3
INSERT INTO employee_payroll (name, salary, start) VALUE
     ('Bill', 1000000.00, '2018-01-03'),
     ('Terisa', 2000000.00, '2019-11-13'),
     ('Charlie', 3000000.00, '2020-05-21');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0


--UC - 4
SELECT * FROM employee_payroll;
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2018-01-03 |
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)


--UC - 5
SELECT salary FROM employee_payroll
WHERE name = 'Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.00 sec)

SELECT * FROM employee_payroll
WHERE start BETWEEN CAST('2018-01-01' AS DATE)  --casting the string to data
AND DATE(NOW());
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2018-01-03 |
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)


--UC - 6
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name; -- Adding a new field
UPDATE employee_payroll set gender = 'F' WHERE name = "Terisa";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

UPDATE employee_payroll set gender = 'M' WHERE name = "Bill" or name = "Charlie";
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

UPDATE employee_payroll set salary = 5000000.00 WHERE name = "Terisa";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 5000000 | 2019-11-13 |
|  3 | Charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)


--UC - 7
SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M'
GROUP BY gender;
 SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M'
    -> GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
+-------------+
1 row in set (0.00 sec)