/**Afficher le nombre de réservation d'un client donné **/
select count (*) from public.user INNER JOIN reservation 
ON public.user.id = reservation.user_id WHERE user.id= 2;