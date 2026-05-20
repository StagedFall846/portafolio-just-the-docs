---
layout: default
title: "Algoritmo ϵ-greedy"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 4
---


# Estrategia $\epsilon$-greedy (Épsilon-Greedy)

Esta es la técnica fundamental y más intuitiva para equilibrar el aprendizaje de un agente interactivo, basando sus decisiones en una simple probabilidad estática.

## 1. El Mecanismo (Regla de Decisión)

El comportamiento del algoritmo está dictado por una probabilidad fija $\epsilon$ (por ejemplo, 0.10 o 10%), dividiendo sus acciones en dos modos:

* **Explotación (Probabilidad $1-\epsilon$):** La mayor parte del tiempo, el agente actúa de forma puramente "codiciosa", seleccionando matemáticamente la acción que promete la recompensa más alta conocida hasta el momento ($A_t = \arg\max [Q_n(a)]$).
* **Exploración (Probabilidad $\epsilon$):** De forma ocasional, el agente ignora todo lo que ha aprendido y escoge un camino completamente al azar con la esperanza de descubrir opciones más lucrativas.

---

> ### ⚖️ El Compromiso de Diseño
> * **El lado fuerte (Ventajas):** Su extrema simplicidad matemática la hace muy fácil de implementar, garantizando un balance inicial decente entre aprender cosas nuevas y aprovechar lo ya conocido.
> * **El punto débil (Desventajas):** Su mayor defecto es que la tasa de exploración es fija. Esto significa que el agente nunca deja de explorar a ciegas, incluso si ya corrió miles de iteraciones y domina el entorno. Si se elige un $\epsilon$ muy grande, el sistema sufrirá para converger y estabilizarse en la ruta óptima.
