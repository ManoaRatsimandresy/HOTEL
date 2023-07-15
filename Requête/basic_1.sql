SELECT user.username,hotel.name  from public.user
INNER JOIN role ON user.id_role = role.id_role  
INNER JOIN reservation ON user.id = reservation.user_id
INNER JOIN room ON reservation.room_id = room.id 
INNER JOIN hotel ON room.id_hotel = hotel.id
where role.name LIKE 'Receptionniste';