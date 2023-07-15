--Afficher le client avec le plus d'avis négatifs redigés envers les hotels


SELECT u.username, u.first_name, u.last_name, r.rate
FROM public."user" u
JOIN rating r ON u.user_id = r.user_id
WHERE r.rate = 1;