---
layout: default
title: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 4
---

# Capítulo 4: Computación Evolutiva (CE)

Este capítulo introduce la computación evolutiva como una familia de algoritmos de búsqueda y optimización global estocástica. Están diseñados para resolver problemas de ingeniería altamente complejos (no lineales, multimodales o discontinuos) donde los métodos clásicos basados en gradientes fallan o quedan atrapados en óptimos locales.

## 1. La Metáfora Biológica
A diferencia de la optimización tradicional que mejora una única solución de forma iterativa, la CE evoluciona una población de soluciones candidatas inspirándose directamente en la teoría de la selección natural de Darwin:

* **Individuo:** Representa una solución candidata específica al problema de ingeniería.
* **Genotipo / Representación:** La estructura de codificación interna de la solución (pueden ser cadenas binarias, vectores de números reales o permutaciones).
* **Fitness (Aptitud):** La evaluación numérica que mide cuantitativamente qué tan buena es la solución respecto a la función objetivo a optimizar.

## 2. El Ciclo Evolutivo Estándar
El algoritmo opera de manera iterativa a lo largo de generaciones mediante cuatro etapas cíclicas fundamentales:

1. **Selección:** Escoge a los individuos más aptos de la población actual (ej. mediante Selección por Torneo) para actuar como progenitores, aplicando una presión selectiva justa.
2. **Recombinación (Cruce):** Combina el material genético de los padres seleccionados para explotar las regiones prometedoras ya descubiertas en el espacio de búsqueda (ej. Cruce aritmético en variables reales).
3. **Mutación:** Introduce variaciones aleatorias de baja probabilidad a la descendencia para explorar nuevas zonas del espacio de búsqueda y mantener la diversidad genética alta.
4. **Reemplazo:** Selecciona qué individuos (entre padres e hijos) sobrevivirán para conformar la población estable de la siguiente generación.

## 3. Fenómenos de Convergencia y Restricciones

* **El Reto de la Diversidad:** Monitorear la convergencia es crítico. El algoritmo busca una convergencia adecuada hacia el óptimo global, cuidando rigurosamente de no caer en una **convergencia prematura** (pérdida drástica de diversidad que atrapa a toda la población en un óptimo local).
* **Manejo de Restricciones:** Para garantizar soluciones físicamente válidas y viables, se implementan estrategias como las **funciones de penalización**, las cuales castigan el valor del *fitness* de los individuos de manera proporcional a la gravedad de la violación de la restricción impuesta.

---

> ### 🚀 Fronteras Avanzadas y Validación
> * **Optimización Multiobjetivo:** Búsqueda activa del **Frente de Pareto**, un conjunto de soluciones óptimas donde no es posible mejorar un objetivo de diseño sin empeorar otro de forma simultánea (ej. mediante el algoritmo NSGA-II).
> * **Naturaleza Estocástica:** Al ser algoritmos probabilísticos y no deterministas, dos ejecuciones idénticas arrojarán resultados ligeramente diferentes. Por ello, la validación de su rendimiento en ingeniería siempre requiere de **pruebas estadísticas no paramétricas** (como la prueba de Wilcoxon o Mann-Whitney U) evaluando el desempeño acumulado a lo largo de múltiples corridas independientes.
