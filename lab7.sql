CREATE DATABASE lab7;
CREATE TABLE customer
(
    customer_id integer ,
     first_name varchar(20),
      last_name varchar(20),
      email varchar(60)
);

CREATE TABLE payment
(
    payment_id int,
     customer_id int,
     rental int ,
     commission double precision,
     payment_date timestamp
);

CREATE TABLE rental
(
    rental_id int PRIMARY KEY ,
    rental_date timestamp,
    customer_id int,
    payment_id int,
    last_update timestamp
);
SELECT first_name, last_name, rental FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT first_name, rental FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id WHERE commission IN(0.99,1.99,2.99);

SELECT customer.first_name, customer.last_name, payment.commission,rental.rental_date FROM customer INNER JOIN payment ON customer.customer_id=payment.customer_id INNER JOIN rental ON payment.payment_id=rental.payment_id;

SELECT customer.first_name,count(payment.rental) From customer JOIN payment ON customer.customer_id=payment.payment_id GROUP BY first_name HAVING count(payment.rental)> 2;

SELECT customer.first_name,customer.last_name, payment.rental As final_rental From customer Join payment on customer.customer_id = payment.customer_id where rental=rental*commission;
SELECT customer.first_name,customer.last_name, rental.rental_date FROM customer JOIN rental ON customer.customer_id = rental.customer_id where rental_date='25-05-2015';
SELECT customer.first_name, customer.email, rental.rental_date, rental.last_update FROM customer RIGHT JOIN rental ON customer.customer_id = rental.customer_id;
SELECT customer.first_name, customer.last_name, customer.customer_id, rental.rental_date AS current_rental, LAG(rental,1) OVER (ORDER BY rental) AS prev_rental FROM  customer LEFT JOIN rental ON customer.customer_id=rental.customer_id;
SELECT count(customer.customer_id), sum(payment.rental*commission),payment.payment_date::date FROM customer RIGHT JOIN payment ON customer.customer_id=payment.customer_id GROUP BY payment.payment_date;
SELECT customer.first_name, customer.last_name, replace(email,'sakilacustomer.org', 'kbtustudent.kz') FROM customer LEFT JOIN rental ON customer.customer_id = rental.customer_id WHERE rental_date IS NULL;


