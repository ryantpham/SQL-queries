--SELECT DISTINCT
SELECT DISTINCT(rating) FROM film;

--SELECT COUNT
SELECT COUNT(DISTINCT(rating)) FROM film;

-- SELECT WHERE
-- Question 1
SELECT email FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas';
-- Question 2
SELECT description FROM film
WHERE title = 'Outlaw Hanky'
-- Question 3
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

--ORDER BY
