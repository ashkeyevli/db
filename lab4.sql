SELECT * FROM city WHERE ID IN(1,2,3,5,14);
SELECT * FROM city WHERE ID>18 AND CountryCode='NLD' AND Population>201843;
SELECT MAX(population),MIN( population) FROM city;
SELECT AVG(population) FROM city;
SELECT LifeExpectancy FROM country ORDER BY Capital DESC;
SELECT name, IndepYear FROM country ORDER BY IndepYear DESC;
SELECT* FROM country WHERE GNP BETWEEN 1500 AND 6000;
SELECT Capital FROM country GROUP BY capital HAVING (Capital)>=65;
SELECT COUNT(capital) FROM country where Capital>=65;



