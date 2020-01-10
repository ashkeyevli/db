Create database lab1;
create table users(
    id  serial,
    firstname varchar(50),
    lastname varchar(50)
);
ALTER TABLE users
    ADD isadmin integer;
Alter table users
    alter column isadmin type bool using isadmin::bool;
ALTER TABLE users
    ALTER COLUMN  isadmin set DEFAULT false;
CREATE table tasks(
    id integer primary key ,
    name varchar(50),
    user_id integer
);

Drop table tasks;
DROP DATABASE lab1;

