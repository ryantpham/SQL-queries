WITH battery_perc AS (
    SELECT
        gr.camera_metadata AS camera_metadata,
        gr.soccer_game_id,
        g.date AS game_date,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') AS camera_id,
        SPLIT_PART(COALESCE(g.camera_pi_id, g.pi_id), '/', 1) AS cam_id,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'sn'), '') AS battery_sn
    FROM
        tracedb.game_resources gr
    JOIN
        tracedb.games g ON gr.soccer_game_id = g.game_id
    WHERE
        g.date >= '2023-01-01' -- Limit games to only 2023-01-01 and after
),
ranked_games AS (
    SELECT
        camera_metadata,
        soccer_game_id,
        game_date,
        camera_id,
        cam_id,
        percent_minute,
        battery_sn,
        ROW_NUMBER() OVER (
            PARTITION BY COALESCE(camera_id, '')
            ORDER BY game_date ASC
        ) AS row_num
    FROM
        battery_perc
)
SELECT
    cam_id,
    camera_id AS case_id,
    percent_minute,
    game_date AS first_game_date,
    battery_sn,
    row_num
FROM
    ranked_games
WHERE
    row_num = 1 -- Only the first game for each camera
ORDER BY
    cam_id, game_date ASC;

--Updated Script:
WITH battery_perc AS (
    SELECT
        gr.camera_metadata AS camera_metadata,
        gr.soccer_game_id,
        g.date AS game_date,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') AS camera_id,
        SPLIT_PART(COALESCE(g.camera_pi_id, g.pi_id), '/', 1) AS cam_id,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'percent_minute'), '')::float AS percent_minute,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'startpercent'), '')::float AS startpercent,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'stoppercent'), '')::float AS stoppercent,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'battery', 'sn'), '') AS battery_sn
    FROM
        tracedb.game_resources gr
    JOIN
        tracedb.games g ON gr.soccer_game_id = g.game_id
    WHERE
        g.date >= '2023-01-01' -- Limit games to only 2023-01-01 and after
),
ranked_games AS (
    SELECT
        camera_metadata,
        soccer_game_id,
        game_date,
        camera_id,
        cam_id,
        percent_minute,
        startpercent,
        stoppercent,
        battery_sn,
        ROW_NUMBER() OVER (
            PARTITION BY COALESCE(camera_id, '')
            ORDER BY game_date ASC
        ) AS row_num
    FROM
        battery_perc
)
SELECT
    cam_id,
    camera_id AS case_id,
    percent_minute,
    game_date AS first_game_date,
    battery_sn,
    stoppercent,
    startpercent,
    row_num
FROM
    ranked_games
WHERE
    row_num = 1 -- Only the first game for each camera
ORDER BY
    cam_id, game_date ASC;
