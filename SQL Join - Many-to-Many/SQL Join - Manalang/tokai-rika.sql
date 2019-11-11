CREATE DATABASE tokai_rika_ph;
SHOW TABLES;
SELECT * FROM employee;

/*TABLE FOR PERSON*/
CREATE TABLE person (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(45) NOT NULL,
	middle_name VARCHAR(45), last_name VARCHAR(45) NOT NULL, contact_number VARCHAR(15),
    address VARCHAR(80) NOT NULL, age INT(3) NOT NULL, birthdate VARCHAR(45) NOT NULL);

INSERT INTO person
	VALUES(1, 'Alana', 'Gay', 'Lara', 09187635601, '135 Andover Street
		Canal Winchester, OH 43110', 20, 'July 06, 1999');
        
INSERT INTO person
	VALUES(2, 'Steve', 'Grave', 'Frank', 09256632901, '380 High Ave.
		Chevy Chase, MD 20815', 36, 'November 28, 1983');
        
INSERT INTO person
	VALUES(3, 'Zain', 'Cole', 'Wiley', 09094567872, '9697 North Heather Drive
		Lake Villa, IL 60046', 25, 'March 06, 1994');
        
INSERT INTO person
	VALUES(4, 'Jayden', 'Moss', 'Park', 09983216791, '7436 Adams Dr.
		Severn, MD 21144', 40, 'October 20, 1979');

INSERT INTO person
	VALUES(5, 'Ricky', 'Joe', 'Ruiz', 09220923119, '749 County St.
		Buckeye, AZ 85326', 23, 'August 13, 1996');
        
/*TABLE FOR DEPARTMENT*/
CREATE TABLE department (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, codename VARCHAR(45));

INSERT INTO department
	VALUES(1, 'TRP-QC');

INSERT INTO department
	VALUES(2, 'SUJI-TOSHI');
    
INSERT INTO department
	VALUES(3, 'PPAP');
    
INSERT INTO department
	VALUES(4, 'TRP-IN HOUSE');
    
/*EMPLOYEE holds the foreign keys*/
CREATE TABLE employee (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, emp_idn VARCHAR(45) NOT NULL
	UNIQUE, person_id INT, department_id INT, FOREIGN KEY (person_id) REFERENCES person(id), 
    FOREIGN KEY (department_id) REFERENCES department(id));
    
INSERT INTO employee
	VALUES(1, '2015-000020', 3, 1);
    
INSERT INTO employee
	VALUES(2, '2005-000100', 1, 4);
    
INSERT INTO employee
	VALUES(3, '2019-100002', 2, 3);
    
INSERT INTO employee
	VALUES(4, '2010-300450', 5, 1);
    
INSERT INTO employee
	VALUES(5, '2014-204055', 4, 2);
    

SELECT employee.id, person.last_name, department.codename
	FROM employee
		INNER JOIN person ON employee.person_id = person.id
        INNER JOIN department ON employee.department_id = department.id;


/*SQL VIEW*/
CREATE VIEW employee_details;

SELECT
	first_name,
    last_name,
    contact_number,
    address,
    emp_idn,
    codename
FROM
	employee
INNER JOIN
	person USING (id)
INNER JOIN
	department USING (id);
    
/*Many-to-many relationship*/

CREATE TABLE order_form(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, order_date VARCHAR(45) NOT NULL,
total DOUBLE NOT NULL, tax DOUBLE NOT NULL, delivery_date VARCHAR(45) NOT NULL);

INSERT INTO order_form
	VALUES(1234, 'July 06, 2010', 14521, 156, 'October 15, 2010');
    
INSERT INTO order_form
    VALUES(1235, 'January 15, 2012', 49756, 1524, 'May 31, 2012');
    
INSERT INTO order_form
    VALUES(1236, 'April 24, 2013', 56487, 1765, 'August 1, 2013');
    
INSERT INTO order_form
    VALUES(1237, 'December 12, 2014', 16421, 684, 'March 16, 2015');
    
INSERT INTO order_form
    VALUES(1238, 'July 08, 2016', 46872, 945, 'December 27, 2016');
    

CREATE TABLE order_detail(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, price DOUBLE NOT NULL, 
quantity INT NOT NULL, subtotal DOUBLE NOT NULL, of_id INT, sp_id INT, FOREIGN KEY (of_id) 
REFERENCES order_form(id), FOREIGN KEY (sp_id) REFERENCES supplier_parts(id));

INSERT INTO order_detail
	VALUES(1, 1500, 20, 30000, 1238, 1);

INSERT INTO order_detail
	VALUES(2, 500, 30, 15000, 1237, 2);
    
INSERT INTO order_detail
	VALUES(3, 250, 100, 25000, 1236, 3);
    
INSERT INTO order_detail
	VALUES(4, 1000, 55, 55000, 1235, 4);
    
INSERT INTO order_detail
	VALUES(5, 750, 75, 56250, 1234, 5);
    
SELECT order_detail.id, supplier_parts.product_desc, supplier_parts.supp_code, order_detail.subtotal,
	order_form.order_date, order_form.delivery_date
	FROM order_detail
		INNER JOIN order_form ON order_detail.of_id = order_form.id
        INNER JOIN supplier_parts ON order_detail.sp_id = supplier_parts.id;

CREATE TABLE supplier_parts(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, product_desc VARCHAR(100) NOT NULL,
supp_code VARCHAR(45) NOT NULL, manufactured_date VARCHAR(45) NOT NULL);

INSERT INTO supplier_parts
	VALUES(1, 'Touchpad', 'AK12GB5', 'September 20, 2016');

INSERT INTO supplier_parts
	VALUES(2, 'Steering Switch', 'BZ45H12', 'January 10, 2016');
    
INSERT INTO supplier_parts
	VALUES(3, 'Seatbelt', '12ZCM4L', 'June 01, 2013');
    
INSERT INTO supplier_parts
	VALUES(4, 'Outer Mirror', 'DDL091G', 'February 06, 2012');
    
INSERT INTO supplier_parts
	VALUES(5, 'Speed Sensor', '09LOPQS', 'August 10, 2010');