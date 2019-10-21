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
	VALUES(1, 'TRP-QC')
	

    