/*  Assignment7.sql 
    Ina Botnaru
    CS 31A, Winter 2021 */

/* Query 1 */

/*
	Write a SQL statement that displays the item number, item description, and price of the least expensive
	item in the database. (Use a subquery.)
*/

SELECT item_number, description, price
FROM item
WHERE price =
	(SELECT MIN(price)
	 FROM item);

/* My output:
+-------------+--------------+-------+
| item_number | description  | price |
+-------------+--------------+-------+
| im01101044  | catcher mitt |  4.99 |
+-------------+--------------+-------+
1 row in set (0.00 sec)
*/


/* Query 2 */

/*
	Write a SQL statement that uses the IN operator to find the customer number, first name, and last name of
	each customer for which as order was created on 09/17/2018. (Use a subquery.)
*/

SELECT customer_number, first_name, last_name
FROM customer
WHERE customer_number IN
	(SELECT cust_number
	 FROM orders
	 WHERE order_date = '2018-09-17');

/* My output:
+-----------------+------------+-----------+
| customer_number | first_name | last_name |
+-----------------+------------+-----------+
| c00182          | Billy      | Rufton    |
+-----------------+------------+-----------+
1 row in set (0.00 sec)
*/


/* Query 3 */

/*
	Write a SQL statement that displays the order ID and order date for each order created for the customer
	Andrew Murcia. (Use a subquery.)
*/

SELECT order_id, order_date
FROM orders
WHERE cust_number =
	(SELECT customer_number
	 FROM customer
	 WHERE first_name = 'Andrew' AND last_name = 'Murcia');

/* My outout:
+-----------+------------+
| order_id  | order_date |
+-----------+------------+
| or0101425 | 2017-05-27 |
+-----------+------------+
1 row in set (0.00 sec)
*/



/* Query 4 */

/*
	Write a SQL statement that displays the item number, item description, item price, and category for each
	item that has a unit price greater than the unit price of every item in category “Accessories”.
	Use either the ALL or ANY operator in your query. (Hint: Make sure you select the correct operator.)
*/

SELECT item_number, description, price, category
FROM item
WHERE price > ALL
	(SELECT price
	 FROM item
	 WHERE category = 'Accessories');

/* My output:
+-------------+-------------------------+-------+-----------+
| item_number | description             | price | category  |
+-------------+-------------------------+-------+-----------+
| im01101048  | high quaity basball bat | 64.99 | equipment |
| im01101049  | Sweater Fleece Vest     | 99.00 | clothing  |
| im01101050  | Cloudswift              | 70.00 | Footwear  |
+-------------+-------------------------+-------+-----------+
3 rows in set (0.01 sec)
*/


/* Query 5 */

/*
	Write a SQL statement that returns all those employees who have a salary greater than that of Lorentz and
	are in the same department as Abel. Display first name, last name, salary, and manager ID columns.
*/

SELECT first_name, last_name, salary, manager_id
FROM employees
WHERE salary >
	(SELECT salary
	FROM employees
	WHERE last_name = 'Lorentz')
AND department_id =
	(SELECT department_id
	 FROM employees
	 WHERE last_name = 'Abel');

/* My outout:
+------------+-----------+----------+------------+
| first_name | last_name | salary   | manager_id |
+------------+-----------+----------+------------+
| Eleni      | Zlotkey   | 10500.00 |        100 |
| Ellen      | Abel      | 11000.00 |        149 |
| Jonathon   | Taylor    |  8600.00 |        149 |
| Nick       | Hooper    |  9600.00 |        149 |
+------------+-----------+----------+------------+
4 rows in set (0.00 sec)
*/


/* Query 6 */

/*
	Write a SQL statement returns a list of department IDs and average salaries where the department’s
	average salary is less than Ernst’s salary. (Use a subquery.)
*/

SELECT department_id AS 'department id', AVG(salary) AS 'average'
FROM employees
GROUP BY department_id
HAVING AVG(salary) < ANY
	(SELECT salary
	 FROM employees
	 WHERE last_name = 'Ernst');

/* My output:
+---------------+-------------+
| department id | average     |
+---------------+-------------+
|            10 | 4300.000000 |
|            50 | 3371.428571 |
+---------------+-------------+
2 rows in set (0.00 sec)
*/


/* Query 7 */

/*
	Write a SQL statement that returns the department ID and minimum salary of all employees, grouped by
	department ID. This minimum salary must be greater than the minimum salary of those employees whose
	department ID is not equal to 50. (Use a subquery.)
*/

SELECT department_id AS 'department id', MIN(salary) AS 'minimum salary'
FROM employees
GROUP BY department_id
HAVING MIN(salary) > ANY
	(SELECT MIN(salary)
	 FROM employees
	 WHERE department_id != 50);

/* My output:
+---------------+----------------+
| department id | minimum salary |
+---------------+----------------+
|          NULL |        7000.00 |
|            10 |        4100.00 |
|            60 |        4200.00 |
|            80 |        8600.00 |
|            85 |        7300.00 |
|            90 |       17000.00 |
|           110 |        5200.00 |
+---------------+----------------+
7 rows in set (0.00 sec)
*/


/* Query 8 */
	
/*
	Write a SQL statement that finds the last names of all employees whose salaries are the same as the
	minimum salary for any department. (Use a subquery.)
*/

SELECT last_name
FROM employees
WHERE salary IN
	(SELECT MIN(salary)
	 FROM employees
	 WHERE department_id IS NOT NULL
	 GROUP BY department_id);

/* My output:
+----------------+
| last_name      |
+----------------+
| Kochhar        |
| De Haan        |
| Lorentz        |
| Vargas         |
| Taylor         |
| Alves Rocha    |
| Almeida Castro |
| Steiner        |
| Stocks         |
| Ricci          |
| Loermans       |
+----------------+
11 rows in set (0.00 sec)
*/


/* Query 9 */
	
/*
	Write a pair-wise subquery listing the last name, first name, department ID, and manager ID for all employees
	that have the same department ID and manager ID as employee 141. Exclude employee 141 from the result set. (Use a subquery.)
*/

SELECT last_name, first_name, department_id, manager_id
FROM employees
WHERE(manager_id, department_id) IN
	(SELECT manager_id, department_id
	 FROM employees
	 WHERE employee_id = 141)
 AND employee_id != 141;

/* My output:
+-----------+------------+---------------+------------+
| last_name | first_name | department_id | manager_id |
+-----------+------------+---------------+------------+
| Davies    | Curtis     |            50 |        124 |
| Matos     | Randall    |            50 |        124 |
| Vargas    | Peter      |            50 |        124 |
| Bell      | George     |            50 |        124 |
| Heiden    | Tiffany    |            50 |        124 |
+-----------+------------+---------------+------------+
5 rows in set (0.00 sec)*/


/* Query 10 */
	
/*
	Write a non-pair-wise subquery listing the last name, first name, department ID, and manager ID
	for all employees that have the same department_ ID and manager ID as employee 141. (Use a subquery.)
*/

SELECT  last_name, first_name, department_id, manager_id
FROM    employees
WHERE  manager_id IN
	(SELECT  manager_id
	 FROM    employees
	WHERE   employee_id = 141)
AND department_id IN
	(SELECT  department_id
	 FROM    employees
	WHERE   employee_id = 141)
AND employee_id != 141;

/* My output:
+-----------+------------+---------------+------------+
| last_name | first_name | department_id | manager_id |
+-----------+------------+---------------+------------+
| Davies    | Curtis     |            50 |        124 |
| Matos     | Randall    |            50 |        124 |
| Vargas    | Peter      |            50 |        124 |
| Bell      | George     |            50 |        124 |
| Heiden    | Tiffany    |            50 |        124 |
+-----------+------------+---------------+------------+
5 rows in set (0.00 sec)
*/


/* Query 11 */
	
/*
	Write a SQL statement that lists the highest earners for each department.
	Include the last name, department ID, and the salary for each employee. (Use a subquery.)
*/

SELECT last_name, department_id, salary
FROM employees
WHERE salary IN
	(SELECT MAX(salary)
	 FROM employees
	 WHERE department_id IS NOT NULL
	 GROUP BY department_id);

/* My output:
+---------------+---------------+----------+
| last_name     | department_id | salary   |
+---------------+---------------+----------+
| King          |            90 | 24000.00 |
| Hunold        |            60 |  9000.00 |
| Mourgos       |            50 |  5800.00 |
| Abel          |            80 | 11000.00 |
| Whalen        |            10 |  4400.00 |
| Hartstein     |            20 | 13000.00 |
| Higgins       |           110 | 12000.00 |
| Barbosa Souza |            85 |  9500.00 |
| Saikawa       |            10 |  4400.00 |
+---------------+---------------+----------+
9 rows in set (0.00 sec)
*/
