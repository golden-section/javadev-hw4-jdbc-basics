SELECT 'Youngest' AS TYPE,  name, birthday
FROM worker
WHERE birthday = (
    SELECT MAX(birthday)
    FROM worker
    )
UNION
SELECT 'Eldest' AS TYPE,  name, birthday
FROM worker
WHERE birthday = (
    SELECT MIN(birthday)
    FROM worker
    )
ORDER BY birthday DESC;