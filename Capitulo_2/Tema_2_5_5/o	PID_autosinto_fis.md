# Simulación de Sintonía Automática de PID Difuso y Análisis de Desempeño  
## Proyecto: Evaluación de un Sistema Fuzzy Self-Tuning PID en Sistemas Dinámicos

---

## Objetivo general

Evaluar el desempeño de un sistema de inferencia difusa (FIS) tipo Mamdani aplicado a la sintonía automática de un controlador PID, analizando su capacidad para mejorar la respuesta dinámica de un sistema mediante simulación en MATLAB y su integración en Simulink.

---

## Objetivos de la práctica

- Analizar el comportamiento dinámico del sistema bajo control PID clásico vs PID difuso adaptativo.
- Evaluar la mejora en métricas de desempeño como:
  - Sobretiro (overshoot)
  - Tiempo de establecimiento
  - Error en estado estacionario
- Verificar la respuesta del sistema ante perturbaciones externas.
- Analizar el impacto del ajuste dinámico de \(K_p\), \(K_i\) y \(K_d\).
- Implementar el sistema difuso en Simulink para su integración en lazo cerrado.

---

## Descripción del ejercicio

En este ejercicio se implementa y evalúa un sistema de **sintonía automática difusa de un controlador PID**, utilizando un archivo `.fis` con arquitectura:

- 3 entradas:
  - Error \(e(t)\)
  - Derivada del error \(de/dt\)
  - Referencia \(r(t)\)

- 3 salidas:
  - \(K_p\)
  - \(K_i\)
  - \(K_d\)

El sistema utiliza un conjunto de **133 reglas difusas** que permiten ajustar las ganancias del controlador en tiempo real según el comportamiento dinámico del sistema.

---


