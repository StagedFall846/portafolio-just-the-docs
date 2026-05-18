---
layout: default
title: "Algoritmo Epsilon-Greedy"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 1
---

# El Dilema de Exploración vs. Explotación

Esta sección analiza el conflicto principal de un agente que aprende interactuando: ¿debe conformarse con la mejor acción que conoce hasta ahora (explotación), o debe arriesgarse a probar algo nuevo que podría darle una mayor recompensa (exploración)?

## 1. Actualización Incremental del Valor

Antes de elegir, el agente debe estimar el valor $Q(a)$ de una acción. En lugar de guardar el historial completo de recompensas, utiliza una fórmula de promedio incremental:

$$Q_{t+1}(a) = Q_t(a) + \frac{1}{n_t(a)}(R_{t+1} - Q_t(a))$$

El término $\frac{1}{n_t(a)}$ actúa como el "tamaño de paso", reduciendo el impacto de las nuevas recompensas conforme se tiene más experiencia acumulada.

## 2. Métodos Clásicos de Balance

Para decidir qué acción tomar basado en esas estimaciones, existen diferentes estrategias:

* **$\epsilon$-greedy (Épsilon-Greedy):** La estrategia estándar e intuitiva. El agente es "codicioso" (elige la opción con mayor recompensa estimada) casi siempre, pero lanza un dado y con una probabilidad baja $\epsilon$ (ej. 10%) elige una acción completamente al azar. **Ventaja:** Muy fácil de programar y balancea bien a largo plazo. **Desventaja:** Su tasa de exploración es fija (el agente sigue explorando aleatoriamente incluso cuando ya domina el entorno), lo que retrasa la convergencia óptima.
* **$\epsilon$-greedy con Inicio Optimista:** Un truco matemático brillante. Consiste en engañar al agente al inicio, asignándole valores iniciales artificialmente altos a todas las acciones (incluso a las malas). Al interactuar, las recompensas reales serán menores a esa expectativa "optimista", causando decepción. Esto obliga al agente a cambiar de opción constantemente al principio, forzando una exploración temprana masiva y natural. **Ventaja:** Promueve una exploración agresiva justo al inicio, acelerando la convergencia final. **Desventaja:** Elegir mal el "valor optimista" inicial puede arruinar el rendimiento temporalmente.

---

> ### 🧭 Otras Estrategias Avanzadas
> Aunque se profundizará más adelante, la lista menciona a **UCB** (Límite Superior de Confianza), que explora basándose en qué tan incierta es una opción, y **SoftMax**, que asigna probabilidades proporcionales al valor de cada acción en lugar de hacerlo de forma puramente aleatoria.
