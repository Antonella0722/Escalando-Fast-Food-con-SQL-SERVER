--Avance 4.
--Consultas a responder.

-- 1. ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?

SELECT
	P.Nombre AS NombreProducto,C.Nombre AS NombreCategoria
FROM Productos AS P 
	INNER JOIN Categorias AS C
	ON P.CategoriaID = C.CategoriaID;
	

--2. ¿Cómo puedo saber a qué sucursal está asignado cada empleado?

SELECT
	E.Nombre AS NombreEmpleado, s.Nombre AS Sucursal
FROM 
	Empleados AS E INNER JOIN Sucursales AS S
ON
	E.SucursalID = S.SucursalID

-- 3.¿Existen productos que no tienen una categoría asignada?
SELECT
	P.Nombre AS NombreProducto,C.Nombre AS NombreCategoria
FROM 
	Productos AS P LEFT JOIN Categorias AS C
ON
	P.CategoriaID = C.CategoriaID
WHERE C.CategoriaID IS NULL;


/*4.¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, 
y Nombre del mensajero que la entregó?*/

SELECT 
       C.nombre AS NombreCliente, 
       E.nombre AS NombreEmpleado, 
       M.nombre AS NombreMensajero
FROM ordenes 
INNER JOIN clientes AS C
	ON ordenes.ClienteID = C.ClienteID 
INNER JOIN empleados AS E
	ON ordenes.EmpleadoID = E.EmpleadoID 
INNER JOIN mensajeros AS M
	ON ordenes.MensajeroID = M.MensajeroID;

--5.¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?

SELECT C.Nombre AS NombreCategoria,
	   S.Nombre AS NombreSucursales,
	   SUM (D.Cantidad) AS CantidadArticulos
FROM Ordenes AS O
INNER JOIN DetalleOrdenes AS D
	ON O.OrdenID = D.OrdenID
INNER JOIN Productos AS P
	ON D.ProductoID = P.ProductoID
INNER JOIN Categorias AS C
	ON P.CategoriaID = C.CategoriaID
INNER JOIN Sucursales AS S
	ON O.SucursalID= S.SucursalID
GROUP BY S.Nombre, C.Nombre;





