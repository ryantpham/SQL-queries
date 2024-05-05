-- Common Aggregation Functions
-- MIN: Find the minimum value in a column
SELECT MIN(replacement_cost) FROM film;

-- MAX: Find the maximum value in a column
SELECT MAX(replacement_cost) FROM film;

-- AVG: Calculate the average value in a column
SELECT AVG(replacement_cost) FROM film;

-- SUM: Calculate the sum of values in a column
SELECT SUM(replacement_cost) FROM film;

-- COUNT: Count the number of values in a column
SELECT COUNT(replacement_cost) FROM film;

-- ROUND: Round the average replacement cost to 3 decimal places
SELECT 
	ROUND(AVG(replacement_cost),3) 
FROM film;

-- GROUP BY: Group rows that have the same values into summary rows
-- Example syntax: Count the number of films released per rating excluding 'R' rating
SELECT rating,COUNT(release_year) FROM film
WHERE rating != 'R'
GROUP BY rating
ORDER BY COUNT(release_year);

-- How many payments did each staff member handle and who gets the bonus
SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id;

-- What is the average replacement cost per MPAA rating?
SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY rating,AVG(replacement_cost) ASC;

-- What are the customer ids of the top 5 customers by total spend?
SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- HAVING: Filter groups of rows returned by a GROUP BY clause
-- Example: Find customers who have made 40 or more payments
SELECT customer_id,COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

-- What are the customer ids of customers who have spent more than $100 in payment transactions with our staff_id member 2?
SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
