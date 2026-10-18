USE Ventas_Tech_DB;

SELECT * FROM clientes;

-- =============================================
-- Consulta 1: Vista Base del Proyecto (INNER JOIN)
-- Proposito: integrar las ventas con la información de clientes,
-- productos y categorías para utilizarla como fuente en Power BI.
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

-- Hallazgo: nada en particular, cada venta tiene mas información.

-- =============================================
-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: identificar clientes registrados que nunca compraron,
-- para que el área de CRM pueda planificar acciones de contacto.
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

-- Hallazgo: no habia clientes sin ventas con los datos cargados

-- =============================================
-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Propósito: detectar productos del catálogo que no tienen ventas
-- registradas, para que el área de Producto evalúe su situación.
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

-- Hallazgo: no habia productos sin ventas con los datos cargados

-- =============================================
-- Consulta 4: Consolidado por canal (UNION ALL)
-- Propósito: comparar las ventas de dos períodos y calcular
-- el total facturado en cada uno.
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

-- Hallazgo: repartidas las ventas de forma pareja entre los dos canales, segun el criterio de separación.
