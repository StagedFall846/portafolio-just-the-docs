---
layout: default
title: "3.10.6 Implementación de la red"
parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
has_children: true
nav_order: 12
---


# Implementación Práctica en Código (MATLAB)

Esta subsección desglosa el flujo de trabajo computacional básico para pasar de la configuración teórica a un modelo ejecutable, resumiendo el proceso en cuatro comandos esenciales:

### 1. Definición de la Arquitectura (`feedforwardnet`)
Se inicializa la estructura de la red especificando su tamaño. En el código de ejemplo, se crea una red con dos capas ocultas (la primera con 5 neuronas y la segunda con 3).

### 2. Inspección Visual (`view`)
Genera un diagrama gráfico de la topología recién creada. Es un paso de validación para asegurar que las capas y conexiones son correctas antes de gastar recursos computacionales en el entrenamiento.

### 3. Ejecución del Aprendizaje (`train`)
Es el motor del proceso. Toma la red inicializada y ajusta sus pesos matemáticos iterativamente, procesando las matrices de datos de entrada (*Inputs*) contra las salidas que queremos que aprenda (*Targets*).

---

> ### ⚙️ 4. Exportación a Simulink (`gensim`)
> Es el paso definitivo para la ingeniería de control. Este comando traduce automáticamente la red neuronal ya entrenada a un bloque funcional de Simulink. Esto permite conectarla de inmediato en esquemas de lazo cerrado para simular su interacción con motores, sensores o plantas dinámicas completas.
