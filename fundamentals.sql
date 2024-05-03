--SELECT DISTINCT
SELECT DISTINCT(rating) FROM film;

--SELECT COUNT
SELECT COUNT(DISTINCT(rating)) FROM film;

--SELECT WHERE
-- Q1
SELECT email FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas';
-- Q2
SELECT description FROM film
WHERE title = 'Outlaw Hanky'
-- Q3
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

--ORDER BY
--Q1
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;
--Q2
SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;
--Q3
SELECT COUNT(title) FROM film
WHERE length <= 50;

--BETWEEN
SELECT amount FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT amount FROM payment
WHERE amount NOT BETWEEN 8 and 9;

--IN
SELECT * FROM customer
WHERE first_name IN('Jared','Maria','Linda');
