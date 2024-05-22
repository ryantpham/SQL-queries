-- Retrieves camera connection data for 'BolsaChica' network within the last day, ordered by last connection time.
SELECT cs.update_time,TO_CHAR(cs.update_time, 'YYYY-MM-DD HH12:MI:SS AM') AS formatted_time,
       cs.case_id,c.pi_id,wifi_name,status
FROM tracedb.case_sessions cs
INNER JOIN tracedb.cases c
ON cs.case_id = c.case_id
WHERE wifi_name ILIKE'BolsaChica%'
    AND cs.update_time >= CURRENT_DATE - 1 --Yesterday
    AND cs.update_time < CURRENT_DATE + 1 --Today's Date
ORDER BY cs.update_time DESC;

-- Retrieves camera connection data for 'BolsaChica' network within the last day, ordered by last connection time.
SELECT TO_CHAR(cs.start_time, 'YYYY-MM-DD HH12:MI:SS AM') AS last_connection_time,
    cs.case_id, c.pi_id, wifi_name, status
FROM tracedb.case_sessions cs
INNER JOIN tracedb.cases c
ON cs.case_id = c.case_id
WHERE wifi_name ILIKE 'BolsaChica%'
    AND cs.update_time >= CURRENT_DATE - 1 --Yesterday
    AND cs.update_time < CURRENT_DATE + 1 --Today's Date
ORDER BY TO_CHAR(cs.start_time, 'YYYY-MM-DD HH12:MI:SS AM') DESC, cs.start_time DESC;

-- T1 - PF Subscriptions Summary
SELECT plan__nickname, COUNT(DISTINCT subitem_id) AS "Unique Subscriptions"
FROM table_name
GROUP BY plan__nickname;

-- T2 - PF Divisions Summary
SELECT type, COUNT(DISTINCT divs_division_id) AS "Unique Divisions"
FROM table_name
GROUP BY type;

-- T3 - Subs per Equipment - All divisions

-- Count for Equipment Subscriptions
SELECT COUNT(DISTINCT subitem_id) AS "Equipment Sub Count"
FROM table_name
WHERE plan__nickname LIKE '%Equipment%';

-- Count for PlayerFocus Subscriptions
SELECT COUNT(DISTINCT subitem_id) AS "PlayerFocus Sub Count"
FROM table_name
WHERE plan__nickname LIKE '%PlayerFocus%';

-- T6 - PF Subs - Annual vs. Monthly

-- Annual Subscriptions
SELECT COUNT(DISTINCT subitem_id) AS "Annual Subscriptions"
FROM table_name
WHERE interval = 'year';

-- Monthly Subscriptions
SELECT COUNT(DISTINCT subitem_id) AS "Monthly Subscriptions"
FROM table_name
WHERE interval = 'month';

-- T6.a - Total annualized recurring revenue for annual and monthly subscriptions

-- Annual Subscriptions Revenue
SELECT SUM(plan__amount) AS "Annual Subscriptions Revenue"
FROM table_name
WHERE interval = 'year';

-- Monthly Subscriptions Revenue
SELECT SUM(plan__amount) * 12 AS "Monthly Subscriptions Revenue"
FROM table_name
WHERE interval = 'month';

-- DG1 - Revenue Per Equipment
SELECT SUM(plan__amount) / COUNT(DISTINCT subitem_id) AS "Revenue Per Equipment"
FROM table_name
WHERE type IN ('Flex', 'Flex_watch') AND plan__nickname LIKE '%Equipment%';
