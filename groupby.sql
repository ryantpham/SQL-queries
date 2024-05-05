--Common Aggregation Functions
--MIN
SELECT MIN(replacement_cost) FROM film;
--MAX
SELECT MAX(replacement_cost) FROM film;
--AVG
SELECT AVG(replacement_cost) FROM film;
--SUM
SELECT SUM(replacement_cost) FROM film;
--COUNT
SELECT COUNT(replacement_cost) FROM film;
--ROUND
SELECT 
	ROUND(AVG(replacement_cost),3) 
FROM film;
