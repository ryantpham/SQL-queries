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

--GROUP BY
--EX syntax
SELECT rating,COUNT(release_year) FROM film
WHERE rating != 'R'
GROUP BY rating
ORDER BY COUNT(release_year);
