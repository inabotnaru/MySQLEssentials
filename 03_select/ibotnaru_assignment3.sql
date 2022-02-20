/*  Assignment3.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
	Query that displays the inventory ID, cost and number of units using aliases,
	for all items that have a trade cost of between $3.00 and $15.00. 
*/

SELECT id AS 'inventory id', cost, units AS 'number of units in stock'
FROM inv_list
WHERE cost BETWEEN 3 AND 15;

/* My output:

+--------------+------+--------------------------+
| inventory id | cost | number of units in stock |
+--------------+------+--------------------------+
| il0125       | 7.99 |                      250 |
| il0126       | 5.24 |                       87 |
+--------------+------+--------------------------+
2 rows in set (0.00 sec)
*/



/* Query 2 */

/*
	Query that displays the inventory ID, cost and number of units using aliases,
	for all items that have 50, 100, 150 or 200 units in stock.
*/

SELECT id AS 'inventory id', cost, units AS 'number of units in stock'
FROM inv_list
WHERE units IN (50, 100, 150, 200);

/* My output:

+--------------+------+--------------------------+
| inventory id | cost | number of units in stock |
+--------------+------+--------------------------+
| il0124       | 2.50 |                      100 |
+--------------+------+--------------------------+
1 row in set (0.00 sec)
*/



/* Query 3 */

/*
	Query that displays item number and name of all items with a name that begins with g.
*/

SELECT item_number AS 'item id', name AS 'item name'
FROM item
WHERE name LIKE 'g%';

/* My output:

+------------+-----------+
| item id    | item name |
+------------+-----------+
| im01101044 | gloves    |
| im01101047 | game top  |
+------------+-----------+
2 rows in set (0.01 sec)
*/



/* Query 4 */

/*
	Query that displaysitem number and name of all items with a name that containsa lowercase o. 
*/

SELECT item_number AS 'item id', name AS 'item name'
FROM item
WHERE name LIKE '%o%';

/* My output:

+------------+-----------+
| item id    | item name |
+------------+-----------+
| im01101044 | gloves    |
| im01101047 | game top  |
| im01101050 | Shoes     |
| im01101052 | Socks     |
+------------+-----------+
4 rows in set (0.00 sec)
*/



/* Query 5 */

/*
	Query that displays the customer number, address line 1, and postal code for customers who live
	in the WY area of Ralston. Using customer number, street address and postal code as the column aliases. 
*/

SELECT cust_number AS 'customer number', address_line_1 AS 'street address',
zip_code AS 'postal code'
FROM cust_address
WHERE address_line_2 = 'WY' AND city = 'Ralston';

/* My output:

+-----------------+----------------+-------------+
| customer number | street address | postal code |
+-----------------+----------------+-------------+
| c00129          | 14 Rock Ln     | 82441       |
+-----------------+----------------+-------------+
1 row in set (0.00 sec)
*/



/* Query 6 */

/*
	Query that displays the customer number, address line 1, and postal code for customers
	 who do not live in Cody. Use customer number, street address and postal code as the column aliases. 
*/

SELECT cust_number AS 'customer number', address_line_1 AS 'street address',
zip_code AS 'postal code'
FROM cust_address
WHERE city != 'Cody';

/* My output:

+-----------------+----------------------+-------------+
| customer number | street address       | postal code |
+-----------------+----------------------+-------------+
| c00001          | 83 Barrhill Drive    | 82441       |
| c00012          | 17 Gartsquare Road   | 82433       |
| c00101          | 54 Ropehill Crescent | 82440       |
| c01986          | 22 Jackson Farm Rd   | 82435       |
| c01986          | 63 Acacia Drive      | 82450       |
| c00182          | 42 Blackwater Way    | 82433       |
| c00129          | 14 Rock Ln           | 82441       |
+-----------------+----------------------+-------------+
7 rows in set (0.00 sec)
*/



/* Query 7 */

/*
	Query that uses the IN operator to list the item number and description of each item
	in category accessories or clothing.
*/

SELECT item_number, description
FROM item
WHERE category IN ('Accessories', 'clothing');

/* My output:

+-------------+-----------------------------+
| item_number | description                 |
+-------------+-----------------------------+
| im01101044  | catcher mitt                |
| im01101045  | top worn under the game top |
| im01101046  | team shirt                  |
| im01101047  | team shirt with emblem      |
| im01101049  | Sweater Fleece Vest         |
| im01101052  | Socks                       |
+-------------+-----------------------------+
6 rows in set (0.00 sec)
*/



/* Query 8 */

/*
	Query that finds the customer number, first name, and last name of each customer
	whose last name ends with the letter S.
*/

SELECT customer_number, first_name, last_name
FROM customer
WHERE last_name LIKE '%S';

/* My output:

+-----------------+------------+-----------+
| customer_number | first_name | last_name |
+-----------------+------------+-----------+
| c00012          | Jennifer   | Jones     |
+-----------------+------------+-----------+
1 row in set (0.00 sec)
*/



/* Query 9 */

/*
	Query that lists the item number and description of all items
	that are in the clothing or Footwear category
	and contain the word “team” in the description.
*/

SELECT item_number, description, category
FROM item
WHERE category IN ('clothing', 'Footwear') AND description LIKE '%team%';

/* My output:

+-------------+------------------------+----------+
| item_number | description            | category |
+-------------+------------------------+----------+
| im01101046  | team shirt             | clothing |
| im01101047  | team shirt with emblem | clothing |
+-------------+------------------------+----------+
2 rows in set (0.00 sec)
*/



/* Query 10 */

/*
	Query that displays the rows from the customer table
	where the customer number is between c00001 and c00987.
	Displaying each customer’s last name, first name, and customer number.
*/

SELECT last_name, first_name, customer_number
FROM customer
WHERE customer_number BETWEEN 'c00001' and 'c00987';

/* My output:

+------------+------------+-----------------+
| last_name  | first_name | customer_number |
+------------+------------+-----------------+
| Thornberry | Robert     | c00001          |
| Jones      | Jennifer   | c00012          |
| Doe        | John       | c00101          |
| Murcia     | Andrew     | c00103          |
| Smith      | Sam        | c00129          |
| Pincher    | Sandra     | c00157          |
| Rufton     | Billy      | c00182          |
| Smith      | Joey       | c00987          |
+------------+------------+-----------------+
8 rows in set (0.00 sec)
*/



/* Query 11 */

/*
	Query that displays all employees who DO NOT earn exactly $3,400, $3,000, or $6,000
	and who have a first name that begins with the letter S.
	Displaying each employee's first name, last name, and salary.
*/

SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT IN (3400, 3000, 6000) AND first_name LIKE 'S%';

/* My output:

+------------+---------------+----------+
| first_name | last_name     | salary   |
+------------+---------------+----------+
| Steven     | King          | 24000.00 |
| Shelley    | Higgins       | 12000.00 |
| Sophia     | Barbosa Souza |  9500.00 |
| Sarah      | Alves Rocha   |  7300.00 |
+------------+---------------+----------+
4 rows in set (0.00 sec)
*/


/* Query 12 */

/*
	Using a search pattern to find any item’s name with L as the second letter and V as the fourth letter.
	Listing each item number, name, and description. Sort the list by item number in descending order.
*/

SELECT item_number, name, description
FROM item
WHERE name LIKE '_L_V%'
ORDER BY item_number DESC;

/* My output:

+-------------+--------+--------------+
| item_number | name   | description  |
+-------------+--------+--------------+
| im01101044  | gloves | catcher mitt |
+-------------+--------+--------------+
1 row in set (0.00 sec)
*/