-- 1. Nombre de cada departamento y nombre de su director.



-- 2. Nombre de los hijos de los ingenieros y representantes, su edad y nombre del
--    departamento en el que trabaja su progenitor, ordenados en primer lugar por
--    departamento, en segundo lugar, por edad de mayor a menor y en tercer lugar
--    por el nombre del hijo.		

select *
from hijos join ingenieros on empleado = nssIngeniero
     join representantes on empleado = nssRepresentante;

select *
from (     
		select nombre, fecha, departamento
		from hijos join ingenieros on empleado = nssIngeniero
		union
		select nombre, fecha, departamento
		from hijos join representantes on empleado = nssRepresentante
	) sub
order by departamento, fecha desc, nombre;   

-- 3. Nombre y departamento de los ingenieros a cuyos hijos les han concedido becas
--    por un importe superior a 500€.

select distinct nombre, ingenieros.departamento
from becar join empleados on empleado = nss
	 join ingenieros on nss = nssIngeniero
where importe > 500;

select nombre, departamento
from ingenieros join empleados on nssIngeniero = nss
where nss in (
	select distinct empleado
    from becar
    where importe > 500
);

	
-- 4. Número de becas de más de 500€ concedidas por cada departamento a hijos de
--    ingenieros.

select becar.departamento, count(*)
from becar join ingenieros on empleado = nssIngeniero
where importe > 500 
group by becar.departamento;

select departamento, count(*)
from becar
where importe > 500 and empleado in (select nssIngeniero from ingenieros)
group by departamento;


-- 5. Nombre y salario de los representantes que trabajan en el departamento
--    dirigido por el empleado con nss=33012012797.



-- 6. Nombre de departamento y número de empleados de los departamentos en los que
--    trabajan más de 10 empleados.

select departamento, count(nss) 'número de empleados'
from (
	select nssRepresentante nss, departamento
	from representantes
	union
	select nssIngeniero nss, departamento
	from ingenieros
) sub
group by departamento;

-- 7. Número de empleados con hijos.



-- 8. Código de proyecto y fecha de comienzo de aquellos proyectos controlados por
--    departamentos que han concedido becas en el año 2011.



-- 9. Nombre del empleado o empleados que dirigen los departamentos que controlan
--    proyectos en los que está involucrado el ingeniero con nss=33210210977.



-- 10. Salario medio de los empleados de cada departamento.



-- 11. Listado de empleados en el que se incluya la función que desempeñan.



-- 12. Número de becas concedidas por cada departamento junto con el nombre del
--     empleado que lo dirige.



-- 13. Número de departamentos dirigidos por empleados que no tienen hijos.


-- 14. Nombre de cada departamento y cantidad de proyectos que controla en los
--     que están involucrados menos de cuatro ingenieros.



-- 15. Número de becas concedidas por los departamentos en los que trabajan
--     aquellos ingenieros que también son representantes.



-- 16. NSS y nombre de los directores que dirigen departamentos que hayan concedido
--     becas a alguno de sus hijos.



-- 17. Cantidad de ingenieros involucrados en proyectos controlados por
--     departamentos distintos a aquel en el que trabajan.



-- 18. Sueldo máximo de los empleados que no dirigen un departamento y que tienen
--     hijos a los que no se les ha concedido ninguna beca.



-- 19. Número de empleados de cada departamento que no están involucrados en ningún
--     proyecto.



