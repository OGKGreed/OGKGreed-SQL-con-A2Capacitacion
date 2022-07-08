# Ejercicios
/* Parte 1: El uso de Join
   
   Imagina que vas a preparar un análisis de ventas; tienes que entregar 2 columnas por vista con
   la descripción de:
   
   1.Ventas por cliente
   2.Ventas por zona
   3.Ventas por vendedor
   4.Ventas por producto
*/
USE practicas;
-- 1. Venta por cliente --
SELECT v.venta, c.Nombre 
FROM ventas v
JOIN clientes c ON v.ID_Cliente = c.ID_Cliente;

-- 2. Venta por zona--
SELECT v.venta, z.Zona 
FROM ventas v
JOIN zona z ON v.ID_Zona = z.ID_zona;

-- 3. Venta por vendedor --
SELECT v.venta, concat(ven.Nombre, ' ', ven.Apellido) AS nombre_vendedor 
FROM ventas v
JOIN vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor;

-- 4. Venta por producto --
SELECT v.venta, p.Producto
FROM ventas v
JOIN producto p ON v.ID_Producto = p.ID_Producto;


/* Parte 2: Múltiples tablas JOIN
   
   Genera una vista con la descripción que contenga:
   
   1.Información de venta por vendedor y cliente
   2.Otra para la venta por cliente, zona y producto.
*/

-- 1.Información de venta por vendedor y cliente --
SELECT v.Venta, 
	   concat(ven.Nombre, ' ', ven.Apellido) AS vendedor, 
       cli.Nombre AS cliente
FROM ventas v
JOIN vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor
JOIN clientes cli  ON v.ID_Cliente = cli.ID_Cliente;

-- 2.Información de venta por cliente, zona y producto --
SELECT v.Venta, 
	   cli.Nombre AS Cliente, 
       z.Zona,
       p.Producto
FROM ventas v
JOIN clientes cli ON v.ID_Cliente = cli.ID_Cliente
JOIN zona z       ON v.ID_Zona = z.ID_zona
JOIN producto p   ON v.ID_Producto = p.ID_Producto;



/* Parte 3: Usar JOIN Externo
   
   Encontrar al vendedor que no ha vendido nada.
   
*/
SELECT ven.ID_Vendedor, ven.Nombre AS Vendedor, v.Venta
FROM ventas v
RIGHT JOIN vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor
ORDER BY v.Venta;



/* Parte 4: Instrucción USING
   
   Genera una vista con la descripción:
   
   1.Venta con el cliente y zona
   2.Venta con vendedor y producto
   
*/
-- 1.Venta con el cliente y zona --
SELECT v.Venta, cli.Nombre AS Cliente, z.Zona
FROM ventas v
JOIN clientes cli USING (ID_Cliente)
JOIN zona z       USING (ID_Zona);

-- 2.Venta con vendedor y producto --
SELECT v.Venta, ven.Nombre AS Vendedor, p.Producto
FROM ventas v
JOIN vendedor ven USING (ID_Vendedor)
JOIN producto p   USING (ID_Producto);



/* Parte 5: CROSS JOIN
   
   Genera una vista para traer todas las combinaciones de:
   
   1.Nombre de productos y nombre de clientes
   
*/
-- 1.Nombre de productos y nombre de clientes --
SELECT cli.Nombre AS Clientes, p.Producto
FROM producto p
CROSS JOIN clientes cli;



/* Parte 6: Usando UNION
   
   Genera 2 consultas y únelas para lograr:
   
   1.Una vista con clientes y que tengan la calificación "A" y "B"
   2.Lista de vendedores que estén casados y sean mayores de 50 años con
     los vendedores solteros y menores de 30 años.
   
*/
-- 1.Una vista con clientes y que tengan la calificación "A" y "B" --
SELECT cli.Nombre, cli.Clasificacion_credito
FROM clientes cli
WHERE cli.Clasificacion_credito = "A"
UNION
SELECT cli.Nombre, cli.Clasificacion_credito
FROM clientes cli
WHERE cli.Clasificacion_credito = "B";

-- 2.Lista de vendedores que estén casados y sean mayores de 50 años con los vendedores 
-- solteros y menores de 30 años. --
SELECT ven.Nombre, ven.Estado_Civil, ven.Edad
FROM vendedor ven
WHERE ven.Estado_Civil = "Casado" AND ven.Edad > 50
UNION
SELECT ven.Nombre, ven.Estado_Civil, ven.Edad
FROM vendedor ven
WHERE ven.Estado_Civil = "Soltero" AND ven.Edad < 30;