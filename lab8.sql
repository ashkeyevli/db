CREATE database lab8;
CREATE TABLE actor(actor_id SERIAL PRIMARY KEY ,
 first_name varchar(50),
  last_name varchar(50),
   email varchar(50),
   active_bool bool,
   create_date date ,
   last_update date,
    active int);
CREATE TABLE film_actor(actor_id SERIAL,
 first_name varchar(50),
 last_update date);


INSERT INTO actor VALUES (1, 'John', 'SMITH', 'MARY.SMITH@sakilaactor.org', true, '2017-02-14', '2018-01-15 09:57:20', 1);
INSERT INTO actor VALUES (2, 'PATRICIA', 'JOHNSON', 'PATRICIA.JOHNSON@sakilaactor.org', true, '2018-10-14', '2019-10-01 09:57:20', 1);
INSERT INTO actor VALUES (3, 'LINDA', 'WILLIAMS', 'LINDA.WILLIAMS@sakilaactor.org', true, '2017-06-14', '2019-01-21 09:57:20', 0);
INSERT INTO actor VALUES (4, 'BARBARA', 'JONES', 'BARBARA.JONES@sakilaactor.org', false, '2015-12-14', '2016-08-20 09:57:20', 1);
INSERT INTO actor VALUES (5, 'ELIZABETH', 'BROWN', 'ELIZABETH.BROWN@sakilaactor.org', true, '2014-04-09', '2017-11-08 09:57:20', 1);
INSERT INTO actor VALUES (6, 'JENNIFER', 'DAVIS', 'JENNIFER.DAVIS@sakilaactor.org', false, '2017-08-30', '2018-09-18 09:57:20', 1);
INSERT INTO actor VALUES (7, 'MARIA', 'MILLER', 'MARIA.MILLER@sakilaactor.org', true, '2015-04-05', '2019-02-15 09:57:20', 1);
INSERT INTO actor VALUES (8, 'SUSAN', 'WILSON', 'SUSAN.WILSON@sakilaactor.org', true, '2016-09-19', '2017-12-04 09:57:20', 0);
INSERT INTO actor VALUES (9, 'MARGARET', 'MOORE', 'MARGARET.MOORE@sakilaactor.org', true, '2017-04-05', '2018-02-19 09:57:20', 1);
INSERT INTO actor VALUES (10, 'DOROTHY', 'TAYLOR', 'DOROTHY.TAYLOR@sakilaactor.org', false, '2014-07-23', '2017-01-25 09:57:20', 1);
INSERT INTO actor VALUES (11, 'LISA', 'ANDERSON', 'LISA.ANDERSON@sakilaactor.org', true, '2013-02-01', '2017-07-06 09:57:20', 0);

CREATE INDEX first_name_index ON actor(first_name) with;
CREATE INDEX fl_name_index ON actor(first_name,last_name) ;
CREATE UNIQUE INDEX Update_date ON actor(last_update) where last_update Between  '2018-01-01' AND '2019-01-01' ;
CREATE INDEX substring_index ON actor(substring(first_name,1,4)) where substring(first_name,1,4)='NICK';
CREATE INDEX emp_dept_join ON actor(last_update);
CREATE INDEX emp_dept_join2 ON film_actor(last_update);
CREATE INDEX name_starts_index ON actor(first_name) WHERE first_name LIKE 'A%' ;
SELECT indexdef,count(tablename) from pg_indexes GROUP BY indexdef HAVING count(tablename)>1;


