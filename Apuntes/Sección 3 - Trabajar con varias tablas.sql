#Uso de JOIN (INNER JOIN)
/*La instrucción JOIN, también conocido como INNER JOIN, crea un cruce o intersección de tablas, de forma que,
 traerá todas las columnas deseadas y con ellas formará una sola tabla con la información proveniente de otras 
 tablas. Es decir, si existen dos tablas donde cada una tiene 3 columnas, creará una tabla nueva temporal 
 donde traerá hasta 6 columnas.
  
  Para hacer uso de la sentencia JOIN, debemos asegurarnos que existan datos coincidentes o que se relacionen
  entresí en en dos tablas distintas o más.
  
  Ejemplo:
  
      Esta consulta traerá a todas las columnas de las tablas ventas, local y empleados. Cabe destacar que
      traerá a la tabla local porque existe una columna ID_local en la tabla ventas que coincide con otra
      columna ID_local en la tabla local. Y lo mismo con las columnas venta_empleado e ID_empleado;
      sus nombres no coinciden pero sí el dato que almacenan.
      
      USE datos;
      
		  SELECT *
		  FROM ventas v
		  JOIN local l
			   ON v.ID_local = l.ID_Local
		  JOIN empleados e
			   ON v.venta_empleado = e.ID_empleado;
       
	  La consulta anterior traerá absolutamente todas las columnas de cada tabla; sin embargo, sería difícil
      de leer e interpretar. De igual forma, podemos traer solo las columnas necesarias en caso de requerirlo.
      
		  SELECT v.Fecha, v.clave_producto, v.venta,
			     l.Direccion,
			     e.Nombre
		  FROM ventas v
		  JOIN local l
			   ON v.ID_local = l.ID_Local
		  JOIN empleados e
			   ON v.venta_empleado = e.ID_empleado;
  */
  
#Uso de JOIN entre bases de datos distintas
/*Podemos hacer JOIN's entre tablas que se ubiquen en bases de datos distintas. Para ello, usamos la siguiente
  notación: 
  
	JOIN baseDeDatos.Tabla
    
  Se especifica primero la base de datos en donde se ubica nuestra tabla de interés, y posteriormente, hacemos
  referencia a la tabla de interés con la notación de punto ( . ).
  
  Ejemplo:
	
      En esta consulta, Usamos la base de datos periodos y luego traemos todas las columnas de la tabla 
      periodo1. Después de esto, hacemos nuestro JOIN y hacemos uso de la notación anteriormente mencionada
      para referenciar a la tabla local ubicada en la base de datos "datos". Hay que mencionar que local 
      tiene datos coincidentes con la tabla periodo1, por lo que se traen los ID's de los locales.
	USE periodos;
	SELECT * 
	FROM periodo1 p
	JOIN datos.local l
		 ON p.Local = l.Letra_zona
  */

#Uso de SELF JOIN
/*Un SELF JOIN es hacer un JOIN a la misma tabla sobre la que estamos trabajando y deseamos unir datos.
  Para trabajar con un SELF JOIN, se recomienda hacer uso de Alias debido a que de lo contrario se generará
  un error debido a ambigüedad (que se está referenciando a la misma tabla).

	SELECT 
		e.ID_Empleado,
		e.Nombre,
		e.ID_Gerente,
		p.Nombre AS gerente
	FROM empleados e
	LEFT JOIN empleados p
		ON e.ID_Gerente = p.ID_empleado
*/
    
    
    
#JOINS laterales o externos (LEFT JOIN, RIGHT JOIN)
-- Explicación de fuente adicional --
/*Las bases de datos y las tablas pueden manejarse como conjuntos. Cuando hacemos INNER JOIN, unimos tablas
que contengan datos coincidentes en ambas tablas; sin embargo esto no pasará siempre. 

En algún momento, se dará el caso en donde tengamos muchas coincidencias en ambas tablas; pero habrán excepciones 
donde no se traigan los datos vacíos, datos con valor NULL o no asignados. Entonces debemos especificar de qué 
tabla deseamos traer todos los resultados sin importar que no tenga coincidencias con la otra tabla. Y esto lo
logramos haciendo uso de LEFT JOIN y RIGHT JOIN.

Tomando como ejemplo, dos tablas A y B, una ubicada a la izquierda y otra a la derecha, como conjuntos:

	LEFT JOIN -> Esta variación especificará que se deberán traer todos los datos de la tabla ubicada a la 
				 izquierda (que siguiendo el orden, sería la tabla A) sin importar que no hayan algunas
                 coincidencias en la tabla de la derecha (tabla B).
                 
	RIGHT JOIN -> Esta variación especificará que se deberán traer todos los datos de la tabla ubicada a la
				  derecha (tabla B) sin importar que no hayan algunas coincidencias en la tabla izquierda
				  (tabla A).
                  
Fuente adicional: https://www.youtube.com/watch?v=eNikUI0Y8y8
*/
-- Explicación de curso--
/*NOTA: Dice lo mismo que la fuente adicional.

	Ejemplos:
    
    RIGHT JOIN -> Deseamos traer a todas las ventas independientemente que no todos los empleados hayan
	hecho alguna venta. Creamos entonces la siguiente consulta.
    
		SELECT
			v.clave_producto, v.venta, v.venta_empleado,
			e.Nombre, e.Apellido
		FROM empleados e
		RIGHT JOIN ventas v
			 ON v.venta_empleado = e.ID_empleado
             
	Hay que destacar que la consulta hace lo que se pide, sin embargo, es algo confusa de entender cuando
    se traen los datos; como resultado, trae todas las ventas pero hay campos donde no hay empleados.
    Entonces, podemos interpretar que no todos los empleados han hecho ventas tras un analizar la consulta.

	LEFT JOIN -> Haciendo uso de LEFT JOIN, los datos traídos cambian un poco. Tenemos la siguiente consulta.
    
		SELECT
			v.clave_producto, v.venta, v.venta_empleado,
			e.Nombre, e.Apellido
		FROM empleados e
		LEFT JOIN ventas v
			 ON v.venta_empleado = e.ID_empleado
             
	En el caso de LEFT JOIN, podemos observar que se traen a todos los empleados pero existen campos
    relacionados con ventas que están vacíos. Es más fácil interpretar esto como que existen empleados que
    aún no han realizado alguna venta.
*/



#Cláusula USING
/*La cláusula USING es útil cuando hacemos JOIN's. Esta cláusula cambia la sintaxis de una consulta, 
  pues, USING especifica entre paréntesis cuál es la columna en la que deseamos buscar coincidencias.
  
  Sin embargo, tiene una restricción, y es que la columna debe tener exactamente el mismo nombre.
  
  Ejemplo:

		SELECT *
		FROM periodos.periodo1 e
		JOIN datos.empleados d
		USING (ID_Empleado);
        
  Como se puede observar, la sintaxis de la consulta es más entendible, pues buscamos datos coincidentes
  entre tablas "usando" ID_Empleado en vez de establecer una relación con ON.
  
  Cabe mencionar que la columna especificada con esta cláusula se mostrará al principio, y además, se 
  mostrará una única vez en lugar de dos o más veces (según el número de tablas que unamos).
  */
  
  
  
#CROSS JOIN
/*En ocasiones podemos desear realizar una combinación de valores de una tabla con todos los de otra tabla.
  Para hacer eso, hacemos uso de CROSS JOIN.
  
  Por ejemplo: se desea combinar todos los ingredientes de la tabla ingredientes con cada producto de la
  tabla producto. Usando CROSS JOIN, tenemos que se realizarán todas las combinaciones posibles entre cada
  producto a la venta con todos los ingredientes posibles que se usen en la preparación de estos.
  
	SELECT producto, ingredientes
	FROM productos
	CROSS JOIN ingredientes i
	ORDER BY producto;
    
  Existe una forma implícita de hacer CROSS JOIN, y es añadiendo más tablas en la cláusula FROM de nuestra
  consulta. Ejemplo:
  
	SELECT p.Producto, i.ingredientes
	FROM producto p, ingredientes i;
  */



#NATURAL JOIN
/*NATURAL JOIN es un JOIN que no se recomienda para nada. Con este JOIN, no se especifica la columna
  por la cual deseamos relacionar a las tablas de interés; sin embargo, al usar este JOIN dejamos que
  la computadora haga las interpretaciones de las relaciones y puede no traer o incluso malinterpretar
  datos, haciéndolos confusos o que no estén completos.
  
  Ejemplo:
  
	SELECT v.venta, v.venta_empleado,
	       e.nombre, e.apellido
	FROM ventas v
	NATURAL JOIN empleados e;
*/



#Uso de UNION
/*UNION nos permite realizar uniones de consultas. Para usar UNION, debemos tener en cuenta los siguientes
  criterios:
  
		-Tener dos o más consultas
        -Tener el mismo número de columnas en la selección de cada consulta
        -El orden especificado de las columnas declaradas determinará la unión de valores en una misma
         columna.
        
  Teniendo en cuenta esto, podemos unir consultas como las siguientes.alter
  
  Ejemplo: 
		
        SELECT producto, clave_producto
		FROM productos
		UNION
		SELECT ingredientes, clave_ingrediente
		FROM ingredientes;
        
  Con esta unión de consultas, unimos las columnas producto con ingredientes, y clave_producto con
  clave_ingrediente. De igual forma podemos hacer uso de Alias, como se muestra a continuación:
  
	Ejemplo: 
    
		SELECT producto AS nombres
		FROM productos
		UNION
		SELECT ingredientes
		FROM ingredientes;
  */