--Alejandra Arredondo Hernandez 189744
--NOTA: como se recomendo en clase, Alejandra, Yuliana y Elisa compartimos nuestros 
--conocimientos después de haber elaborado de manera individual nuestra tarea,
--cada una sabe como hacer cada pregunta, sin embargo, intercambiamos opiniones 
--y formas de hacerlo para enriquecer nuestro conocimiento en la materia. 

--Pregunta 1, ¿Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?
select c.customer_id, concat (c.first_name, ' ',c.last_name) as "nombre", c.email, c3.country
from customer c join address a using (address_id) join city c2 using (city_id) join country c3 using (country_id)
where c3.country = 'Canada'; 

--Pregunta 2, ¿Qué cliente ha rentado más de nuestra sección de adultos?
select c.customer_id, concat(c.first_name, ' ', c.last_name) as "nombre", count(r.rental_id) as veces_rentado 
from customer c join rental r using (customer_id) join inventory i using (inventory_id)
join film f using (film_id) where f.rating = 'NC-17'
group by (c.customer_id, nombre) order by veces_rentado  desc limit 1;

--Pregunta 3, ¿Qué películas son las más rentadas en todas nuestras stores? 
select f.film_id, f.title, count(r.rental_id) as veces_rentado from rental r 
join inventory i using (inventory_id) join film f using (film_id) 
group by (f.film_id, f.title) order by veces_rentado desc; 
