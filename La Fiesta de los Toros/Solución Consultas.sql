-- 1. Lista de corridas celebradas entre los años 2007 y 2009 en la que figuren el año,
--    la feria, el orden, la plaza y la localidad, en orden descendente por año, dentro
--    de cada año en orden ascendente por feria y dentro de cada feria en orden ascendente
--    por el atributo orden.

select año, feria, orden, plaza, localidad
from corridas join plazas on plaza = nombre
where año between 2007 and 2009
order by año desc, feria, orden;

-- 2. Nombre de las ferias que han celebrado alguna corrida en la Plaza de la Malagueta.

select distinct feria
from corridas
where plaza = 'Plaza de la Malagueta';

-- 3. Nombre y localidad de las ganaderías que han proporcionado toros para las corridas
--    celebradas en la Feria de Linares.

select nombre, localidad
from ganaderías join participar on código = ganadería
     join corridas on corrida = id
where feria = 'Feria de Linares';



-- 4. De las corridas celebradas antes del año 2005 en las que hayan participado toros de la
--    ganadería Castillo de Azuel, mostrar el año de celebración, el nombre de la feria, y el
--    nombre, dirección y localidad de la plaza donde se han celebrado.



-- 5. Nombre de las plazas y número de corridas celebradas desde el año 2003 de aquellas plazas
--    en las que se hayan celebrado más de tres corridas desde ese año.

select plaza, count(id) total
from corridas
where año >= 2003
group by plaza
having total > 3;

-- 6. Nombre de las plazas en las que se han celebrado corridas en el año 2007 y cantidad total
--    de toreros distintos que han actuado en cada plaza.

select plaza, count(distinct torero) `número de toreros`
from corridas join actuar on id = corrida
where año = 2007
group by plaza;


-- 7. Apodo del torero y nombre de su apoderado para todos aquellos toreros que hayan obtenido
--    más de 50 premios en las corridas en las que han actuado durante el año 2009.

select apodo, apoderados.nombre, sum(orejas + rabos + salidas) premios
from corridas join actuar on id = corrida
     join toreros on torero = toreros.dni
     join apoderados on apoderado = apoderados.dni
where año = 2009
group by toreros.dni
having premios > 50;

-- 8. Nombre y apodo de cada torero junto con el número de corridas en las que ha actuado en los
--    últimos 10 años.

select toreros.nombre, apodo, count(corrida)
from corridas join actuar on id = corrida
     join toreros on torero = dni
where year(now()) - año <= 10
group by toreros.dni;

-- 9. Nombre y apodo, además del nombre y dirección de su apoderado, de todos aquellos toreros
--    que nunca hayan toreado en la Feria de San Isidro.

select toreros.nombre torero, apodo, apoderados.nombre apoderado, dirección
from toreros join apoderados on apoderado = apoderados.dni
where toreros.dni not in (
	select distinct torero
    from corridas join actuar on id = corrida
    where feria = 'Feria de San Isidro'
);


-- 10. Nombre y dirección de aquellos apoderados que apoderan toreros que han actuado en más de
--     15 plazas.



-- 11. Nombre y apodo de todos aquellos toreros que habiendo actuado en más de 500 corridas,
--     nunca han toreado en la Plaza de las Ventas.



-- 12. Número de ganaderías distintas que han proporcionado toros para las corridas en las que
--     ha participado cada torero apadrinado por la persona cuyo D.N.I. es el 11222333.



-- 13. Año y feria de aquellas corridas celebradas en la plaza con mayor aforo.


