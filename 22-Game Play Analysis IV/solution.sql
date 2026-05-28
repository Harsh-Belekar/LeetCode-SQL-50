SELECT
    ROUND(SUM(player_login)/COUNT(DISTINCT player_id),2) AS fraction
FROM (
    SELECT
        player_id,
        DATEDIFF(event_date,MIN(event_date) OVER (PARTITION BY player_id)
        )= 1 AS player_login
    FROM Activity
) AS new_table
