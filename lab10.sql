CREATE DATABASE lab10;
zabcd#abcdzabcdz
CREATE TABLE accounts (id serial primary key , name varchar(20) NOT NULL , age int, balance int not null );
INSERT INTO accounts (name, age, balance) VALUES ('Anna',35, 32000);
INSERT INTO accounts (name, age, balance) VALUES ('Nurlam',25,45000);
INSERT INTO accounts (name, age, balance) VALUES ('Adam',21,35000);
INSERT INTO accounts (name, age, balance) VALUES ('Mishel',19,65000)
INSERT INTO accounts (name, age, balance) VALUES ('Dana',27, 75000);
INSERT INTO accounts (name, age, balance) VALUES ('Kirill',22, 95000);
INSERT INTO accounts (name, age, balance) VALUES ('Janibek',24, 37000);
BEGIN;
UPDATE accounts set balance=balance+1000 WHERE id='1';
Select balance FROM accounts where balance=20000 and id='2';
UPDATE accounts set balance=balance-3000 where id='3';
ROLLBACK ;
COMMIT;


BEGIN;
UPDATE accounts set balance=balance+1500 WHERE name='Adam';
UPDATE accounts set balance=balance-1500 WHERE name='Kirill';
ROLLBACK ;
COMMIT;

BEGIN;
DELETE FROM accounts where name='Dana';
ROLLBACK;
UPDATE accounts set balance=7000 WHERE name='Dana';
COMMIT;

BEGIN;
UPDATE accounts set balance=balance-3000 where id='3';
SAVEPOINT save_1;
UPDATE accounts set balance=balance+1000 where id='1';
UPDATE accounts set balance=balance+1000 where id='2';
ROLLBACK to save_1;
COMMIT;
--#6 ex
--6.1)For user2 nothing will change because user1 does not commit transaction, so balance will update balance*1.1. And while user1 SELECT balance FROM accounts LIMIT 1 answear will 32000 because does not commit transaction
--6.2)Even user1 roolback it wouldn't change anything, but it cancels previous procedurs without commit. So user2 result is update balance*1.1;
--6.3)When user1 commits the result will change to balance = balance * 1.05;



CREATE function avg_salary( OUT average NUMERIC)  AS $$
    BEGIN
SELECT INTO average AVG(salary) FROM Employees;
        END; $$
    LANGUAGE PLPGSQL;
SELECT avg_salary();



CREATE  function avg_salary( d_id integer,out average numeric)   AS $$
    BEGIN
SELECT INTO average AVG(salary) FROM Employees where department_id=d_id;
        END; $$
    LANGUAGE PLPGSQL;
SELECT avg_salary(d_id := 80);


CREATE  function sum( out sum numeric)   AS $$
       BEGIN
SELECT INTO  SUM(salary) FROM Employees where date_start>=time_start AND date_end<=time_end;
        END; $$
    LANGUAGE PLPGSQL;

CREATE or replace function select_emp( name_emp varchar)
RETURNS table(id1 int,name1 varchar, age1 int, address1 varchar(50), salary1 int, department_id1 int )
AS $$
       BEGIN
           return query select
                    id,name,age,address,salary,department_id FROM Employees where name ILIKE name_emp;
        END; $$
    LANGUAGE plpgsql;
select * from select_emp('Kim');

