-- 1. Nombre y teléfono de los habitantes de Luarca.

	select nombre, teléfono 
	from habitantes join vivienda on código_vivienda = código
	where localidad = 'Luarca';


-- 2. Nombre y teléfono de los habitantes del municipio de Valdés.

	select habitantes.nombre, teléfono
	from habitantes join vivienda on código_vivienda = vivienda.código
		 join municipios on código_municipio = municipios.código
	where municipios.nombre = 'Valdés';
    

-- 3. Dirección y metros cuadrados de las viviendas del municipio de Navia.

	select dirección, cp, localidad, metros
	from vivienda, municipios
	where código_municipio = municipios.código and nombre = 'Navia';

-- 4. Nombre y teléfono de aquellas personas que poseen una vivienda en Navia.

	select distinct nombre, teléfono
	from habitantes, vivienda, poseer
	where código = poseer.código_vivienda && 
		dni_habitante = dni &&
		localidad = 'Navia';
    
	select distinct h.nombre, h.teléfono
	from habitantes h, vivienda v, poseer p
	where v.código = p.código_vivienda && 
		p.dni_habitante = h.dni &&
		v.localidad = 'Navia';  
    
	select distinct habitantes.nombre, habitantes.teléfono
	from habitantes, vivienda, poseer
	where vivienda.código = poseer.código_vivienda && 
		poseer.dni_habitante = habitantes.dni &&
		vivienda.localidad = 'Navia';
    
-- 5. De todas las viviendas del municipio de Avilés, su dirección,
--    localidad y nombre del propietario.    

-- 6. Nombre, dirección y teléfono de todos los cabeza de familia
--    empadronados en el municipio de Tineo.

-- 7. Número total de cabezas de familia empadronados en el
--    municipio de Proaza.

	select 	
		count(distinct dni_cabeza_familia)	
	from 
		depender
			join 
		habitantes on dni_cabeza_familia = dni
			join 
		vivienda on código_vivienda = código
			join
		municipios on código_municipio = municipios. código
	where 	
		municipios.nombre = 'Proaza';


-- 8. Número total de municipios en cada provincia junto con el nombre
--    de la misma.

select count(municipios.código) 'total de municipios', municipios.provincia 'provincia'
from municipios
group by municipios.provincia;


-- 9. Cantidad total de personas a cargo de cada cabeza de familia de las
--    localidades de Asturias cuyo nombre empieza o termina por la letra ‘s’.

select count(depender.dni_dependiente) 'personas dependientes',
	habitantes.nombre 'cabeza de familia'
from depender join habitantes on depender.dni_cabeza_familia = habitantes.dni
	join vivienda on habitantes.código_vivienda = vivienda.código
    join municipios on vivienda.código_municipio = municipios.código
where municipios.provincia = 'Asturias' && (vivienda.localidad like 'S%' ||
	vivienda.localidad like '%s')
group by habitantes.dni, habitantes.nombre;


-- 10. Media de personas a cargo de un cabeza de familia en cada
--     municipio de la provincia de Asturias.

select avg(num_dep), sub.nombre
from (select count(dni_dependiente) num_dep, municipios.código, municipios.nombre
	  from depender join habitantes on dni_cabeza_familia = dni
		   join vivienda on código_vivienda = vivienda.código
           join municipios on código_municipio = municipios.código
      where provincia = 'Asturias'
      group by dni_cabeza_familia, municipios.código, municipios.nombre) sub
group by código, nombre;


-- 11. Tamaño medio en metros cuadrados de las viviendas de cada
--     municipio de la provincia de Asturias.

	select nombre, avg(metros) 'promedio metros cuadrados'
	from vivienda join municipios on código_municipio = municipios.código
	where provincia = 'Asturias'
	group by código_municipio, nombre;


-- 12. Nombre, dirección y teléfono del cabeza de familia responsable
--     de la persona con el D.N.I. 11.421.124.




-- 13. Nombre y número de viviendas que posee cada cabeza de familia
--     empadronado en un municipio de Asturias.



















