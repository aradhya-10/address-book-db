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


mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email) VALUES ('Aradhyaa', 'Mishraa', 'Infocity', 'Gandhinagar', 'Gujarat', '382010', '+91 6394972188', 'aradhya.mishra1012@gmail.com');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Aradhyaa   | Mishraa   | Infocity | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
2 rows in set (0.00 sec)

-- UC5: Delete Contact
mysql> DELETE FROM AddressBook
    -> WHERE first_name = 'Aradhyaa' AND last_name = 'Mishraa';
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
1 row in set (0.00 sec)


mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip
    -> , phone_number, email) VALUES ('Sanjana', 'Pathak', 'Shahpur', 'Gorakhpur', 'UP', '273014', '+91 6394972288', 'sanjana.pathak@gmail.com');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip
    -> , phone_number, email) VALUES ('Garima', 'Mangal', 'Bada', 'Gwalior', 'MP', '474009', '+91 6394772288', 'mangal.garima@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Garima     | Mangal    | Bada     | Gwalior     | MP      | 474009 | +91 6394772288 | mangal.garima@gmail.com      |
| Sanjana    | Pathak    | Shahpur  | Gorakhpur   | UP      | 273014 | +91 6394972288 | sanjana.pathak@gmail.com     |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
3 rows in set (0.00 sec)

-- UC6: Select contact from city or state
mysql> SELECT * FROM AddressBook WHERE city='Gwalior' OR state='Gujarat';
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Garima     | Mangal    | Bada     | Gwalior     | MP      | 474009 | +91 6394772288 | mangal.garima@gmail.com      |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
2 rows in set (0.00 sec)


mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip
    -> , phone_number, email) VALUES ('Riya', 'Mishra', 'Noida', 'Gaziabad', 'UP', '382420', '+91 6394972187', 'riya.mishra7800@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Garima     | Mangal    | Bada     | Gwalior     | MP      | 474009 | +91 6394772288 | mangal.garima@gmail.com      |
| Riya       | Mishra    | Noida    | Gaziabad    | UP      | 382420 | +91 6394972187 | riya.mishra7800@gmail.com    |
| Sanjana    | Pathak    | Shahpur  | Gorakhpur   | UP      | 273014 | +91 6394972288 | sanjana.pathak@gmail.com     |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email) VALUES ('Naman', 'Mishra', 'Infocity', 'Gandhinagar', 'Gujarat', '382010', '+91 6394972199', 'naman.mishra1012@gmail.com');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM AddressBook;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Garima     | Mangal    | Bada     | Gwalior     | MP      | 474009 | +91 6394772288 | mangal.garima@gmail.com      |
| Naman      | Mishra    | Infocity | Gandhinagar | Gujarat | 382010 | +91 6394972199 | naman.mishra1012@gmail.com   |
| Riya       | Mishra    | Noida    | Gaziabad    | UP      | 382420 | +91 6394972187 | riya.mishra7800@gmail.com    |
| Sanjana    | Pathak    | Shahpur  | Gorakhpur   | UP      | 273014 | +91 6394972288 | sanjana.pathak@gmail.com     |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
5 rows in set (0.00 sec)

-- UC7: Understand the size of address book by City and State
mysql> SELECT city, state, COUNT(*) AS size FROM AddressBook GROUP BY city, state;
+-------------+---------+------+
| city        | state   | size |
+-------------+---------+------+
| Gandhinagar | Gujarat |    2 |
| Gaziabad    | UP      |    1 |
| Gorakhpur   | UP      |    1 |
| Gwalior     | MP      |    1 |
+-------------+---------+------+
4 rows in set (0.00 sec)


-- UC8: Ability to retrieve entries sorted alphabetically by Person’s name for a given city
mysql> SELECT *
    -> FROM AddressBook
    -> WHERE city = 'Gandhinagar'
    -> ORDER BY first_name, last_name;
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| first_name | last_name | address  | city        | state   | zip    | phone_number   | email                        |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
| Aradhya    | Mishra    | Sargasan | Gandhinagar | Gujarat | 382010 | +91 6394972188 | aradhya.mishra1012@gmail.com |
| Naman      | Mishra    | Infocity | Gandhinagar | Gujarat | 382010 | +91 6394972199 | naman.mishra1012@gmail.com   |
+------------+-----------+----------+-------------+---------+--------+----------------+------------------------------+
2 rows in set (0.00 sec)