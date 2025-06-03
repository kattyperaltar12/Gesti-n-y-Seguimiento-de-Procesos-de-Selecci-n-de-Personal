USE Seguimiento_Seleccion_de_Personal;
GO

-- Tabla: ProcesoSeleccion
INSERT INTO ProcesoSeleccion (convocatoria, fecha_inicio, fecha_fin, unidad_solicitante, estado) VALUES
('Convocatoria 100-2025', '2025-04-16', '2025-06-15', 'Informática', 'Desierto'),
('Convocatoria 101-2025', '2025-02-24', '2025-04-27', 'Logística', 'En proceso'),
('Convocatoria 102-2025', '2025-01-03', '2025-03-10', 'Informática', 'Desierto'),
('Convocatoria 103-2025', '2025-02-01', '2025-03-18', 'Planeamiento', 'Stand By'),
('Convocatoria 104-2025', '2025-02-20', '2025-06-15', 'Logística', 'Desierto'),
('Convocatoria 105-2025', '2025-05-22', '2025-05-24', 'Contabilidad', 'Culminado'),
('Convocatoria 106-2025', '2025-01-09', '2025-08-21', 'Atención al Ciudadano', 'Culminado'),
('Convocatoria 107-2025', '2025-04-18', '2025-04-05', 'Logística', 'Desierto'),
('Convocatoria 108-2025', '2024-12-26', '2024-12-09', 'Logística', 'Culminado'),
('Convocatoria 109-2025', '2025-02-24', '2025-04-29', 'Contabilidad', 'Desierto'),
('Convocatoria 110-2025', '2025-01-25', '2025-08-30', 'RRHH', 'En proceso'),
('Convocatoria 111-2025', '2025-03-21', '2025-05-24', 'Contabilidad', 'En proceso'),
('Convocatoria 112-2025', '2025-03-11', '2024-12-17', 'RRHH', 'Stand By'),
('Convocatoria 113-2025', '2025-08-11', '2024-12-12', 'Logística', 'Stand By'),
('Convocatoria 114-2025', '2025-04-10', '2025-06-29', 'Logística', 'Culminado');

-- Tabla: Responsable
INSERT INTO Responsable (id_proceso, DNI_responsable, nombres, apellidos, cargo, correo, fecha_asignacion) VALUES
(15, '35591816', 'Carlos', 'Ramírez', 'Responsable de Área', 'carlosjuan-jose@almagro.es', '2025-07-06'),
(9, '93980634', 'Lucía', 'Mendoza', 'Responsable de Área', 'morantemarc@hotmail.com', '2025-07-20'),
(8, '20696234', 'Luis', 'Vega', 'Responsable de Área', 'bibiana23@ferrero.es', '2025-08-22'),
(11, '24077318', 'Ana', 'Salas', 'Responsable de Área', 'anastasiacarranza@hotmail.com', '2025-05-31'),
(14, '79365860', 'Jorge', 'Paredes', 'Responsable de Área', 'estebanraimundo@llorente-diez.com', '2025-01-15');

-- Tabla: PuestoConvocado
INSERT INTO PuestoConvocado (id_proceso, nombre_puesto, cantidad_vacantes, tipo_contrato, unidad, nivel_remunerativo) VALUES
(13, 'Asistente Dolores', 1, 'CAS', 'Contabilidad', '6685'),
(14, 'Técnico Exercitationem', 2, 'CAS', 'Contabilidad', '5870'),
(1, 'Asistente Accusantium', 3, 'CAS', 'Logística', '5124'),
(12, 'Técnico Sint', 1, 'CAS', 'Tesorería', '3917'),
(12, 'Asistente Atque', 3, 'CAS', 'Contabilidad', '6761'),
(10, 'Analista Autem', 2, 'CAS', 'Logística', '6209'),
(6, 'Analista Blanditiis', 3, 'CAS', 'RRHH', '3551'),
(14, 'Especialista Ullam', 2, 'CAS', 'Contabilidad', '5275'),
(6, 'Especialista Consequuntur', 3, 'CAS', 'Tesorería', '5283'),
(3, 'Asistente Porro', 3, 'CAS', 'Logística', '5404'),
(7, 'Asistente Consequuntur', 2, 'CAS', 'Tesorería', '6902'),
(15, 'Analista Illum', 2, 'CAS', 'Logística', '4498'),
(13, 'Especialista Repudiandae', 3, 'CAS', 'Logística', '4877'),
(1, 'Especialista Reprehenderit', 2, 'CAS', 'Tesorería', '5497'),
(4, 'Asistente Ut', 2, 'CAS', 'RRHH', '4645'),
(15, 'Asistente Recusandae', 3, 'CAS', 'Contabilidad', '5616'),
(4, 'Analista Ex', 1, 'CAS', 'Logística', '5501'),
(9, 'Técnico Praesentium', 3, 'CAS', 'Logística', '6145'),
(12, 'Especialista Occaecati', 2, 'CAS', 'Contabilidad', '3881'),
(5, 'Técnico Accusamus', 2, 'CAS', 'Tesorería', '4754');

-- Tabla: Postulante
INSERT INTO Postulante (DNI, nombres, apellidos, correo, telefono, sexo, fecha_nacimiento, grado_academico, profesion, experiencia_general, experiencia_especifica, cv_documentado, condicion_especial) VALUES
('65256895', 'Tamara', 'Rico', 'clago@priego-galindo.com', '+34711974911', 'Femenino', '1990-04-21', 'Titulado', 'Ingeniería', 5.78, 2.41, 1, ''),
('56267981', 'Renato', 'Gomila', 'jmedina@yahoo.com', '+34714 60 28 93', 'Femenino', '1972-08-09', 'Titulado', 'Derecho', 3.26, 1.04, 0, ''),
('45183273', 'Ramona', 'Carballo', 'pontmelania@cabanas.es', '+34 983807023', 'Masculino', '1979-03-29', 'Maestría', 'Ingeniería', 9.56, 3.61, 0, ''),
('41670876', 'Jenaro', 'Ferrero', 'torremelania@hervia-feliu.es', '+34742 06 75 63', 'Femenino', '1985-08-03', 'Titulado', 'Ingeniería', 9.79, 2.86, 1, ''),
('19650670', 'Clemente', 'Calderón', 'yaiza46@laguna-escolano.es', '+34747944080', 'Masculino', '1999-08-08', 'Titulado', 'Administración', 4.25, 1.86, 0, ''),
('28453181', 'Silvio', 'Cantón', 'pardodaniela@rosell.org', '+34817 462 326', 'Masculino', '1978-09-06', 'Bachiller', 'Ingeniería', 3.63, 4.75, 1, ''),
('60299055', 'Lucas', 'Rodriguez', 'pacificarodriguez@hotmail.com', '+34 708 755 671', 'Masculino', '1979-02-12', 'Maestría', 'Derecho', 5.22, 2.48, 0, ''),
('84768900', 'María Ángeles', 'Carretero', 'marmolricarda@hotmail.com', '+34 710 97 28 38', 'Femenino', '1994-04-06', 'Titulado', 'Contabilidad', 8.4, 2.3, 0, 'Licencia militar'),
('66537083', 'Isaura', 'Luna', 'flaviolara@hotmail.com', '+34 984796441', 'Masculino', '1979-12-18', 'Bachiller', 'Administración', 8.3, 4.77, 0, ''),
('93702574', 'Omar', 'Baeza', 'nieves24@hotmail.com', '+34 846 137 811', 'Masculino', '1995-06-03', 'Maestría', 'Economía', 6.46, 4.06, 0, 'Licencia militar'),
('34797927', 'Pepita', 'Aranda', 'benaventesalome@guijarro.org', '+34703 822 416', 'Femenino', '1978-06-09', 'Titulado', 'Economía', 3.68, 3.15, 1, ''),
('39184859', 'Wilfredo', 'Cortina', 'ocanaanibal@hotmail.com', '+34712 130 712', 'Masculino', '1985-04-16', 'Maestría', 'Contabilidad', 9.53, 1.44, 0, ''),
('16034330', 'Ramón', 'Folch', 'selenaarroyo@gmail.com', '+34 893685727', 'Masculino', '1975-08-05', 'Bachiller', 'Administración', 2.56, 0.84, 0, 'Discapacidad leve'),
('31524070', 'Damián', 'Solís', 'angeles86@leon.es', '+34 809 61 76 78', 'Femenino', '1979-12-19', 'Maestría', 'Ingeniería', 5.23, 0.65, 1, ''),
('45769991', 'Victoria', 'Galiano', 'consuelo63@miralles.es', '+34746933021', 'Femenino', '1975-07-24', 'Bachiller', 'Administración', 9.32, 4.05, 0, 'Discapacidad leve'),
('75038196', 'Cornelio', 'Pombo', 'fpelayo@cuellar.org', '+34 712 779 890', 'Masculino', '1985-04-11', 'Maestría', 'Administración', 6.83, 4.59, 0, ''),
('46578743', 'Gala', 'Gisbert', 'fabiopuente@somoza.org', '+34 736 11 77 46', 'Masculino', '1997-09-30', 'Bachiller', 'Derecho', 6.36, 4.21, 1, 'Discapacidad leve'),
('90989961', 'Abril', 'Galvez', 'isernvictor-manuel@gmail.com', '+34 742 41 05 13', 'Masculino', '1994-06-26', 'Titulado', 'Derecho', 7.3, 4.74, 1, 'Discapacidad leve'),
('21421479', 'Macario', 'Morcillo', 'larreamatias@yahoo.com', '+34896 13 50 44', 'Masculino', '1983-12-18', 'Maestría', 'Contabilidad', 9.0, 3.81, 1, ''),
('27272189', 'Aura', 'Montero', 'lobonilo@gmail.com', '+34732 750 416', 'Masculino', '1976-07-27', 'Bachiller', 'Ingeniería', 6.28, 0.59, 1, 'Licencia militar'),
('57604693', 'Rosa', 'Castells', 'peraltalalo@sales.es', '+34 735 01 89 99', 'Masculino', '1977-08-20', 'Bachiller', 'Economía', 5.67, 2.49, 1, ''),
('33124330', 'Celso', 'Acuña', 'kreig@yahoo.com', '+34 854724087', 'Femenino', '1999-03-26', 'Maestría', 'Economía', 9.72, 2.62, 1, ''),
('42483341', 'Andrea', 'Llopis', 'felicidad38@cortina.es', '+34939 29 64 04', 'Femenino', '1993-11-19', 'Maestría', 'Contabilidad', 8.72, 1.98, 1, ''),
('58579407', 'Tito', 'Coloma', 'cobojeronimo@yahoo.com', '+34 706 524 476', 'Femenino', '1999-07-17', 'Maestría', 'Contabilidad', 5.09, 1.92, 1, ''),
('81314117', 'Petrona', 'Millán', 'ingrid24@gmail.com', '+34 730 473 663', 'Femenino', '2001-06-10', 'Maestría', 'Contabilidad', 6.92, 2.94, 1, ''),
('99343518', 'Rosaura', 'Baena', 'ambar46@cabello.org', '+34744498448', 'Masculino', '1983-04-21', 'Maestría', 'Derecho', 6.6, 2.74, 1, ''),
('20510235', 'Quique', 'Infante', 'badiabrigida@yahoo.com', '+34 863188435', 'Masculino', '1996-08-11', 'Titulado', 'Ingeniería', 2.18, 1.8, 1, ''),
('25449233', 'Eugenio', 'Borrego', 'pascualaabascal@hotmail.com', '+34715 554 448', 'Masculino', '1973-10-02', 'Maestría', 'Ingeniería', 8.19, 3.69, 1, 'Licencia militar'),
('83098672', 'Chelo', 'Rocamora', 'jaureguiale@hotmail.com', '+34 659909700', 'Masculino', '1978-09-15', 'Maestría', 'Economía', 1.84, 4.97, 0, 'Discapacidad leve'),
('13865253', 'Anna', 'Cruz', 'vilasalvador@arana.es', '+34917736384', 'Masculino', '1973-11-28', 'Maestría', 'Administración', 5.49, 3.72, 1, 'Discapacidad leve'),
('78821101', 'Marc', 'Ibáñez', 'dafneuria@sandoval-muro.net', '+34 877 99 66 26', 'Femenino', '1970-09-16', 'Titulado', 'Administración', 5.11, 1.15, 0, 'Licencia militar'),
('44535001', 'Irma', 'Diego', 'vilarroxana@estevez.com', '+34720547548', 'Masculino', '1983-05-04', 'Bachiller', 'Derecho', 7.95, 4.34, 1, 'Licencia militar'),
('65170438', 'Emilia', 'Giménez', 'alegremayte@calzada.es', '+34 949 22 82 96', 'Femenino', '1973-09-27', 'Bachiller', 'Derecho', 7.53, 4.27, 1, ''),
('92343482', 'Juan Antonio', 'Gras', 'rolando99@hotmail.com', '+34716 117 069', 'Femenino', '1995-12-24', 'Maestría', 'Economía', 4.11, 2.98, 1, 'Discapacidad leve'),
('98380410', 'Palmira', 'Diaz', 'narcisajuan@hotmail.com', '+34 827521615', 'Femenino', '1989-10-24', 'Bachiller', 'Administración', 6.15, 1.55, 1, ''),
('67213728', 'Bernardo', 'Porcel', 'juanaamaya@noriega.com', '+34 616 314 051', 'Femenino', '1995-11-19', 'Maestría', 'Economía', 7.35, 4.15, 1, ''),
('56997392', 'Araceli', 'Camps', 'vallesjose-carlos@gutierrez.com', '+34631666234', 'Femenino', '1989-08-22', 'Bachiller', 'Administración', 5.52, 3.16, 0, 'Discapacidad leve'),
('97867816', 'Dan', 'Arana', 'xvazquez@gmail.com', '+34 856173497', 'Masculino', '1974-12-07', 'Maestría', 'Economía', 1.14, 1.15, 0, ''),
('93554005', 'Enrique', 'Toro', 'morenoquintana@yahoo.com', '+34734 368 353', 'Femenino', '1982-10-16', 'Titulado', 'Derecho', 6.61, 2.29, 0, ''),
('75000514', 'Leocadia', 'Manzano', 'ezequielquerol@diaz-galvan.es', '+34 723 042 933', 'Femenino', '1999-11-26', 'Titulado', 'Economía', 8.85, 0.66, 0, ''),
('85371223', 'Gonzalo', 'Cuevas', 'bellidojose-mari@barroso.com', '+34 709 178 219', 'Femenino', '1974-05-06', 'Bachiller', 'Contabilidad', 4.91, 0.94, 0, 'Discapacidad leve'),
('88425774', 'Socorro', 'Pedraza', 'herrerogabino@galvan.es', '+34742380737', 'Masculino', '1986-12-06', 'Maestría', 'Derecho', 9.13, 0.71, 0, ''),
('70462976', 'Natalia', 'Cámara', 'hserrano@yahoo.com', '+34 937 054 580', 'Femenino', '1992-02-27', 'Titulado', 'Economía', 2.31, 2.89, 0, ''),
('94570568', 'Leocadia', 'Torrens', 'batallavictorino@reguera.net', '+34741 518 231', 'Masculino', '1998-11-28', 'Bachiller', 'Ingeniería', 8.84, 3.29, 0, 'Discapacidad leve'),
('34855276', 'María José', 'Llabrés', 'eroca@sarabia.es', '+34827804547', 'Masculino', '2000-03-06', 'Bachiller', 'Economía', 6.74, 2.57, 0, 'Discapacidad leve'),
('37641758', 'Marisela', 'Bermejo', 'pacificaelias@hotmail.com', '+34727688180', 'Femenino', '1992-03-06', 'Maestría', 'Ingeniería', 2.42, 2.49, 1, 'Licencia militar'),
('25951617', 'Amancio', 'Caballero', 'grobles@trillo.org', '+34 701 29 21 22', 'Femenino', '1989-08-03', 'Maestría', 'Economía', 7.21, 2.56, 1, ''),
('32509094', 'Yolanda', 'Segovia', 'murilloevangelina@gmail.com', '+34 702 93 96 37', 'Femenino', '1994-02-28', 'Titulado', 'Contabilidad', 3.13, 3.07, 1, ''),
('93112308', 'Adalberto', 'Casas', 'adelinaalarcon@yahoo.com', '+34733 566 641', 'Masculino', '1979-03-23', 'Maestría', 'Economía', 3.47, 3.05, 0, 'Licencia militar'),
('76372349', 'Leopoldo', 'Vall', 'vicentellorens@clavero.com', '+34744079278', 'Femenino', '1997-12-04', 'Titulado', 'Administración', 6.46, 2.09, 0, 'Licencia militar');

-- Tabla: Postulacion
INSERT INTO Postulacion (id_puesto, id_postulante, fecha_postulacion, estado_postulacion) VALUES
(9, 44, '2025-03-18', 'Registrado'),
(4, 41, '2025-01-26', 'Registrado'),
(10, 29, '2025-08-20', 'Registrado'),
(19, 24, '2025-07-26', 'Registrado'),
(3, 19, '2025-01-13', 'Cancelado'),
(14, 12, '2025-03-28', 'Registrado'),
(5, 35, '2025-06-13', 'Cancelado'),
(17, 33, '2025-08-24', 'Cancelado'),
(6, 17, '2025-04-26', 'Cancelado'),
(10, 48, '2025-01-17', 'Cancelado'),
(4, 30, '2024-12-28', 'Registrado'),
(5, 49, '2025-05-15', 'Registrado'),
(13, 36, '2025-04-17', 'Cancelado'),
(3, 26, '2025-04-19', 'Registrado'),
(9, 35, '2025-08-18', 'Registrado');


-- Tabla: EvaluacionEtapa
INSERT INTO EvaluacionEtapa (id_postulacion, etapa, observaciones, fecha) VALUES
(1, 'Etapa Técnica', 'Evaluación satisfactoria', '2024-12-18'),
(2, 'Etapa Entrevista', 'Evaluación satisfactoria', '2025-05-31'),
(3, 'Etapa Entrevista', 'Evaluación satisfactoria', '2025-08-13'),
(4, 'Etapa Entrevista', 'Evaluación satisfactoria', '2025-05-17'),
(5, 'Etapa CV', 'Evaluación satisfactoria', '2025-02-16'),
(6, 'Etapa Técnica', 'Evaluación satisfactoria', '2025-07-12'),
(7, 'Etapa Entrevista', 'Evaluación satisfactoria', '2025-01-17'),
(8, 'Etapa Entrevista',  'Evaluación satisfactoria', '2025-04-16'),
(9, 'Etapa CV', 'Evaluación satisfactoria', '2025-04-24'),
(10, 'Etapa Técnica', 'Evaluación satisfactoria', '2024-12-17'),
(11, 'Etapa Técnica', 'Evaluación satisfactoria', '2025-01-02'),
(12, 'Etapa CV', 'Evaluación satisfactoria', '2025-03-06'),
(13, 'Etapa CV', 'Evaluación satisfactoria', '2025-06-26'),
(14, 'Etapa Técnica', 'Evaluación satisfactoria', '2025-03-06'),
(15, 'Etapa CV', 'Evaluación satisfactoria', '2025-03-19');

-- Tabla: ResultadoFinal
INSERT INTO ResultadoFinal (id_postulacion, puntaje_total, orden_merito, estado_final) VALUES
(1, 18, 1, 'Ganador'),
(2, 16.7, 2, 'Accesitario 1'),
(3, 14.19, 3, 'Accesitario 2'),
(4, 15, 4, 'Accesitario 3'),
(5, 15, 5, 'Accesitario 4'),
(6, 19.52, 6, 'Desierto'),
(7, 14.43, 7, 'Accesitario 6'),
(8, 10.99, 8, 'Accesitario 7'),
(9, 19.78, 9, 'Accesitario 8'),
(10, 11.9, 10, 'Desierto'),
(11, 14.55, 11, 'Accesitario 10'),
(12, 15.97, 12, 'Desierto'),
(13, 12.44, 13, 'Desierto'),
(14, 10.69, 14, 'Accesitario 13'),
(15, 12.16, 15, 'Accesitario 14');