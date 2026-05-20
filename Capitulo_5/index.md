---
layout: default
title: "5.1 Búsqueda Básica"
parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
has_children: true
nav_order: 1
---

# Algoritmos Genéticos y Optimización Evolutiva

Este capítulo establece las bases matemáticas y computacionales para resolver problemas complejos de ingeniería donde las ecuaciones tradicionales se quedan cortas, utilizando la evolución biológica como motor de búsqueda.

## 1. Fundamentos de Optimización

* **El Objetivo:** Encontrar la mejor solución posible (minimizar o maximizar) dentro de un espacio de búsqueda lleno de restricciones.
* **La Trampa (Mínimos Locales):** El reto de no quedarse atascado en un "valle falso" y lograr encontrar el verdadero mínimo global.
* **Multiobjetivo y Pareto:** Qué hacer cuando hay metas en conflicto (ej. minimizar costo pero maximizar velocidad). Se introduce el **Frente de Pareto** (soluciones donde no puedes mejorar algo sin empeorar otra cosa).

## 2. Clasificación y el Teorema "No Free Lunch"

* **Taxonomía de Algoritmos:** Un barrido por los tipos de algoritmos: desde los exactos (matemáticos) hasta los poblacionales (evolutivos).
* **El Teorema NFL:** La regla de oro que demuestra que ningún algoritmo es mágicamente superior a todos los demás en todos los escenarios. El éxito depende de elegir la herramienta correcta para la topología del problema.

## 3. El Algoritmo Genético Simple (Paso a Paso)

* **El Ciclo de Vida:** Cómo inicializar una población aleatoria, decodificar sus "cromosomas" (binarios o reales) y evaluar su *fitness* (aptitud).
* **Selección:** Métodos como la Ruleta o el Torneo para decidir qué soluciones "sobreviven" para reproducirse.
* **Operadores y Balance:** El uso de la Cruza para explotar las buenas soluciones y la Mutación para explorar el mapa.

## 4. Programación Genética (Evolucionando Código)

En lugar de optimizar números, aquí se evolucionan funciones, ecuaciones o programas enteros (representados como árboles de sintaxis).

* **Problemas técnicos a evitar:**
  * ***Bloating*:** Cuando las ecuaciones crecen descontroladamente sin mejorar el resultado.
  * **Intrones:** Código muerto o inútil que se arrastra a lo largo de la evolución.

## 5. Aplicaciones Reales en Control

Cómo se aterriza todo esto en ingeniería mecatrónica: sintonización automática de ganancias PID, calibración de controladores difusos, identificación de plantas físicas (descubrir su modelo matemático) y planificación inteligente de rutas para robots autónomos.

---

> ### 💻 6. Laboratorio en MATLAB (Comparativa de Búsqueda)
> La unidad cierra comprobando la teoría con código real, resolviendo una misma función polinomial con tres enfoques distintos:
> * **Diferenciación Exacta:** Usando cálculo diferencial y raíces matemáticas.
> * ***Hill Climbing* (Búsqueda Local):** Rápida y eficiente para refinar, pero inútil si cae en un óptimo local.
> * ***Random Search* (Búsqueda Global):** Inmune a los óptimos locales, pero torpe para hacer ajustes finos de precisión.
