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

--FOR ALEX
WITH battery_perc AS (
    SELECT
    gr.camera_metadata AS camera_metadata,
    gr.soccer_game_id,
    g.date AS game_date,
    NULLIF(json_extract_path_text(gr.camera_metadata, 'battery', 'percent_minute'), '')::float AS percent_minute,
    NULLIF(json_extract_path_text(gr.camera_metadata, 'battery', 'SN'), '') AS battery_sn,
    ROW_NUMBER() OVER (
        PARTITION BY COALESCE(json_extract_path_text(gr.camera_metadata, 'cameraID', ''), '')
        ORDER BY g.date ASC
    ) AS row_num
FROM
    tracedb.game_resources gr
JOIN
    tracedb.games g ON gr.soccer_game_id = g.game_id
WHERE
    g.date >= '2023-01-01' --Limit games to only after 2023-01-01
)
SELECT
    json_extract_path_text(camera_metadata, 'game_info_v3', 'caseID') AS case_id,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
    game_date AS first_game_date,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'SN'), '')::float AS battery_sn
FROM
    battery_perc
WHERE
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float <= 0.6
ORDER BY game_date DESC;

--Second sumbission for ALEX
WITH battery_perc AS (
    SELECT
        gr.camera_metadata AS camera_metadata,
        gr.soccer_game_id,
        g.date AS game_date,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'battery', 'percent_minute'), '')::float AS percent_minute,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'battery', 'sn'), '') AS battery_sn,
        ROW_NUMBER() OVER (
            PARTITION BY COALESCE(json_extract_path_text(gr.camera_metadata, 'cameraID', ''), '')
            ORDER BY g.date ASC
        ) AS row_num
    FROM
        tracedb.game_resources gr
    JOIN
        tracedb.games g ON gr.soccer_game_id = g.game_id
    WHERE
        g.date >= '2023-01-01' --Limit games to only after 2023-01-01
)
SELECT
    json_extract_path_text(camera_metadata, 'game_info_v3', 'caseID') AS case_id,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
    game_date AS first_game_date,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'sn'), '') AS battery_sn
FROM
    battery_perc
WHERE
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float <= 0.6
ORDER BY game_date DESC;

-- Final adjustment (need review)
WITH battery_perc AS (
    SELECT
        gr.camera_metadata AS camera_metadata,
        gr.soccer_game_id,
        g.date AS game_date,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') AS camera_id,
        SPLIT_PART(COALESCE(g.camera_pi_id, g.pi_id), '/', 1) AS cam_id,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'sn'), '') AS battery_sn,
        DENSE_RANK() OVER (
            PARTITION BY COALESCE(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'cameraID', ''), '')
            ORDER BY g.date ASC -- Earliest Game (so starting at 2024-01-02)
        ) AS row_num
    FROM
        tracedb.game_resources gr
    JOIN
        tracedb.games g ON gr.soccer_game_id = g.game_id
    WHERE
        g.date > '2023-01-01' -- Limit games to only after 2023-01-01
)
SELECT
    cam_id,
    json_extract_path_text(camera_metadata, 'game_info_v3', 'caseID') AS case_id,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
    game_date AS first_game_date,
    NULLIF(json_extract_path_text(camera_metadata, 'game_info_v3', 'battery', 'sn'), '') AS battery_sn
FROM
    battery_perc
WHERE row_num = 1
ORDER BY game_date DESC;
