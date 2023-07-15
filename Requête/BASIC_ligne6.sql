SELECT *
FROM reservation res
INNER JOIN "user" u
ON res.user_id = u.user_id
WHERE u.first_name ILIKE '%?%' -- où ? est un first name à donner
AND u.last_name ILIKE '%?%';  -- où ? est un last name à donner