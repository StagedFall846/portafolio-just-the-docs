---
layout: default
title: "Proceso de Selección"
parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
has_children: true
nav_order: 2
---

# El Proceso de Selección

Esta sección detalla cómo el algoritmo decide qué individuos de la población actual tienen el "derecho" a reproducirse y pasar su material genético a la siguiente generación, basándose en la premisa de la supervivencia del más apto.

## 1. Preparación y Evaluación Matemática

Antes de elegir, el sistema debe estandarizar y calificar a todos los individuos:

* **Decodificación:** Traduce el "genotipo" (ej. una cadena binaria) a un valor numérico real o "fenotipo" (su valor decimal) para poder operarlo.
* **Función de Aptitud (*Fitness*):** Se calcula la probabilidad de selección <span class="math">P_i</span> de cada individuo dividiendo su valor decodificado <span class="math">f(i)</span> entre el promedio de adaptación de toda la población <span class="math">\bar{f}</span>.
* **Acumulación:** Se genera una probabilidad acumulada <span class="math">q_i</span> (donde la suma total siempre da 1) para mapear a los individuos en un rango de selección.

## 2. Algoritmos de Selección (¿Quién sobrevive?)

Una vez calculadas las probabilidades, se aplican distintos métodos para extraer a los ganadores:

* **Selección por Ruleta:** Imagina una ruleta de casino donde el tamaño de la "rebanada" de cada individuo es proporcional a su aptitud <span class="math">q_i</span>. Se generan números aleatorios para "girar" la ruleta múltiples veces. Los individuos más aptos tienen rebanadas más grandes, pero la suerte sigue jugando un factor.
* **Muestreo Estocástico Universal (SUS):** Es una versión corregida de la ruleta. En lugar de girar la ruleta múltiples veces al azar, genera un único número aleatorio inicial y distribuye el resto de los punteros de selección de forma matemáticamente equidistante. Esto garantiza una representación mucho más justa de la población y evita que la pura suerte elimine buenos candidatos.
* **Selección por Torneo:** En lugar de evaluar a todos globalmente, toma "mini-muestras" aleatorias de la población y simplemente elige al mejor individuo de ese pequeño grupo. Es computacionalmente muy rápido y permite controlar qué tan agresiva es la selección ajustando el tamaño del torneo.

---

> ### 🧩 Muestreo por Restos
> Es un método híbrido. Toma de forma determinista y directa a los mejores individuos absolutos para asegurar su supervivencia, y luego "rellena" los espacios restantes de la nueva generación utilizando métodos probabilísticos como la ruleta o el torneo.
