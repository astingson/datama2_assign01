CREATE DATABASE tokai_rika_ph;

SHOW TABLES;

SELECT * FROM employee;

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
    
CREATE TABLE supplier (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, department_id INT, 
	FOREIGN KEY (department_id) REFERENCES department(id));
    
INSERT INTO supplier
	VALUES(1, 2);
    
INSERT INTO supplier
	VALUES(2, 3);
    
INSERT INTO supplier
	VALUES(3, 4);
    
INSERT INTO supplier
	VALUES(4, 1);
    
INSERT INTO supplier
	VALUES(5, 2);
    

SELECT supplier.id, department.codename
	FROM supplier
        INNER JOIN department ON supplier.department_id = department.id;
    
CREATE TABLE department (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, codename VARCHAR(45));

INSERT INTO department
	VALUES(1, 'TRP-QC');

	
CREATE TABLE order_form (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, order_date VARCHAR(45) NOT NULL,
total VARCHAR(45) NOT NULL, tax VARCHAR(45) NOT NULL, delivery_date VARCHAR(45) NOT NULL, department_id INT,
supplier_id INT,
	FOREIGN KEY (department_id) REFERENCES department(id), FOREIGN KEY(supplier_id) REFERENCES supplier(id));
    
INSERT INTO order_form
	VALUES(1234, 'July 06, 2010', 14521, 156, 'October 15, 2010', 2, 5);
INSERT INTO order_form
    VALUES(1235, 'January 15, 2012', 49756, 1524, 'May 31, 2012', 1, 4);
INSERT INTO order_form
    VALUES(1236, 'April 24, 2013', 56487, 1765, 'August 1, 2013', 3, 2);
INSERT INTO order_form
    VALUES(1237, 'December 12, 2014', 16421, 684, 'March 16, 2015', 4, 3);
INSERT INTO order_form
    VALUES(1238, 'July 08, 2016', 46872, 945, 'December 27, 2016', 3, 2);
    
    
SELECT department.id, supplier.id, order_form.id, department.codename
	FROM order_form
		INNER JOIN supplier ON order_form.supplier_id = supplier.id
        INNER JOIN department ON order_form.department_id = department.id;
        
CREATE VIEW order_form_info2
AS
SELECT codename, total, tax
	FROM order_form
		INNER JOIN supplier ON order_form.supplier_id = supplier.id
        INNER JOIN department ON order_form.department_id = department.id;

    