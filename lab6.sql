CREATE DATABASE lab6;
CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY ,
first_name varchar(20),
last_name varchar(40) UNIQUE,
salary integer NOT NULL ,
CONSTRAINT chk_salary CHECK ( salary>65000),
begin_date date CHECK ( begin_date>='2000-01-01' ),
end_date date CHECK ( end_date>=begin_date ),
job_title varchar(50) DEFAULT NULL
);

CREATE table department(
    department_id INTEGER PRIMARY KEY,
        department_name varchar(5) CHECK ( department_name='FIT'or department_name='BS'or department_name='FEOG'or department_name='FGGE' ),

 emp_id serial references employees(emp_id),
    email varchar(40) UNIQUE,
    phone_number varchar(12),
     hire_date timestamp,
    commission float

);
ALTER TABLE employees
DROP CONSTRAINT chk_salary;
SELECT first_name from employees where emp_id=ANY(SELECT emp_id FROM department);
ALTER TABLE employees
DROP COLUMN emp_id CASCADE;
Select last_name From employees where last_name>'Fleming' order by last_name asc ;
ALTER TABLE employees
DROP COLUMN last_name;
ALTER TABLE department
DROP COLUMN email;