CREATE DATABASE lab3;
CREATE TABLE computers (
comp_id serial primary key ,
name_comp char(10),
model text,
speed integer,
ram integer,
price integer
);
INSERT INTO computers(name_comp, model, speed, ram, price) VALUES ('acsdsr','213214',222,512,232133);
INSERT INTO computers (ram) VALUES(NULL);
INSERT INTO computers(name_comp, model, speed, ram, price) VALUES ('acsdsrq','421412',2322,5132,2332133),('acsd','3432324',2422,5152,2321343),('acsds','4324324',2252,5162,2321353);
ALTER TABLE computers
    Alter column price set DEFAULT 75000;
Alter table computers
    alter column model type integer using (model::integer);
INSERT INTO computers DEFAULT VALUES;

CREATE TABLE personal_c (LIKE computers);
INSERT INTO personal_c SELECT*FROM computers;
UPDATE personal_c SET model = '1875' WHERE model IS NULL;
UPDATE personal_c SET price=price*0.1 RETURNING name_comp,price AS new_price;
DELETE  FROM computers WHERE price<=50000;
DELETE FROM personal_c USING computers WHERE computers.comp_id IS NOT NULL;
DELETE FROM computers returning *;




