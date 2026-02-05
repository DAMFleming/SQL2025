-- 1. Nombre de cada departamento y nombre de su director.



-- 2. Nombre de los hijos de los ingenieros y representantes, su edad y nombre del
--    departamento en el que trabaja su progenitor, ordenados en primer lugar por
--    departamento, en segundo lugar, por edad de mayor a menor y en tercer lugar
--    por el nombre del hijo.		
insert into representantes values (1, 'D2');

select *
from hijos join ingenieros on empleado = nssIngeniero;

select *
from hijos join representantes on empleado = nssRepresentante;
	
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


-- 5. Nombre y salario de los representantes que trabajan en el
--    departamento dirigido por el empleado con nss=33012012797.

SELECT e.nombre, e.salario
FROM empleados e
JOIN representantes r ON e.nss = r.nssRepresentante
JOIN departamentos d ON r.departamento = d.nombre
WHERE d.director = 5;

SELECT nombre, salario
FROM empleados
WHERE nss IN (
    SELECT nssRepresentante
    FROM representantes
    WHERE departamento = (
        SELECT nombre
        FROM departamentos
        WHERE director = 5
    )
);

SELECT nombre, salario
FROM empleados join representantes on nss = nssRepresentante
WHERE departamento = (
        SELECT nombre
        FROM departamentos
        WHERE director = 5
);


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



-- 8. Código de proyecto y fecha de comienzo de aquellos proyectos
--    controlados por departamentos que han concedido becas en el
--    año 2011.

select distinct código, fechaComienzo 
from proyectos join controlar on código = proyecto
     join becar on becar.departamento = controlar.departamento
where year(becar.fecha) = 2011;

select código, fechaComienzo 
from proyectos join controlar on código = proyecto
where departamento in (
	select distinct departamento
    from becar
    where year(fecha) = 2011
);
    

-- 9. Nombre del empleado o empleados que dirigen los departamentos que
--    controlan proyectos en los que está involucrado el ingeniero con
--    nss=33210210977.

select distinct empleados.nombre
from empleados join departamentos on director = nss
	join controlar on departamentos.nombre = controlar.departamento
    join involucrar on controlar.proyecto = involucrar.proyecto
where ingeniero = 33210210977;



-- 10. Salario medio de los empleados de cada departamento.
select departamento, avg(salario)
from (
	select departamento, salario
	from empleados join representantes on nss = nssRepresentante
	union
	select departamento, salario
	from empleados join ingenieros on nss = nssIngeniero
	union
	select departamentos.nombre departamento, salario
	from empleados join departamentos on nss = director) sub
group by departamento;

-- 11. Listado de empleados en el que se incluya la función que desempeñan.

select empleados.*, "representante"
from empleados join representantes on nss = nssRepresentante
where nss not in (select nssIngeniero from ingenieros)
union
select empleados.*, "ingeniero"
from empleados join ingenieros on nss = nssIngeniero
where nss not in (select nssRepresentante from representantes)
union
select *, "ingenieros/representantes"
from empleados where nss in (select nssIngeniero from ingenieros) and
				    nss in (select nssRepresentante from representantes)
union
select empleados.*, "director"
from empleados join directores on nss = nssDirector;


-- 12. Número de becas concedidas por cada departamento junto con el nombre del
--     empleado que lo dirige.
select empleados.nombre director, becar.departamento, count(*) `número de becas`
from becar join departamentos on departamento = nombre
join empleados on director = nss
group by departamento;


-- 13. Número de departamentos dirigidos por empleados que no tienen hijos.

select count(departamentos.nombre)
from departamentos
where director not in (select distinct empleado from hijos);


-- 14. Nombre de cada departamento y cantidad de proyectos que controla en los
--     que están involucrados menos de cuatro ingenieros.

select departamento, count(código) `número de proyectos`
from proyectos join controlar on código = proyecto
where código not in (
	-- códigos de los proyectos en los que están involucrados más de tres ingenieros
    select proyecto
    from involucrar
    group by proyecto
    having count(ingeniero) > 3
)
group by departamento;


-- 15. Número de becas concedidas por los departamentos en los que trabajan
--     aquellos ingenieros que también son representantes.

select departamento, count(importe)
from becar
where departamento in (
	select distinct i.departamento
    from ingenieros i join representantes r on i.nssIngeniero = r.nssRepresentante
)
group by departamento;

select departamento, count(importe)
from becar
where departamento in (
	select distinct departamento
    from ingenieros
    where nssingeniero in (
		select nssRepresentante
        from representantes
	)
)
group by departamento;



-- 16. NSS y nombre de los directores que dirigen departamentos que hayan concedido
--     becas a alguno de sus hijos.
SELECT DISTINCT
	nss,
    empleados.nombre
FROM
	empleados
		JOIN
	departamentos ON nss = director
		JOIN
	becar ON empleado = director;


-- 17. Cantidad de ingenieros involucrados en proyectos controlados por
--     departamentos distintos a aquel en el que trabajan.



-- 18. Sueldo máximo de los empleados que no dirigen un departamento y que tienen
--     hijos a los que no se les ha concedido ninguna beca.



-- 19. Número de empleados de cada departamento que no están involucrados en ningún
--     proyecto.



