CREATE DATABASE lab5;

CREATE TABLE Customer(customer_id SERIAL PRIMARY KEY , first_name varchar(50), last_name varchar(50), email varchar(50), active_bool bool, create_date date , last_update timestamp, active int);


CREATE TABLE payment(payment_id SERIAL, customer_id Serial references Customer, rental integer, amount double precision, payment_date timestamp);

SELECT * FROM customer WHERE last_name LIKE '%ON%';

SELECT * FROM customer WHERE first_name LIKE 'M_%_%';

SELECT * FROM customer WHERE first_name LIKE 'L%A';

SELECT * FROM customer WHERE create_date BETWEEN '2013-01-01' AND '2014-12-31';

SELECT * FROM customer WHERE  create_date::text LIKE '%-04-05';

SELECT  customer_id AS usedID, email AS userEmail, active AS userState FROM Customer;

SELECT *, to_char( create_date, '2025% 31.12') FROM Customer;

SELECT CONCAT(rental, ' ', amount,'!!!') AS res FROM payment;

SELECT first_name, customer_id FROM Customer WHERE exists(SELECT 1 FROM payment WHERE rental=1040);

SELECT rental AS bouns_amount,
      Case
           WHEN rental>1500 THEN rental+rental*0.15
           WHEN rental<1000 Then rental+rental*0.1
           ELSE rental+rental*0.05
END New
From payment;


SELECT *FROM Customer Where last_update=Any(Select payment_date from payment);

SELECT ROUND(amount) FROM payment;


