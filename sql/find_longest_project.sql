SELECT CONCAT('Project-', id) AS name, MAX(month_count) AS month_count FROM (
SELECT id, DATEDIFF(MONTH, start_date, finish_date) AS month_count
FROM project) AS res
GROUP BY id
HAVING MAX(month_count) = (
    SELECT MAX(month_count) AS month_count FROM (
        SELECT DATEDIFF(MONTH, start_date, finish_date) AS month_count
        FROM project) AS res
);