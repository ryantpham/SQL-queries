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
