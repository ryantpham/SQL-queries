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