/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	    The Sports Retail Store Database                     			      */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/

/*  Insert data into the tables */
USE retailStore;

-- populate inv_list table
INSERT INTO inv_list (id, cost, units)
VALUES('il0124', 2.5, 100);
INSERT INTO inv_list (id, cost, units)
VALUES('il0125', 7.99, 250);
INSERT INTO inv_list (id, cost, units)
VALUES('il0126', 5.24, 87);
INSERT INTO inv_list (id, cost, units)
VALUES('il0127', 18.95, 65);
INSERT INTO inv_list (id, cost, units)
VALUES('il0128', 57.46, 8);
INSERT INTO inv_list (id, cost, units)
VALUES('il0129', 69.46, 9);
INSERT INTO inv_list (id, cost, units)
VALUES('il0130', 80.50, 20);
INSERT INTO inv_list (id, cost, units)
VALUES('il0131', 20.50, 10);

-- populate item table
INSERT INTO item (item_number, name, description, category, color, Size, price ,ilt_id )
VALUES('im01101044', 'gloves', 'catcher mitt', 'clothing', 'brown', 'm', 4.99, 'il0124');
INSERT INTO item (item_number, name, description, category, color, Size, price, ilt_id )
VALUES('im01101045', 'under shirt', 'top worn under the game top', 'clothing', 'white', 's',10.99,  'il0125');
INSERT INTO item (item_number, name, description, category, color, Size, price, ilt_id )
VALUES('im01101046', 'shirt', 'team shirt', 'clothing', 'orange', 'l', 10.99, 'il0126');
INSERT INTO item (item_number, name, description, category, color, Size, price, ilt_id )
VALUES('im01101047', 'game top', 'team shirt with emblem', 'clothing', 'orange', 'm', 19.99, 'il0127');
INSERT INTO item (item_number, name, description, category, price, ilt_id )
VALUES('im01101048', 'premium bat', 'high quaity basball bat', 'equipment', 64.99, 'il0128');
INSERT INTO item (item_number, name, description, category, color, Size, price, ilt_id )
VALUES('im01101049', 'Vest', 'Sweater Fleece Vest', 'clothing','blue', 'xl', 99.00, 'il0129');
INSERT INTO item (item_number, name, description, category, price, ilt_id )
VALUES('im01101050', 'Shoes', 'Cloudswift', 'Footwear',  70.00, 'il0130');
INSERT INTO item (item_number, name, description, category, color, Size, price, ilt_id )
VALUES('im01101052', 'Socks', 'Socks', 'Accessories', 'brown', 's', 30.00, 'il0131');


-- populate membership table
INSERT INTO membership (id, name,  discount)
VALUES('t001', 'Rookie', 10);
INSERT INTO membership  (id, name,  discount)
VALUES('t002', 'All Star', 20);
INSERT INTO membership  (id, name,  discount)
VALUES('t003', 'Golden Star',  30);


-- populate customer table
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number,    current_balance,   member_id , card_number)
VALUES('c00001', 'bob.thornberry@heatmail.com', 'Robert', 'Thornberry', '01234567898', 150.00,  't001', NULL);
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance, card_number)
VALUES('c00012', 'Jjones@freemail.com', 'Jennifer', 'Jones', '01505214598', 0.00, 'lc1015');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,  member_id )
VALUES('c00101', 'unknown@here.com', 'John', 'Doe', '03216547808', 987.50,  't002');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance, card_number)
VALUES('c00103', 'MurciaA@globaltech.com', 'Andrew', 'Murcia', '07715246890', 85.00, 'lc2341');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,   member_id )
VALUES('c01986', 'margal87@delphiview.com', 'Maria', 'Galant', '01442736589', 125.65,  't003');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,   member_id )
VALUES('c00987', 'jsmith17@example.com', 'Joey', 'Smith', '01489736589', 287.65,  't002');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,   member_id )
VALUES('c00182', 'billyruff@example.com', 'Billy', 'Rufton', '01489736231', 540.65,  't003');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,   member_id )
VALUES('c00157', 'spinch2@example.com', 'Sandra', 'Pincher', '01342136231', 840.65,  't002');
INSERT INTO customer (customer_number, email, first_name, last_name, phone_number, current_balance,   member_id )
VALUES('c00129', 'ssmith5@example.com', 'Sam', 'Smith', '01342145231', 740.65,  't001');


-- populate cust_address table
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0101', '83 Barrhill Drive', NULL, 'Ralston', '82441', 'c00001');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0102', '17 Gartsquare Road', 'Starford', 'Elk Butte', '82433', 'c00012');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0103', '54 Ropehill Crescent', 'Georgetown', 'Powell', '82440', 'c00101');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0104', '22 Jackson Farm Rd', NULL, 'Garland', '82435', 'c01986');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0105', '63 Acacia Drive', 'Skins', 'Wapiti', '82450', 'c01986');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0106', '17 Fourth St', 'WY', 'Cody', '82414', 'c00987');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0107', '42 Blackwater Way', 'WY', 'Elk Butte', '82433', 'c00182');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0108', '1 Rascal Farm Rd', 'WY', 'Cody', '82414', 'c00157');
INSERT INTO cust_address (id, address_line_1, address_line_2, city, zip_code, cust_number)
VALUES('ca0109', '14 Rock Ln', 'WY', 'Ralston', '82441', 'c00129');



-- populate orders table
INSERT INTO orders (order_id, order_date ,  number_of_units, cust_number)
VALUES('or0101250', '2017-04-17',  10, 'c00001');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101350','2017-05-24', 5, 'c00001');
INSERT INTO orders (order_id, order_date ,  number_of_units, cust_number)
VALUES('or0101425', '2017-05-27', 18, 'c00103');
INSERT INTO orders (order_id, order_date ,  number_of_units, cust_number)
VALUES('or0101681', '2017-06-06', 10, 'c00001');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101750', '2017-07-18', 1, 'c01986');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101752', '2017-12-18', 2, 'c01986');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101753', '2018-12-18', 1, 'c00987');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101754', '2018-09-17', 2, 'c00182');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101755', '2018-10-10', 4, 'c00157');
INSERT INTO orders (order_id, order_date , number_of_units, cust_number)
VALUES('or0101756', '2018-10-09', 3, 'c00129');

-- populate ordered_items table
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(5, 5, 'or0101250', 'im01101044');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(5, 5, 'or0101250', 'im01101046');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(5, 5, 'or0101350', 'im01101044');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(18, 18, 'or0101425', 'im01101047');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(10, 10, 'or0101681', 'im01101047');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(1, 1, 'or0101750', 'im01101048');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(2, 2, 'or0101752', 'im01101050');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(1, 1, 'or0101753', 'im01101050');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(2, 2, 'or0101754', 'im01101050');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(2, 2, 'or0101755', 'im01101050');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(2, 2, 'or0101755', 'im01101048');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(2, 2, 'or0101756', 'im01101050');
INSERT INTO ordered_items (quantity_ordered, quantity_shipped, order_id, item_number)
VALUES(1, 1, 'or0101756', 'im01101048');


-- populate departments table
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(10,'Administration',200);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(20,'Marketing',201);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(50,'Shipping',124);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(60,'IT',103);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(80,'Sales - Europe',149);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(85,'Sales - Americas',149);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(90,'Executive',100);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(110,'Accounting',205);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(190,'Contracting',NULL);

-- populate jobs table
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('AD_PRES','President',20000,40000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('AD_VP','Administration Vice President',15000,30000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('SA_MAN','Sales Manager',10000,20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('SR_SA_REP','Senior Sales Representative',8000,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('SA_REP','Sales Representative',6000,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('ST_MAN','Stock Manager',5500,8500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('SR_ST_CLRK','Senior Stock Clerk',3700,6700);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('IT_PROG','Programmer',4000,10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('SR_MK_REP','Senior Marketing Representative',6500,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('MK_REP','Marketing Representative',4000,9000);

-- populate employees table
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(100,'Steven','King','SKING','515.123.4567',STR_TO_DATE('2002-02-11', '%Y-%m-%d'), 'AD_PRES',24000,NULL,NULL,90);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568',STR_TO_DATE('2004-09-21', '%Y-%m-%d'),'AD_VP',17000,NULL,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569',STR_TO_DATE('2008-01-13', '%Y-%m-%d'), 'AD_VP',17000,NULL,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444',STR_TO_DATE('2002-09-17', '%Y-%m-%d'), 'AD_ASST',4400,NULL,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080',STR_TO_DATE('2009-06-07', '%Y-%m-%d'), 'AC_MGR',12000,NULL,101,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(206,'William','Gietz','WGIETZ','515.123.8181',STR_TO_DATE('2009-06-07', '%Y-%m-%d'), 'AC_ACCOUNT',8300,NULL,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id, bonus)
VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',STR_TO_DATE('2015-01-29', '%Y-%m-%d'), 'SA_MAN',10500,.2,100,80, '1500' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id, bonus)
VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267',STR_TO_DATE('2011-05-11', '%Y-%m-%d'), 'SA_REP',11000,.3,149,80,'1700' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id, bonus)
VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',STR_TO_DATE('2013-03-24', '%Y-%m-%d'),'SA_REP',8600,.2,149,80,'1250' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263',STR_TO_DATE('2014-05-24', '%Y-%m-%d'), 'SA_REP',7000,.15,149,NULL );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234',STR_TO_DATE('2014-11-16', '%Y-%m-%d'),'ST_MAN',5800,NULL,100,50);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009',STR_TO_DATE('2010-10-17', '%Y-%m-%d'), 'ST_CLERK',3500,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994',STR_TO_DATE('2012-01-29', '%Y-%m-%d'), 'ST_CLERK',3100,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(143,'Randall','Matos','RMATOS','650.121.2874',STR_TO_DATE('2013-03-15', '%Y-%m-%d'), 'ST_CLERK',2600,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004',STR_TO_DATE('2013-07-09', '%Y-%m-%d'), 'ST_CLERK',2500,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567',STR_TO_DATE('2005-01-03', '%Y-%m-%d'), 'IT_PROG',9000,NULL,102,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568',STR_TO_DATE('2006-05-21', '%Y-%m-%d'), 'IT_PROG',6000,NULL,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567',STR_TO_DATE('2014-02-07', '%Y-%m-%d'),'IT_PROG',4200,NULL,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555',STR_TO_DATE('2011-02-17', '%Y-%m-%d'), 'MK_MAN',13000,NULL,100,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(202,'Pat','Fay','PFAY','603.123.6666',STR_TO_DATE('2013-08-17', '%Y-%m-%d'), 'MK_REP',3900,NULL,201,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(207,'Sophia','Barbosa Souza','SBARBOSASOUZA','55.24.6280.6935',STR_TO_DATE('2009-03-21', '%Y-%m-%d'),'SR_SA_REP',9500,.2,149,85);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(208,'Diego','Silva Pinto','DSILVAPINTO','55.24.8806.9837',STR_TO_DATE('2009-10-25', '%Y-%m-%d'), 'SA_REP',7500,.15,149,85);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(209,'Sarah','Alves Rocha','SALVESROCHA','55.24.9381.2160',STR_TO_DATE('2011-02-06', '%Y-%m-%d'), 'SA_REP',7300,.15,149,85);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(210,'Lucas','Almeida Castro','ALMEIDACASTRO','55.24.6514-5378',STR_TO_DATE('2012-08-16', '%Y-%m-%d'),'SA_REP',7300,.2,149,85);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(212,'Nick','Hooper','NHOOPER','011.44.1886 6663',STR_TO_DATE('2012-09-01', '%Y-%m-%d'), 'SR_SA_REP',9600,.2,149,80);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(215,'Donna','Steiner','DSTEINER','843.452.5959',STR_TO_DATE('2004-11-02', '%Y-%m-%d'),'SR_MK_REP',8600,NULL,201,20);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(216,'George','Bell','GBELL','724.647.4299',STR_TO_DATE('2014-04-01', '%Y-%m-%d'),'SR_ST_CLRK',3500,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(217,'Lisa','TAYLOR','LTAYLOR','417.730.8202',STR_TO_DATE('2013-02-09', '%Y-%m-%d'),'MK_REP',4000,NULL,201,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(219,'Michael','Stocks','MSTOCKS','662.314.6844',STR_TO_DATE('2015-12-16', '%Y-%m-%d'),'MK_REP',3700,NULL,201,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(220,'Tiffany','Heiden','THEIDEN','413.251.0684',STR_TO_DATE('2015-07-06', '%Y-%m-%d'),'ST_CLERK',2600,NULL,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(222,'Chen','Li','CLI','423.817.1481',STR_TO_DATE('2008-08-29', '%Y-%m-%d'), 'IT_PROG',8000,NULL,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(223,'Alain','Fontaine','AFONTAINE','601.424.8816',STR_TO_DATE('2013-11-18', '%Y-%m-%d'),'IT_PROG',7800,NULL,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(224,'Matthias','Reinhard','MREINHARD','315.496.2466',STR_TO_DATE('2007-07-25', '%Y-%m-%d'),'AC_ACCOUNT',8100,NULL,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(225,'Katia','Hernandez','KHERNANDEZ','214.350.4575',STR_TO_DATE('2011-06-13', '%Y-%m-%d'),'AD_ASST',4300,NULL,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(226,'Guido','Ricci','GRICCI','305.269.9415',STR_TO_DATE('2015-05-17', '%Y-%m-%d'),'AD_ASST',4100,NULL,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(227,'Mizuto','Saikawa','MSAIKAWA','541.831.2444',STR_TO_DATE('2012-02-01', '%Y-%m-%d'),'AD_ASST',4400,NULL,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(228,'Nabil','Safwah','NSAFWAH','720.863.0485',STR_TO_DATE('1997-01-06', '%Y-%m-%d'),'MK_REP',5000,NULL,201,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(231,'Jelena','Duric','JDURIC','505.514.1583',STR_TO_DATE('2009-05-11', '%Y-%m-%d'),'AC_ACCOUNT',5400,NULL,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(232,'Jennifer','Loermans','JLOERMANS','213.447.9053',STR_TO_DATE('2013-04-14', '%Y-%m-%d'), 'AC_ACCOUNT',5200,NULL,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id)
VALUES(235,'Alice','Newton','ANEWTON','314.248.7709',STR_TO_DATE('2015-12-16', '%Y-%m-%d'),'MK_REP',4900,NULL,201,20 );
