# RetailPro | Proyecto de Data Analytics

## Descripción del proyecto

**RetailPro** es un proyecto integral de análisis de datos desarrollado en el marco del programa de formación en Data Analytics. Su objetivo es analizar el comportamiento de las ventas, los clientes y los productos de un negocio minorista, transformando datos en información útil para la toma de decisiones comerciales.

El proyecto integra distintas etapas del proceso de análisis de datos: exploración y limpieza de información, modelado de bases de datos, consultas SQL, transformación de datos y creación de visualizaciones interactivas en Power BI.

Se busca identificar tendencias de ventas, evaluar el desempeño de productos y categorías, analizar el comportamiento de los clientes y generar insights que permitan detectar oportunidades de mejora para el negocio.

## Objetivos

- Analizar el desempeño comercial mediante indicadores de ventas.
- Identificar tendencias y variaciones en las ventas a lo largo del tiempo.
- Analizar el rendimiento de productos y categorías.
- Obtener información relevante sobre el comportamiento de los clientes.
- Diseñar un modelo de datos que facilite las consultas y el análisis.
- Construir dashboards interactivos para comunicar resultados y facilitar la toma de decisiones.

## Herramientas utilizadas

| Herramienta | Aplicación en el proyecto |
|---|---|
| **SQL Server** | Creación, almacenamiento y consulta de bases de datos. |
| **SQL Server Management Studio (SSMS)** | Administración de bases de datos y ejecución de consultas SQL. |
| **SQL** | Limpieza, extracción, transformación y análisis de datos mediante consultas. |
| **Power BI** | Modelado de datos, creación de indicadores y dashboards interactivos. |
| **Power Query** | Limpieza, transformación y preparación de los datos. |
| **Excel** | Exploración inicial y revisión de datos. |
| **GitHub** | Almacenamiento, organización y documentación del proyecto. |

## Desarrollo del proyecto

El proyecto se organiza en las siguientes etapas:

### 1. Exploración y preparación de datos (EDA)

Se realiza una exploración inicial de los datos para comprender su estructura, identificar inconsistencias y evaluar su calidad.

Se revisan valores nulos, registros duplicados, formatos de fechas y tipos de datos. Posteriormente, se seleccionan y preparan las variables necesarias para el análisis.

### 2. Modelado de datos

Se diseña una estructura relacional para organizar la información comercial y facilitar el análisis.

Las principales entidades consideradas son:

- **Clientes:** información de los clientes.
- **Ventas:** registro de las operaciones comerciales.
- **Productos:** información de los productos vendidos.
- **Categorías:** clasificación de los productos.

Se establecen relaciones mediante claves primarias y foráneas, garantizando la integridad y consistencia de los datos.

### 3. Consultas SQL

Se desarrollan consultas para extraer, relacionar y analizar información de distintas tablas.

Entre los análisis realizados se incluyen:

- Resumen ejecutivo mensual de ventas.
- Ranking de productos según unidades vendidas y facturación.
- Análisis de ventas y comportamiento de clientes.
- Integración de información mediante INNER JOIN.
- Cálculo de indicadores comerciales.
- Filtrado, agrupamiento y ordenamiento de resultados.

También se revisan las consultas para mejorar su legibilidad, mantenimiento y rendimiento.

### 4. Transformación de datos (Power Query)

Se utiliza Power Query para preparar y transformar los datos antes de su incorporación al modelo de Power BI.

Se realizan tareas de limpieza, modificación de tipos de datos, eliminación de inconsistencias y adecuación de las tablas para el análisis.

### 5. Modelado y visualización (Power BI)

Se construye un modelo de datos que permite relacionar las distintas entidades y desarrollar indicadores comerciales.

Se implementan medidas mediante DAX para calcular métricas como:

- Total de ventas.
- Ventas por período.
- Cantidad de operaciones.
- Unidades vendidas.
- Evolución de ventas.
- Comparaciones entre períodos.

Finalmente, se desarrollan visualizaciones y dashboards interactivos para facilitar la interpretación de los resultados.

### 6. Generación de insights y conclusiones

A partir de los resultados obtenidos mediante SQL y Power BI, se identifican patrones, tendencias y oportunidades comerciales.

Se utiliza el storytelling con datos para comunicar los principales hallazgos y traducirlos en recomendaciones orientadas a la toma de decisiones.

## Estructura del repositorio

La siguiente estructura permite organizar los archivos del proyecto:

```text
RetailPro/
│
├── README.md
│
├── Dataset/
│   ├── datos_originales/
│   └── datos_procesados/
│
├── SQL/
│   ├── 01_creacion_base_datos.sql
│   ├── 02_creacion_tablas.sql
│   ├── 03_carga_datos.sql
│   ├── 04_consultas_analisis.sql
│   └── 05_vistas.sql
│
├── PowerBI/
│   └── RetailPro.pbix
│
└── Documentacion/
    ├── modelo_entidad_relacion.png
    ├── dashboard.png
    └── informe_final.pdf
```

*Nota: esta estructura es una propuesta de organización. Los nombres de los archivos deben adaptarse a los que efectivamente se encuentren en el repositorio.*

## Cómo ejecutar los scripts SQL

Para ejecutar los scripts del proyecto se requiere SQL Server y SQL Server Management Studio (SSMS).

**Requisitos previos**

- Tener SQL Server instalado y funcionando.
- Tener instalado SQL Server Management Studio.
- Contar con los archivos de datos originales o procesados incluidos en el proyecto.

**Procedimiento**

1. Abrir SQL Server Management Studio y conectarse a la instancia de SQL Server.
2. Abrir el archivo `01_creacion_base_datos.sql` y ejecutarlo para crear la base de datos.
3. Ejecutar `02_creacion_tablas.sql` para generar las tablas y establecer sus relaciones.
4. Ejecutar `03_carga_datos.sql` para incorporar los registros del dataset.
5. Ejecutar `04_consultas_analisis.sql` para obtener los resultados de los análisis comerciales.
6. Ejecutar `05_vistas.sql` para crear las vistas utilizadas en el proyecto, si corresponde.

**Importante:** si la carga de datos se realiza mediante archivos CSV o Excel, primero se deben importar los archivos a SQL Server o configurar las rutas correspondientes en los scripts de carga.

Los scripts deben ejecutarse respetando el orden indicado, ya que algunas operaciones dependen de la creación previa de tablas y relaciones.

## Resultados esperados

El desarrollo de RetailPro permite:

- Obtener una visión general del desempeño comercial.
- Identificar los productos que generan mayor facturación.
- Detectar diferencias entre volumen de unidades vendidas e ingresos generados.
- Analizar la evolución mensual de las ventas.
- Generar indicadores para evaluar el comportamiento del negocio.
- Comunicar hallazgos mediante visualizaciones e insights accionables.

## Competencias aplicadas

Este proyecto integra conocimientos y habilidades en:

- Análisis exploratorio de datos (EDA).
- Limpieza y transformación de datos.
- Diseño y modelado de bases de datos relacionales.
- SQL y consultas de análisis.
- Relaciones entre tablas y operaciones JOIN.
- Power Query y lenguaje M.
- Power BI y lenguaje DAX.
- Diseño de dashboards e indicadores KPI.
- Storytelling con datos.
- Interpretación de resultados y toma de decisiones basada en datos.

---

**Proyecto desarrollado como parte del programa de formación en Data Analytics.**
