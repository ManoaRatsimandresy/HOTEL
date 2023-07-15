SELECT h.id AS hotel_id, h.name AS hotel_name, COUNT(r.id) AS total_rooms
FROM hotel h
LEFT JOIN room r ON h.id = r.id_hotel
GROUP BY h.id, h.name;