CREATE DATABASE lab2;
CREATE TABLE project(

    id  integer not null generated always as identity,
    name varchar(50),
    start_datetime timestamp,
    end_datetime timestamp,
    is_finished boolean,
    description text
);
ALTER TABLE project
    ADD created_at timestamp;
ALTER TABLE project
    ALTER COLUMN name type varchar(100);
ALTER TABLE project
    ALTER COLUMN  is_finished set DEFAULT false;
ALTER TABLE project
  ADD  constraint id primary key(id);
CREATE TABLE tasks(
    id  integer not null generated always as identity,
    name varchar(50),
    description text,
    priority smallint,
    project_id int references project(id)
);
DROP TABLE project CASCADE;
DROP DATABASE lab1;
DROP DATABASE lab2; /*if error in the task of lab2*/


