---
layout: default
title: "Estructura de Control Base para Datos"
parent: "2.6 Controladores difusos convencionales (implícito)"
grand_parent: "Capítulo 2: Sistemas Difusos"
nav_order: 2
---

## Estructura de Control Base para Datos (`PID_para_RNN.slx`)

**Proyecto:** Modelo de Simulación y Adquisición de Datos para Entrenamiento de Redes Neuronales Recurrentes  
**Objetivo general:** Diseñar un entorno experimental en Simulink utilizando un controlador base para estabilizar la planta y extraer los vectores dinámicos de error y acción de control requeridos para el entrenamiento de una RNN.

---

## Objetivo de la práctica

- Configurar un lazo de control cerrado en Simulink que actúe como la planta experimental base.
- Sintonizar un controlador convencional/difuso que estabilice el sistema ante entradas tipo escalón.
- Exportar los vectores de entrada (torque/acción de control $u$) y los vectores de estado (error $e$ y posiciones $q$) al espacio de trabajo (*Workspace*) de MATLAB.
- Asegurar la persistencia y el muestreo correcto de los datos dinámicos para evitar problemas de desfase temporal en la red neuronal.

---

## Descripción del ejercicio

Este ejercicio consiste en la construcción de la arquitectura de simulación en Simulink que une la planta física (un robot articulado o sistema dinámico) con un controlador convencional optimizado. El propósito principal no es solo el análisis del control en lazo cerrado, sino la **generación de datos sintéticos de alta fidelidad**. 

El lazo de control se encarga de guiar al sistema hacia una referencia predefinida. Durante este proceso de estabilización y seguimiento, los bloques `To Workspace` interceptan de forma síncrona las señales clave de la simulación. Estos datos sirven como el "mapa de comportamiento" que una Red Neuronal Recurrente (RNN) requiere posteriormente para aprender e imitar de forma inteligente la dinámica inversa o el comportamiento del controlador en lazo cerrado.

### Estructura del sistema de adquisición

- **Entradas del Lazo:** Referencias de trayectoria/posición $[q_d]$
- **Variables Capturadas (Workspace):** Señal de control ($u$), vector de error ($e$) y estados de la planta ($q$)
- **Tipo de Simulación:** Tiempo continuo / Tiempo discreto con paso fijo (*Fixed-step*)
- **Propósito Final:** Generación de base de datos `.mat` para entrenamiento de arquitecturas RNN

---

### Variables del sistema

#### Entradas de la Planta / Salidas del Controlador:
- Action de Control ($u$) : `[-10 a 10] V` o `[N·m]` (dependiendo del actuador)  
- Señal de Referencia ($r$) : `[-5 a 5]` (unidades de posición/grados)  

#### Variables de Estado Monitoreadas:
- Vector de Error ($e$) : `[-10 a 10]` (Diferencia entre referencia y salida real)  
- Posición Angular Real ($q_0$) : `[-3.14 a 3.14] rad` (Respuesta dinámica del sistema)  

---

### Lógica de control y adquisición

El flujo de operaciones en el diagrama de bloques sigue una secuencia estrictamente temporizada:

- **Referencia $\rightarrow$ Comparador:** Se genera la señal de error dinámico continua $e(t) = r(t) - y(t)$.
- **Error $\rightarrow$ Controlador Base:** El bloque de control calcula la acción necesaria ($u$) para minimizar el error basándose en ganancias fijas o mapeo heurístico.
- **Acción de Control $\rightarrow$ Planta:** La señal $u$ excita los bloques dinámicos/función de transferencia de la planta mecatrónica.
- **Líneas de Intercepción $\rightarrow$ Workspace:** Las señales $u(t)$ y $e(t)$ se configuran en formato de *Array* o *Structure with time* con un periodo de muestreo constante $\Delta t$, garantizando la sincronía necesaria para algoritmos de aprendizaje de series temporales.

---

### Comportamiento esperado

- Estabilización completa de la planta ante perturbaciones y cambios de consigna tipo escalón en el tiempo estipulado.
- Generación de matrices con dimensiones idénticas y alineadas temporalmente en el espacio de trabajo de MATLAB.
- Ausencia de discontinuidades o datos perdidos (*NaN*) en los vectores de control exportados.

---

## Consideraciones importantes

### Periodo de Muestreo Constante
Es crítico configurar la simulación en Simulink con un solucionador de paso fijo (*Fixed-step solver*). Un paso variable destruye la estructura equidistante de los datos, volviendo los vectores inservibles para el entrenamiento de una Red Neuronal Recurrente.

### Rango de Excitación de Datos
El controlador base debe someter a la planta a una variedad amplia de movimientos y frecuencias (frecuentemente usando señales pseudoaleatorias o múltiples escalones). Si los datos de entrenamiento solo contienen una posición fija, la red neuronal no aprenderá la dinámica general del sistema.

### Formato de Exportación
Al configurar los bloques `To Workspace`, asegúrate de seleccionar el formato `2D Array` o `Matrix`. El formato por defecto `Timeseries` requiere un preprocesamiento adicional en MATLAB mediante comandos como `squeeze` antes de poder ingresar los datos a la *Neural Network Toolbox*.

---

[Descargar PID_para_RNN.slx](/assets/PID_para_RNN.slx){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
