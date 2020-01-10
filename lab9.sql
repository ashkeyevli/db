Create DATABASE lab9;
CREATE TABLE Employees (id serial, name varchar(20), age int, address varchar(50), salary int, department_id int );
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('Paul', 32, 'California', 20000, 80);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('Allen', 25, 'Texas', 15000, 60);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('Teddy', 23, 'Norway', 20000, 60);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('Mark', 25, 'Rich-Mond', 65000, 40);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('David', 27, 'Texas', 85000, 30);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('Kim', 22, 'South-Hall', 45000, 50);
INSERT INTO Employees (name, age, address, salary, department_id) VALUES ('James', 24, 'Houston', 10000, 10);
CREATE VIEW Address_view AS SELECT name, address FROM Employees;
ALTER VIEW address_view RENAME TO view_address;
CREATE VIEW david_address AS SELECT address FROM view_address WHERE name='David';

DROP VIEW view_address;
CREATE ROLE loginuser WITH LOGIN;

CREATE ROLE with_password WITH PASSWORD 'password' VALID UNTIL '01-01-2020';
ALTER ROLE with_password PASSWORD 'dsa8tyu75';
ALTER ROLE with_password PASSWORD NULL;
ALTER ROLE with_password VALID UNTIL '01-05-2020 12:00:00';
ALTER ROLE with_password VALID UNTIL 'infinity';

ALTER ROLE with_password SET maintenance_work_mem = 2097150;

CREATE MATERIALIZED VIEW salary_more_2000 AS SELECT * FROM Employees WHERE salary > 20000 WITH NO DATA;

CREATE VIEW emp_view AS SELECT id, name, salary FROM Employees WHERE department_id = 50;

DROP VIEW emp_view Cascade;

CREATE MATERIALIZED VIEW emp_mview AS SELECT * FROM Employees WHERE name >= 'A%' AND name <= 'H%' AND salary IN (10000, 20000, 15000);
