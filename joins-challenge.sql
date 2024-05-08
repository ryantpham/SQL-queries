-- What are the emails of the customers who live in California?
SELECT district,email FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district IN('California');

--Get a list of all the movies "Nick Wahlberg" has been in.

--Solution 1
SELECT actor_id FROM actor
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'
--OUTPUT: 2

SELECT title,actor_id FROM film
FULL OUTER JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE actor_id = 2

--Solution 2: Double JOIN
SELECT actor.first_name,actor.last_name,title FROM film
FULL OUTER JOIN film_actor
ON film.film_id = film_actor.film_id
FULL OUTER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'