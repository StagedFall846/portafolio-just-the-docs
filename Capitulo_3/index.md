---
layout: default
title: "Capítulo 3: Redes Neuronales Artificiales"
nav_order: 7
has_children: true
---

---
layout: default
title: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
nav_order: 4
has_children: true
---

# Capítulo 3: Redes Neuronales Artificiales (ANN)

Este capítulo aborda el diseño de sistemas inteligentes inspirados en el cerebro biológico. A diferencia de los algoritmos tradicionales que siguen instrucciones analíticas, las redes neuronales "aprenden" a resolver problemas complejos y altamente no lineales ajustando sus parámetros internos a partir de la experiencia (datos).

## 1. Arquitectura y Funcionamiento Básico

* **La Neurona Artificial:** Opera multiplicando señales de entrada por pesos sinápticos (que actúan como memoria), suma los resultados y los pasa por una función de activación (como la función Signo, ReLU o Sigmoide) para generar una salida.
* **El Perceptrón:** Es la topología más simple (una sola capa). Clasifica datos linealmente separables (aprende compuertas lógicas como AND y OR, pero falla con XOR). Físicamente, puede construirse utilizando amplificadores operacionales (sumadores y comparadores).

## 2. Tipos de Aprendizaje

* **Supervisado:** La red aprende comparando sus respuestas con un conjunto de salidas deseadas (etiquetas) proporcionadas por el diseñador.
* **No Supervisado:** La red analiza datos de entrada sin etiquetar para encontrar patrones ocultos o agrupaciones.
* **Reforzado:** La red aprende mediante un sistema de recompensas y penalizaciones (prueba y error) para maximizar un objetivo.

## 3. Superando las Limitaciones: Multicapa y Backpropagation

* **Perceptrón Multicapa (MLP):** Agrega "capas ocultas" de neuronas, lo que permite resolver problemas no lineales complejos (como la función XOR).
* **Retropropagación (*Backpropagation*):** Es el algoritmo clave para entrenar redes multicapa. Consiste en una pasada hacia adelante (*forward*) para calcular la salida, medir el error, y una pasada hacia atrás (*backward*) que utiliza cálculo diferencial (gradiente descendiente) para ajustar matemáticamente los pesos de todas las capas ocultas y minimizar el error.

## 4. Aplicación en Ingeniería de Control

* **Esquemas Comunes:** Las redes se usan para **Identificación de sistemas** (aprender el modelo matemático de la planta), **Control supervisado** (clonar a un controlador existente) y **Control inverso** (aprender la inversa de la planta para forzar su comportamiento).

---

> ### 🏆 Regla de Oro: Persistencia de Excitación (PE)
> Para que una red neuronal aprenda verdaderamente la dinámica de un sistema físico, los datos de entrenamiento deben provenir de señales ricas en frecuencias (como el Ruido Binario PRBS). Señales simples, como un escalón unitario, no proporcionan suficiente información y generan modelos deficientes.
