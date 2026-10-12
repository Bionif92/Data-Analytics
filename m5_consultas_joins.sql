USE Ventas_Tech_DB;

SELECT * FROM clientes;

-- =============================================
-- 1. QUERY N°1 - INNER JOIN
-- =============================================

SELECT 
	v.id_venta AS id_venta,
	v.fecha_venta AS fecha,
	v.cantidad AS cantidad,
	v.precio_unitario AS precio_unitario,
	v.cantidad * v.precio_unitario AS total_venta,
	c.nombre AS nombre_cliente,
	p.nombre_producto AS nombre_producto,
	cat.nombre_categoria AS categoria_producto
FROM ventas AS v
	INNER JOIN clientes AS c
		ON v.id_cliente = c.id_cliente
	INNER JOIN productos AS p
		ON v.id_producto = p.id_producto
	INNER JOIN categorias AS cat
		ON p.id_categoria = cat.id_categoria
ORDER BY id_venta ASC;

-- =============================================
-- 2. QUERY N°2 - LEFT JOIN CLIENTES SIN VENTAS
-- =============================================

SELECT 
	c.id_cliente AS id_cliente,
	c.nombre AS nombre_cliente,
	c.email AS email,
	c.fecha_registro AS fecha_registro
FROM clientes AS c
	LEFT JOIN ventas AS V
		ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL
ORDER BY id_cliente ASC;

-- =============================================
-- 3. QUERY N°3 - LEFT JOIN PRODUCTOS SIN VENTAS
-- =============================================

SELECT 
	p.id_producto AS id_producto,
	p.nombre_producto AS nombre_producto,
	p.precio AS precio,
	cat.nombre_categoria AS categoria
FROM productos AS p
	LEFT JOIN ventas AS v
		ON p.id_producto = v.id_producto
	INNER JOIN categorias AS cat
		ON p.id_categoria = cat.id_categoria
WHERE v.id_producto IS NULL
ORDER BY id_producto ASC;

-- =============================================
-- 4. QUERY N°4 - UNION ALL
-- =============================================

SELECT 
	canal, 
	SUM(total) AS total_canal
FROM (
    SELECT
		fecha_venta, 
		cantidad * precio_unitario AS total, 
		'Online' AS canal
    FROM ventas 
	WHERE fecha_venta < '2024-03-10'
    UNION ALL
    SELECT 
		fecha_venta, 
		cantidad * precio_unitario AS total, 
		'Presencial' AS canal
    FROM ventas 
	WHERE fecha_venta >= '2024-03-10'
) AS consolidado
GROUP BY canal;
