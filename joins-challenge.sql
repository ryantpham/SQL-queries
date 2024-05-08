-- What are the emails of the customers who live in California?
SELECT district,email FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district IN('California');

