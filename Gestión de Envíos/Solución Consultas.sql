-- 1. Obtener todos los detalles de todos los artículos de CACERES.

select *
from ARTICULOS
where CIUDAD = 'CACERES';

-- 2. Obtener todos los valores de P# para los proveedores que abastecen el artículo T1.

select distinct `P#`
from ENVIOS
where `T#` = 'T1';


-- 3. Obtener la lista de pares de atributos (COLOR, CIUDAD) de la tabla componentes eliminando
--    los pares duplicados.

select distinct COLOR, CIUDAD
from COMPONENTES;

-- 4. Obtener de la tabla de artículos los valores de T# y CIUDAD donde el nombre de la ciudad
--    acaba en D o contiene al menos una E.

select `T#`, CIUDAD
from ARTICULOS
WHERE CIUDAD LIKE '%D' OR CIUDAD LIKE '%E%';

-- 5. Obtener los valores de P# para los proveedores que suministran para el artículo T1
--    el componente C1.

SELECT DISTINCT `P#`
FROM ENVIOS
WHERE `T#` = 'T1' AND `C#` = 'C1';


-- 6. Obtener los valores de TNOMBRE en orden alfabético para los artículos abastecidos por
--    el proveedor P1.

select distinct NOMBRE
from ARTICULOS a join ENVIOS e on a.`T#` = e.`T#`
where `P#` = 'P1'
order by NOMBRE;


-- 7. Obtener los valores de C# para los componentes suministrados para cualquier artículo de
--    MADRID.

select distinct `C#`
from ENVIOS e join ARTICULOS a on e.`T#` = a.`T#`
where CIUDAD = 'MADRID';


-- 8. Obtener todos los valores de C# de los componentes de menor peso.

SELECT `C#`
FROM COMPONENTES
WHERE PESO <= ALL (SELECT DISTINCT PESO FROM COMPONENTES);

-- 9. Obtener los valores de P# para los proveedores que suministren los artículos T1 y T2.

select distinct `P#`
from ENVIOS
where `T#` = 'T1' or `T#` = 'T2';

select distinct `P#`
from ENVIOS
where `T#` in ('T1', 'T2');

-- 10. Obtener los valores de P# para los proveedores que suministran para un artículo de
--     SEVILLA o MADRID un componente ROJO.

select distinct `P#`
from ENVIOS e join ARTICULOS a on e.`T#` = a.`T#`
     join COMPONENTES c on e.`C#` = c.`C#`
where (a.CIUDAD = 'SEVILLA' or a.CIUDAD = 'MADRID') and COLOR = 'ROJO';

select distinct `P#`
from ENVIOS e join ARTICULOS a on e.`T#` = a.`T#`
     join COMPONENTES c on e.`C#` = c.`C#`
where a.CIUDAD in ('SEVILLA', 'MADRID') and COLOR = 'ROJO';


-- 11. Obtener, mediante subconsultas, los valores de C# para los componentes suministrados para
--     algún artículo de SEVILLA por un proveedor de SEVILLA.

select distinct `C#`
from ENVIOS
where `T#` in (select `T#` from ARTICULOS where CIUDAD = 'SEVILLA') and
      `P#` in (select `P#` from PROVEEDORES where CIUDAD = 'SEVILLA');


-- 12. Obtener los valores de T# para los artículos que usan al menos un componente que se puede obtener con el proveedor P1.




-- 13. Obtener todas las ternas (CIUDAD, C#, CIUDAD) tales que un proveedor de la primera ciudad suministre el componente especificado para un artículo montado en la segunda ciudad.
-- 14. Repetir el ejercicio anterior pero sin recuperar las ternas en los que los dos valores de ciudad sean los mismos.
-- 15. Obtener el número de suministros, el de artículos distintos suministrados y la cantidad total de artículos suministrados por el proveedor P2.
-- 16. Para cada artículo y componente suministrado obtener los valores de C#, T# y la cantidad total correspondiente.
-- 17. Obtener los valores de T# de los artículos abastecidos al menos por un proveedor que no viva en MADRID y que no esté en la misma ciudad en la que se monta el artículo.
-- 18. Obtener los valores de P# para los proveedores que suministran al menos un componente suministrado al menos por un proveedor que suministra al menos un componente ROJO.
-- 19. Obtener los identificadores de artículos, T#, para los que se ha suministrado algún componente del que se haya suministrado una media superior a 320 artículos.
-- 20. Seleccionar los identificadores de proveedores que hayan realizado algún envío con Cantidad mayor que la media de los envíos realizados para el componente a que corresponda dicho envío.
-- 21. Seleccionar los identificadores de componentes suministrados para el artículo 'T2' por el proveedor 'P2'.
-- 22. Seleccionar todos los datos de los envíos realizados de componentes cuyo color no sea
-- 'ROJO'.
-- 23. Seleccionar los identificadores de componentes que se suministren para los artículos 'T1' y 'T2'.
-- 24. Seleccionar el identificador de proveedor y el número de envíos de componentes de color
-- 'ROJO' llevados a cabo por cada proveedor.
-- 25. Seleccionar los colores de componentes suministrados por el proveedor 'P1'.
-- 26. Seleccionar los datos de envío y nombre de ciudad de aquellos envíos que cumplan que el artículo, proveedor y componente son de la misma ciudad.
-- 27. Seleccionar los nombres de los componentes que son suministrados en una cantidad total superior a 500.
-- 28. Seleccionar los identificadores de proveedores que residan en Sevilla y no suministren más de dos artículos distintos.
-- 29. Seleccionar los identificadores de artículos para los cuales todos sus componentes se fabrican en una misma ciudad.
-- 30. Seleccionar los identificadores de artículos para los que se provean envíos de todos los componentes existentes en la base de datos.
-- 31. Seleccionar los códigos de proveedor y artículo que suministran al menos dos componentes de color 'ROJO'.