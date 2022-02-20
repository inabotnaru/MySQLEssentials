/*  Assignment5.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
	For each order, write a SQL statement that displays the order ID and order date
	along with the customer number, first name, and last name of the customer
	for which the order was created.
*/

SELECT orders.order_id, orders.order_date,
customer.customer_number, customer.first_name, customer.last_name
FROM orders
JOIN customer ON (orders.cust_number=customer.customer_number);

/* My output:
+-----------+------------+-----------------+------------+------------+
| order_id  | order_date | customer_number | first_name | last_name  |
+-----------+------------+-----------------+------------+------------+
| or0101250 | 2017-04-17 | c00001          | Robert     | Thornberry |
| or0101350 | 2017-05-24 | c00001          | Robert     | Thornberry |
| or0101681 | 2017-06-06 | c00001          | Robert     | Thornberry |
| or0101425 | 2017-05-27 | c00103          | Andrew     | Murcia     |
| or0101756 | 2018-10-09 | c00129          | Sam        | Smith      |
| or0101755 | 2018-10-10 | c00157          | Sandra     | Pincher    |
| or0101754 | 2018-09-17 | c00182          | Billy      | Rufton     |
| or0101753 | 2018-12-18 | c00987          | Joey       | Smith      |
| or0101750 | 2017-07-18 | c01986          | Maria      | Galant     |
| or0101752 | 2017-12-18 | c01986          | Maria      | Galant     |
+-----------+------------+-----------------+------------+------------+
10 rows in set (0.00 sec)
*/


/* Query 2 */

/*
 	For each order placed on 09/17/2018, write a SQL statement that lists the order number
 	along with the order ID, customer number, first name, and last name of the customer
 	for which the order was created.
*/

SELECT orders.order_id,
customer.customer_number, customer.first_name, customer.last_name
FROM orders
JOIN customer ON (orders.cust_number=customer.customer_number)
WHERE orders.order_date = '2018-09-17';

/* My output:
+-----------+-----------------+------------+-----------+
| order_id  | customer_number | first_name | last_name |
+-----------+-----------------+------------+-----------+
| or0101754 | c00182          | Billy      | Rufton    |
+-----------+-----------------+------------+-----------+
1 row in set (0.00 sec)
*/


/* Query 3 */

/*
	For each order, write a SQL statement that lists 
	the item number, order date, order ID, quantity ordered, and price for each item that makes up an order.

*/

SELECT o.order_id, o.order_date, i.item_number,  oi.quantity_ordered, i.price
FROM orders o
JOIN ordered_items oi ON (o.order_id = oi.order_id)
JOIN item i ON (oi.item_number = i.item_number);

/* My output:
+-----------+------------+-------------+------------------+-------+
| order_id  | order_date | item_number | quantity_ordered | price |
+-----------+------------+-------------+------------------+-------+
| or0101250 | 2017-04-17 | im01101044  |                5 |  4.99 |
| or0101350 | 2017-05-24 | im01101044  |                5 |  4.99 |
| or0101250 | 2017-04-17 | im01101046  |                5 | 10.99 |
| or0101425 | 2017-05-27 | im01101047  |               18 | 19.99 |
| or0101681 | 2017-06-06 | im01101047  |               10 | 19.99 |
| or0101750 | 2017-07-18 | im01101048  |                1 | 64.99 |
| or0101755 | 2018-10-10 | im01101048  |                2 | 64.99 |
| or0101756 | 2018-10-09 | im01101048  |                1 | 64.99 |
| or0101752 | 2017-12-18 | im01101050  |                2 | 70.00 |
| or0101753 | 2018-12-18 | im01101050  |                1 | 70.00 |
| or0101754 | 2018-09-17 | im01101050  |                2 | 70.00 |
| or0101755 | 2018-10-10 | im01101050  |                2 | 70.00 |
| or0101756 | 2018-10-09 | im01101050  |                2 | 70.00 |
+-----------+------------+-------------+------------------+-------+
13 rows in set (0.00 sec)
*/


/* Query 4 */

/*
	Write a SQL statement that finds the customer number, first name, and last name of each customer for
	which an order was not created on 09/17/2018.
*/

SELECT c.customer_number, c.first_name, c.last_name
FROM customer c
JOIN orders o ON (c.customer_number = o.cust_number)
WHERE NOT o.order_date = '2018-09-17';

/* My output:
+-----------------+------------+------------+
| customer_number | first_name | last_name  |
+-----------------+------------+------------+
| c00001          | Robert     | Thornberry |
| c00001          | Robert     | Thornberry |
| c00001          | Robert     | Thornberry |
| c00103          | Andrew     | Murcia     |
| c00129          | Sam        | Smith      |
| c00157          | Sandra     | Pincher    |
| c00987          | Joey       | Smith      |
| c01986          | Maria      | Galant     |
| c01986          | Maria      | Galant     |
+-----------------+------------+------------+
9 rows in set (0.00 sec)
*/


/* Query 5 */

/*
	For each order, write a SQL statement that lists the
	item number, order date, order ID, item description, and category
	for each item that make up the order.
	Order the rows by category and then by order ID
*/

SELECT o.order_id, o.order_date, i.item_number,  i.description , i.category
FROM orders o
JOIN ordered_items oi ON (o.order_id = oi.order_id)
JOIN item i ON (oi.item_number = i.item_number)
ORDER BY i.category, o.order_id;

/* My output:
+-----------+------------+-------------+-------------------------+-----------+
| order_id  | order_date | item_number | description             | category  |
+-----------+------------+-------------+-------------------------+-----------+
| or0101250 | 2017-04-17 | im01101044  | catcher mitt            | clothing  |
| or0101250 | 2017-04-17 | im01101046  | team shirt              | clothing  |
| or0101350 | 2017-05-24 | im01101044  | catcher mitt            | clothing  |
| or0101425 | 2017-05-27 | im01101047  | team shirt with emblem  | clothing  |
| or0101681 | 2017-06-06 | im01101047  | team shirt with emblem  | clothing  |
| or0101750 | 2017-07-18 | im01101048  | high quaity basball bat | equipment |
| or0101755 | 2018-10-10 | im01101048  | high quaity basball bat | equipment |
| or0101756 | 2018-10-09 | im01101048  | high quaity basball bat | equipment |
| or0101752 | 2017-12-18 | im01101050  | Cloudswift              | Footwear  |
| or0101753 | 2018-12-18 | im01101050  | Cloudswift              | Footwear  |
| or0101754 | 2018-09-17 | im01101050  | Cloudswift              | Footwear  |
| or0101755 | 2018-10-10 | im01101050  | Cloudswift              | Footwear  |
| or0101756 | 2018-10-09 | im01101050  | Cloudswift              | Footwear  |
+-----------+------------+-------------+-------------------------+-----------+
13 rows in set (0.00 sec)
*/


/* Query 6 */

/*
	Write a SQL statement that lists the order ID and order date
	for each order that contains the item description ‘team shirt with emblem’.
*/

SELECT o.order_id, o.order_date
FROM orders o
JOIN ordered_items oi ON (o.order_id = oi.order_id)
JOIN item i ON (oi.item_number = i.item_number)
WHERE i.description LIKE '%team shirt with emblem%';

/* My output:
+-----------+------------+
| order_id  | order_date |
+-----------+------------+
| or0101425 | 2017-05-27 |
| or0101681 | 2017-06-06 |
+-----------+------------+
2 rows in set (0.00 sec)
*/


/* Query 7 */

/*
	Write a SQL statement that lists the order ID and order date
	for each order that was created for Robert Thornberry
	but does not contain the item description “team shirt with emblem”.

*/

SELECT o.order_id, o.order_date
FROM customer c
JOIN orders o ON (c.customer_number = o.cust_number)
JOIN ordered_items oi ON (o.order_id = oi.order_id)
JOIN item i ON (oi.item_number = i.item_number)
WHERE c.first_name = 'Robert' AND c.last_name = 'Thornberry'
AND NOT i.description LIKE '%team shirt with emblem%';

/* My output
+-----------+------------+
| order_id  | order_date |
+-----------+------------+
| or0101250 | 2017-04-17 |
| or0101250 | 2017-04-17 |
| or0101350 | 2017-05-24 |
+-----------+------------+
3 rows in set (0.00 sec)
*/


/* Query 8 */

/*
	Write a SQL statement that displays the customer number, first name, last name,
	address line 1, address line 2, and city of the customer. use a natural join.
*/

SELECT customer_number, first_name, last_name,
address_line_1, address_line_2, city
FROM customer NATURAL JOIN cust_address;

/* My output:
+-----------------+------------+------------+----------------------+----------------+-----------+
| customer_number | first_name | last_name  | address_line_1       | address_line_2 | city      |
+-----------------+------------+------------+----------------------+----------------+-----------+
| c00001          | Robert     | Thornberry | 83 Barrhill Drive    | NULL           | Ralston   |
| c00012          | Jennifer   | Jones      | 83 Barrhill Drive    | NULL           | Ralston   |
| c00101          | John       | Doe        | 83 Barrhill Drive    | NULL           | Ralston   |
| c00103          | Andrew     | Murcia     | 83 Barrhill Drive    | NULL           | Ralston   |
| c00129          | Sam        | Smith      | 83 Barrhill Drive    | NULL           | Ralston   |
| c00157          | Sandra     | Pincher    | 83 Barrhill Drive    | NULL           | Ralston   |
| c00182          | Billy      | Rufton     | 83 Barrhill Drive    | NULL           | Ralston   |
| c00987          | Joey       | Smith      | 83 Barrhill Drive    | NULL           | Ralston   |
| c01986          | Maria      | Galant     | 83 Barrhill Drive    | NULL           | Ralston   |
| c00001          | Robert     | Thornberry | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00012          | Jennifer   | Jones      | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00101          | John       | Doe        | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00103          | Andrew     | Murcia     | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00129          | Sam        | Smith      | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00157          | Sandra     | Pincher    | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00182          | Billy      | Rufton     | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00987          | Joey       | Smith      | 17 Gartsquare Road   | Starford       | Elk Butte |
| c01986          | Maria      | Galant     | 17 Gartsquare Road   | Starford       | Elk Butte |
| c00001          | Robert     | Thornberry | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00012          | Jennifer   | Jones      | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00101          | John       | Doe        | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00103          | Andrew     | Murcia     | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00129          | Sam        | Smith      | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00157          | Sandra     | Pincher    | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00182          | Billy      | Rufton     | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00987          | Joey       | Smith      | 54 Ropehill Crescent | Georgetown     | Powell    |
| c01986          | Maria      | Galant     | 54 Ropehill Crescent | Georgetown     | Powell    |
| c00001          | Robert     | Thornberry | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00012          | Jennifer   | Jones      | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00101          | John       | Doe        | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00103          | Andrew     | Murcia     | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00129          | Sam        | Smith      | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00157          | Sandra     | Pincher    | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00182          | Billy      | Rufton     | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00987          | Joey       | Smith      | 22 Jackson Farm Rd   | NULL           | Garland   |
| c01986          | Maria      | Galant     | 22 Jackson Farm Rd   | NULL           | Garland   |
| c00001          | Robert     | Thornberry | 63 Acacia Drive      | Skins          | Wapiti    |
| c00012          | Jennifer   | Jones      | 63 Acacia Drive      | Skins          | Wapiti    |
| c00101          | John       | Doe        | 63 Acacia Drive      | Skins          | Wapiti    |
| c00103          | Andrew     | Murcia     | 63 Acacia Drive      | Skins          | Wapiti    |
| c00129          | Sam        | Smith      | 63 Acacia Drive      | Skins          | Wapiti    |
| c00157          | Sandra     | Pincher    | 63 Acacia Drive      | Skins          | Wapiti    |
| c00182          | Billy      | Rufton     | 63 Acacia Drive      | Skins          | Wapiti    |
| c00987          | Joey       | Smith      | 63 Acacia Drive      | Skins          | Wapiti    |
| c01986          | Maria      | Galant     | 63 Acacia Drive      | Skins          | Wapiti    |
| c00001          | Robert     | Thornberry | 17 Fourth St         | WY             | Cody      |
| c00012          | Jennifer   | Jones      | 17 Fourth St         | WY             | Cody      |
| c00101          | John       | Doe        | 17 Fourth St         | WY             | Cody      |
| c00103          | Andrew     | Murcia     | 17 Fourth St         | WY             | Cody      |
| c00129          | Sam        | Smith      | 17 Fourth St         | WY             | Cody      |
| c00157          | Sandra     | Pincher    | 17 Fourth St         | WY             | Cody      |
| c00182          | Billy      | Rufton     | 17 Fourth St         | WY             | Cody      |
| c00987          | Joey       | Smith      | 17 Fourth St         | WY             | Cody      |
| c01986          | Maria      | Galant     | 17 Fourth St         | WY             | Cody      |
| c00001          | Robert     | Thornberry | 42 Blackwater Way    | WY             | Elk Butte |
| c00012          | Jennifer   | Jones      | 42 Blackwater Way    | WY             | Elk Butte |
| c00101          | John       | Doe        | 42 Blackwater Way    | WY             | Elk Butte |
| c00103          | Andrew     | Murcia     | 42 Blackwater Way    | WY             | Elk Butte |
| c00129          | Sam        | Smith      | 42 Blackwater Way    | WY             | Elk Butte |
| c00157          | Sandra     | Pincher    | 42 Blackwater Way    | WY             | Elk Butte |
| c00182          | Billy      | Rufton     | 42 Blackwater Way    | WY             | Elk Butte |
| c00987          | Joey       | Smith      | 42 Blackwater Way    | WY             | Elk Butte |
| c01986          | Maria      | Galant     | 42 Blackwater Way    | WY             | Elk Butte |
| c00001          | Robert     | Thornberry | 1 Rascal Farm Rd     | WY             | Cody      |
| c00012          | Jennifer   | Jones      | 1 Rascal Farm Rd     | WY             | Cody      |
| c00101          | John       | Doe        | 1 Rascal Farm Rd     | WY             | Cody      |
| c00103          | Andrew     | Murcia     | 1 Rascal Farm Rd     | WY             | Cody      |
| c00129          | Sam        | Smith      | 1 Rascal Farm Rd     | WY             | Cody      |
| c00157          | Sandra     | Pincher    | 1 Rascal Farm Rd     | WY             | Cody      |
| c00182          | Billy      | Rufton     | 1 Rascal Farm Rd     | WY             | Cody      |
| c00987          | Joey       | Smith      | 1 Rascal Farm Rd     | WY             | Cody      |
| c01986          | Maria      | Galant     | 1 Rascal Farm Rd     | WY             | Cody      |
| c00001          | Robert     | Thornberry | 14 Rock Ln           | WY             | Ralston   |
| c00012          | Jennifer   | Jones      | 14 Rock Ln           | WY             | Ralston   |
| c00101          | John       | Doe        | 14 Rock Ln           | WY             | Ralston   |
| c00103          | Andrew     | Murcia     | 14 Rock Ln           | WY             | Ralston   |
| c00129          | Sam        | Smith      | 14 Rock Ln           | WY             | Ralston   |
| c00157          | Sandra     | Pincher    | 14 Rock Ln           | WY             | Ralston   |
| c00182          | Billy      | Rufton     | 14 Rock Ln           | WY             | Ralston   |
| c00987          | Joey       | Smith      | 14 Rock Ln           | WY             | Ralston   |
| c01986          | Maria      | Galant     | 14 Rock Ln           | WY             | Ralston   |
+-----------------+------------+------------+----------------------+----------------+-----------+
81 rows in set (0.00 sec)
*/


/* Query 9 */

/*
	Use an ON clause to join the customer and membership table so that the SQL statement displays the
	customer number, fist name, last name, phone number, email, and membership name. You will need to use
	a table alias in your answer as both tables have columns with the same name. 
*/

SELECT c.customer_number, c.first_name, c.last_name, c.phone_number, c.email,
m.name AS membership_name
FROM customer c
JOIN membership m ON (c.member_id = m.id);

/* My output:
+-----------------+------------+------------+--------------+-----------------------------+-----------------+
| customer_number | first_name | last_name  | phone_number | email                       | membership_name |
+-----------------+------------+------------+--------------+-----------------------------+-----------------+
| c00001          | Robert     | Thornberry | 01234567898  | bob.thornberry@heatmail.com | Rookie          |
| c00129          | Sam        | Smith      | 01342145231  | ssmith5@example.com         | Rookie          |
| c00101          | John       | Doe        | 03216547808  | unknown@here.com            | All Star        |
| c00157          | Sandra     | Pincher    | 01342136231  | spinch2@example.com         | All Star        |
| c00987          | Joey       | Smith      | 01489736589  | jsmith17@example.com        | All Star        |
| c00182          | Billy      | Rufton     | 01489736231  | billyruff@example.com       | Golden Star     |
| c01986          | Maria      | Galant     | 01442736589  | margal87@delphiview.com     | Golden Star     |
+-----------------+------------+------------+--------------+-----------------------------+-----------------+
7 rows in set (0.00 sec)
*/



/* Query 10 */

/*
	Write a SQL statement that displays all of the membership and customer information, even if there is no
	match with the table on the left (membership). 
*/

SELECT *
FROM membership
LEFT JOIN customer
ON membership.id = customer.member_id;

/* My output:
+------+-------------+----------+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
| id   | name        | discount | customer_number | email                       | first_name | last_name  | phone_number | current_balance | member_id | card_number |
+------+-------------+----------+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
| t001 | Rookie      |       10 | c00001          | bob.thornberry@heatmail.com | Robert     | Thornberry | 01234567898  |          150.00 | t001      | NULL        |
| t001 | Rookie      |       10 | c00129          | ssmith5@example.com         | Sam        | Smith      | 01342145231  |          740.65 | t001      | NULL        |
| t002 | All Star    |       20 | c00101          | unknown@here.com            | John       | Doe        | 03216547808  |          987.50 | t002      | NULL        |
| t002 | All Star    |       20 | c00157          | spinch2@example.com         | Sandra     | Pincher    | 01342136231  |          840.65 | t002      | NULL        |
| t002 | All Star    |       20 | c00987          | jsmith17@example.com        | Joey       | Smith      | 01489736589  |          287.65 | t002      | NULL        |
| t003 | Golden Star |       30 | c00182          | billyruff@example.com       | Billy      | Rufton     | 01489736231  |          540.65 | t003      | NULL        |
| t003 | Golden Star |       30 | c01986          | margal87@delphiview.com     | Maria      | Galant     | 01442736589  |          125.65 | t003      | NULL        |
+------+-------------+----------+-----------------+-----------------------------+------------+------------+--------------+-----------------+-----------+-------------+
7 rows in set (0.01 sec)
*/

