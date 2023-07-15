SELECT h.name AS hotel_name, COUNT(*) AS total_reservations
FROM hotel h
JOIN room r ON h.id = r.id_hotel
JOIN reservation res ON r.id = res.room_id
GROUP BY h.name;