SELECT name, COUNT(client_id) AS project_count
FROM client
INNER JOIN project
ON client.id = client_id
GROUP BY name
HAVING COUNT(client_id) = (
	SELECT MAX(project_count)
	FROM (
		SELECT name, COUNT(client_id) AS project_count
		FROM client
		JOIN project
		ON client.id = client_id
		GROUP BY client.name
	) AS max_value
);