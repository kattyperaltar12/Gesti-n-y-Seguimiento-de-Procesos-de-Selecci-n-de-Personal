USE Seguimiento_Seleccion_de_Personal;
GO

----Insercion de datos

SELECT COUNT(*) AS total_procesos
FROM ProcesoSeleccion;

SELECT COUNT(*) AS total_postulantes
FROM Postulante;

SELECT COUNT(*) AS total_puestos
FROM PuestoConvocado;

SELECT estado_postulacion, COUNT(*) AS cantidad
FROM Postulacion
GROUP BY estado_postulacion;

-----
SELECT profesion,
       AVG(experiencia_general) AS promedio_experiencia_general,
       AVG(experiencia_especifica) AS promedio_experiencia_especifica
FROM Postulante
GROUP BY profesion;

SELECT ps.unidad_solicitante, SUM(pc.cantidad_vacantes) AS total_vacantes
FROM ProcesoSeleccion ps
JOIN PuestoConvocado pc ON ps.id = pc.id_proceso
GROUP BY ps.unidad_solicitante;

SELECT estado, COUNT(*) AS cantidad
FROM ProcesoSeleccion
GROUP BY estado;

SELECT condicion_especial, COUNT(*) AS cantidad
FROM Postulante
WHERE condicion_especial IS NOT NULL AND condicion_especial <> ''
GROUP BY condicion_especial;

------

SELECT 
  CAST(SUM(CASE WHEN estado_postulacion = 'Cancelado' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS porcentaje_cancelados
FROM Postulacion;

SELECT 
  CAST(SUM(CASE WHEN estado_postulacion = 'Cancelado' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS porcentaje_cancelados
FROM Postulacion;

SELECT estado_final,
       COUNT(*) AS cantidad,
       AVG(puntaje_total) AS promedio_puntaje
FROM ResultadoFinal
GROUP BY estado_final;

SELECT ps.id AS id_proceso,
       ps.convocatoria,
       SUM(pc.cantidad_vacantes) AS total_vacantes,
       COUNT(DISTINCT po.id_postulante) AS total_postulantes,
       CAST(COUNT(DISTINCT po.id_postulante) * 1.0 / SUM(pc.cantidad_vacantes) AS DECIMAL(5,2)) AS indice_cobertura
FROM ProcesoSeleccion ps
JOIN PuestoConvocado pc ON ps.id = pc.id_proceso
JOIN Postulacion po ON pc.id = po.id_puesto
GROUP BY ps.id, ps.convocatoria;






