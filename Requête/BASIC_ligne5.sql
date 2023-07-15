SELECT d.id, d.name, d.rate, d.start_time, d.end_time
FROM discount d
WHERE CURRENT_TIMESTAMP BETWEEN d.start_time AND d.end_time;