-- welcome to payroll_service Database
-- DAY16 Learning problem

--UC - 1
--creating a database payroll_service
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
--creating a table as employee_payroll
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
--inserting rows in the table
INSERT INTO employee_payroll (name, salary, start) VALUE
     ('Bill', 1000000.00, '2018-01-03'),
     ('Terisa', 2000000.00, '2019-11-13'),
     ('Charlie', 3000000.00, '2020-05-21');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0


--UC - 4
--retrieving all employee payroll data
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
--query to look at the salary of a particular employee
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
--query to add a new field called gender and update the rows accordingly
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
--calculating the average of all salaries of the employees
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


--UC - 8
--Ability to extend employee_payroll data to store employee information
--like employee phone, address and department

--adding phone_number
mysql> ALTER TABLE employee_payroll ADD phone_number BIGINT AFTER name;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0
--adding address
mysql> Alter TABLE employee_payroll ADD address VARCHAR(150) AFTER phone_number;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0
--adding department
mysql> Alter TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0
--adding default address
mysql> ALTER TABLE employee_payroll ALTER address SET DEFAULT 'default_address';
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


--UC - 9
--ability to extend the table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD income_tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER income_tax;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
| id | name    | phone_number | address | department | gender | basic_pay | deductions | taxable_pay | income_tax | net_pay | start      |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
|  1 | Bill    |         NULL | NULL    |            | M      |   1000000 |          0 |           0 |          0 |       0 | 2018-01-03 |
|  2 | Terisa  |         NULL | NULL    |            | F      |   5000000 |          0 |           0 |          0 |       0 | 2019-11-13 |
|  3 | Charlie |         NULL | NULL    |            | M      |   3000000 |          0 |           0 |          0 |       0 | 2020-05-21 |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
3 rows in set (0.00 sec)


--UC - 10
--Draw the ER Diagram for Payroll Service DB


--UC - 11
--creating different tables each for employee, company, department and payroll
--to demostrate the ER diagram

--company table (one to many relationship with employee)
mysql> CREATE TABLE company (
    ->     company_id INT PRIMARY KEY,
    ->     name VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.09 sec)

--department table (many to many relationship with employee)
mysql> CREATE TABLE department (
    ->     department_id INT PRIMARY KEY,
    ->     name VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.05 s

--Employee table (Strong entity)
mysql> -- Employee table
mysql> CREATE TABLE employee (
    ->     employee_id INT PRIMARY KEY,
    ->     company_id INT,
    ->     name VARCHAR(255) NOT NULL,
    ->     phone_number VARCHAR(20),
    ->     address VARCHAR(255),
    ->     gender CHAR(1),
    ->     start_date DATE,
    ->     FOREIGN KEY (company_id) REFERENCES company(company_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

--payroll table (One to one relationship with employee)
mysql> CREATE TABLE payroll (
    ->     payroll_id INT PRIMARY KEY,
    ->     employee_id INT UNIQUE,
    ->     basic_pay INT,
    ->     deductions INT,
    ->     taxable_pay INT,
    ->     income_tax INT,
    ->     net_pay INT,
    ->     start_date DATE,
    ->     FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    -> );
Query OK, 0 rows affected (0.13 sec)

-- EmployeeDepartment table for many-to-many relationship
mysql> CREATE TABLE employee_department (
    ->     employee_id INT,
    ->     department_id INT,
    ->     PRIMARY KEY (employee_id, department_id), --composite key
    ->     FOREIGN KEY (employee_id) REFERENCES employee(employee_id), --specifies the emp_id in this table refers to primary key in another
    ->     FOREIGN KEY (department_id) REFERENCES department(department_id)
    -> );
Query OK, 0 rows affected (0.12 sec)