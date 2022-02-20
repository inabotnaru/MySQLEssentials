/*  Assignment2.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
	SQL statement that liststhe item number, description, and color for all items. 
*/

SELECT item_number, description, color FROM item;

/* My output:

SELECT item_number, description, color FROM item

+-------------+-----------------------------+--------+
| item_number | description                 | color  |
+-------------+-----------------------------+--------+
| im01101044  | catcher mitt                | brown  |
| im01101045  | top worn under the game top | white  |
| im01101046  | team shirt                  | orange |
| im01101047  | team shirt with emblem      | orange |
| im01101048  | high quaity basball bat     | NULL   |
| im01101049  | Sweater Fleece Vest         | blue   |
| im01101050  | Cloudswift                  | NULL   |
| im01101052  | Socks                       | brown  |
+-------------+-----------------------------+--------+
8 rows in set (0.00 sec)
*/



/* Query 2 */

/*
	SQL statement that listsall rows and columns for the complete orders table. 
*/

SELECT * FROM orders;

/* My output:

SELECT * FROM orders

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
10 rows in set (0.00 sec)
*/



/* Query 3 */

/*
	SQL statement that liststhe first and last names of customers
	with current balance of $100or more. 
*/

SELECT first_name, last_name, current_balance FROM customer
WHERE current_balance >= 100;

/* My output:

SELECT first_name, last_name, current_balance FROM customer
WHERE current_balance >= 100

+------------+------------+-----------------+
| first_name | last_name  | current_balance |
+------------+------------+-----------------+
| Robert     | Thornberry |          150.00 |
| John       | Doe        |          987.50 |
| Sam        | Smith      |          740.65 |
| Sandra     | Pincher    |          840.65 |
| Billy      | Rufton     |          540.65 |
| Joey       | Smith      |          287.65 |
| Maria      | Galant     |          125.65 |
+------------+------------+-----------------+
7 rows in set (0.01 sec)
*/



/* Query 4 */

/*
	SQL statement that liststhe order number for each order placed
	by customer number c00103 on 05/27/2017. 
*/

SELECT order_id, order_date, number_of_units, cust_number FROM orders
WHERE (cust_number = 'c00103') AND (order_date = '2017-05-27');

/* My output:

SELECT order_id, order_date, number_of_units, cust_number FROM orders
WHERE (cust_number = 'c00103') AND (order_date = '2017-05-27')

+-----------+------------+-----------------+-------------+
| order_id  | order_date | number_of_units | cust_number |
+-----------+------------+-----------------+-------------+
| or0101425 | 2017-05-27 |              18 | c00103      |
+-----------+------------+-----------------+-------------+
1 row in set (0.01 sec)
*/



/* Query 5 */

/*
	SQL statement that displaysthe customer number, first name,last name,
	email and phone number of eachcustomer. 
*/

SELECT customer_number, first_name, last_name, email, phone_number
FROM customer;

/* My output:

SELECT customer_number, first_name, last_name, email, phone_number
FROM customer

+-----------------+------------+------------+-----------------------------+--------------+
| customer_number | first_name | last_name  | email                       | phone_number |
+-----------------+------------+------------+-----------------------------+--------------+
| c00001          | Robert     | Thornberry | bob.thornberry@heatmail.com | 01234567898  |
| c00012          | Jennifer   | Jones      | Jjones@freemail.com         | 01505214598  |
| c00101          | John       | Doe        | unknown@here.com            | 03216547808  |
| c00103          | Andrew     | Murcia     | MurciaA@globaltech.com      | 07715246890  |
| c00129          | Sam        | Smith      | ssmith5@example.com         | 01342145231  |
| c00157          | Sandra     | Pincher    | spinch2@example.com         | 01342136231  |
| c00182          | Billy      | Rufton     | billyruff@example.com       | 01489736231  |
| c00987          | Joey       | Smith      | jsmith17@example.com        | 01489736589  |
| c01986          | Maria      | Galant     | margal87@delphiview.com     | 01442736589  |
+-----------------+------------+------------+-----------------------------+--------------+
9 rows in set (0.00 sec)
*/



/* Query 6 */

/*
	SRS (Sports Retail Store)is considering giving a $5.00 gift card to all customers,
	which can be used to reduce their current balance.
	This is a query that will show the customer’s first name, last name, customer number,
	current balance and the value of their balance minus the gift value. 
*/

SELECT first_name, last_name, customer_number, current_balance,
(current_balance - 5) AS balance_minus_gift
FROM customer;

/* My output:

SELECT first_name, last_name, customer_number, current_balance,
current_balance - 5 AS balance_minus_gift
FROM customer

+------------+------------+-----------------+-----------------+--------------------+
| first_name | last_name  | customer_number | current_balance | balance_minus_gift |
+------------+------------+-----------------+-----------------+--------------------+
| Robert     | Thornberry | c00001          |          150.00 |             145.00 |
| Jennifer   | Jones      | c00012          |            0.00 |              -5.00 |
| John       | Doe        | c00101          |          987.50 |             982.50 |
| Andrew     | Murcia     | c00103          |           85.00 |              80.00 |
| Sam        | Smith      | c00129          |          740.65 |             735.65 |
| Sandra     | Pincher    | c00157          |          840.65 |             835.65 |
| Billy      | Rufton     | c00182          |          540.65 |             535.65 |
| Joey       | Smith      | c00987          |          287.65 |             282.65 |
| Maria      | Galant     | c01986          |          125.65 |             120.65 |
+------------+------------+-----------------+-----------------+--------------------+
9 rows in set (0.00 sec)
*/



/* Query 7 */

/*
	Query that displaysthe customer’s first name, last name, current balance and monthly payment.
	Use first name, last name, balance and monthly repayments as the column aliases.
	The aliases are to be shown exactly as described (case sensitive).
*/

SELECT first_name AS 'first name', last_name AS 'last name',
current_balance AS balance, (current_balance / 12) AS 'monthly repayments'
FROM customer;

/* My output:

SELECT first_name AS 'first name', last_name AS 'last name',
current_balance AS balance, current_balance / 12 AS 'monthly repayments'
FROM customer

+------------+------------+---------+--------------------+
| first name | last name  | balance | monthly repayments |
+------------+------------+---------+--------------------+
| Robert     | Thornberry |  150.00 |          12.500000 |
| Jennifer   | Jones      |    0.00 |           0.000000 |
| John       | Doe        |  987.50 |          82.291667 |
| Andrew     | Murcia     |   85.00 |           7.083333 |
| Sam        | Smith      |  740.65 |          61.720833 |
| Sandra     | Pincher    |  840.65 |          70.054167 |
| Billy      | Rufton     |  540.65 |          45.054167 |
| Joey       | Smith      |  287.65 |          23.970833 |
| Maria      | Galant     |  125.65 |          10.470833 |
+------------+------------+---------+--------------------+
9 rows in set (0.00 sec)
*/



/* Query 8 */

/*
	Query that displays the orderID, date and time of all orders that were placed before the 05/28/2019.
	Using an appropriate alias for the column headings. 
*/

SELECT order_id AS 'order id', order_date AS 'order date' FROM orders
WHERE order_date < '2019-05-28';

/* My output:

SELECT order_id AS 'order id', order_date AS 'order date' FROM orders
WHERE order_date < '2019-05-28'

+-----------+------------+
| order id  | order date |
+-----------+------------+
| or0101250 | 2017-04-17 |
| or0101350 | 2017-05-24 |
| or0101425 | 2017-05-27 |
| or0101681 | 2017-06-06 |
| or0101750 | 2017-07-18 |
| or0101752 | 2017-12-18 |
| or0101753 | 2018-12-18 |
| or0101754 | 2018-09-17 |
| or0101755 | 2018-10-10 |
| or0101756 | 2018-10-09 |
+-----------+------------+
10 rows in set (0.00 sec)
*/



/* Query 9 */

/*
	Query that lists all details ofall items.
	Ordering the output by item number within category.
	(That is, order the output by category and then by item number.) 
*/

SELECT * FROM item ORDER BY category, item_number;

/* My output:

SELECT * FROM item ORDER BY category, item_number

+-------------+-------------+-----------------------------+-------------+--------+------+-------+--------+
| item_number | name        | description                 | category    | color  | Size | price | ilt_id |
+-------------+-------------+-----------------------------+-------------+--------+------+-------+--------+
| im01101052  | Socks       | Socks                       | Accessories | brown  | s    | 30.00 | il0131 |
| im01101044  | gloves      | catcher mitt                | clothing    | brown  | m    |  4.99 | il0124 |
| im01101045  | under shirt | top worn under the game top | clothing    | white  | s    | 10.99 | il0125 |
| im01101046  | shirt       | team shirt                  | clothing    | orange | l    | 10.99 | il0126 |
| im01101047  | game top    | team shirt with emblem      | clothing    | orange | m    | 19.99 | il0127 |
| im01101049  | Vest        | Sweater Fleece Vest         | clothing    | blue   | xl   | 99.00 | il0129 |
| im01101048  | premium bat | high quaity basball bat     | equipment   | NULL   | NULL | 64.99 | il0128 |
| im01101050  | Shoes       | Cloudswift                  | Footwear    | NULL   | NULL | 70.00 | il0130 |
+-------------+-------------+-----------------------------+-------------+--------+------+-------+--------+
8 rows in set (0.00 sec)
*/



/* Query 10 */

/*
	Query that displaysthe rows from the customer table where the values in the customer numbercolumn is 11119.
	Displaying the customer’s last name, first name, customer number, and email address.
	Using an appropriate alias for the column headings. 
*/

SELECT  last_name AS 'last name', first_name AS 'first name',
customer_number AS 'customer number', email AS 'email address' FROM customer
WHERE customer_number = '11119';

/* My output:

SELECT  last_name AS 'last name', first_name AS 'first name',
customer_number AS 'customer number', email AS 'email address' FROM customer
WHERE customer_number = '11119'

Empty set (0.00 sec)
*/



/* Query 11 */

/*
	Query that displays the customer numberfrom the orders table for each customer
	who has placed an order with the retailStore. Displaying each customer numberonly once.
*/

SELECT DISTINCT cust_number FROM orders
WHERE number_of_units IS NOT NULL;

/* My output:

SELECT DISTINCT cust_number FROM orders WHERE number_of_units IS NOT NULL

+-------------+
| cust_number |
+-------------+
| c00001      |
| c00103      |
| c00129      |
| c00157      |
| c00182      |
| c00987      |
| c01986      |
+-------------+
7 rows in set (0.00 sec)
*/
