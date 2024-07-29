--AVANCE 3.
--Consultas a responder.

--¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT*FROM Ordenes

SELECT SUM (TotalCompra) AS TotalVentasGlobal
FROM Ordenes;

--¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT*FROM Productos

SELECT CategoriaID,
AVG (Precio) AS PrecioPromedio
FROM Productos
GROUP BY CategoriaID;


--¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT*FROM Ordenes

SELECT SucursalID,
MIN (TotalCompra) AS ValorMinimo,
MAX (TotalCompra) AS ValorMaximo
FROM Ordenes
GROUP BY SucursalID;

--¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT*FROM Ordenes

SELECT 
MAX (KilometroRecorrer) AS MayorkmRecorridos
FROM Ordenes

--¿Cuál es la cantidad promedio de productos por orden?
SELECT*FROM DetalleOrdenes


SELECT OrdenID,
AVG (Cantidad) AS PromedioProductosPorOrden
FROM DetalleOrdenes
GROUP BY OrdenID;

--¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
SELECT *FROM Ordenes

SELECT TipodePagoID,
SUM(TotalCompra) AS FacturacionTotal
FROM Ordenes
GROUP BY TipodePagoID;

--¿Cual Sucursal tiene el ingreso promedio más alto?
SELECT*FROM Ordenes

SELECT TOP 1 SucursalID,
AVG (TotalCompra) AS IngresoMedio
FROM Ordenes
GROUP BY SucursalID
ORDER BY IngresoMedio DESC;


--¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT*FROM Ordenes

SELECT SucursalID, 
SUM(TotalCompra) AS VentasTotales
FROM ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 1000;


--¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT*FROM Ordenes

SELECT
AVG(TotalCompra) AS PromedioVentasPrimerSemestre
FROM Ordenes
WHERE FechaOrdenTomada < '2023-07-01';

SELECT
AVG(TotalCompra) AS PromedioVentasSegundoSemestre
FROM Ordenes
WHERE FechaOrdenTomada >= '2023-07-01';

/*Durante qué horario del día (mañana, tarde, noche) se registra la 
mayor cantidad de ventas, ¿cuál es el ingreso promedio de estas ventas, y cuál 
ha sido el importe máximo alcanzado por una orden en dicha jornada?*/

SELECT*FROM Ordenes

SELECT HorarioVenta,
COUNT(OrdenID) AS Cantidadventas,
AVG(TotalCompra)AS IngresoPromedio,
MAX (TotalCompra)AS MaximoCompra
FROM Ordenes
GROUP BY HorarioVenta;
