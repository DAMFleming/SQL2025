--  1. Mostrar un listado de medicamentos suministrados de tipo 'comprimido' en el que los datos del medicamento
--     vayan acompañados del nombre del laboratorio que los suministra. El listado se mostrará ordenado por nombre de
--     laboratorio, y en los casos en los que se muestren medicamentos de varios laboratorios, estos estarán ordenados
--     por nombre de medicamento.

		select m.*, l.nombre laboratorio
		FROM medicamentos m join suministrados s on m.`código` = s.`códigoMedicamento`
							join laboratorios l on s.`códigoLaboratorio` = l.`código`
		where lower(m.tipo) = 'comprimido'
		order by l.nombre, m.nombre;
		
		

--  2. Mostrar las líneas de detalle de todas las ventas realizadas al cliente con DNI 11111111. En cada línea de detalle se
--     ha de mostrar el importe total en lugar del precio unitario. Ordenar descendentemente el listado por número de venta.

		select a.`códigoMedicamento` medicamento, a.`númeroVenta` venta, a.cantidad * a.precio importe
		from apuntar a join ventas v on a.`númeroVenta` = v.`número`
		where v.dniCliente = 11111111
		order by v.`número` desc;

		

--  3. Mostrar un listado con los números de venta correspondientes a aquellas ventas realizadas al cliente con DNI
--     11111111 en las que el número de artículos distintos que se detallan en ellas es superior a 3.

		select v.`número`
		from ventas v join apuntar a on v.`número` = a.`númeroVenta`
		where v.dniCliente = 11111111
		group by v.`número`
		having count(a.`códigoMedicamento`) > 3;

		

--  4. A partir de la cantidad de medicamentos que intervienen en cada venta, obtener la media anual de dicha cantidad.
		
		select year(v.fecha) `año`, avg(cantidad) media
		from ventas v join (
		    select `númeroVenta`, sum(cantidad) as cantidad
		    from apuntar
		    group by númeroVenta
		) sub on v.`número`= sub.`númeroVenta`
		group by year(v.fecha);
		
		select `año`, avg(total) media
		from (
			select year(v.fecha) `año`, count(a.`códigoMedicamento`) total
			from ventas v join apuntar a on v.`número` = a. `númeroVenta`
			group by v.`número`, v.fecha) sub
		group by `año`;
		
		

--  5. Obtener un listado sin valores repetidos de todas las unidades de medida que se emplean en la elaboración de
--     medicamentos.

		select distinct unidadMedida
		from elaborar e;
		

		
--  6. Nombre y dirección de aquellos laboratorios para los que existen ventas en las que se venden más de tres
--     medicamentos suministrados por ellos mismos.

		select nombre, `dirección`
		from laboratorios l
		where exists (
			select *
			from apuntar a join suministrados s on a.`códigoMedicamento` = s.`códigoMedicamento`
			where s.`códigoLaboratorio` = l.`código`
			group by a.`númeroVenta`
			having count(a.`códigoMedicamento`) > 3
		);
		

		
--  7. Número y fecha de las ventas en las que todos los medicamentos vendidos son elaborados o en las que todos los
--     medicamentos vendidos son suministrados. Por cada venta se mostrará el nombre del cliente si dicha venta fue
--     aplazada o el literal ‘pago al contado’ en caso contrario. El resultado también incluirá una columna en la que se
--     muestre el valor ‘elaborados’ o el valor ‘suministrados’ según corresponda.
--     (Las ventas aplazadas son aquellas en las que el atributo dniCliente no es nulo, el resto son ventas al contado)

		select v.`número`, v.fecha, 'ELABORADOS' tipo, 'PAGO AL CONTADO' cliente
		from ventas v join apuntar a on v.`número` = a.`númeroVenta`
		where v.dnicliente is null and v.`número` not in (
			select distinct aa.`númeroVenta`
		    from apuntar aa join suministrados s on aa.`códigoMedicamento` = s.`códigoMedicamento`)
		union
		select v.`número`, v.fecha, 'ELABORADOS' tipo, c.nombre cliente
		from clientes c join ventas v on c.dni = v.dniCliente
						join apuntar a on v.`número` = a.`númeroVenta`
		where v.`número` not in (
			select distinct aa.`númeroVenta`
		    from apuntar aa join suministrados s on aa.`códigoMedicamento` = s.`códigoMedicamento`)
		union
		select v.`número`, v.fecha, 'SUMINISTRADOS' tipo, 'PAGO AL CONTADO' cliente
		from ventas v join apuntar a on v.`número` = a.`númeroVenta`
		where v.dniCliente is null and  v.`número` not in (
			select distinct aa.`númeroVenta`
		    from apuntar aa join elaborar e on aa.`códigoMedicamento` = e.`códigoMedicamento`)
		union
		select v.`número`, v.fecha, 'SUMINISTRADOS' tipo, c.nombre cliente
		from clientes c join ventas v on c.dni = v.dniCliente
						join apuntar a on v.`número` = a.`númeroVenta`
		where v.`número` not in (
			select distinct aa.`númeroVenta`
		    from apuntar aa join elaborar e on aa.`códigoMedicamento` = e.`códigoMedicamento`);
		

		
--  8. Para cada año, indicar la cantidad de ventas en las que intervienen medicamentos suministrados por más de tres
--     laboratorios distintos.

		select year(v.fecha) `año`, count(v.`número`) ventas
        from ventas v join apuntar a on v.`número` = a.`númeroVenta`
                      join suministrados s on a.`códigoMedicamento` = s.`códigoMedicamento`
		group by `año`, v.`número`
        having count(distinct s.`códigoLaboratorio`) > 3;
		
		Select year(v.fecha) `año`, COUNT(*) ventas
		from ventas v join (
		    Select a.`númeroVenta`
		    from apuntar a join suministrados s on a.`códigoMedicamento` = s.`códigoMedicamento`
		    group by a.`númeroVenta`
		    having COUNT(distinct s.`códigoLaboratorio`) > 3
		) sub on v.`número` = sub.`númeroVenta`
		group by `año`;

		select `año`, count(*) ventas
		from (
		  select v.`número`, year(v.fecha) `año`
		  from ventas v join apuntar a on v.`número` = a.`númeroVenta`
		  				join suministrados s on a.`códigoMedicamento` = s.`códigoMedicamento`
		  group by v.`número`, `año`
		  having count(distinct s.`códigoLaboratorio`) > 3
		) sub
		group by `año`;
				

--  9. Código y nombre de todos aquellos medicamentos elaborados para los cuales el número de ventas al contado no
--     sea inferior al número de ventas al contado de cualquier medicamento suministrado.
--     (El número de ventas de un medicamento se calculará como el número total de unidades que se han vendido de
--     ese medicamento)

		select m.`código`, m.nombre
		from elaborar e join medicamentos m on e.`códigoMedicamento` = m.`código`
						join apuntar a on m.`código` = a.`códigoMedicamento`
						join ventas v on a.`númeroVenta` = v.`número`
		where v.dniCliente is null
		group by m.`código`, m.nombre
		having sum(a.cantidad) >= all (
			select sum(cantidad)
			from apuntar aa join suministrados s on aa.`códigoMedicamento` = s.`códigoMedicamento`
		    				join ventas vv on aa.`númeroVenta` = vv.`número`
			where vv.dniCliente is null
			group by aa.`códigoMedicamento`
		);
		


-- 10. Listado de todas las ventas del año anterior al de la fecha actual, que se ha de obtener en la propia consulta, en el
--     que figure el número de venta, el número de medicamentos vendidos en dicha venta, el importe total de la venta,
--     el nombre del cliente y su teléfono. El resultado se ha de ordenar en orden descendente por el importe total de
--     venta.

		select v.`número` Venta, sum(a.cantidad) `Cantidad de medicamentos`, sum(a.cantidad * a.precio) `Importe total`,
			   c.nombre Cliente, c.`teléfono` `Teléfono`
		from clientes c join ventas v on c.dni = v.dniCliente
						join apuntar a on v.`número` = a.`númeroVenta`
		where year(v.fecha) = year(sysdate()) - 1
		group by v.`número`, c.nombre, c.`teléfono`
		order by "Importe total" desc;
		
		
		
