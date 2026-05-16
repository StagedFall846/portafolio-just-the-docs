---
layout: default
title: "Capítulo 4: Computación Evolutiva y Aprendizaje Reforzado"
nav_order: 8
has_children: true
---

# Capítulo 4: Computación Evolutiva y Aprendizaje Reforzado

En este capítulo se explora el diseño e implementación de algoritmos inspirados en la biología natural y el comportamiento adaptativo. A diferencia de los métodos de optimización clásicos basados en gradientes, estos enfoques permiten manejar espacios de búsqueda complejos, multimodales o discontinuos, siendo herramientas fundamentales para el control de sistemas dinámicos inestables y la toma de decisiones autónoma.

## Fundamentos de la Evolución y el Aprendizaje
Tanto un algoritmo evolutivo como un agente de aprendizaje interactúan y se adaptan a su entorno mediante procesos iterativos que constan de cuatro etapas conceptuales:
1. **Inicialización y Estado:** Definición de una población de soluciones candidatas o evaluación del estado actual del entorno por parte del agente.
2. **Selección e Inferencia:** Preferencia por las mejores soluciones basada en su aptitud (*fitness*) o selección de la mejor acción basada en una política de control.
3. **Operación y Exploración:** Generación de nuevas características (mediante cruce y mutación) o exploración de nuevas acciones en el entorno.
4. **Evaluación y Recompensa:** Medición del desempeño de las nuevas soluciones o recepción de una señal de recompensa para ajustar los pesos del aprendizaje.

## Contenido del Capítulo
A continuación, se presentan las implementaciones prácticas desarrolladas:

### 1. El modelo del aprendizaje reforzado (Sección 4.1.2)
* **modelo3_claseSemana5** y **modelo4_claseSemana5:** Diferentes versiones de agentes entrenados en entornos de simulación para comprender la dinámica de toma de decisiones y la evolución de sus políticas de control.

### 2. Señal de recompensa (Sección 4.1.3)
* **generarRecompensa:** El código encargado de definir matemáticamente qué comportamientos del agente son deseables y cuáles deben penalizarse durante el proceso iterativo de entrenamiento.

### 3. Agentes y entornos: Ejemplos aplicados (Sección 4.2.1)
* **pendulo_rnn:** Control de un péndulo simple, un entorno clásico y fundamental para probar la convergencia de algoritmos de aprendizaje por refuerzo.
* **PenduloDoble_ANN_2024a:** Un sistema mecatrónico altamente no lineal y complejo que requiere estrategias de aprendizaje avanzadas y redes neuronales artificiales para mantener el equilibrio dinámico.

---

> **Nota Técnica:** Los ejercicios incluidos combinan el comportamiento exploratorio estocástico (similar a la mutación en algoritmos genéticos) con la explotación del conocimiento acumulado (entrenamiento de la red). Estos métodos son particularmente efectivos para sistemas donde el modelado matemático analítico es demasiado complejo.

Utiliza el menú lateral para explorar cada archivo y sus resultados de convergencia.
