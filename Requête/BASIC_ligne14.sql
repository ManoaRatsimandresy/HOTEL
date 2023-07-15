SELECT h.id ,h.name ,h.address, ro.name, ro.description, ro.price  
FROM have_room_options hro
INNER JOIN room r
ON hro.room_id = r.id
INNER JOIN room_option ro
ON hro.option_id = ro.id_room_option
INNER JOIN hotel h
ON r.id_hotel = h.id
WHERE description ILIKE '%?%'; -- où ? est un mot clés donné