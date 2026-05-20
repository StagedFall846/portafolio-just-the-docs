---
layout: default
title: "Algoritmos de Búsqueda Básica"
parent: "5.1 Búsqueda Básica"
grand_parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
nav_order: 1
---


# Algoritmos de Búsqueda Básica

Esta sección contrasta dos enfoques elementales para encontrar soluciones matemáticas, estableciendo la diferencia entre el refinamiento progresivo y la exploración a ciegas.

## 1. Hill Climbing (Búsqueda Local Incremental)

* **El Mecanismo:** Inicia en una solución aleatoria y comienza a "tantear" a su alrededor realizando pequeños cambios de un solo elemento a la vez. Si el pequeño paso mejora el resultado, el algoritmo se mueve a esa nueva posición y repite el proceso.
* **La Limitación (Óptimos locales):** Se detiene en el momento en que ningún paso cercano mejora la solución. Como se ve en la gráfica, esto significa que el algoritmo simplemente "resbala" hacia el fondo del valle más cercano (óptimo local) y se queda atrapado ahí, incapaz de ver si hay un valle mucho más profundo (óptimo global) más adelante.

## 2. Random Search (Búsqueda Aleatoria Global)

* **El Mecanismo:** En lugar de dar pasos pequeños, este algoritmo genera soluciones de forma completamente aleatoria a lo largo de todo el espacio de búsqueda.
* **Evaluación (*Fitness*):** Para que no sea un simple caos, utiliza una función de aptitud o *fitness* que califica cada punto aleatorio generado, permitiendo al sistema recordar y conservar únicamente la mejor solución encontrada en sus saltos.

---

> ### ⚖️ El Contraste Estratégico
> A diferencia de *Hill Climbing*, *Random Search* evita quedarse atascado en mínimos locales porque no depende de su posición actual. Sin embargo, al ser puramente aleatorio, le cuesta mucho trabajo realizar ajustes finos para perfeccionar una solución casi óptima.
