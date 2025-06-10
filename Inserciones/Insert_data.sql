USE Seguimiento_Seleccion_de_Personal;
GO

-----ANEXOS: INFORME FINAL

----RRHH necesita saber la cantidad de postulantes por profesión:
SELECT profesion, COUNT(*) AS cantidad_postulantes
FROM Postulante
GROUP BY profesion
ORDER BY cantidad_postulantes DESC;

----La Gerencia General quiere visualizar solo las convocatorias vigentes
CREATE VIEW Vista_Convocatorias_Vigentes AS
SELECT *
FROM ProcesoSeleccion
WHERE estado = 'En proceso';

---Los evaluadores desean conocer los puestos con mayor cantidad de postulaciones canceladas
SELECT PC.nombre_puesto, COUNT(*) AS total_canceladas
FROM Postulacion PO
JOIN PuestoConvocado PC ON PO.id_puesto = PC.id
WHERE PO.estado_postulacion = 'Cancelado'
GROUP BY PC.nombre_puesto;

---Se desea calcular la edad de los postulantes para segmentarlos por edad
CREATE FUNCTION fn_EdadPostulante (@fecha_nacimiento DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());
END;

SELECT DNI, nombres, apellidos, 
       fecha_nacimiento,
       dbo.fn_EdadPostulante(fecha_nacimiento) AS edad
FROM Postulante;

---

SELECT 
  CASE 
    WHEN edad BETWEEN 18 AND 27 THEN '18 - 27'
    WHEN edad BETWEEN 28 AND 37 THEN '28 - 37'
    WHEN edad BETWEEN 38 AND 47 THEN '38 - 47'
    WHEN edad BETWEEN 48 AND 57 THEN '48 - 57'
    WHEN edad >= 58 THEN '58 o más'
    ELSE 'Sin edad válida'
  END AS rango_edad,
  COUNT(*) AS cantidad_postulantes
FROM (
  SELECT dbo.fn_EdadPostulante(fecha_nacimiento) AS edad
  FROM Postulante
) AS subconsulta
GROUP BY 
  CASE 
    WHEN edad BETWEEN 18 AND 27 THEN '18 - 27'
    WHEN edad BETWEEN 28 AND 37 THEN '28 - 37'
    WHEN edad BETWEEN 38 AND 47 THEN '38 - 47'
    WHEN edad BETWEEN 48 AND 57 THEN '48 - 57'
    WHEN edad >= 58 THEN '58 o más'
    ELSE 'Sin edad válida'
  END
ORDER BY rango_edad;

---Revisión de los postulantes mejor calificados
SELECT TOP 10 P.nombres, P.apellidos, RF.puntaje_total
FROM ResultadoFinal RF
JOIN Postulacion PO ON RF.id_postulacion = PO.id
JOIN Postulante P ON PO.id_postulante = P.id
ORDER BY RF.puntaje_total DESC;


----Detectar los puestos con mayor necesidad de personal
CREATE VIEW Vista_Puestos_MasVacantes AS
SELECT nombre_puesto, cantidad_vacantes, unidad
FROM PuestoConvocado
WHERE cantidad_vacantes > 2;

---Reporte de ganadores por convocatoria
CREATE PROCEDURE sp_ListarGanadoresPorProceso
  @id_proceso INT
AS
BEGIN
    SELECT P.nombres, P.apellidos, PC.nombre_puesto, RF.estado_final
    FROM ResultadoFinal RF
    JOIN Postulacion PO ON RF.id_postulacion = PO.id
    JOIN Postulante P ON PO.id_postulante = P.id
    JOIN PuestoConvocado PC ON PO.id_puesto = PC.id
    WHERE RF.estado_final = 'Ganador'
      AND PC.id_proceso = @id_proceso;
END;
EXEC sp_ListarGanadoresPorProceso @id_proceso = 6;

----Distribución por Sexo y Profesión
SELECT profesion, sexo, COUNT(*) AS total
FROM Postulante
GROUP BY profesion, sexo
ORDER BY profesion, sexo;

---Promedio de edad por profesión y sexo
SELECT profesion, sexo, 
       AVG(dbo.fn_EdadPostulante(fecha_nacimiento)) AS edad_promedio
FROM Postulante
GROUP BY profesion, sexo
ORDER BY profesion, sexo;





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






