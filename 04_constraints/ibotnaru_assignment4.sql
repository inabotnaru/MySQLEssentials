/*  Assignment4.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
		Robert Thornberry has contacted SRS (Sports Retail Store) to ask that his 83 Barrhill Drive address be
	removed from the system as he can longer receive parcels at this address. Write a SQL statement
	that will remove this address from the system.
	Run a SELECT statement on the cust_address table to ensure that the statement has been executed.
*/

DELETE FROM cust_address
WHERE cust_number = 'c00001';

/* My output:

+--------+----------------------+----------------+-----------+----------+-------------+
| id     | address_line_1       | address_line_2 | city      | zip_code | cust_number |
+--------+----------------------+----------------+-----------+----------+-------------+
| ca0102 | 17 Gartsquare Road   | Starford       | Elk Butte | 82433    | c00012      |
| ca0103 | 54 Ropehill Crescent | Georgetown     | Powell    | 82440    | c00101      |
| ca0104 | 22 Jackson Farm Rd   | NULL           | Garland   | 82435    | c01986      |
| ca0105 | 63 Acacia Drive      | Skins          | Wapiti    | 82450    | c01986      |
| ca0106 | 17 Fourth St         | WY             | Cody      | 82414    | c00987      |
| ca0107 | 42 Blackwater Way    | WY             | Elk Butte | 82433    | c00182      |
| ca0108 | 1 Rascal Farm Rd     | WY             | Cody      | 82414    | c00157      |
| ca0109 | 14 Rock Ln           | WY             | Ralston   | 82441    | c00129      |
+--------+----------------------+----------------+-----------+----------+-------------+
8 rows in set (0.00 sec)
*/


/* Query 2 */

/*
		Run the DESCRIBE command on the orders table to view its structure.
	Add a default constraint that will use todays date to assign a value to the order_date column of the
	orders table, if no date is provided.
	Run the DESCRIBE command again to verify the command was successful. 
*/

DESCRIBE orders;

/* My output:

+-----------------+------------+------+-----+---------+-------+
| Field           | Type       | Null | Key | Default | Extra |
+-----------------+------------+------+-----+---------+-------+
| order_id        | varchar(9) | NO   | PRI | NULL    |       |
| order_date      | date       | NO   |     | NULL    |       |
| number_of_units | int        | NO   |     | NULL    |       |
| cust_number     | varchar(6) | NO   | MUL | NULL    |       |
+-----------------+------------+------+-----+---------+-------+
4 rows in set (0.02 sec)
*/

ALTER TABLE orders
ALTER order_date SET DEFAULT '2020-02-01';

/* My output

Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0
*/

DESCRIBE orders;

/* My output:

+-----------------+------------+------+-----+------------+-------+
| Field           | Type       | Null | Key | Default    | Extra |
+-----------------+------------+------+-----+------------+-------+
| order_id        | varchar(9) | NO   | PRI | NULL       |       |
| order_date      | date       | NO   |     | 2020-02-01 |       |
| number_of_units | int        | NO   |     | NULL       |       |
| cust_number     | varchar(6) | NO   | MUL | NULL       |       |
+-----------------+------------+------+-----+------------+-------+
4 rows in set (0.00 sec)
*/


/* Query 3 */

/*
		The client has decided that they would like a separate column for the customer’s mobile phone
	number. This is an optional column that will be required to store 11 digits.
	
	Run the DESCRIBE command on the customers table to view its structure.

	Add column that will satisfy the clients requirements.

	Run the DESCRIBE command on the customers table to view its structure. 
*/

DESCRIBE customer;

/* My output:

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| customer_number | varchar(6)   | NO   | PRI | NULL    |       |
| email           | varchar(50)  | NO   | UNI | NULL    |       |
| first_name      | varchar(20)  | NO   |     | NULL    |       |
| last_name       | varchar(30)  | NO   |     | NULL    |       |
| phone_number    | varchar(11)  | NO   |     | NULL    |       |
| current_balance | decimal(6,2) | NO   |     | NULL    |       |
| member_id       | varchar(4)   | YES  | MUL | NULL    |       |
| card_number     | varchar(6)   | YES  | UNI | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
*/


ALTER TABLE customer
ADD COLUMN mobile_phone_number VARCHAR(11);

/* My output

Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
*/

DESCRIBE customer;

/* My output:

+---------------------+--------------+------+-----+---------+-------+
| Field               | Type         | Null | Key | Default | Extra |
+---------------------+--------------+------+-----+---------+-------+
| customer_number     | varchar(6)   | NO   | PRI | NULL    |       |
| email               | varchar(50)  | NO   | UNI | NULL    |       |
| first_name          | varchar(20)  | NO   |     | NULL    |       |
| last_name           | varchar(30)  | NO   |     | NULL    |       |
| phone_number        | varchar(11)  | NO   |     | NULL    |       |
| current_balance     | decimal(6,2) | NO   |     | NULL    |       |
| member_id           | varchar(4)   | YES  | MUL | NULL    |       |
| card_number         | varchar(6)   | YES  | UNI | NULL    |       |
| mobile_phone_number | varchar(11)  | YES  |     | NULL    |       |
+---------------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)
*/


/* Query 4 */

/*
		The client has decided that they do not need the mobile number column as most customers only
	provide a single contact number and that is already catered for with the existing phone number
	column.

	Run the DESCRIBE command on the customer table to view its structure.

	Drop the column that was created to store the mobile phone number.

	Run the DESCRIBE command on the customer table to view its structure.
*/

DESCRIBE customer;

/* My output:

+---------------------+--------------+------+-----+---------+-------+
| Field               | Type         | Null | Key | Default | Extra |
+---------------------+--------------+------+-----+---------+-------+
| customer_number     | varchar(6)   | NO   | PRI | NULL    |       |
| email               | varchar(50)  | NO   | UNI | NULL    |       |
| first_name          | varchar(20)  | NO   |     | NULL    |       |
| last_name           | varchar(30)  | NO   |     | NULL    |       |
| phone_number        | varchar(11)  | NO   |     | NULL    |       |
| current_balance     | decimal(6,2) | NO   |     | NULL    |       |
| member_id           | varchar(4)   | YES  | MUL | NULL    |       |
| card_number         | varchar(6)   | YES  | UNI | NULL    |       |
| mobile_phone_number | varchar(11)  | YES  |     | NULL    |       |
+---------------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)
*/

ALTER TABLE customer
DROP COLUMN mobile_phone_number;

/* My output

Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
*/

DESCRIBE customer;

/* My output:

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| customer_number | varchar(6)   | NO   | PRI | NULL    |       |
| email           | varchar(50)  | NO   | UNI | NULL    |       |
| first_name      | varchar(20)  | NO   |     | NULL    |       |
| last_name       | varchar(30)  | NO   |     | NULL    |       |
| phone_number    | varchar(11)  | NO   |     | NULL    |       |
| current_balance | decimal(6,2) | NO   |     | NULL    |       |
| member_id       | varchar(4)   | YES  | MUL | NULL    |       |
| card_number     | varchar(6)   | YES  | UNI | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
*/


/* Query 5 */

/*
	Write an INSERT statement that adds this row to the membership table:
	id: t010
	name: executive
	discount 50
*/

INSERT INTO membership (id, name, discount)
VALUES ('t010', 'executive', 50);

/* My output:
	
Query OK, 1 row affected (0.00 sec)
*/

/* 

select * from membership;

My output:

+------+-------------+----------+
| id   | name        | discount |
+------+-------------+----------+
| t001 | Rookie      |       10 |
| t002 | All Star    |       20 |
| t003 | Golden Star |       30 |
| t010 | executive   |       50 |
+------+-------------+----------+
4 rows in set (0.00 sec)
*/


/* Query 6 */

/*
	Modify the number of units on order ID or0101250 to 11.
*/

/* Check the content of the database before ecexuting the query

select * from orders

+-----------+------------+-----------------+-------------+
| order_id  | order_date | number_of_units | cust_number |
+-----------+------------+-----------------+-------------+
| or0101250 | 2017-04-17 |              10 | c00001      |
| or0101350 | 2017-05-24 |               5 | c00001      |
| or0101425 | 2017-05-27 |              18 | c00103      |
| or0101681 | 2017-06-06 |              10 | c00001      |
| or0101750 | 2017-07-18 |               1 | c01986      |
| or0101752 | 2017-12-18 |               2 | c01986      |
| or0101753 | 2018-12-18 |               1 | c00987      |
| or0101754 | 2018-09-17 |               2 | c00182      |
| or0101755 | 2018-10-10 |               4 | c00157      |
| or0101756 | 2018-10-09 |               3 | c00129      |
+-----------+------------+-----------------+-------------+
10 rows in set (0.01 sec)
*/

UPDATE orders SET number_of_units = 11
WHERE order_id = 'or0101250';

/* My output:

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
*/

/* Check the content of the database after ecexuting the query

select * from orders;

+-----------+------------+-----------------+-------------+
| order_id  | order_date | number_of_units | cust_number |
+-----------+------------+-----------------+-------------+
| or0101250 | 2017-04-17 |              11 | c00001      |
| or0101350 | 2017-05-24 |               5 | c00001      |
| or0101425 | 2017-05-27 |              18 | c00103      |
| or0101681 | 2017-06-06 |              10 | c00001      |
| or0101750 | 2017-07-18 |               1 | c01986      |
| or0101752 | 2017-12-18 |               2 | c01986      |
| or0101753 | 2018-12-18 |               1 | c00987      |
| or0101754 | 2018-09-17 |               2 | c00182      |
| or0101755 | 2018-10-10 |               4 | c00157      |
| or0101756 | 2018-10-09 |               3 | c00129      |
+-----------+------------+-----------------+-------------+
10 rows in set (0.00 sec)
*/


/* Query 7 */

/*
	Write an INSERT statement that adds this row to the customer table:

	customer_number: c02001
	email: brianrog@hootech.com
	first_name: brian
	last_name: rogers
	phone_number: 01654564898
	current_balance: -5
	card_number: lc4587

	This information violates the check constraint that the current balance must not be less than zero.
	Change the current balance to 50 and re-run the query.
*/

/* Check the content of the table before ecexuting the queries

select * from customer;

+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
| customer_number | email                       | first_name | last_name  | phone_number | current_balance | member_id | card_number |
+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
| c00001          | bob.thornberry@heatmail.com | Robert     | Thornberry | 01234567898  |          150.00 | t001      | NULL        |
| c00012          | Jjones@freemail.com         | Jennifer   | Jones      | 01505214598  |          100.00 | NULL      | lc1015      |
| c00101          | unknown@here.com            | John       | Doe        | 03216547808  |          987.50 | t002      | NULL        |
| c00103          | MurciaA@globaltech.com      | Andrew     | Murcia     | 07715246890  |           85.00 | NULL      | lc2341      |
| c00129          | ssmith5@example.com         | Sam        | Smith      | 01342145231  |          740.65 | t001      | NULL        |
| c00157          | spinch2@example.com         | Sandra     | Pincher    | 01342136231  |          840.65 | t002      | NULL        |
| c00182          | billyruff@example.com       | Billy      | Rufton     | 01489736231  |          540.65 | t003      | NULL        |
| c00987          | jsmith17@example.com        | Joey       | Smith      | 01489736589  |          287.65 | t002      | NULL        |
| c01986          | margal87@delphiview.com     | Maria      | Galant     | 01442736589  |          125.65 | t003      | NULL        |
+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
9 rows in set (0.00 sec)

describe customer ;

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| customer_number | varchar(6)   | NO   | PRI | NULL    |       |
| email           | varchar(50)  | NO   | UNI | NULL    |       |
| first_name      | varchar(20)  | NO   |     | NULL    |       |
| last_name       | varchar(30)  | NO   |     | NULL    |       |
| phone_number    | varchar(11)  | NO   |     | NULL    |       |
| current_balance | decimal(6,2) | NO   |     | NULL    |       |
| member_id       | varchar(4)   | YES  | MUL | NULL    |       |
| card_number     | varchar(6)   | YES  | UNI | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
8 rows in set (0.01 sec)
*/


INSERT INTO customer (customer_number, email, first_name, last_name,
						phone_number, current_balance, card_number)
VALUES ('c02001', 'brianrog@hootech.com', 'brian', 'rogers',
					'01654564898', -5, 'lc4587');

/* My output

ERROR 3819 (HY000): Check constraint 'cur_balance' is violated.
*/

INSERT INTO customer (customer_number, email, first_name, last_name,
						phone_number, current_balance, card_number)
VALUES ('c02001', 'brianrog@hootech.com', 'brian', 'rogers',
					'01654564898', 50, 'lc4587');

/* My output

ERROR 3819 (HY000): Check constraint 'cur_balance' is violated.
*/



/* Query 8 */

/*
	Create the three o_tables – jobs, employees, and departments – using the syntax:
	
	CREATE TABLE o_jobs AS (SELECT * FROM jobs);
	CREATE TABLE o_employees AS (sELECT * FROM employees);
	CREATE TABLE o_departments AS (sELECT * FROM departments);
*/

/* Check the content of the database before ecexuting the queries

show tables ;

+-----------------------+
| Tables_in_retailstore |
+-----------------------+
| cust_address          |
| customer              |
| departments           |
| employees             |
| inv_list              |
| item                  |
| jobs                  |
| membership            |
| ordered_items         |
| orders                |
+-----------------------+
10 rows in set (0.00 sec)
*/

CREATE TABLE o_jobs AS (SELECT * FROM jobs);

/* My output:

Query OK, 15 rows affected (0.03 sec)
Records: 15  Duplicates: 0  Warnings: 0
*/

CREATE TABLE o_employees AS (sELECT * FROM employees);

/* My output:

Query OK, 40 rows affected (0.02 sec)
Records: 40  Duplicates: 0  Warnings: 0
*/

CREATE TABLE o_departments AS (sELECT * FROM departments);

/* My output:

Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0
*/

/* The database wes changed, 3 tables was added.

show tables ;

+-----------------------+
| Tables_in_retailstore |
+-----------------------+
| cust_address          |
| customer              |
| departments           |
| employees             |
| inv_list              |
| item                  |
| jobs                  |
| membership            |
| o_departments         |
| o_employees           |
| o_jobs                |
| ordered_items         |
| orders                |
+-----------------------+
13 rows in set (0.00 sec)
*/


/* Query 9 */

/*
	Write an INSERT statement that adds the Human Resources job to the o_jobs table:

	job_id: hr_man
	job_title: human resources manager
	min_salary: 4500
	max_salary: 5500
*/

/* Check the table before executing the query

select * from o_jobs;

+------------+---------------------------------+------------+------------+
| job_id     | job_title                       | min_salary | max_salary |
+------------+---------------------------------+------------+------------+
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| AD_PRES    | President                       |      20000 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| SR_MK_REP  | Senior Marketing Representative |       6500 |      12000 |
| SR_SA_REP  | Senior Sales Representative     |       8000 |      16000 |
| SR_ST_CLRK | Senior Stock Clerk              |       3700 |       6700 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
+------------+---------------------------------+------------+------------+
15 rows in set (0.00 sec)

describe o_jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| job_id     | varchar(10)  | NO   |     | NULL    |       |
| job_title  | varchar(35)  | NO   |     | NULL    |       |
| min_salary | decimal(6,0) | YES  |     | NULL    |       |
| max_salary | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
*/

INSERT INTO o_jobs (job_id, job_title, min_salary, max_salary)
VALUES ('hr_man', 'human resources manager', 4500, 5500);

/* My output:

Query OK, 1 row affected (0.00 sec)
*/

/* Show table after executing the query gto see the changes

select * from o_jobs;

+------------+---------------------------------+------------+------------+
| job_id     | job_title                       | min_salary | max_salary |
+------------+---------------------------------+------------+------------+
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| AD_PRES    | President                       |      20000 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| SR_MK_REP  | Senior Marketing Representative |       6500 |      12000 |
| SR_SA_REP  | Senior Sales Representative     |       8000 |      16000 |
| SR_ST_CLRK | Senior Stock Clerk              |       3700 |       6700 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| hr_man     | human resources manager         |       4500 |       5500 |
+------------+---------------------------------+------------+------------+
16 rows in set (0.00 sec)
*/


/* Query 10 */

/*
	Rename the o_jobs table to o_job_description.
*/

ALTER TABLE o_jobs RENAME TO o_job_description;

/* My output:

Query OK, 0 rows affected (0.02 sec)
*/

/* Check the result after executing the query

select * from o_job_description ;

+------------+---------------------------------+------------+------------+
| job_id     | job_title                       | min_salary | max_salary |
+------------+---------------------------------+------------+------------+
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| AD_PRES    | President                       |      20000 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| SR_MK_REP  | Senior Marketing Representative |       6500 |      12000 |
| SR_SA_REP  | Senior Sales Representative     |       8000 |      16000 |
| SR_ST_CLRK | Senior Stock Clerk              |       3700 |       6700 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| hr_man     | human resources manager         |       4500 |       5500 |
+------------+---------------------------------+------------+------------+
16 rows in set (0.00 sec)
*/


/* Query 11 */

/*
	Write the CREATE TABLE statement for the SRS global locations table. Define the constraints at the
	column level.
	
	Execute the CREATE TABLE statement.
	
	Execute a DESCRIBE command to view the Table Summary information.

*/

/* Check the content of the database before creating a new table

show tables ;

+-----------------------+
| Tables_in_retailstore |
+-----------------------+
| cust_address          |
| customer              |
| departments           |
| employees             |
| inv_list              |
| item                  |
| jobs                  |
| membership            |
| o_departments         |
| o_employees           |
| o_job_description     |
| ordered_items         |
| orders                |
+-----------------------+
13 rows in set (0.01 sec)
*/

CREATE TABLE GLOBAL_LOCATIONS (
	id INT(4) NOT NULL PRIMARY KEY,
	loc_name VARCHAR(20),
	date_opened DATE,
	address VARCHAR(20),
	city VARCHAR(20),
	zip_postal_code VARCHAR(20),
	phone VARCHAR(15),
	email VARCHAR(15) UNIQUE,
	manager_id DECIMAL(6,0),
	emergency_contact VARCHAR(20)
);

/* My output:

Query OK, 0 rows affected, 1 warning (0.03 sec)
*/

/* Make sure that the table was created

show tables;

+-----------------------+
| Tables_in_retailstore |
+-----------------------+
| cust_address          |
| customer              |
| departments           |
| employees             |
| GLOBAL_LOCATIONS      |
| inv_list              |
| item                  |
| jobs                  |
| membership            |
| o_departments         |
| o_employees           |
| o_job_description     |
| ordered_items         |
| orders                |
+-----------------------+
14 rows in set (0.00 sec)
*/

DESCRIBE GLOBAL_LOCATIONS;

/* My output:

+-------------------+--------------+------+-----+---------+-------+
| Field             | Type         | Null | Key | Default | Extra |
+-------------------+--------------+------+-----+---------+-------+
| id                | int          | NO   | PRI | NULL    |       |
| loc_name          | varchar(20)  | YES  |     | NULL    |       |
| date_opened       | date         | YES  |     | NULL    |       |
| address           | varchar(20)  | YES  |     | NULL    |       |
| city              | varchar(20)  | YES  |     | NULL    |       |
| zip_postal_code   | varchar(20)  | YES  |     | NULL    |       |
| phone             | varchar(15)  | YES  |     | NULL    |       |
| email             | varchar(15)  | YES  | UNI | NULL    |       |
| manager_id        | decimal(6,0) | YES  |     | NULL    |       |
| emergency_contact | varchar(20)  | YES  |     | NULL    |       |
+-------------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)
*/