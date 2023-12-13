-- welcome to address_book Database
-- DAY16 practical problem

--UC - 1
--creating the database
create database address_book;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+


--UC - 2
--create a contacts table
CREATE TABLE contacts(
   id INT unsigned NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(150) NOT NULL,
   last_name VARCHAR(150) NOT NULL,
   address VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   zip VARCHAR(50) NOT NULL,
   phone_number BIGINT NOT NULL,
   email VARCHAR(150) NOT NULL,
   PRIMARY KEY (id)
);
Query OK, 0 rows affected (0.13 sec)
