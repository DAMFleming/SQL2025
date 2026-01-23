-- 1. Nombre, dirección y teléfono de todos los participantes de España.

	select participantes.nombre,participantes.dirección,participantes.teléfono
	from participantes join paises on participantes.numPaís = paises.número 
	where paises.nombre ="España";

-- 2. Nombre y dirección de todos los hoteles en los que se han alojado jugadores de España.

	select hoteles.nombre, hoteles.dirección
	from paises join participantes on participantes.numPaís = paises.número
		join alojar on participantes.numAsociado = alojar.numAsociado
		join hoteles on alojar.nombreHotel = hoteles.nombre 
	where paises.nombre = 'España';
		

-- 3. Nombre los participantes en cada partida junto con su nacionalidad y el número de partida.
	select partidas.número 'Número de partida', prN.nombre 'J.Negras', paN.nombre 'País',
			prB.nombre 'J.Blancas', paB.nombre 'País'
	from paises paN join participantes prN on paN.número = prN.numPaís
		join jugadores jN on prN.numAsociado = jN.numAsociado
        join partidas on jN.numAsociado = partidas.negras
        join jugadores jB on partidas.blancas = jB.numAsociado
        join participantes prB on jB.numAsociado = prB.numAsociado
        join paises paB on prB.numPaís = paB.número;
	
	
-- 4. Obtener el nombre de los jugadores, el nombre del árbitro y el número de partida de las
--    partidas celebradas el 10 de mayo de 2009, y también el nombre de hotel y de la sala donde
--    se celebraron.


-- 5. Nombre, dirección y teléfono del hotel u hoteles en los que se haya celebrado el mayor
--    número de partidas.

select nombreHotel
from partidas
group by nombreHotel
having count(*) >= all (select distinct count(*)
	                    from partidas
                        group by nombreHotel);

-- 6. Nombre de la sala o salas de mayor capacidad y nombre de su hotel.
SELECT nombreSala, nombreHotel
FROM salas
WHERE capacidad = (
	SELECT MAX(capacidad)
	FROM salas
);

-- 7. Nombre, dirección y teléfono del hotel u hoteles que poseen la sala de mayor capacidad.


-- 8. Obtener el nombre del hotel y sala donde se han celebrado partidas en las que el número de
--    entradas vendidas ha sido inferior al 50% de la capacidad de la sala donde se han celebrado,
--    y también el nombre de los jugadores y la fecha con el formato:
--               <día_de_la_semana>, <día del més> de <año>

select p1.nombre 'jugador blancas', p2.nombre 'jugador negras',
       partidas.nombreHotel hotel, partidas.nombreSala sala,
       concat(dayname(fecha), ', ', dayofmonth(fecha), ' de ', year(fecha)) fecha
from participantes p1 join partidas on p1.numAsociado = blancas
     join participantes p2 on p2.numAsociado = negras
     join salas on partidas.nombreSala = salas.nombreSala and partidas.nombreHotel = salas.nombreHotel
where entradas < capacidad / 2;
     
-- 9. Obtener el número de partida, fecha de celebración, nombre de los participantes y número de
--    movimientos de aquellas partidas en las que el número de movimientos realizados está entre
--    los 5 mayores.

select p1.nombre blancas, p2.nombre negras, número partida, fecha, count(numMovimiento) movimientos
from partidas join movimientos on número = numPartida
	 join participantes p1 on p1.numAsociado = blancas
     join participantes p2 on p2.numAsociado = negras
group by número
having movimientos in (
	select count(numMovimiento) n
    from movimientos
    group by numPartida
    order by n desc
    limit 5
);

select distinct count(*) n
from products
group by productVendor
order by n desc
limit 3;


-- 10. Nombre de todos los jugadores que no han participado en partidas celebradas un lunes.

select nombre
from participantes
where numAsociado not in (
	select distinct numAsociado
	from jugadores join partidas on numAsociado = blancas || numAsociado = negras
	where dayofweek(fecha) = 2);

-- 11. Nombre de los jugadores cuya media de movimientos por partida supere a la media de
--     movimientos por partida del resto de jugadores de su país.


-- 12. Nombre de todas las salas junto al nombre de su hotel y el número de partidas celebradas en
--     cada una de ellas.

select nombreHotel, nombreSala, count(número) 'número de partidas'
from partidas
group by nombreHotel, nombreSala;


-- 13. Nombre, dirección y teléfono del hotel u hoteles en los que se haya celebrado el mayor número
--     de partidas.

select nombre, dirección, teléfono
from hoteles join partidas on nombre = nombreHotel
group by nombre, dirección, teléfono
having count(número) >= all (
	select distinct count(número)
    from partidas
    group by nombreHotel
);

select nombre, dirección, teléfono
from hoteles join partidas on nombre = nombreHotel
group by nombre, dirección, teléfono
having count(número) = (
	select distinct count(número) n
    from partidas
    group by nombreHotel
    order by n desc
    limit 1
);

select nombre, dirección, teléfono
from hoteles join partidas on nombre = nombreHotel
group by nombre, dirección, teléfono
having count(número) = (
	select max(n)
    from (
		select distinct count(número) n
		from partidas
		group by nombreHotel
    )
);



alter table partidas change entradas entradas integer;


