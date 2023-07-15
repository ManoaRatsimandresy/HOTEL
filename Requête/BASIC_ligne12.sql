SELECT hro.room_id, ro.name, ro.price + rt.base_price AS total_price
FROM have_room_options hro
INNER JOIN room r ON hro.room_id = r.id
INNER JOIN room_option ro ON hro.option_id = ro.id_room_option
INNER JOIN room_type rt ON r.id_room_type = rt.id
ORDER BY total_price DESC;