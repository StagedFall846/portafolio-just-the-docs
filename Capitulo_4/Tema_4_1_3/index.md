---
layout: default
title: "Señal de Recompensa "
parent: "Capítulo 4: Computación Evolutiva y Aprendizaje Reforzado"
has_children: true
nav_order: 8
---

# Señal de Recompensa

El diseño de la señal de recompensa es el núcleo del aprendizaje por refuerzo, ya que define matemáticamente el objetivo del agente. A continuación, se presenta la implementación de la función `generarRecompensa`, la cual simula un entorno estocástico para un problema clásico de toma de decisiones. 

En este script, el agente interactúa eligiendo entre diferentes "máquinas" (problema del *Multi-Armed Bandit*). Cada opción devuelve una recompensa variable modelada mediante una distribución estadística normal, obligando al agente a equilibrar la exploración de nuevas opciones y la explotación de la máquina que aparenta dar el mejor rendimiento promedio.
