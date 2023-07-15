SELECT * FROM room INNER JOIN room_type ON room.id_room_type = room_type.id
INNER JOIN hotel ON room.id_hotel = hotel.id WHERE hotel.name LIKE 'saphir' AND room_type.name LIKE 'VIP';