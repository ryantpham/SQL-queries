--SELECT DISTINCT
SELECT DISTINCT(rating) FROM film;

--SELECT COUNT
SELECT COUNT(DISTINCT(rating)) FROM film;

--SELECT WHERE
SELECT email FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky'

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

--ORDER BY
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;

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

--LIKE and ILIKE
SELECT * FROM customer
WHERE first_name LIKE'J%' and last_name ILIKE's%';

SELECT * FROM customer
WHERE first_name LIKE'_her%';

SELECT * FROM customer
WHERE first_name LIKE'R%'
ORDER BY last_name ASC;

SELECT * FROM customer
WHERE first_name LIKE'R%' and last_name NOT LIKE 'B%'
ORDER BY last_name ASC;

