-- ¿Cuáles son los productos más rentables ?

SELECT p.ProductoID, 
	   p.Nombre,
	   SUM(D.Cantidad * p.Precio) AS TotalVentas
FROM DetalleOrdenes D
	JOIN Productos p 
ON D.ProductoID = p.ProductoID
GROUP BY p.ProductoID, p.Nombre
ORDER BY TotalVentas DESC;

--¿Cuáles son las horas pico de ventas y qué productos se venden más en esos periodos?
SELECT DATEPART (HOUR,R.FechaOrdenTomada) AS Hora,
	p.ProductoID, 
	p.Nombre, 
	SUM(D.Cantidad) AS CantidadVendida
FROM DetalleOrdenes AS D
JOIN Productos p 
	ON D.ProductoID = p.ProductoID INNER JOIN Ordenes AS R
	ON D.OrdenID = R.OrdenID
GROUP BY 
	DATEPART (HOUR,R.FechaOrdenTomada),
	p.ProductoID, 
	p.Nombre
ORDER BY 
	CantidadVendida DESC;


