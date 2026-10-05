USE Ventas_Tech_DB;

SELECT * FROM ventas;

-- =============================================
-- 1. QUERY N°1
-- =============================================

SELECT 
	COUNT(DISTINCT id_venta) as cantidad_de_pedidos,
	SUM(cantidad * precio_unitario) as total_facturado,
	SUM(cantidad * precio_unitario) / COUNT(DISTINCT id_venta) as ticket_promedio,
	MONTH(fecha_venta) as mes
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- =============================================
-- 1. QUERY N°2
-- =============================================

SELECT TOP 5
	id_producto,
	SUM(cantidad) as unidades_vendidas,
	SUM(cantidad * precio_unitario) as total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

-- =============================================
-- 1. QUERY N°3
-- =============================================

SELECT 
	id_cliente,
	COUNT(*) as cantidad_de_pedidos,
	SUM(cantidad * precio_unitario) as total_gastado
FROM ventas
GROUP BY id_cliente 
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- =============================================
-- 1. QUERY N°4
-- =============================================

SELECT 
	SUM(cantidad * precio_unitario) as total_facturado,
	MONTH(fecha_venta) as mes,
	CASE 
		WHEN SUM(cantidad * precio_unitario) > AVG(SUM(cantidad * precio_unitario)) OVER()
			THEN 'Por encima'
			ELSE 'Por debajo'
		END as comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- =============================================
-- 1. BLOQUE DE CIERRE
-- =============================================

-- EL producto n°1 genero el 56% de la facturación total de marzo
-- El cliente n°1 genero el 41% de la facturación total de marzo
-- Las ventas del caso solo se realizaron en un mes, por lo que la consulta n°4 no puede calcular correctamente