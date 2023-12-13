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


--UC - 3
--Insert into the table
INSERT INTO contacts(first_name, last_name, address, city, zip, phone_number, email)VALUE
          ('Jane', 'Doe', 'west-coast-lane', 'New York', '99456', 7784568721, 'janedoe@gmail.com'),
          ('Peter', 'Smith', 'north-hill-view', 'cincinnati', '88254', 8947328167, 'petersmith@gmail.com');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

--view the table
SELECT * FROM contacts;
+----+------------+-----------+-----------------+------------+-------+--------------+----------------------+
| id | first_name | last_name | address         | city       | zip   | phone_number | email                |
+----+------------+-----------+-----------------+------------+-------+--------------+----------------------+
|  1 | Jane       | Doe       | west-coast-lane | New York   | 99456 |   7784568721 | janedoe@gmail.com    |
|  2 | Peter      | Smith     | north-hill-view | cincinnati | 88254 |   8947328167 | petersmith@gmail.com |
+----+------------+-----------+-----------------+------------+-------+--------------+----------------------+
2 rows in set (0.00 sec)


--UC - 4
--editing existing contact using name
UPDATE contacts set email = "peters123@gmail.com" WHERE first_name="Peter" AND last_name="Smith";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

SELECT * FROM contacts;
+----+------------+-----------+-----------------+------------+-------+--------------+---------------------+
| id | first_name | last_name | address         | city       | zip   | phone_number | email               |
+----+------------+-----------+-----------------+------------+-------+--------------+---------------------+
|  1 | Jane       | Doe       | west-coast-lane | New York   | 99456 |   7784568721 | janedoe@gmail.com   |
|  2 | Peter      | Smith     | north-hill-view | cincinnati | 88254 |   8947328167 | peters123@gmail.com |
+----+------------+-----------+-----------------+------------+-------+--------------+---------------------+
2 rows in set (0.00 sec)


--UC - 5
--deleting a contact from the list using person's name
DELETE FROM contacts WHERE first_name = "Peter";
Query OK, 1 row affected (0.03 sec)

SELECT * FROM contacts;
+----+------------+-----------+-----------------+---------+----------+-------+--------------+-------------------+
| id | first_name | last_name | address         | city    | state    | zip   | phone_number | email             |
+----+------------+-----------+-----------------+---------+----------+-------+--------------+-------------------+
|  1 | Jane       | Doe       | west-coast-lane | Chicago | Illinois | 99456 |   7784568721 | janedoe@gmail.com |
+----+------------+-----------+-----------------+---------+----------+-------+--------------+-------------------+
1 row in set (0.00 sec)


--UC - 6
--*inserted one more contact to the table*
+----+------------+-----------+------------------+-----------+-----------+-------+--------------+-------------------+
| id | first_name | last_name | address          | city      | state     | zip   | phone_number | email             |
+----+------------+-----------+------------------+-----------+-----------+-------+--------------+-------------------+
|  1 | Jane       | Doe       | west-coast-lane  | Chicago   | Illinois  | 99456 |   7784568721 | janedoe@gmail.com |
|  3 | Anushka    | Amar      | south-coast-lane | Hyderabad | Telangana | 99470 |   8969492195 | anushka@gmail.com |
+----+------------+-----------+------------------+-----------+-----------+-------+--------------+-------------------+
--Retrieve Person belonging to a City or State from the Address Book
mysql> SELECT first_name FROM contacts WHERE city = "Chicago";
+------------+
| first_name |
+------------+
| Jane       |
+------------+
1 row in set (0.00 sec)


--UC - 7
--Ability to understand the size of address book by City and State
mysql> SELECT COUNT(*) FROM contacts WHERE city ="Chicago" OR city="Hyderabad";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)