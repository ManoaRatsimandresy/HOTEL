SELECT *
FROM reservation res
INNER JOIN "user" u
ON res.user_id = u.user_id
INNER JOIN room r
ON res.room_id = r.id
WHERE u.first_name ILIKE '%?%'; --où ? est le nom de l'user à donner