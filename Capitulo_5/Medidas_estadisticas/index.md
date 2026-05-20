---
layout: default
title: "Máximo de una Función"
parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
has_children: true
nav_order: 3
---

# Medidas Estadísticas de Desempeño

Al ser los algoritmos genéticos métodos estocásticos (basados en probabilidad y azar), una sola ejecución exitosa no sirve para comprobar si el diseño es bueno. Esta sección define cómo evaluar su rendimiento de forma rigurosa utilizando tres métricas clave.

## 1. Las Tres Métricas Principales

* **Convergencia al Error:** Evalúa la precisión. Consiste en registrar el error mínimo (o el mejor *fitness*) alcanzado en cada iteración para ver qué tanto se acerca a la solución ideal.
* **Tiempo Máquina:** Evalúa el costo computacional. Mide el tiempo físico real que le toma al procesador completar una corrida entera del algoritmo.
* **Épocas (Generaciones):** Evalúa la velocidad de convergencia. Si el algoritmo tiene una condición de terminación prematura (por ejemplo, detenerse si el error llega a cero), se cuenta cuántas épocas tardó en alcanzar ese objetivo.

## 2. La Regla de Oro (Análisis Estadístico)

Debido a la naturaleza aleatoria de los operadores (cruza y mutación), una corrida puede ser excelente por pura suerte y otra puede ser terrible. Por lo tanto, el protocolo dicta que:

1. El algoritmo debe ejecutarse un número estadísticamente significativo de ocasiones (usualmente 30, 50 o 100 corridas independientes).
2. A los resultados de esas múltiples corridas se les debe aplicar estadística descriptiva, analizando la media, la moda, la mediana y graficando su distribución en un histograma para demostrar que el algoritmo es consistentemente robusto y no solo "tuvo suerte".
