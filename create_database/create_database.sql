CREATE DATABASE Seguimiento_Seleccion_de_Personal;
GO

USE Seguimiento_Seleccion_de_Personal;
GO

-- Tabla: ProcesoSeleccion
CREATE TABLE ProcesoSeleccion (
    id INT PRIMARY KEY IDENTITY(1,1),
    convocatoria VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    unidad_solicitante VARCHAR(255),
    estado VARCHAR(50)
);

-- Tabla: Responsable
CREATE TABLE Responsable (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_proceso INT,
    DNI_responsable VARCHAR(20),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    cargo VARCHAR(100),
    correo VARCHAR(100),
    fecha_asignacion DATE,
    CONSTRAINT fk_responsable_proceso
        FOREIGN KEY (id_proceso) REFERENCES ProcesoSeleccion(id)
);

-- Tabla: PuestoConvocado
CREATE TABLE PuestoConvocado (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_proceso INT,
    nombre_puesto VARCHAR(100) NOT NULL,
    cantidad_vacantes INT,
    tipo_contrato VARCHAR(50),
    unidad VARCHAR(100),
    nivel_remunerativo VARCHAR(50),
    CONSTRAINT fk_puestoconvocado_proceso
        FOREIGN KEY (id_proceso) REFERENCES ProcesoSeleccion(id)
);

-- Tabla: Postulante
CREATE TABLE Postulante (
    id INT PRIMARY KEY IDENTITY(1,1),
    DNI VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20),
    sexo VARCHAR(10) CHECK (sexo IN ('Masculino', 'Femenino')),
    fecha_nacimiento DATE,
    grado_academico VARCHAR(100),
    profesion VARCHAR(100),
    experiencia_general DECIMAL(5,2),
    experiencia_especifica DECIMAL(5,2),
    cv_documentado BIT CHECK (cv_documentado IN (0,1)),
    condicion_especial VARCHAR(100)
);

-- Tabla: Postulacion
CREATE TABLE Postulacion (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_puesto INT,
    id_postulante INT, 
    fecha_postulacion DATE,
    estado_postulacion VARCHAR(50),
    CONSTRAINT fk_postulacion_puesto
        FOREIGN KEY (id_puesto) REFERENCES PuestoConvocado(id),
    CONSTRAINT fk_postulacion_postulante
        FOREIGN KEY (id_postulante) REFERENCES Postulante(id)
);

-- Tabla: EvaluacionEtapa
CREATE TABLE EvaluacionEtapa (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_postulacion INT,
    etapa VARCHAR(50),
    puntaje DECIMAL(5,2),
    observaciones TEXT,
    fecha DATE,
    CONSTRAINT fk_evaluacion_postulacion
        FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id)
);

-- Tabla: ResultadoFinal
CREATE TABLE ResultadoFinal (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_postulacion INT UNIQUE,
    puntaje_total DECIMAL(5,2),
    orden_merito INT,
    estado_final VARCHAR(50),
    CONSTRAINT fk_resultado_postulacion
        FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id)
);
