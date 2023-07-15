SELECT h.name AS hotel_name, COUNT(*) AS reservation_count
FROM hotel h
LEFT JOIN room r ON h.id = r.id_hotel
LEFT JOIN reservation res ON r.id = res.room_id
GROUP BY h.name
ORDER BY reservation_count ASC
LIMIT 1;