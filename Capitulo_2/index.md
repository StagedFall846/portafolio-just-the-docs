---
layout: default
title: "Capítulo 2: Sistemas Difusos"
nav_order: 3
has_children: true
---

# Capítulo 2: Sistemas Difusos

En este capítulo se explora el diseño e implementación de sistemas basados en la **lógica difusa** (Fuzzy Logic). A diferencia de la lógica booleana tradicional, este enfoque permite manejar la incertidumbre y el razonamiento heurístico, siendo una herramienta poderosa para el control de sistemas no lineales y la toma de decisiones.

## Fundamentos del Sistema Difuso
Un sistema difuso actúa como un **aproximador universal**, mapeando variables de entrada a salidas mediante un proceso de cuatro etapas:
1. **Fuzzificación:** Conversión de entradas reales en grados de membresía.
2. **Inferencia:** Evaluación de reglas lingüísticas (*If-Then*).
3. **Agregación:** Combinación de las funciones resultantes.
4. **Defuzzificación:** Obtención de un valor numérico real (ej. mediante Centroide).



## Contenido del Capítulo
A continuación, se presentan las implementaciones prácticas desarrolladas (archivos `.fis`):

### 1. Controladores Difusos Adaptativos (Sección 2.5.2)
* **PID_autosinto.fis:** Un sistema de control PID cuyas ganancias ($K_p, K_i, K_d$) se ajustan dinámicamente en tiempo real mediante un motor de inferencia difuso. Ideal para plantas con parámetros cambiantes.

### 2. Controladores Convencionales y Comparativas (Sección 2.6)
* **PID_Derivado.fis:** Implementación enfocada en la optimización de la acción derivativa mediante lógica difusa para reducir el sobretiro (*overshoot*).
* **PID_para_RNN:** Estructura de control híbrida que compara el desempeño de un PID difuso frente a arquitecturas de Redes Neuronales Recurrentes.

---

> **Nota Técnica:** Los ejercicios incluidos utilizan tanto el modelo de **Mamdani** (intuitivo y lingüístico) como el de **Takagi-Sugeno** (eficiente para análisis matemático).

Utiliza el menú lateral para explorar cada archivo `.fis` y sus resultados de simulación en Simulink.
