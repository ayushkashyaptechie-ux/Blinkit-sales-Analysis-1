use blinkit;

UPDATE blinkit_data
SET `Item Fat Content` =
CASE
    WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN `Item Fat Content` = 'reg' THEN 'Regular'
    ELSE `Item Fat Content`
END;

SELECT `Item Fat Content`
FROM blinkit_data
LIMIT 5	