/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	                The Sports Retail Store  Database                		  */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/

CREATE DATABASE IF NOT EXISTS retailstore;

USE retailstore;

/* drop the tables */

DROP TABLE IF EXISTS ordered_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cust_address;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS membership;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS inv_list;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS departments;

/* create the tables for the database */

-- Create departments table
CREATE TABLE departments (
    department_id DECIMAL(4 , 0 ),
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6 , 0 ),
    CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
);
-- Create jobs table
CREATE TABLE jobs (
    job_id VARCHAR(10),
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(6 , 0 ),
    max_salary DECIMAL(6 , 0 ),
    CONSTRAINT job_id_pk PRIMARY KEY (job_id)
);
-- Create employees table
CREATE TABLE employees (
    employee_id DECIMAL(6 , 0 ),
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8 , 2 ),
    commission DECIMAL(2 , 2 ),
    manager_id DECIMAL(6 , 0 ),
    department_id DECIMAL(4 , 0 ),
    bonus VARCHAR(5),
    CONSTRAINT emp_salary_min CHECK (salary > 0),
    CONSTRAINT emp_id_pk PRIMARY KEY (employee_id),
    CONSTRAINT emp_email_uk UNIQUE (email),
    CONSTRAINT emp_dept_fk FOREIGN KEY (department_id)
        REFERENCES departments (department_id),
    CONSTRAINT emp_job_fk FOREIGN KEY (job_id)
        REFERENCES jobs (job_id),
    CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id)
        REFERENCES employees (employee_id),
    CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id)
        REFERENCES employees (employee_id)
);
  
-- Create inv_list table
CREATE TABLE inv_list (
    id VARCHAR(11) NOT NULL,
    cost DECIMAL(9 , 2 ) NOT NULL,
    units INT(4) NOT NULL,
    CONSTRAINT inventory_list_pk PRIMARY KEY (id)
);

-- Create item table
CREATE TABLE item (
    item_number VARCHAR(10) NOT NULL,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(50) NOT NULL,
    category VARCHAR(25) NOT NULL,
    color VARCHAR(15),
    Size CHAR(2),
    price DECIMAL(9 , 2 ) NOT NULL,
    ilt_id VARCHAR(11) NOT NULL,
    CONSTRAINT item_pk PRIMARY KEY (item_number),
    CONSTRAINT item_inventory_list_fk FOREIGN KEY (ilt_id)
        REFERENCES inv_list(id)
);

-- Create membership table
CREATE TABLE membership (
    id VARCHAR(4) NOT NULL,
    name VARCHAR(20) NOT NULL,
    discount INT(2),
    CONSTRAINT member_pk PRIMARY KEY (id)
);

-- Create customer table
CREATE TABLE customer (
    customer_number VARCHAR(6) NOT NULL,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
    current_balance DECIMAL(6 , 2 ) NOT NULL,
    member_id VARCHAR(4),
    card_number VARCHAR(6),
    CONSTRAINT customer_pk PRIMARY KEY (customer_number),
    CONSTRAINT cust_email_uk UNIQUE (email),
    CONSTRAINT cust_lcn_uk UNIQUE (card_number),
    CONSTRAINT customer_member_fk FOREIGN KEY (member_id)
        REFERENCES membership (id)
);

-- Create cust_address  table
CREATE TABLE cust_address (
    id VARCHAR(8) NOT NULL,
    address_line_1 VARCHAR(30) NOT NULL,
    address_line_2 VARCHAR(30),
    city VARCHAR(15) NOT NULL,
    zip_code VARCHAR(7) NOT NULL,
    cust_number VARCHAR(6) NOT NULL,
    CONSTRAINT customer_address_pk PRIMARY KEY (id),
    CONSTRAINT customer_address_customer_fk FOREIGN KEY (cust_number)
        REFERENCES customer (customer_number)
);

-- Create orders table
CREATE TABLE orders (
    order_id VARCHAR(9) NOT NULL,
    order_date DATE NOT NULL,
    number_of_units INT(2) NOT NULL,
    cust_number VARCHAR(6) NOT NULL,
    CONSTRAINT ordersr_pk PRIMARY KEY (order_id),
    CONSTRAINT orders_customer_fk FOREIGN KEY (cust_number)
        REFERENCES customer (customer_number)
);

-- Create ordered_items table
CREATE TABLE ordered_items (
    quantity_ordered INT(3) NOT NULL,
    quantity_shipped INT(3) NOT NULL,
    item_number VARCHAR(10) NOT NULL,
    order_id VARCHAR(9) NOT NULL,
    CONSTRAINT ordered_item_pk PRIMARY KEY (item_number , order_id),
    CONSTRAINT ordered_item_item_fk FOREIGN KEY (item_number)
        REFERENCES item (item_number),
    CONSTRAINT ordered_item_order_fk FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
);

