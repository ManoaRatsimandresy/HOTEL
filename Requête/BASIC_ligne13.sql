SELECT hro.room_id, ro.name, ro.description, ro.price  
FROM have_room_options hro
INNER JOIN room r
ON hro.room_id = r.id
INNER JOIN room_option ro
ON hro.option_id = ro.id_room_option
WHERE description ILIKE '%?%'; -- où ? est un mot clés donné