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

--How many payments did each staff member handle and who gets the bonus
SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id;

--What is the average replacement cost per MPAA rating?
SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY rating,AVG(replacement_cost) ASC;

--What are the customer ids of the top 5 customers by total spend?
SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
