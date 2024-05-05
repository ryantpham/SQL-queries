-- SELECT DISTINCT: Retrieve unique values from a column
SELECT DISTINCT(rating) FROM film;

-- SELECT COUNT: Count the number of distinct values in a column
SELECT COUNT(DISTINCT(rating)) FROM film;

-- SELECT WHERE: Filter rows based on a condition
SELECT email FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- ORDER BY: Sort the result set
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;

SELECT COUNT(title) FROM film
WHERE length <= 50;

-- BETWEEN: Select values within a range
SELECT amount FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT amount FROM payment
WHERE amount NOT BETWEEN 8 and 9;

-- IN: Filter rows based on a list of values
SELECT * FROM customer
WHERE first_name IN('Jared','Maria','Linda');

-- LIKE and ILIKE: Filter rows based on a pattern
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
