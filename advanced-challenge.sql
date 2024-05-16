--Timestamps and EXTRACT
    --TIME - Contains only time
    --DATE - Contains only date
    --TIMESTAMP Contains date and time
    --TIMESTAMPTZ - Contains date, time, and timezone
--YEAR
SELECT EXTRACT(YEAR FROM payment_date) 
FROM payment
--MONTH
SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment
--QUARTER 
SELECT EXTRACT(QUARTER FROM payment_date) AS pay_quarter
FROM payment

--AGE: Calculates how old the inputted timestamp is to the present time
SELECT AGE(payment_date)
FROM payment

--TO_CHAR: To convert to string and format
SELECT to_char(payment_date,'MM-DD-YYYY')
FROM payment

SELECT to_char(payment_date,'MONTH-month-mm')
FROM payment

-- Mathematical functions and operators
    --https://www.postgresql.org/docs/9.5/functions-math.html
SELECT ROUND(rental_rate/replacement_cost,2) * 10 AS cost_percentage
FROM film;

SELECT ROUND(replacement_cost * .10,2) AS deposit_amount
FROM film;

--String functions and operators
SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@company_name.com' AS custom_email
FROM customer;

--Subquery