#Instrucción USE
/*Use sirve para hacer uso de una base de datos, o schema. Para usar esta instrucción, se debe
  escribir la instrucción USE y seguido de esto el schema de nuestro interés.
  
  Sabremos que estamos usando el schema deseado porque MySQL Workbench señalará el schema
  en negritas. 
  
  Ejemplos:
	-> USE datos;
    -> USE index;
    -> USE periodos;
  */
USE datos;



# Uso de SELECT, FROM y AS
/*La instrucción SELECT sirve para traer datos. Para usar esta instrucción, se debe escribir la
  instrucción SELECT, y seguido de esto, especificar las columnas de nuestro interés; por último,
  se deberá especificar la tabla de origen de donde vendrán estas columnas haciendo uso de la
  instrucción FROM.
  
  Esta instrucción puede hacer uso de columnas especificas, en caso de querer traer sólo las columnas
  de la tabla de nuestro interés, o el caracter ( * ), que traerá todas las columnas de la tabla.
  
  Ejemplos: 
		-Usando el caracter ( * ):
			-> SELECT * from ventas;
        
        -Trayendo columnas específicas:
			-> SELECT clave_producto, fecha, venta, venta FROM ventas;
        
  La instrucción SELECT puede complementarse creando columnas nuevas a través de datos ya existentes.
  En resumen, se crea una columna nueva con el nombre que deseemos y con datos de otra columna; además,
  esta columna es temporal, es decir, sólo existirá mientras la consulta se ejecute. Para hacer esto,
  usamos la instrucción AS, también conocido como Alias.
  
  La instrucción AS aceptará como parámetro el nombre de la columna temporal que requeramos en ese momento.
  Esto nos será útil para crear, por ejemplo, columnas con un nombre más explícito que pueda ayudarnos con
  operaciones entre columnas.
  
  Ejemplos: 
		-Usando Alias ( AS ): 
			-> SELECT clave_producto, fecha, venta, venta * 1.16 AS venta_iva FROM ventas;
  */



# Uso de WHERE
/*La instrucción WHERE sirve para realizar una búsqueda entre los datos de las tablas de forma específica.
  Al usar dicha instrucción, se especifica una condición que servirá para filtrar los resultados traídos.
  
  Puntos a considerar:
	WHERE se puede usar tanto para valores numéricos como alfanuméricos.
    
    * Para valores numéricos -> La condición deberá usar un operador de comparación, seguido del valor que 
    servirá como filtro.  Por ejemplo:
		-> SELECT clave_producto, venta from ventas WHERE venta >= 1000;
        
	* Para valores alfanuméricos -> La condición puede usarse para ver si existen datos que coinciden con
    un conjunto de caracteres haciendo uso del operador de igualdad ( = ); o puede usarse para ver si existen
    datos distintos a dicho conjunto ( != ). El conjunto de caracteres a comparar deberá estar declarado entre
    comillas dobles ( "" ), simples ( '' )  o backsticks ( `` ). Por ejemplo:
		-> SELECT ID_local, clave_producto, venta FROM ventas WHERE clave_producto = "pzz";
  */



# Operadores AND, OR, NOT
/*Los operadores AND, OR y NOT sirven para establecer una relación entre condiciones. Es muy usada en conjunto a
  instrucciones como WHERE para filtrar información, ya sea dependiendo si se cumplen un conjunto de condiciones,
  si se cumple alguna condición de ese conjunto, o en su defecto, que no se cumpla ninguna.
  
  Los operadores funcionan de la siguiente forma:
	
    AND -> Este operador relaciona condiciones de forma que se tengan que cumplir todas, retornando así los
    resultados que cumplan todas las condiciones al mismo tiempo.
    
    OR  -> Este operador relaciona condiciones de forma que, se retornarán resultados si se cumple una de todas 
    las condiciones establecidas.
    
    NOT -> Este operador sirve para formar una relación de forma que la condición no se cumpla, o, en otras
    palabras, que se cumpla el caso contrario al que se está analizando. 
    
    Ejemplos: 
		-Usando el operador AND: Esta consulta retornará las columnas especificadas donde la clave del producto
        sea igual a pzz y el ID del local sea igual a 2
			-> SELECT ID_local, clave_producto, venta FROM ventas WHERE clave_producto = "pzz" AND ID_local = 2;
            
		-Usando el operador OR: Esta consulta retornará las columnas especificadas donde la clave del producto
        sea igual a pzz, o que el ID del local sea igual a 2
			-> SELECT ID_local, clave_producto, venta FROM ventas WHERE clave_producto = "pzz" OR ID_local = 2;
		
        NOTA: NÓTESE QUE LA CONSULTA CON EL OPERADOR OR RETORNA MÁS RESULTADOS QUE LA QUE USA EL OPERADOR AND, Y
        SE DEBE A QUE SÓLO REQUIERE CUMPLIRSE UNA DE LAS DOS CONDICIONES EN LUGAR DE AMBAS SIMULTÁNEAMENTE.
        
        -Usando el operador NOT: Esta consulta retornará las columnas especificadas donde la clave del producto
        no sea igual a pzz y que el ID del local sea igual a 2, o que la ventas sean mayores a 1000. 
			-> SELECT ID_local, clave_producto, venta FROM ventas 
			   WHERE NOT clave_producto = "pzz" AND ID_local = 2 OR venta > 1000;

        NOTA: CABE MENCIONAR QUE LA ÚNICA NEGACIÓN DE CONDICIÓN EN LA CONSULTA ES QUE LA CLAVE DEL PRODUCTO NO 
        SEA PZZ, POR LO QUE DEVOLVERÁ RESULTADOS DONDE:
            -LA CLAVE DEL PRODUCTO SEA IGUAL DE PZZ, EL ID DEL LOCAL SEA IGUAL A 2 Y LAS VENTAS SEAN MAYORES A 1000.
			-LA CLAVE DEL PRODUCTO SEA DISTINTO DE PZZ, EL ID DEL LOCAL SEA IGUAL A 2 Y LAS VENTAS SEAN MENORES A 1000.
			-LA CLAVE DEL PRODUCTO SEA DISTINTO DE PZZ, EL ID DEL LOCAL SEA DISTINTO DE 2 Y LAS VENTAS SEAN MAYORES A 1000.
  */



# Uso del Operador IN
/*Este operador sirve cuando deseamos realizar una búsqueda de datos donde existen múltiples valores en una columna.
  Por ejemplo, si quisieramos realizar la búsqueda de las ventas donde la clave del producto sea igual a pzz, o brr,
  o qsd, se haría una consulta así:
	-Sin usar el operador IN:
		-> SELECT * FROM ventas WHERE clave_producto = "pzz" OR clave_producto = "brr" OR clave_producto = "qsd";

  La consulta anterior es muy larga, además de que para buscar valores múltiples tiene que hacer uso de operadores OR.
  
  El operador IN busca un conjunto de valores especificados en paréntesis, acortando así la consulta. Por ejemplo:
	-Usando el operador IN:
		-> SELECT * FROM ventas WHERE clave_producto IN ("pzz", "brr", "qsd");
*/



# Uso de BETWEEN
/*La instrucción BETWEEN establece un rango de valores numéricos. Por lo general, para hacer una consulta definiendo
  un rango de valores numéricos, se haría una consulta como la siguiente:
	-Sin usar la instrucción BETWEEN:
		-> SELECT * FROM ventas WHERE ventas >= 1000 AND venta <= 2000;
  
  Las consultas de este tipo pueden permitir errores al escribir los operadores de comparación. 
  
  Podemos minimizar ese riesgo a través de la instrucción BETWEEN. Por ejemplo: 
	-Usando la instrucción BETWEEN:
		-> SELECT * FROM ventas WHERE venta BETWEEN 1000 AND 3000;
        
  NOTA: NÓTESE QUE EL USO DE LA INSTRUCCIÓN BETWEEN FACILITA EL ENTENDIMIENTO DE LA CONSULTA.
*/



# Uso de LIKE
/*La instrucción LIKE sirve para acotar o filtrar búsquedas de datos donde los valores hallados coincidan con
  un conjunto de caracteres o valores numéricos de nuestro interés. Por ejemplo:
  
  -> SELECT * FROM ventas WHERE clave_producto LIKE "z";
     ↑ Esta consulta no retornará datos debido a que no existe una clave de producto que SÓLO sea igual a z.
     
  -> SELECT * FROM ventas WHERE ID_local LIKE 2;
     ↑ Esta consulta retornará datos debido a que existen ventas donde el ID del local sea igual a 2.
  
  Esta instrucción hace uso de caracteres especiales, que se pueden colocar al inicio o al final de la búsqueda
  de nuestro interés, para indicar determinadas acciones en nuestra búsqueda. Dichos caracteres especiales son:
	
    Guión Bajo ( _ ) -> Este caracter especifica un número exacto de caracteres en nuestra búsqueda, es decir,
    si colocamos dos guiones bajos al inicio de la búsqueda, retornará todos los datos cuya búsqueda tenga dos
    caracteres antes que ella; si se colocan tres guiones bajos al final de la búsqueda, retornará todos los
    datos cuya búsqueda tenga tres caracteres después de ella.
    
    Ejemplos:
		-Usando guión bajo al inicio:
			-> SELECT * FROM ventas WHERE clave_producto LIKE "__z";
			   ↑ Retornará datos que tengan dos caractéres antes que la z
		
        -Usando guión bajo al final:
			-> SELECT * FROM ventas WHERE clave_producto LIKE "z__";
			   ↑ Retornará datos que tengan dos caractéres después de la z
    
    Porcentaje ( % ) -> También conocido como "comodín", se usa para buscar cualquier cantidad de caracteres, ya
    sea al inicio o al final de la búsqueda de nuestro interés.
    
    Ejemplos:
		-Usando el comodín ( % ) al inicio:
			-> SELECT * FROM ventas WHERE clave_producto LIKE "%z";
		
        -Usando el comodín ( % ) al final:
			-> SELECT * FROM ventas WHERE clave_producto LIKE "z%";
            
	Podemos ampliar los resultados de la búsqueda colocando comodines al inicio y final de los caracteres de nuestro
    interés. Por ejemplo:
		-Usando comodines al inicio y final de la búsqueda:
			-> SELECT * FROM empleados WHERE apellido LIKE "%ez%";
               ↑ Esta consulta retornará datos que contengan cualquier número de caracteres, ya sea al inicio o
                 al final, de la búsqueda de nuestro interés.
*/



# Uso de REGEXP
/*La instrucción REGEXP, o expresiones regulares ayuda a realizar una búsqueda de datos que coincidan con un
  conjunto de caracteres específico. Por ejemplo:
  -> SELECT * FROM empleados WHERE apellido REGEXP "Lo";
	↑ Esta consulta retornará cualquier resultado donde los apellidos contengan "Lo" en cualquier parte.
   
  La diferencia entre REGEXP y LIKE, es que REGEXP puede hacer uso de caracteres especiales que fuercen 
  las coincidencias, ya sea al inicio o al final. Además, permite realizar una búsqueda de valores 
  múltiples en una misma consulta sin tantas instrucciones.

  Los caracteres especiales para el uso de REGEXP son:

	^ -> Sirve para buscar un conjunto de caracteres al inicio. Ejemplo:
		 -> SELECT * FROM empleados WHERE apellido REGEXP "^Lo";
		    ↑ Esta consulta retornará sólo los resultados que contengan un apellido que comience con "Lo"

	$ -> Sirve para buscar un conjunto de caracteres al final. Ejemplo:
		 -> SELECT * FROM empleados WHERE apellido REGEXP "ez$";
            ↑ Esta consulta retornará sólo los resultados que contengan un apellido que termine con "ez"

	| -> Actúa como el operador OR; sirve para buscar un conjunto de caracteres, 
		 y en caso de no encontrar esos, traer otro conjunto de caracteres. Este
		 operador REGEXP permite combinar búsquedas usando ^ y $. Ejemplo:
         -> SELECT * FROM empleados WHERE apellido REGEXP "ez|iz|za$";
*/



# Instrucción ORDER BY
/*La instrucción ORDER BY nos permite organizar la búsqueda consultada de la forma en que mejor convenga.
  Permite trabajar tanto con valores alfanuméricos como valores numéricos, además de que, con estos últimos,
  se pueden realizar operaciones. Por ejemplo:
	
    -> SELECT * FROM empleados ORDER BY apellido;
    -> SELECT * FROM empleados ORDER BY Edad * 2;
    
  Permite realizar un ordenamiento ascendente ( ASC ), o descendente ( DESC ). Ejemplos:
	-Usando ordenamiento ascendente ( ASC ):
		-> SELECT * FROM empleados ORDER BY Edad * 2 ASC;
	
    -Usando ordenamiento descendente ( DESC ): 
		-> SELECT * FROM empleados ORDER BY Edad * 2 DESC;
	
    NOTA: EN CASO DE QUE NO SE ESPECIFIQUE UN ORDENAMIENTO ESPECÍFICO, IMPLÍCITAMENTE SE ORDENARÁN LOS DATOS
    ASCENDENTEMENTE.
*/



# Operador NULL
/*Este operador sirve para realizar una búsqueda en con respecto a los datos que puedan ser nulos ( NULL ), o
  de igual forma, si no lo son. Por ejemplo:
	-Analizando si existen datos nulos en la columna domicilio:
		-> SELECT * FROM empleados WHERE domicilio IS NULL;
		   ↑ Esta consulta retornará los resultados donde la columna domicilio contenga un valor NULL
	
    -Analizando si no existen datos nulos en la columna domicilio:
		-> SELECT * FROM empleados WHERE domicilio IS NOT NULL;
           ↑ Esta consulta retornará los resultados donde la columna domicilio contenga un valor distinto a NULL
*/



# Cláusula LIMIT
/*Esta cláusula nos sirve para limitar la cantidad de resultados retornados. Por ejemplo:
  
  -> SELECT * FROM ventas LIMIT 5;
  
  Esta cláusula puede aceptar uno, o hasta dos parámetros de tipo entero y separados por una coma.
  
	LIMIT con un parámetro -> Al utilizar un solo parámetro, se traerá el número de registros solicitados.
    Por ejemplo:
		-Usando LIMIT con un parámetro:
			-> SELECT * FROM ventas LIMIT 10;
	
    LIMIT con dos parámetros -> Al utilizar dos parámetros, cada uno deberá estar separado por una coma entre
    ambos. El primer parámetro representará un punto de referencia, es decir, a partir de qué registro se 
    comenzarán a traer resultados. Cabe mencionar que esta punto de referencia se comporta como el inicio de 
    un intervalo abierto, o sea, traerá los registros desde la posición n + 1 en adelante; el segundo parámetro
    representará el número de registros que se desea traer desde la posición antes declarada. Por ejemplo:
		-Usando LIMIT con dos parámetros
			-> SELECT * FROM ventas LIMIT 7, 5;
               ↑ Esta consulta traerá 5 registros desde la posición 8 hasta la 12 ( 8 + 5 = 12)
*/

















