/*  Assignment6.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
	Write a SELECT statement that finds the average salary for Sports Retail Store (SRS) employees
	whose manager ID is 100. 
*/

SELECT AVG(salary)
FROM employees
GROUP BY manager_id
HAVING manager_id = 100;

/* My output:
+--------------+
| AVG(salary)  |
+--------------+
| 12660.000000 |
+--------------+
1 row in set (0.00 sec)
*/


/* Query 2 */

/*
	Write a SELECT statement that finds the lowest salary, the most recent hire date, the last name who is first
	in an alphabetical list of employees, and the last name who is last of an alphabetical list of employees.
	Select only employees who are in departments 50 or 60.
*/

SELECT MIN(salary) AS lowest_salary,
MAX(hire_date) AS most_recent_hire_date,
MIN(last_name) AS first_last_name_by_alpha,
MAX(last_name) AS last_last_name_by_alpha
FROM employees
WHERE department_id IN (50, 60);

/* My output:
+---------------+-----------------------+--------------------------+-------------------------+
| lowest_salary | most_recent_hire_date | first_last_name_by_alpha | last_last_name_by_alpha |
+---------------+-----------------------+--------------------------+-------------------------+
|       2500.00 | 2015-07-06            | Bell                     | Vargas                  |
+---------------+-----------------------+--------------------------+-------------------------+
1 row in set (0.00 sec)
*/


/* Query 3 */

/*

	Write a SELECT statement that finds what the most recent hire date of an SRS employee was.

*/

SELECT MAX(hire_date) AS most_recent_hire_date
FROM employees;

/* My output:
+-----------------------+
| most_recent_hire_date |
+-----------------------+
| 2015-12-16            |
+-----------------------+
1 row in set (0.00 sec)
*/


/* Query 4 */

/*
	Write a SQL statement that creates a list including each employee's first name concatenated to a space and
	the employee's last name, and the salary of all employees where the last name contains the string 'ar'. 
*/

SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM employees
WHERE last_name LIKE '%ar%';

/* My output:
+----------------------+----------+
| full_name            | salary   |
+----------------------+----------+
| Neena Kochhar        | 17000.00 |
| Peter Vargas         |  2500.00 |
| Michael Hartstein    | 13000.00 |
| Sophia Barbosa Souza |  9500.00 |
| Matthias Reinhard    |  8100.00 |
+----------------------+----------+
5 rows in set (0.00 sec)
*/


/* Query 5 */

/*
	Write a SQL statement that finds the last name who is first in an alphabetical list of employees in the
	employees table, and the last name who is last in that an alphabetical list.
*/

SELECT MIN(last_name) AS first_in_list,
MAX(last_name) AS last_in_list
FROM employees;

/* My output:
+---------------+--------------+
| first_in_list | last_in_list |
+---------------+--------------+
| Abel          | Zlotkey      |
+---------------+--------------+
1 row in set (0.00 sec)
*/


/* Query 6 */

/*
	Write a SQL statement that creates a list of weekly salaries from the employees table where the weekly
	salary is between $700 and $3,000. The salaries should be formatted to include a $-sign and have two
	decimal points like: $9999.99.
*/

SELECT CONCAT('$', FORMAT(salary / 4, 2)) AS weekly_salary
FROM employees
WHERE (salary / 4) BETWEEN 700 AND 3000;

/* My output:
+---------------+
| weekly_salary |
+---------------+
| $2,250.00     |
| $1,500.00     |
| $1,050.00     |
| $1,450.00     |
| $875.00       |
| $775.00       |
| $2,625.00     |
| $2,750.00     |
| $2,150.00     |
| $1,750.00     |
| $1,100.00     |
| $975.00       |
| $3,000.00     |
| $2,075.00     |
| $2,375.00     |
| $1,875.00     |
| $1,825.00     |
| $1,825.00     |
| $2,400.00     |
| $2,150.00     |
| $875.00       |
| $1,000.00     |
| $925.00       |
| $2,000.00     |
| $1,950.00     |
| $2,025.00     |
| $1,075.00     |
| $1,025.00     |
| $1,100.00     |
| $1,250.00     |
| $1,350.00     |
| $1,300.00     |
| $1,225.00     |
+---------------+
33 rows in set (0.00 sec)
*/


/* Query 7 */

/*
	Write a SQL statement that lists the item number and item description for all items. The item descriptions
	should appear in uppercase letters.

*/

SELECT item_number,  UPPER(description) AS description
FROM item;

/* My output
+-------------+-----------------------------+
| item_number | description                 |
+-------------+-----------------------------+
| im01101044  | CATCHER MITT                |
| im01101045  | TOP WORN UNDER THE GAME TOP |
| im01101046  | TEAM SHIRT                  |
| im01101047  | TEAM SHIRT WITH EMBLEM      |
| im01101048  | HIGH QUAITY BASBALL BAT     |
| im01101049  | SWEATER FLEECE VEST         |
| im01101050  | CLOUDSWIFT                  |
| im01101052  | SOCKS                       |
+-------------+-----------------------------+
8 rows in set (0.00 sec)
*/


/* Query 8 */

/*
	Write a SQL statement that lists the customer number, first name, last name, and current balance for all
	customers. The balance should be rounded to the nearest dollar.
*/

SELECT customer_number, first_name, last_name,
ROUND(current_balance, 0) AS current_balance
FROM customer;

/* My output
+-----------------+------------+------------+-----------------+
| customer_number | first_name | last_name  | current_balance |
+-----------------+------------+------------+-----------------+
| c00001          | Robert     | Thornberry |             150 |
| c00012          | Jennifer   | Jones      |               0 |
| c00101          | John       | Doe        |             988 |
| c00103          | Andrew     | Murcia     |              85 |
| c00129          | Sam        | Smith      |             741 |
| c00157          | Sandra     | Pincher    |             841 |
| c00182          | Billy      | Rufton     |             541 |
| c00987          | Joey       | Smith      |             288 |
| c01986          | Maria      | Galant     |             126 |
+-----------------+------------+------------+-----------------+
9 rows in set (0.00 sec)
*/


/* Query 9 */

/*
	SRS is running a promotion that is valid for up to 20 days after an order is placed. Write a SQL statement that
	lists the order ID, customer number, first name, and last name. The promotion date is 20 days after the
	order was placed.
*/

SELECT orders.order_id, customer.customer_number, customer.first_name,
customer.last_name, orders.order_date,
ADDDATE(orders.order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders
INNER JOIN customer ON (orders.cust_number = customer.customer_number);

/* My output
+-----------+-----------------+------------+------------+------------+----------------+
| order_id  | customer_number | first_name | last_name  | order_date | promotion_date |
+-----------+-----------------+------------+------------+------------+----------------+
| or0101250 | c00001          | Robert     | Thornberry | 2017-04-17 | 2017-05-07     |
| or0101350 | c00001          | Robert     | Thornberry | 2017-05-24 | 2017-06-13     |
| or0101681 | c00001          | Robert     | Thornberry | 2017-06-06 | 2017-06-26     |
| or0101425 | c00103          | Andrew     | Murcia     | 2017-05-27 | 2017-06-16     |
| or0101756 | c00129          | Sam        | Smith      | 2018-10-09 | 2018-10-29     |
| or0101755 | c00157          | Sandra     | Pincher    | 2018-10-10 | 2018-10-30     |
| or0101754 | c00182          | Billy      | Rufton     | 2018-09-17 | 2018-10-07     |
| or0101753 | c00987          | Joey       | Smith      | 2018-12-18 | 2019-01-07     |
| or0101750 | c01986          | Maria      | Galant     | 2017-07-18 | 2017-08-07     |
| or0101752 | c01986          | Maria      | Galant     | 2017-12-18 | 2018-01-07     |
+-----------+-----------------+------------+------------+------------+----------------+
10 rows in set (0.00 sec)
*/


/* Query 10 */

/*
	Write a SELECT statement that returns these columns:
	The count of the number of orders in the ORDERS table.
	The sum of the number of units column in the ORDERS table.
*/

SELECT COUNT(*) AS  num_orders,
SUM(number_of_units) AS number_of_unites 
FROM orders;

/* My output
+------------+------------------+
| num_orders | number_of_unites |
+------------+------------------+
|         10 |               56 |
+------------+------------------+
1 row in set (0.00 sec)
*/


/* Query 11 */

/*
	Write a SELECT statement that displays the item number and the number of orders placed for each item.
	Show the results in decreasing order and label result column NumOrders.
*/

SELECT item_number, COUNT(quantity_ordered) AS NumOrders
FROM ordered_items
GROUP BY item_number
ORDER BY NumOrders DESC;

/* My output
+-------------+-----------+
| item_number | NumOrders |
+-------------+-----------+
| im01101050  |         5 |
| im01101048  |         3 |
| im01101044  |         2 |
| im01101047  |         2 |
| im01101046  |         1 |
+-------------+-----------+
5 rows in set (0.00 sec)
*/


/* Query 12 */

/*
	Write a SELECT statement that answers this question: Which customers have ordered more than one item?
	Return these columns:
	The email address from the CUSTOMER table
	The count of distinct items from the customer’s orders
*/

SELECT c.email, COUNT(distinct item_number) AS number_of_items
FROM customer c
INNER JOIN orders o ON o.cust_number = c.customer_number
INNER JOIN ordered_items oi ON oi.order_id = o.order_id
GROUP BY c.email
HAVING number_of_items > 1
ORDER BY c.email;

/* My output
+-----------------------------+-----------------+
| email                       | number_of_items |
+-----------------------------+-----------------+
| bob.thornberry@heatmail.com |               3 |
| margal87@delphiview.com     |               2 |
| spinch2@example.com         |               2 |
| ssmith5@example.com         |               2 |
+-----------------------------+-----------------+
4 rows in set (0.00 sec)
*/


/* Query 13 */

/*
	Consider the groups of items where each group contains the items that are from the same category. For
	each such group that has more than one item, display item category, number of items in the group, and
	average price of the products in the group.
*/

SELECT item.category, COUNT(item.item_number) AS number_of_items,
AVG(item.price) AS avg_price
FROM item
GROUP BY item.category
HAVING number_of_items > 1;

/* My output
+----------+-----------------+-----------+
| category | number_of_items | avg_price |
+----------+-----------------+-----------+
| clothing |               5 | 29.192000 |
+----------+-----------------+-----------+
1 row in set (0.00 sec)
*/
