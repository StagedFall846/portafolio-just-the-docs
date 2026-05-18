---
layout: default
title: "Capítulo 5: Implementación y Proyectos Avanzados"
has_children: true
nav_order: 5
---

# Algoritmos Genéticos y Evolutivos

Este capítulo formaliza el concepto de optimización matemática y clasifica los algoritmos de búsqueda, centrándose en las metaheurísticas poblacionales de inspiración biológica y en la evolución de expresiones complejas.

## 1. Fundamentos de la Optimización

* **El Problema General:** Consiste en maximizar o minimizar una función objetivo <span class="math">f(x)</span> mapeada dentro de un espacio de búsqueda delimitado por un conjunto de restricciones.
* **El Desafío Multimodal:** Las funciones complejas presentan múltiples óptimos locales (valles o crestas falsas). Los algoritmos locales suelen converger prematuramente en ellos, fallando en encontrar el único óptimo global.
* **Optimización Multiobjetivo:** Cuando se optimizan metas en conflicto (ej. minimizar costo y maximizar eficiencia), no existe una única solución. Se calcula un **Frente de Pareto**, compuesto por soluciones no dominadas donde no es posible mejorar un objetivo sin perjudicar otro.

## 2. Clasificación y el Teorema *No Free Lunch* (NFL)

* **Taxonomía de Algoritmos:** Abarca desde métodos exactos y basados en gradientes (rápidos pero rígidos y propensos a estancarse), hasta métodos estocásticos y poblacionales (flexibles, globales y paralelos).
* **Teorema NFL:** Demuestra matemáticamente que ningún algoritmo de optimización es universalmente superior a otro al promediar su rendimiento sobre todos los problemas posibles. Su éxito depende estrictamente de qué tan bien se adapte su estrategia a la estructura específica del problema.

## 3. Mecánica del Algoritmo Genético Simple (AGS)

El AGS simula la evolución darwiniana operando sobre una población de cromosomas (comúnmente cadenas binarias) mediante un ciclo estructurado:

1. **Decodificación:** Transforma el genotipo binario a un fenotipo numérico real ejecutable en la función de aptitud (*fitness*).
2. **Evaluación y Selección:** Mide el *fitness* de cada individuo para determinar su probabilidad de reproducción a través de métodos como la Ruleta (muestreo proporcional) o Torneos.
3. **Operadores Genéticos:** Ejecuta la Recombinación o Cruce (probabilidad alta, **~90%**) para explotar las buenas soluciones combinando padres, y la Mutación (probabilidad baja, **<10%**) para alterar genes al azar y explorar nuevas regiones.

## 4. Programación Genética (PG)

* **Evolución de Estructuras:** A diferencia de los AG tradicionales que optimizan vectores numéricos, la PG evoluciona programas de computadora o expresiones matemáticas representadas mediante **árboles de sintaxis**.
* **Fenómenos Críticos:**
  * ***Bloating***: El crecimiento excesivo y descontrolado del tamaño del árbol sin mejoras en el *fitness*, combatido mediante presión de parsimonia o límites de profundidad.
  * **Intrones:** Secciones de código muerto (ej. <span class="math">f(x) \cdot 1</span>) que no alteran la salida pero protegen los genes útiles contra mutaciones destructivas.
  * **Individuos no factibles:** Expresiones inválidas (ej. divisiones por cero) que deben controlarse mediante operadores protegidos o penalizaciones extremas.

---

> ### ⚙️ Aplicaciones en Ingeniería de Control
> Los algoritmos evolutivos actúan como optimizadores de caja negra ideales en mecatrónica para:
> * El ajuste óptimo de ganancias PID (<span class="math">K_p, K_i, K_d</span>).
> * Sintonización y calibración de controladores difusos complejos.
> * Regresión simbólica para descubrir de forma autónoma las ecuaciones de una planta a partir de datos empíricos.
> * Planificación de rutas óptimas (*path planning*) para robots móviles autónomos.
