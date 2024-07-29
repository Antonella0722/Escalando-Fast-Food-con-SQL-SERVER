-- �Cu�les son los productos m�s rentables ?

SELECT p.ProductoID, 
	   p.Nombre,
	   SUM(D.Cantidad * p.Precio) AS TotalVentas
FROM DetalleOrdenes D
	JOIN Productos p 
ON D.ProductoID = p.ProductoID
GROUP BY p.ProductoID, p.Nombre
ORDER BY TotalVentas DESC;

--�Cu�les son las horas pico de ventas y qu� productos se venden m�s en esos periodos?
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


