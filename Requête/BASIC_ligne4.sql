select h.name, h.address, rt.name, rt.base_price
from room r
inner join room_type rt
on r.id = rt.id
inner join hotel h
on r.id_hotel = h.id
where rt.name = '?' -- où ? est un type de room donnée
AND h.name = '?'; --où ? est un nom d'hotel à donner
