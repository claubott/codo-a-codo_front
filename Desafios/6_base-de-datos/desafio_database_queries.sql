--
-- 2.1 obtener los apellidos de los empleados
--
SELECT apellido FROM empleados;
SELECT `apellido` FROM `empleados`;

--
-- 2.2 obtener los apellidos de los empleados sin repeticiones
--
SELECT DISTINCT apellido FROM empleados;

--
-- 2.3 obtener los datos de los empleados que se apelliden Lopez
--
SELECT * FROM empleados WHERE apellido='Lopez';

--
-- 2.4 obtener los datos de los empleados que se apelliden Lopez y los que se apelliden Perez
--
SELECT * FROM empleados WHERE apellido='Lopez' OR apellido='Perez';
SELECT * FROM empleados WHERE apellido IN ('Lopez','Perez');

--
-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14
--
SELECT * FROM empleados WHERE depto_id='14';
SELECT * FROM empleados WHERE depto_id=14;

--
-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77
--
SELECT * FROM empleados WHERE depto_id='37' OR depto_id='77';

--
-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P
--
SELECT * FROM empleados WHERE apellido LIKE 'P%';

--
-- 2.8 Obtener el presupuesto total de todos los departamentos
--
SELECT SUM(presupuesto) FROM departamentos;
SELECT SUM(presupuesto) AS 'Presupuesto Total' FROM departamentos;
SELECT SUM(presupuesto) 'Presupuesto Total' FROM departamentos;

--
-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento
--
SELECT empleados.*, departamentos.departamento, departamentos.presupuesto FROM empleados INNER JOIN departamentos ON empleados.depto_id=departamentos.id;

--
-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento
--
SELECT empleados.nombre, empleados.apellido, departamentos.departamento, departamentos.presupuesto FROM empleados INNER JOIN departamentos ON empleados.depto_id=departamentos.id;

--
-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000
--
SELECT empleados.nombre, empleados.apellido FROM empleados INNER JOIN departamentos ON empleados.depto_id=departamentos.id WHERE departamentos.presupuesto > 60000;

--
-- 2.12 añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109
--
INSERT INTO departamentos(id, departamento, presupuesto) VALUES (11,'Calidad',40000);
INSERT INTO empleados(dni, nombre, apellido, depto_id) VALUES (89267109,'Esther','Vazquez',11);

--
-- 2.13 aplicar un recorte presupuestario del 10% a todos los departamentos
--
UPDATE departamentos SET presupuesto=presupuesto*0.9;

--
-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14)
--
UPDATE empleados SET depto_id=14 WHERE depto_id=77;

--
-- 2.15 Despedir a los empleados del departamento de informática (código 14)
--
DELETE FROM empleados WHERE depto_id=14;

--
-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000
--
DELETE empleados.* FROM empleados INNER JOIN departamentos ON empleados.depto_id=departamentos.id WHERE departamentos.presupuesto > 90000;
DELETE FROM empleados WHERE depto_id IN (SELECT d.id FROM departamentos d WHERE d.presupuesto > 90000);
