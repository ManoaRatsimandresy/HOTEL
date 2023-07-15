SELECT r.id AS room_id, h.name, r.id_room_type, COUNT(res.id) AS reservation_count
FROM room r
LEFT JOIN reservation res ON r.id = res.room_id
INNER JOIN hotel h ON r.id_hotel = h.id
WHERE r.id_hotel = ? --où ? est l'id de hotel à donner
GROUP BY r.id, h.name, r.id_room_type
ORDER BY reservation_count DESC;