--AS 
SELECT customer_id,SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

--INNER JOIN
SELECT first_name, payment.customer_id, payment_id 
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;
