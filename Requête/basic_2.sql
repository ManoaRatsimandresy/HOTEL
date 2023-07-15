SELECT * FROM reservation 
INNER JOIN room ON reservation.room_id = room.id 
INNER JOIN hotel ON room.id_hotel = hotel.id
where hotel.id=1
ORDER BY reservation.creation_timestamp DESC;