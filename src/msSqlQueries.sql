mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.00 sec)

-- UC1: Create an Address Book Service DB
mysql> CREATE DATABASE AddressBookService;
Query OK, 1 row affected (0.00 sec)


mysql> USE AddressBookService;
Database changed

-- UC2: Create Address Book Table
mysql> CREATE TABLE AddressBook (
    ->     first_name VARCHAR(50),
    ->     last_name VARCHAR(50),
    ->     address VARCHAR(100),
    ->     city VARCHAR(50),
    ->     state VARCHAR(50),
    ->     zip VARCHAR(20),
    ->     phone_number VARCHAR(20),
    ->     email VARCHAR(100),
    ->     PRIMARY KEY (first_name, last_name)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM AddressBook;
Empty set (0.00 sec)

-- UC3: Insert new contacts into the Address Book
mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email) VALUES
      ('Aradhya', 'Mishra', 'Infocity', 'Gandhinagar', 'Gujarat', '382010', '+91 6394972188', 'aradhya.mishra1012@gmail.com');

Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Infocity | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
1 row in set (0.00 sec)


-- UC4: Edit contact using name
mysql> UPDATE AddressBook SET address='Sargasan' WHERE first_name='Aradhya' AND last_name='Mishra';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
1 row in set (0.00 sec)
