-- During which months did payments occur?
-- Format your answer to return back the full month name.
SELECT DISTINCT TO_CHAR(payment_date,'MONTH') 
FROM payment;

--How many payments occurred on a Monday?
SELECT COUNT(amount) AS day_of_week 
FROM payment
WHERE TRIM(TO_CHAR(payment_date,'DAY')) = 'MONDAY';

--Second Solution: 
SELECT COUNT(amount) AS day_of_week 
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

--Utilizing GROUP BY and Visualizing
SELECT TO_CHAR(payment_date,'d') AS week_day, SUM(amount) 
FROM payment
GROUP BY TO_CHAR(payment_date,'d')
ORDER BY TO_CHAR(payment_date,'d'); --Sort Monday-Sunday

--Graph Visualiser
--Stacked Line Chart
--X Axis: week_day
--Y Axis: sum