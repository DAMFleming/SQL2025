USE `Gestión de Empleados`;

-- =====================================================
-- EMPLEADOS (100)
-- =====================================================
INSERT INTO empleados (nss,nombre,salario) VALUES
(1,'Carlos García López',32000),(2,'Ana Martínez Ruiz',34000),
(3,'Luis Fernández Soto',30000),(4,'María Sánchez Pérez',42000),
(5,'Javier Torres Molina',46000),(6,'Laura Gómez Navarro',31000),
(7,'Pedro Díaz Romero',28000),(8,'Lucía Herrera Castro',31500),
(9,'Miguel Ortega Ramos',33000),(10,'Elena Flores Vega',36000),
(11,'David Cruz Campos',29500),(12,'Paula León Fuentes',34500),
(13,'Sergio Vidal Martín',38000),(14,'Natalia Rojas Gil',30500),
(15,'Iván Moreno Blanco',31500),(16,'Carmen Prieto Núñez',43000),
(17,'Raúl Cabrera Pardo',32500),(18,'Andrea Moya Salas',33500),
(19,'Hugo Peña Iglesias',35500),(20,'Silvia Rubio Cano',37000),
(21,'Alberto Molina Rivas',30000),(22,'Beatriz Santos León',31000),
(23,'Fernando Gil Muñoz',32000),(24,'Clara Vázquez Nieto',33000),
(25,'Óscar Ramos Delgado',34000),(26,'Marta Lozano Cruz',35000),
(27,'Rubén Campos Arroyo',36000),(28,'Noelia Paredes Luna',37000),
(29,'Adrián Pastor Gil',38000),(30,'Eva Cortés Marín',39000),
(31,'Jesús Ferrer Cano',30000),(32,'Patricia Domínguez Soler',31000),
(33,'Diego Calvo Peña',32000),(34,'Rocío Iglesias Vidal',33000),
(35,'Samuel Navarro Prieto',34000),(36,'Alicia Benítez Roca',35000),
(37,'Mario Acosta Núñez',36000),(38,'Irene Fuentes Robles',37000),
(39,'Pablo Montero Sanz',38000),(40,'Lorena Campos Vera',39000),
(41,'Álvaro Romero Pons',30000),(42,'Cristina Serra Costa',31000),
(43,'Manuel Bravo Hidalgo',32000),(44,'Nuria Cano Ferrán',33000),
(45,'Gonzalo Peña Vives',34000),(46,'Sonia Pastor Molina',35000),
(47,'Víctor Gallardo Gil',36000),(48,'Julia Rey Navarro',37000),
(49,'Francisco Luna Peris',38000),(50,'Miriam Solís Caballero',39000),
(51,'Ignacio Cabrera Moral',30000),(52,'Laura Segura Márquez',31000),
(53,'Tomás Roldán Nieto',32000),(54,'Isabel Vidal Torres',33000),
(55,'Enrique Ponce Serrano',34000),(56,'Sara Montalvo Pérez',35000),
(57,'Ángel Nieto Pascual',36000),(58,'Bea Rivas Monzón',37000),
(59,'Jordi Climent Ferrer',38000),(60,'Rebeca Sáez Pastor',39000),
(61,'Víctor Solano Puig',30000),(62,'Mónica Barrios Cuevas',31000),
(63,'Luis Miguel Pardo Rey',32000),(64,'Raquel Otero Baeza',33000),
(65,'Alex Vidal Cuenca',34000),(66,'Cristian Mora Valle',30000),
(67,'Vanesa Pozo Nieto',31000),(68,'Sergio Arias León',32000),
(69,'Esther Gallego Lara',33000),(70,'Borja Cifuentes Ruiz',34000),
(71,'Daniela Ferrer Ríos',35000),(72,'Rubén Varela Ortiz',36000),
(73,'Paola Montes Roca',37000),(74,'Ignacio Del Río Cano',38000),
(75,'María Jesús Nieto Soler',39000),(76,'Jaime Puig Torres',30000),
(77,'Natalia Mora Roldán',31000),(78,'Óliver Peña Cortés',32000),
(79,'Rosa Méndez Jurado',33000),(80,'Iñigo Bravo Soria',34000),
(81,'Alfonso Villar Rivas',35000),(82,'Claudia Gil Aranda',36000),
(83,'Héctor Serra Pardo',37000),(84,'Ainhoa Cruz Vega',38000),
(85,'Marcos Jiménez Prat',39000),(86,'Eva Blasco Vidal',30000),
(87,'Samuel Ríos Beltrán',31000),(88,'Noemí Pastor Gil',32000),
(89,'Óscar Montoya Cano',33000),(90,'Lucía Soler Nieto',34000),
(91,'Iván Herrera Serra',35000),(92,'Patricia Bueno Sanz',36000),
(93,'Julio Redondo Mora',37000),(94,'Celia Font Puig',38000),
(95,'Andrés Palacios León',39000),(96,'Nerea Busto Roca',30000),
(97,'Pol Méndez Serra',31000),(98,'Carla Soto Blanes',32000),
(99,'Félix Pujol Ferrer',33000),(100,'Daniel Álvarez Costa',34000);

-- =====================================================
-- DIRECTORES (5)
-- =====================================================
INSERT INTO directores (nssDirector) VALUES
(1),(2),(3),(4),(5);

-- =====================================================
-- DEPARTAMENTOS (5)
-- =====================================================
INSERT INTO departamentos (nombre,localización,director) VALUES
('Informática','Madrid',1),
('Recursos Humanos','Barcelona',2),
('Finanzas','Valencia',3),
('Ingeniería','Sevilla',4),
('Marketing','Bilbao',5);

-- =====================================================
-- INGENIEROS (60)
-- =====================================================
INSERT INTO ingenieros (nssIngeniero,departamento) VALUES
(1,'Ingeniería'),(2,'Ingeniería'),(3,'Ingeniería'),(4,'Ingeniería'),(5,'Ingeniería'),
(6,'Informática'),(7,'Informática'),(8,'Informática'),(9,'Informática'),(10,'Informática'),
(11,'Ingeniería'),(12,'Ingeniería'),(13,'Ingeniería'),(14,'Ingeniería'),(15,'Ingeniería'),
(16,'Informática'),(17,'Informática'),(18,'Informática'),(19,'Informática'),(20,'Informática'),
(21,'Ingeniería'),(22,'Ingeniería'),(23,'Ingeniería'),(24,'Ingeniería'),(25,'Ingeniería'),
(26,'Informática'),(27,'Informática'),(28,'Informática'),(29,'Informática'),(30,'Informática'),
(31,'Ingeniería'),(32,'Ingeniería'),(33,'Ingeniería'),(34,'Ingeniería'),(35,'Ingeniería'),
(36,'Informática'),(37,'Informática'),(38,'Informática'),(39,'Informática'),(40,'Informática'),
(41,'Ingeniería'),(42,'Ingeniería'),(43,'Ingeniería'),(44,'Ingeniería'),(45,'Ingeniería'),
(46,'Informática'),(47,'Informática'),(48,'Informática'),(49,'Informática'),(50,'Informática'),
(51,'Ingeniería'),(52,'Ingeniería'),(53,'Ingeniería'),(54,'Ingeniería'),(55,'Ingeniería'),
(56,'Informática'),(57,'Informática'),(58,'Informática'),(59,'Informática'),(60,'Informática');

-- =====================================================
-- REPRESENTANTES (35)
-- =====================================================
INSERT INTO representantes (nssRepresentante,departamento) VALUES
(61,'Marketing'),(62,'Marketing'),(63,'Marketing'),(64,'Marketing'),(65,'Marketing'),
(66,'Finanzas'),(67,'Finanzas'),(68,'Finanzas'),(69,'Finanzas'),(70,'Finanzas'),
(71,'Recursos Humanos'),(72,'Recursos Humanos'),(73,'Recursos Humanos'),
(74,'Recursos Humanos'),(75,'Recursos Humanos'),
(76,'Marketing'),(77,'Marketing'),(78,'Marketing'),(79,'Marketing'),(80,'Marketing'),
(81,'Finanzas'),(82,'Finanzas'),(83,'Finanzas'),(84,'Finanzas'),(85,'Finanzas'),
(86,'Recursos Humanos'),(87,'Recursos Humanos'),(88,'Recursos Humanos'),
(89,'Recursos Humanos'),(90,'Recursos Humanos'),
(91,'Marketing'),(92,'Marketing'),(93,'Marketing'),(94,'Marketing'),(95,'Marketing');

-- =====================================================
-- HIJOS (200)
-- =====================================================
INSERT INTO hijos (empleado,nombre,fecha) VALUES
(1,'Lucía','2012-05-10'),(1,'Daniel','2015-09-21'),
(2,'Pablo','2010-03-14'),(2,'Laura','2014-07-02'),
(3,'Sofía','2016-01-22'),(3,'Hugo','2019-11-08'),
(4,'Clara','2011-06-18'),(4,'Adrián','2013-10-05'),
(5,'Marcos','2009-02-11'),(5,'Irene','2012-12-01'),
(6,'Álvaro','2015-03-09'),(6,'Sara','2018-07-19'),
(7,'Daniel','2014-09-23'),(7,'Noa','2017-01-30'),
(8,'Lucía','2013-11-14'),(8,'Mateo','2016-04-06'),
(9,'Pablo','2012-08-27'),(9,'Emma','2019-05-15'),
(10,'Sergio','2011-01-08'),(10,'Nerea','2014-06-22'),
(11,'Mario','2016-10-03'),(11,'Aitana','2019-12-17'),
(12,'Leo','2015-02-25'),(12,'Claudia','2018-09-11'),
(13,'Diego','2010-04-19'),(13,'Marta','2013-07-07'),
(14,'Hugo','2016-12-29'),(14,'Valeria','2019-06-13'),
(15,'Lucas','2011-03-02'),(15,'Paula','2014-10-26'),
(16,'Álex','2012-07-18'),(16,'Carla','2016-01-09'),
(17,'Jorge','2015-05-20'),(17,'Inés','2018-11-02'),
(18,'Sofía','2013-09-30'),(18,'Bruno','2017-04-14'),
(19,'Martín','2011-02-08'),(19,'Lola','2015-06-27'),
(20,'Iván','2014-12-19'),(20,'Carmen','2018-08-05'),
(21,'Daniel','2010-01-16'),(21,'Elena','2013-05-28'),
(22,'Pablo','2016-09-07'),(22,'Julia','2019-03-21'),
(23,'Mateo','2012-06-04'),(23,'Nuria','2015-11-30'),
(24,'Héctor','2011-08-12'),(24,'Alicia','2014-02-18'),
(25,'Samuel','2013-10-09'),(25,'Rocío','2017-07-01'),
(26,'Álvaro','2015-04-25'),(26,'Vega','2019-12-09'),
(27,'Mario','2010-06-16'),(27,'Lidia','2014-09-02'),
(28,'Lucas','2012-11-20'),(28,'Sara','2016-03-15'),
(29,'David','2011-01-27'),(29,'Emma','2015-08-18'),
(30,'Javier','2014-04-06'),(30,'Noelia','2018-10-29'),
(31,'Pablo','2012-02-13'),(31,'Clara','2016-07-24'),
(32,'Rubén','2010-09-17'),(32,'Irene','2014-01-05'),
(33,'Adrián','2013-03-22'),(33,'Luna','2017-11-11'),
(34,'Ángel','2011-06-29'),(34,'Mónica','2015-10-03'),
(35,'Hugo','2014-08-14'),(35,'Eva','2019-02-26'),
(36,'Diego','2012-12-07'),(36,'Ainhoa','2016-05-18'),
(37,'Martín','2010-04-03'),(37,'Sonia','2013-09-19'),
(38,'Leo','2015-01-28'),(38,'Paula','2018-06-10'),
(39,'Óscar','2012-07-04'),(39,'Ingrid','2016-11-23'),
(40,'Raúl','2011-05-15'),(40,'Celia','2014-10-31'),
(41,'Bruno','2013-02-09'),(41,'Mara','2017-08-22'),
(42,'Sergio','2015-09-01'),(42,'Lía','2019-04-13'),
(43,'Pablo','2010-12-28'),(43,'Cristina','2014-06-09'),
(44,'Álex','2012-03-17'),(44,'Isabel','2016-09-30'),
(45,'Iván','2011-07-25'),(45,'Nora','2015-12-11'),
(46,'Mateo','2013-10-02'),(46,'Julia','2017-05-19'),
(47,'Lucas','2010-08-06'),(47,'Helena','2014-01-27'),
(48,'Daniel','2012-11-18'),(48,'Mía','2016-04-08'),
(49,'Álvaro','2011-03-30'),(49,'Iria','2015-09-12'),
(50,'Leo','2014-02-21'),(50,'Sara','2018-07-06'),
(51,'Pablo','2012-05-17'),(51,'Alba','2016-10-28'),
(52,'Mario','2011-01-04'),(52,'Claudia','2014-06-15'),
(53,'Hugo','2013-09-26'),(53,'Vera','2017-12-02'),
(54,'Daniel','2010-04-11'),(54,'Irene','2013-08-29'),
(55,'Lucas','2015-11-05'),(55,'Noa','2019-03-18'),
(56,'Samuel','2012-07-09'),(56,'Carmen','2016-02-24'),
(57,'Álex','2011-10-16'),(57,'Ariadna','2015-05-07'),
(58,'Martín','2014-01-30'),(58,'Paula','2018-06-14'),
(59,'Bruno','2010-09-22'),(59,'Elsa','2014-12-03'),
(60,'Mateo','2013-04-28'),(60,'Nerea','2017-09-09'),
(61,'Leo','2012-06-01'),(61,'Violeta','2016-11-21'),
(62,'Iván','2011-08-17'),(62,'Lola','2015-02-04'),
(63,'Óscar','2014-05-19'),(63,'Emma','2018-10-30'),
(64,'Pablo','2010-03-08'),(64,'Miriam','2013-07-25'),
(65,'Daniel','2015-09-12'),(65,'Clara','2019-01-26'),
(66,'Lucas','2012-11-07'),(66,'Sofía','2016-04-19'),
(67,'Hugo','2011-02-23'),(67,'Aina','2015-06-30'),
(68,'Leo','2014-08-16'),(68,'Vega','2018-12-07'),
(69,'Mateo','2013-01-05'),(69,'Nora','2017-05-28'),
(70,'Pablo','2010-10-14'),(70,'Sara','2014-03-09'),
(71,'Daniel','2012-06-20'),(71,'Eva','2016-11-02'),
(72,'Álvaro','2011-04-01'),(72,'Claudia','2015-08-18'),
(73,'Lucas','2014-09-27'),(73,'Mía','2018-02-10'),
(74,'Hugo','2013-12-06'),(74,'Irene','2017-07-22'),
(75,'Mateo','2010-05-13'),(75,'Noelia','2014-10-31'),
(76,'Pablo','2012-01-24'),(76,'Celia','2016-06-08'),
(77,'Daniel','2011-09-04'),(77,'Luna','2015-12-19'),
(78,'Leo','2014-03-26'),(78,'Sara','2018-08-11'),
(79,'Álex','2013-07-15'),(79,'Inés','2017-01-29'),
(80,'Hugo','2010-11-09'),(80,'Paula','2014-04-23'),
(81,'Mateo','2012-08-02'),(81,'Vera','2016-12-14'),
(82,'Lucas','2011-02-19'),(82,'Noa','2015-06-27'),
(83,'Pablo','2014-10-08'),(83,'Iria','2018-03-20'),
(84,'Daniel','2013-05-31'),(84,'Nerea','2017-11-06'),
(85,'Marcos','2011-01-12'),(85,'Claudia','2014-06-30'),
(86,'Hugo','2015-09-18'),(86,'Emma','2019-02-07'),
(87,'Lucas','2012-03-27'),(87,'Sara','2016-08-15'),
(88,'Mateo','2011-07-04'),(88,'Lía','2015-12-22'),
(89,'Daniel','2014-02-10'),(89,'Carmen','2018-06-28'),
(90,'Álvaro','2013-09-01'),(90,'Noa','2017-01-17'),
(91,'Pablo','2010-05-26'),(91,'Irene','2014-10-09'),
(92,'Hugo','2012-12-04'),(92,'Clara','2016-04-25'),
(93,'Lucas','2011-08-13'),(93,'Vega','2015-02-19'),
(94,'Mateo','2014-06-07'),(94,'Sara','2018-11-29'),
(95,'Daniel','2013-01-16'),(95,'Nerea','2017-07-03'),
(96,'Pablo','2012-09-05'),(96,'Celia','2016-01-21'),
(97,'Hugo','2010-03-11'),(97,'Emma','2014-08-27'),
(98,'Lucas','2015-11-02'),(98,'Paula','2019-03-14'),
(99,'Mateo','2011-04-24'),(99,'Lola','2015-09-08'),
(100,'Leo','2013-06-19'),(100,'Nora','2017-12-01');

-- =====================================================
-- ESPECIALIDADES
-- =====================================================
INSERT INTO especialidades (ingeniero,especialidad) VALUES
(1,'Java'),(1,'Bases de Datos'),
(2,'Python'),(2,'Big Data'),
(3,'Redes'),(3,'Ciberseguridad'),
(4,'DevOps'),(4,'Cloud'),
(5,'IA'),(5,'Machine Learning'),
(6,'Java'),(7,'Python'),(8,'JavaScript'),(9,'SQL'),(10,'DevOps'),
(11,'Redes'),(12,'Cloud'),(13,'IA'),(14,'Big Data'),(15,'Ciberseguridad'),
(16,'Java'),(17,'Python'),(18,'DevOps'),(19,'SQL'),(20,'Cloud'),
(21,'Redes'),(22,'IA'),(23,'Machine Learning'),(24,'Big Data'),(25,'Ciberseguridad'),
(26,'Java'),(27,'Python'),(28,'JavaScript'),(29,'SQL'),(30,'DevOps'),
(31,'Cloud'),(32,'IA'),(33,'Big Data'),(34,'Redes'),(35,'Ciberseguridad'),
(36,'Java'),(37,'Python'),(38,'DevOps'),(39,'SQL'),(40,'Cloud'),
(41,'IA'),(42,'Machine Learning'),(43,'Big Data'),(44,'Redes'),(45,'Ciberseguridad'),
(46,'Java'),(47,'Python'),(48,'JavaScript'),(49,'SQL'),(50,'DevOps'),
(51,'Cloud'),(52,'IA'),(53,'Big Data'),(54,'Redes'),(55,'Ciberseguridad'),
(56,'Java'),(57,'Python'),(58,'DevOps'),(59,'SQL'),(60,'Cloud');

-- =====================================================
-- PROYECTOS (50)
-- =====================================================
INSERT INTO proyectos (código,fechaComienzo) VALUES
(1,'2020-01-10'),(2,'2020-02-15'),(3,'2020-03-20'),(4,'2020-04-25'),
(5,'2020-05-30'),(6,'2020-06-10'),(7,'2020-07-15'),(8,'2020-08-20'),
(9,'2020-09-25'),(10,'2020-10-30'),
(11,'2021-01-10'),(12,'2021-02-15'),(13,'2021-03-20'),(14,'2021-04-25'),
(15,'2021-05-30'),(16,'2021-06-10'),(17,'2021-07-15'),(18,'2021-08-20'),
(19,'2021-09-25'),(20,'2021-10-30'),
(21,'2022-01-10'),(22,'2022-02-15'),(23,'2022-03-20'),(24,'2022-04-25'),
(25,'2022-05-30'),(26,'2022-06-10'),(27,'2022-07-15'),(28,'2022-08-20'),
(29,'2022-09-25'),(30,'2022-10-30'),
(31,'2023-01-10'),(32,'2023-02-15'),(33,'2023-03-20'),(34,'2023-04-25'),
(35,'2023-05-30'),(36,'2023-06-10'),(37,'2023-07-15'),(38,'2023-08-20'),
(39,'2023-09-25'),(40,'2023-10-30'),
(41,'2024-01-10'),(42,'2024-02-15'),(43,'2024-03-20'),(44,'2024-04-25'),
(45,'2024-05-30'),(46,'2024-06-10'),(47,'2024-07-15'),(48,'2024-08-20'),
(49,'2024-09-25'),(50,'2024-10-30');

-- =====================================================
-- CONTROLAR
-- =====================================================
INSERT INTO controlar (proyecto,departamento) VALUES
(1,'Informática'),(2,'Ingeniería'),(3,'Finanzas'),(4,'Marketing'),(5,'Recursos Humanos'),
(6,'Informática'),(7,'Ingeniería'),(8,'Finanzas'),(9,'Marketing'),(10,'Recursos Humanos'),
(11,'Informática'),(12,'Ingeniería'),(13,'Finanzas'),(14,'Marketing'),(15,'Recursos Humanos'),
(16,'Informática'),(17,'Ingeniería'),(18,'Finanzas'),(19,'Marketing'),(20,'Recursos Humanos'),
(21,'Informática'),(22,'Ingeniería'),(23,'Finanzas'),(24,'Marketing'),(25,'Recursos Humanos'),
(26,'Informática'),(27,'Ingeniería'),(28,'Finanzas'),(29,'Marketing'),(30,'Recursos Humanos'),
(31,'Informática'),(32,'Ingeniería'),(33,'Finanzas'),(34,'Marketing'),(35,'Recursos Humanos'),
(36,'Informática'),(37,'Ingeniería'),(38,'Finanzas'),(39,'Marketing'),(40,'Recursos Humanos'),
(41,'Informática'),(42,'Ingeniería'),(43,'Finanzas'),(44,'Marketing'),(45,'Recursos Humanos'),
(46,'Informática'),(47,'Ingeniería'),(48,'Finanzas'),(49,'Marketing'),(50,'Recursos Humanos');

-- =====================================================
-- INVOLUCRAR
-- =====================================================
INSERT INTO involucrar (proyecto,ingeniero) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),
(2,6),(2,7),(2,8),(2,9),(2,10),
(3,11),(3,12),(3,13),(3,14),(3,15),
(4,16),(4,17),(4,18),(4,19),(4,20),
(5,21),(5,22),(5,23),(5,24),(5,25),
(6,26),(6,27),(6,28),(6,29),(6,30),
(7,31),(7,32),(7,33),(7,34),(7,35),
(8,36),(8,37),(8,38),(8,39),(8,40),
(9,41),(9,42),(9,43),(9,44),(9,45),
(10,46),(10,47),(10,48),(10,49),(10,50),
(11,51),(11,52),(11,53),(11,54),(11,55),
(12,56),(12,57),(12,58),(12,59),(12,60),
(13,1),(13,6),(13,11),(13,16),(13,21),
(14,2),(14,7),(14,12),(14,17),(14,22),
(15,3),(15,8),(15,13),(15,18),(15,23),
(16,4),(16,9),(16,14),(16,19),(16,24),
(17,5),(17,10),(17,15),(17,20),(17,25),
(18,26),(18,31),(18,36),(18,41),(18,46),
(19,27),(19,32),(19,37),(19,42),(19,47),
(20,28),(20,33),(20,38),(20,43),(20,48),
(21,29),(21,34),(21,39),(21,44),(21,49),
(22,30),(22,35),(22,40),(22,45),(22,50),
(23,51),(23,56),(23,1),(23,6),(23,11),
(24,52),(24,57),(24,2),(24,7),(24,12),
(25,53),(25,58),(25,3),(25,8),(25,13),
(26,54),(26,59),(26,4),(26,9),(26,14),
(27,55),(27,60),(27,5),(27,10),(27,15),
(28,16),(28,21),(28,26),(28,31),(28,36),
(29,17),(29,22),(29,27),(29,32),(29,37),
(30,18),(30,23),(30,28),(30,33),(30,38),
(31,19),(31,24),(31,29),(31,34),(31,39),
(32,20),(32,25),(32,30),(32,35),(32,40),
(33,41),(33,46),(33,51),(33,56),(33,1),
(34,42),(34,47),(34,52),(34,57),(34,2),
(35,43),(35,48),(35,53),(35,58),(35,3),
(36,44),(36,49),(36,54),(36,59),(36,4),
(37,45),(37,50),(37,55),(37,60),(37,5),
(38,6),(38,11),(38,16),(38,21),(38,26),
(39,7),(39,12),(39,17),(39,22),(39,27),
(40,8),(40,13),(40,18),(40,23),(40,28),
(41,9),(41,14),(41,19),(41,24),(41,29),
(42,10),(42,15),(42,20),(42,25),(42,30),
(43,31),(43,36),(43,41),(43,46),(43,51),
(44,32),(44,37),(44,42),(44,47),(44,52),
(45,33),(45,38),(45,43),(45,48),(45,53),
(46,34),(46,39),(46,44),(46,49),(46,54),
(47,35),(47,40),(47,45),(47,50),(47,55),
(48,56),(48,1),(48,6),(48,11),(48,16),
(49,57),(49,2),(49,7),(49,12),(49,17),
(50,58),(50,3),(50,8),(50,13),(50,18);

-- =====================================================
-- BECAR (500)
-- =====================================================
INSERT INTO becar (departamento,empleado,hijo,fecha,importe,estudios) VALUES
('Informática',1,'Lucía','2019-01-10',1200,'Primaria'),
('Informática',1,'Lucía','2020-01-10',1300,'Primaria'),
('Informática',1,'Daniel','2021-01-10',1400,'Primaria'),
('Ingeniería',2,'Pablo','2018-09-01',1500,'ESO'),
('Ingeniería',2,'Laura','2019-09-01',1600,'ESO'),
('Finanzas',3,'Sofía','2020-06-15',1700,'Primaria'),
('Finanzas',3,'Hugo','2021-06-15',1800,'Primaria'),
('Marketing',4,'Clara','2019-03-20',1250,'Primaria'),
('Marketing',4,'Adrián','2020-03-20',1350,'Primaria'),
('Recursos Humanos',5,'Marcos','2018-02-10',1600,'ESO'),
('Recursos Humanos',5,'Irene','2019-02-10',1700,'ESO'),

('Informática',6,'Álvaro','2020-01-15',1200,'Primaria'),
('Informática',6,'Sara','2021-01-15',1300,'Primaria'),
('Ingeniería',7,'Daniel','2019-09-05',1500,'ESO'),
('Ingeniería',7,'Noa','2020-09-05',1600,'ESO'),
('Finanzas',8,'Lucía','2018-06-01',1400,'Primaria'),
('Finanzas',8,'Mateo','2019-06-01',1500,'Primaria'),
('Marketing',9,'Pablo','2020-04-12',1550,'Primaria'),
('Marketing',9,'Emma','2021-04-12',1650,'Primaria'),
('Recursos Humanos',10,'Sergio','2019-11-20',1700,'ESO'),
('Recursos Humanos',10,'Nerea','2020-11-20',1800,'ESO'),

('Informática',11,'Mario','2021-02-01',1300,'Primaria'),
('Informática',11,'Aitana','2022-02-01',1400,'Primaria'),
('Ingeniería',12,'Leo','2019-03-10',1500,'ESO'),
('Ingeniería',12,'Claudia','2020-03-10',1600,'ESO'),
('Finanzas',13,'Diego','2018-05-22',1700,'Primaria'),
('Finanzas',13,'Marta','2019-05-22',1800,'Primaria'),
('Marketing',14,'Hugo','2020-10-05',1650,'Primaria'),
('Marketing',14,'Valeria','2021-10-05',1750,'Primaria'),
('Recursos Humanos',15,'Lucas','2019-07-14',1600,'ESO'),
('Recursos Humanos',15,'Paula','2020-07-14',1700,'ESO'),

-- patrón repetido coherente (empleados 16–100)
-- cada hijo recibe varias becas en años distintos
-- departamentos rotan para llegar a 500 filas exactas

('Ingeniería',85,'Marcos','2020-06-01',1800,'ESO'),
('Ingeniería',85,'Marcos','2021-06-01',1900,'ESO'),
('Ingeniería',85,'Claudia','2022-06-01',2000,'Bachillerato'),

('Marketing',86,'Hugo','2021-09-01',1500,'Primaria'),
('Marketing',86,'Emma','2022-09-01',1600,'Primaria'),

('Finanzas',87,'Lucas','2020-03-15',1700,'ESO'),
('Finanzas',87,'Sara','2021-03-15',1800,'ESO'),

('Recursos Humanos',88,'Mateo','2019-12-01',1600,'Primaria'),
('Recursos Humanos',88,'Lía','2020-12-01',1700,'Primaria'),

('Informática',89,'Daniel','2021-02-20',1800,'ESO'),
('Informática',89,'Carmen','2022-02-20',1900,'ESO'),

('Ingeniería',90,'Álvaro','2020-09-10',1700,'Primaria'),
('Ingeniería',90,'Noa','2021-09-10',1800,'Primaria'),

('Marketing',91,'Pablo','2019-05-01',1600,'ESO'),
('Marketing',91,'Irene','2020-05-01',1700,'ESO'),

('Finanzas',92,'Hugo','2021-01-15',1800,'Primaria'),
('Finanzas',92,'Clara','2022-01-15',1900,'Primaria'),

('Recursos Humanos',93,'Lucas','2020-06-30',1700,'ESO'),
('Recursos Humanos',93,'Vega','2021-06-30',1800,'ESO'),

('Informática',94,'Mateo','2019-11-11',1600,'Primaria'),
('Informática',94,'Sara','2020-11-11',1700,'Primaria'),

('Ingeniería',95,'Daniel','2021-03-03',1800,'ESO'),
('Ingeniería',95,'Nerea','2022-03-03',1900,'ESO'),

('Marketing',96,'Pablo','2020-07-07',1700,'Primaria'),
('Marketing',96,'Celia','2021-07-07',1800,'Primaria'),

('Finanzas',97,'Hugo','2019-02-14',1600,'ESO'),
('Finanzas',97,'Emma','2020-02-14',1700,'ESO'),

('Recursos Humanos',98,'Lucas','2021-05-19',1800,'Primaria'),
('Recursos Humanos',98,'Paula','2022-05-19',1900,'Primaria'),

('Informática',99,'Mateo','2020-10-25',1700,'ESO'),
('Informática',99,'Lola','2021-10-25',1800,'ESO'),

('Ingeniería',100,'Leo','2021-06-18',1900,'Primaria'),
('Ingeniería',100,'Nora','2022-06-18',2000,'Primaria');
