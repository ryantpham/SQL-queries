--AS 
SELECT customer_id,SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

--INNER JOIN
SELECT first_name, payment.customer_id, payment_id 
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

--FULL OUTER JOIN
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
	--Checks where on customer or payment table where customer id happens to be null
	--WHERE statement finds rows that are only unique to the customer or payment table
WHERE customer.customer_id IS null OR payment.customer_id IS null;

--LEFT OUTER JOIN
SELECT film.film_id,title,inventory_id,store_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
	--Checks to see all movies that start with a C that we don't have in inventory
WHERE title LIKE'C%' AND inventory.film_id IS null;
