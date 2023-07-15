SELECT * FROM hotel INNER JOIN room ON room.id_hotel = hotel.id
INNER JOIN reservation ON room.id = reservation.room_id 
WHERE reservation.start_timestamp > '2023-08-15'  AND reservation.end_timestamp < '2023-08-18' ;