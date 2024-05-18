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
