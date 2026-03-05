-- 1. Teniendo en cuenta que en la dirección de una estación de esquí se incluye
--    la provincia, mostrar los datos de los esquiadores que pertenecen a federaciones
--    que administran estaciones de Asturias y de los esquiadores que tienen un nivel
--    superior a 7.

select esquiadores.nombre, esquiadores.dni, esquiadores.fechaNac,esquiadores.nivel
from esquiadores join federaciones on esquiadores.federacion = federaciones.numero
			     join administrar on administrar.federacion = federaciones.numero
                 join estaciones on administrar.estacion = estaciones.codigo
where estaciones.direccion like '%Asturias%' or nivel > 7;



-- 2. Longitud media de las pistas de “Sierra Nevada”.

select avg(longitud) `longitud media`
from pistas join estaciones on pistas.estacion = estaciones.codigo
where estaciones.nombre = 'Sierra Nevada';


-- 3. Todas las fechas en las que se han celebrado pruebas en pistas de las
--    estaciones de esquí administradas por la “Federación de Deportes de 
--    Invierno del Principado de Asturias”.

select distinct celebrar.fecha
from celebrar join administrar on celebrar.estacion = administrar.estacion
	join federaciones on administrar.federacion = federaciones.numero
where federaciones.nombre = 'Federación de Deportes de Invierno del Principado de Asturias';

-- 4. Nombre y nivel de los esquiadores de la federación número 1001, ordenados
--    por nivel de mayor a menor y dentro de los que tienen el mismo nivel ordenados
--    por edad de menor a mayor.

select nombre, nivel
from esquiadores
where federacion = 1001
order by nivel desc, fechaNac desc;

-- 5. Nombre y número de pistas de cada estación que tenga más de tres pistas.

select estaciones.nombre, count(pistas.codigo) total_pistas
from estaciones
join pistas on estaciones.codigo = pistas.estacion
group by estaciones.codigo 
having total_pistas > 3;

-- 6. Obtener el total de metros esquiables en cada estación de esquí.



-- 7. Datos de los esquiadores de la “Federación de Deportes de Invierno del
--    Principado de Asturias” que no han participado en pruebas individuales.

select esquiadores.*
from esquiadores join federaciones on esquiadores.federacion = federaciones.numero
where federaciones.nombre = 'Federación de Deportes de Invierno del Principado de Asturias'
	and dni not in (
		select distinct dni
        from pindividual
);

select esquiadores.*
from esquiadores join federaciones on esquiadores.federacion = federaciones.numero
     left join pindividual on pindividual.dni = esquiadores.dni
where federaciones.nombre = 'Federación de Deportes de Invierno del Principado de Asturias'
	and prueba is null;


-- 8. Nombre de las estaciones en las que solo se hayan celebrado pruebas
--    individuales o en las que solo se han celebrado pruebas por equipos.



-- 9. DNI y nombre de los esquiadores que, habiendo participado en más de 10
--    individuales, nunca han participado en una prueba de equipo.

select nombre, esquiadores.dni
from esquiadores join pindividual on esquiadores.dni = pindividual.dni
where esquiadores.dni not in (
	select distinct dni
	from formar
)
group by dni
having count(prueba) > 10;


-- 10. Número de estaciones en las que el número de pruebas celebradas es inferior
--     a la media de pruebas realizadas por estación.

select count(*)
from (
	select estacion
		from celebrar
		group by estacion
		having count(prueba) > (
			select avg(total) media
			from (
				select count(prueba) total
				from celebrar
				group by estacion
			) s1
		)
) s2;

