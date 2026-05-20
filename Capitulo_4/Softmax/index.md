---
layout: default
title: "Algoritmo Softmax"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 3
---


# Exploración Softmax (Distribución de Boltzmann)

Esta sección presenta una alternativa probabilística e inteligente al dilema de exploración-explotación. En lugar de elegir completamente al azar (como en $\epsilon$-greedy) o basarse en la incertidumbre matemática (como en UCB), Softmax convierte los valores de las recompensas en probabilidades proporcionales.

## 1. El Concepto Central (Exploración Dirigida)

A cada acción disponible se le asigna una probabilidad de ser elegida <span class="math">P(A_t = a)</span> en función de su valor estimado actual <span class="math">Q_t(a)</span> mediante una función exponencial:

$$P(A_t = a) = \frac{e^{Q_t(a)/\tau}}{\sum_{b=1}^k e^{Q_t(b)/\tau}}$$

Esto significa que las mejores acciones tienen una alta probabilidad de ser seleccionadas, pero las opciones subóptimas mantienen una probabilidad mayor a 0, garantizando que el agente siga explorando de manera proporcional a qué tan buena parece ser cada opción.

## 2. El Parámetro de Temperatura (<span class="math">\tau</span>)

Es el hiperparámetro que controla el comportamiento del algoritmo, dictando la "suavidad" o "agudeza" de las probabilidades:

* **Temperatura Alta (<span class="math">\tau \to \infty</span>):** Las probabilidades se aplanan y tienden a ser iguales para todas las opciones (<span class="math">1/k</span>). El agente se comporta de forma puramente aleatoria (**Exploración máxima**).
* **Temperatura Baja (<span class="math">\tau \to 0</span>):** Las pequeñas diferencias en las recompensas se amplifican drásticamente. La probabilidad se concentra casi al 100% en la mejor opción conocida, volviendo al agente "codicioso" (**Explotación máxima**).

---

> ### ⚖️ Ventajas vs. Desventajas
> * **Ventaja:** Ofrece una exploración proporcional y toma de decisiones con transiciones muy suaves, siendo mucho más eficiente que la exploración a ciegas ya que no gasta recursos probando opciones marcadamente pésimas con la misma tasa que las prometedoras.
> * **Desventaja:** Posee un costo computacional más elevado (calcular exponenciales para todas las acciones en cada paso de tiempo consume recursos en hardware embebido) y su éxito depende por completo de que el diseñador ajuste correctamente la dinámica de enfriamiento de la temperatura <span class="math">\tau</span>.
