WITH cam_blur AS (
    SELECT
        gr.camera_metadata AS camera_metadata,
        gr.soccer_game_id,
        g.date AS game_date,
        NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') AS camera_id,
        SPLIT_PART(COALESCE(g.camera_pi_id, g.pi_id), '/', 1) AS cam_id,
        (json_extract_path_text(gr.camera_metadata, 'blurriness', NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') || 'A'))::int AS blurry_R,
        (json_extract_path_text(gr.camera_metadata, 'blurriness', NULLIF(json_extract_path_text(gr.camera_metadata, 'game_info_v3', 'caseID'), '') || 'B'))::int AS blurry_N,
        (json_extract_path_text(gr.camera_metadata, 'misalignment', 'raw'))::int AS misalignment_raw
    FROM
        tracedb.game_resources gr
    JOIN
        tracedb.games g ON gr.soccer_game_id = g.game_id
    WHERE
        g.date >= '2024-01-01'
),
ranked_games AS (
    SELECT
        camera_metadata,
        soccer_game_id,
        game_date,
        camera_id,
        cam_id,
        blurry_R,
        blurry_N,
        misalignment_raw,
        ROW_NUMBER() OVER (
            PARTITION BY COALESCE(camera_id, '')
            ORDER BY game_date DESC -- Most Recent Game
        ) AS row_num
    FROM
        cam_blur
    WHERE
        camera_id = 'X8682' -- Change cam ID here
)
SELECT
    cam_id,
    camera_id AS case_id,
    game_date AS game_date,
    camera_metadata,
    blurry_R,
    blurry_N,
    misalignment_raw,
    row_num
FROM
    ranked_games
WHERE
    row_num = 1 OR row_num = 2 -- Grabs first 2 Recent games
ORDER BY
    cam_id, game_date DESC;
    