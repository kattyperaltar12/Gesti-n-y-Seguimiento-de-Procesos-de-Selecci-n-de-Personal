CREATE DATABASE Seguimiento_SelecciondePersonal
GO

USE Seguimiento_SelecciondePersonal;
GO


-- Tabla: ProcesoSeleccion
CREATE TABLE ProcesoSeleccion (
    id INTEGER PRIMARY KEY,
    convocatoria VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    unidad_solicitante VARCHAR(255),
    estado VARCHAR(50)
);

-- Tabla: Responsable
CREATE TABLE Responsable (
    id INTEGER PRIMARY KEY,
    id_proceso INTEGER,
    DNI_responsable VARCHAR(20),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    cargo VARCHAR(100),
    correo VARCHAR(100),
    fecha_asignacion VARCHAR(50),
    CONSTRAINT fk_responsable_proceso
        FOREIGN KEY (id_proceso) REFERENCES ProcesoSeleccion(id)
);

-- Tabla: PuestoConvocado
CREATE TABLE PuestoConvocado (
    id INTEGER PRIMARY KEY,
    id_proceso INTEGER,
    nombre_puesto VARCHAR(100),
    cantidad_vacantes INTEGER,
    tipo_contrato VARCHAR(50),
    unidad VARCHAR(100),
    nivel_remunerativo VARCHAR(50),
    CONSTRAINT fk_puestoconvocado_proceso
        FOREIGN KEY (id_proceso) REFERENCES ProcesoSeleccion(id)
);

-- Tabla: Postulante
CREATE TABLE Postulante (
    id INTEGER PRIMARY KEY,
    DNI VARCHAR(20) UNIQUE,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20),
    sexo VARCHAR(10),
    fecha_nacimiento DATE,
    grado_academico VARCHAR(100),
    profesion VARCHAR(100),
    experiencia_general DECIMAL(5,2),
    experiencia_especifica DECIMAL(5,2),
    cv_documentado BIT,
    condicion_especial VARCHAR(100)
);

-- Tabla: Postulacion
CREATE TABLE Postulacion (
    id INTEGER PRIMARY KEY,
    id_puesto INTEGER,
    id_postulante INTEGER,  -- <-- NUEVO
    fecha_postulacion DATE,
    estado_postulacion VARCHAR(50),
    CONSTRAINT fk_postulacion_puesto
        FOREIGN KEY (id_puesto) REFERENCES PuestoConvocado(id),
    CONSTRAINT fk_postulacion_postulante
        FOREIGN KEY (id_postulante) REFERENCES Postulante(id) -- <-- CLAVE PRIMARIA AHORA
);

-- Tabla: EvaluacionEtapa
CREATE TABLE EvaluacionEtapa (
    id INTEGER PRIMARY KEY,
    id_postulacion INTEGER,
    etapa VARCHAR(50),
    puntaje DECIMAL(5,2),
    observaciones TEXT,
    fecha DATE,
    CONSTRAINT fk_evaluacion_postulacion
        FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id)
);

-- Tabla: ResultadoFinal
CREATE TABLE ResultadoFinal (
    id INTEGER PRIMARY KEY,
    id_postulacion INTEGER UNIQUE,
    puntaje_total DECIMAL(5,2),
    orden_merito INTEGER,
    estado_final VARCHAR(50),
    CONSTRAINT fk_resultado_postulacion
        FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id)
);

CREATE TABLE Postulacion (
    id INTEGER PRIMARY KEY,
    id_puesto INTEGER,
    id_postulante INTEGER,  -- <-- NUEVO
    fecha_postulacion DATE,
    estado_postulacion VARCHAR(50),
    CONSTRAINT fk_postulacion_puesto
        FOREIGN KEY (id_puesto) REFERENCES PuestoConvocado(id),
    CONSTRAINT fk_postulacion_postulante
        FOREIGN KEY (id_postulante) REFERENCES Postulante(id) -- <-- CLAVE PRIMARIA AHORA
);

DROP TABLE Postulacion;
ALTER TABLE ResultadoFinal
DROP CONSTRAINT fk_resultado_postulacion;

ALTER TABLE EvaluacionEtapa
DROP CONSTRAINT fk_evaluacion_postulacion;
DROP TABLE Postulacion;
DROP TABLE IF EXISTS Postulacion;
CREATE TABLE Postulacion (
    id INTEGER PRIMARY KEY,
    id_puesto INTEGER,
    id_postulante INTEGER,  -- clave foránea correcta
    fecha_postulacion DATE,
    estado_postulacion VARCHAR(50),
    CONSTRAINT fk_postulacion_puesto
        FOREIGN KEY (id_puesto) REFERENCES PuestoConvocado(id),
    CONSTRAINT fk_postulacion_postulante
        FOREIGN KEY (id_postulante) REFERENCES Postulante(id)
);

ALTER TABLE ResultadoFinal
ADD CONSTRAINT fk_resultado_postulacion
FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id);

ALTER TABLE EvaluacionEtapa
ADD CONSTRAINT fk_evaluacion_postulacion
FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id);