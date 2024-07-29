--AVANCE 3.
--Consultas a responder.

--�Cu�l es el total de ventas (TotalCompra) a nivel global?
SELECT*FROM Ordenes

SELECT SUM (TotalCompra) AS TotalVentasGlobal
FROM Ordenes;

--�Cu�l es el precio promedio de los productos dentro de cada categor�a?
SELECT*FROM Productos

SELECT CategoriaID,
AVG (Precio) AS PrecioPromedio
FROM Productos
GROUP BY CategoriaID;


--�Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?

SELECT*FROM Ordenes

SELECT SucursalID,
MIN (TotalCompra) AS ValorMinimo,
MAX (TotalCompra) AS ValorMaximo
FROM Ordenes
GROUP BY SucursalID;

--�Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?
SELECT*FROM Ordenes

SELECT 
MAX (KilometroRecorrer) AS MayorkmRecorridos
FROM Ordenes

--�Cu�l es la cantidad promedio de productos por orden?
SELECT*FROM DetalleOrdenes


SELECT OrdenID,
AVG (Cantidad) AS PromedioProductosPorOrden
FROM DetalleOrdenes
GROUP BY OrdenID;

--�C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?
SELECT *FROM Ordenes

SELECT TipodePagoID,
SUM(TotalCompra) AS FacturacionTotal
FROM Ordenes
GROUP BY TipodePagoID;

--�Cual Sucursal tiene el ingreso promedio m�s alto?
SELECT*FROM Ordenes

SELECT TOP 1 SucursalID,
AVG (TotalCompra) AS IngresoMedio
FROM Ordenes
GROUP BY SucursalID
ORDER BY IngresoMedio DESC;


--�Cu�les son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT*FROM Ordenes

SELECT SucursalID, 
SUM(TotalCompra) AS VentasTotales
FROM ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 1000;


--�C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?
SELECT*FROM Ordenes

SELECT
AVG(TotalCompra) AS PromedioVentasPrimerSemestre
FROM Ordenes
WHERE FechaOrdenTomada < '2023-07-01';

SELECT
AVG(TotalCompra) AS PromedioVentasSegundoSemestre
FROM Ordenes
WHERE FechaOrdenTomada >= '2023-07-01';

/*Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la 
mayor cantidad de ventas, �cu�l es el ingreso promedio de estas ventas, y cu�l 
ha sido el importe m�ximo alcanzado por una orden en dicha jornada?*/

SELECT*FROM Ordenes

SELECT HorarioVenta,
COUNT(OrdenID) AS Cantidadventas,
AVG(TotalCompra)AS IngresoPromedio,
MAX (TotalCompra)AS MaximoCompra
FROM Ordenes
GROUP BY HorarioVenta;
