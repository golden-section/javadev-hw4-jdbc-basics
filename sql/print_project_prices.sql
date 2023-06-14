SELECT CONCAT('Project-', project.id) AS name, sum(DATEDIFF(MONTH, start_date, finish_date) * salary) AS price
FROM project
INNER JOIN project_worker ON project.id = project_worker.project_id
INNER JOIN worker ON project_worker.worker_id = worker.id 
GROUP BY project.id
ORDER BY price DESC;