 🧩 Caso: Sistema de Gestión y Seguimiento de Procesos de Selección de Personal

---

## 🏛️ Contexto

La Oficina de Recursos Humanos necesita un sistema integral que permita registrar y hacer seguimiento de los procesos de selección de personal en todas sus etapas. El sistema debe cubrir desde la convocatoria hasta la selección final, manteniendo trazabilidad de puestos, postulantes, evaluaciones, resultados y cobertura de vacantes, promoviendo la transparencia y eficiencia institucional.

Actualmente, estos procesos se gestionan de manera descentralizada, dificultando el control de postulaciones, tiempos de respuesta y métricas de desempeño.

---

## 🎯 Objetivos del sistema

- Registrar procesos de selección y puestos convocados.
- Vincular postulantes con los puestos a los que aplican.
- Registrar puntajes por etapa (CV, técnica, entrevista, etc.).
- Calcular resultados finales y orden de mérito.
- Controlar cobertura de vacantes y tiempos por etapa.
- Obtener reportes e indicadores clave de eficiencia del proceso.

---

## 📦 Entidades y relaciones clave

### 🟦 1. ProcesoSeleccion
- `id_proceso` (PK)
- convocatoria
- fecha_inicio  
- fecha_fin  
- unidad_solicitante  
- estado (en curso, finalizado, cancelado)  
🔗 1:N con `PuestoConvocado`

### 🟦 2. PuestoConvocado
- `id_puesto` (PK)  
- `id_proceso` (FK)  
- nombre_puesto  
- cantidad_vacantes  
- tipo_contrato (CAS, 728, etc.)  
- unidad  
- nivel_remunerativo  
🔗 1:N con `Postulacion`

### 🟦 3. Responsable
- `id_proceso` (PK)  
- `DNI_resposale`
- nombre
- apellidos
- cargo
- correo
- fecha asignacion
🔗 1:N con `PocesoSeleccion`

### 🟦 4. Postulante (versión mejorada)
- `dni` (PK)  
- nombres  
- apellidos  
- correo  
- telefono  
- sexo (opcional)  
- fecha_nacimiento  
- grado_academico  
- especialidad  
- experiencia_general  
- experiencia_especifica  
- cv_documentado (booleano)  
- condicion_especial (opcional: discapacidad, reasignado, etc.)
🔗 1:N con `Postulacion`

### 🟦 5. Postulacion
- `id_postulacion` (PK)  
- `id_puesto` (FK)  
- `dni` (FK)  
- fecha_postulacion  
- estado_postulacion (admitido, descalificado, seleccionado, en evaluación)  
🔗 1:N con `EvaluacionEtapa`  
🔗 1:1 con `ResultadoFinal` (opcional)

### 🟦 6. EvaluacionEtapa
- `id_evaluacion` (PK)  
- `id_postulacion` (FK)  
- etapa (CV, técnica, entrevista, psicológica, etc.)  
- puntaje  
- observaciones  
- fecha  

### 🟦 7. ResultadoFinal
- `id_postulacion` (PK/FK)  
- puntaje_total  
- orden_merito  
- estado_final (apto, no apto, lista espera, desierta)

---

## 📘 Reglas de negocio

- Cada proceso puede convocar uno o más puestos.
- Cada puesto tiene una cantidad de vacantes limitadas.
- Cada postulante puede aplicar a múltiples puestos.
- Cada postulación debe tener al menos una evaluación (CV).
- Solo pueden seleccionarse tantos postulantes como vacantes disponibles.
- El orden de mérito se calcula con base en puntajes ponderados.

---

## 💡 Consultas clave

- ¿Cuántos postulantes aplicaron a cada puesto?  
- ¿Qué porcentaje fue admitido o descalificado en etapa curricular?  
- ¿Qué postulante obtuvo el mayor puntaje final?  
- ¿Qué puestos quedaron desiertos?  
- ¿Qué grado académico predomina entre los postulantes seleccionados?

---

## 📊 Indicadores sugeridos

- Tasa de cobertura de vacantes  
- Tiempo promedio por proceso  
- Puntaje promedio por etapa  
- Tasa de descalificación por etapa  
- Participación femenina o por grupos etarios

---

## ✅ Modelo E/R lógico
![image](https://github.com/user-attachments/assets/1dc131d2-3615-460d-b181-fc8a47dd36f5)

## ✅ BD designer
![image](https://github.com/user-attachments/assets/dc38ca00-8860-4fdd-8a10-edc14bc97f54)

## ✅ Modelo físico
![image](https://github.com/user-attachments/assets/cd2d4a7f-feac-49e4-8c6d-6f59e47e428f)






