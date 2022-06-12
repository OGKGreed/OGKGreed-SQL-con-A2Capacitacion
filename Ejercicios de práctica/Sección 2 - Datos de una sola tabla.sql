# Ejercicios
/* Parte 1: SELECT
  1. Selecciona tu SCHEMA practicas con USE
  2. Aplica un SELECT y obten todas las columnas con * de ventas
  3. Usa SELECT para traer las columnas de ID_zona, venta y ID_cliente
  4. Con SELECT trae ahora solo venta y dale otro nombre con AS a la columna
  5. Obten una columna que te muestre la venta + IVA (16%) y nómbrala diferente
*/
USE practicas;
SELECT * FROM ventas;
SELECT ID_zona, venta, ID_Cliente FROM ventas;
SELECT venta AS total FROM ventas;
SELECT venta * 1.16 AS venta_con_iva FROM ventas;

/* Parte 2: WHERE
  1. Traer todas las ventas de la zona 2
  2. Todas las ventas mayores a 2,000,000
  3. Todos los productos que sean del cliente 7
  4. Trae toda la venta que sean menores a 1,000,000
*/
SELECT * FROM ventas WHERE ID_Zona = 2; #
SELECT * FROM ventas WHERE Venta > 2000000;
SELECT * FROM ventas WHERE ID_Cliente = 7;
SELECT * FROM ventas WHERE Venta < 1000000;

/* Parte 3: Operadores AND, OR, NOT
  1. Traer todas las ventas mayores o iguales a 1,500,000 en zona 2
  2. Todas las ventas menores a 500,000 en la zona 2 que sean del vendedor 2
  3. Todas las ventas mayores a 999,999 o que sean del vendedor 13
  4. Trae toda la venta que NO sea del cliente 10
*/
SELECT ID_Venta, Venta, ID_Zona FROM ventas WHERE Venta >= 1500000 AND ID_Zona = 2;
SELECT ID_Venta, Venta, ID_Zona, ID_Vendedor FROM ventas WHERE Venta < 500000 AND ID_Zona = 2 AND ID_Vendedor = 2;
SELECT ID_Venta, Venta, ID_Vendedor FROM ventas WHERE Venta > 999999 OR ID_Vendedor = 13;
SELECT ID_Venta, Venta, ID_Cliente FROM ventas WHERE NOT ID_Cliente = 10;

/* Parte 4: Operador IN
  1. Obten las ventas de la zona del 1 al 4
  2. Obten las ventas que haya realizado el consumidor 6, 7, 8 y 9
  3. Obten las ventas que NO sean del vendedor 15, 21, y 35
*/
SELECT * FROM ventas WHERE ID_Zona IN (1, 2, 3, 4);
SELECT * FROM ventas WHERE ID_Cliente IN (6, 7, 8, 9);
SELECT * FROM ventas WHERE ID_Vendedor NOT IN (15, 21, 35);

/* Parte 5: REGEXP
  1. Obten los apellidos del personal de ventas que termine con "ez"
  2. Agrega la columna de nombre para tener las 2 columnas, nombre y apellidos
  3. Crea una consulta para tener los apellidos que terminen en "ez" o inicien en "sa"
*/
SELECT Apellido FROM vendedor WHERE Apellido REGEXP "ez$";
SELECT Nombre, Apellido FROM vendedor WHERE Apellido REGEXP "ez$";
SELECT Apellido FROM vendedor WHERE Apellido REGEXP "ez$|^sa";

/* Parte 6: Operador NULL
  1. Tenemos un cliente que no tiene teléfono, necesitamos identificarlo para poder
     actualizar la base de datos. ¿Qué cliente es?
     R = Honduland, ID de cliente 5
*/
SELECT ID_Cliente, Nombre, Pais, Telefono FROM clientes WHERE Telefono IS NULL;

/* Parte 6: Instrucción ORDER BY
  1. Ordena la información de los vendedores por nombre en forma descendiente.
  2. Ordena ahora los datos de los vendedores por nombre y después por apellido.
*/
SELECT * FROM vendedor ORDER BY Nombre DESC;
SELECT * FROM vendedor ORDER BY Nombre, Apellido DESC;

/* Parte 7: Cláusula LIMIT
  1. Limita las ventas a los primeros 10 registros
  2. Limita la venta a los registros entre el 50 y el 100
*/
SELECT * FROM ventas LIMIT 10;
SELECT * FROM VENTAS LIMIT 49, 51;