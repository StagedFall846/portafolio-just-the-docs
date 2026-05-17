---
layout: default
title: "Redes Neuronales en Control Automático"
parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
has_children: true
nav_order: 9
---

# Redes Neuronales en Control Automático

Esta sección detalla cómo se integran las redes neuronales artificiales (ANN) directamente en los lazos de control de sistemas físicos. En la industria, no se usan de una sola forma, sino que operan bajo tres esquemas arquitectónicos fundamentales:

## 1. Identificación de Sistemas (El "Gemelo Digital")
* **Concepto:** La red neuronal observa los datos históricos de entrada y salida de la planta para aprender y replicar su comportamiento dinámico. Funciona como un modelo matemático virtual del sistema real.

## 2. Control Supervisado (Clonación del Controlador)
* **Concepto:** La red neuronal se entrena para observar e imitar exactamente lo que hace un controlador clásico ya existente (ej. un controlador muy avanzado o complejo).
* **¿Por qué usarlo?** Es la solución ideal cuando el controlador original es computacionalmente excesivo, impráctico o difícil de afinar. La red neuronal entrenada ejecuta la misma tarea de forma mucho más rápida y ligera.

## 3. Control Inverso (Ingeniería Inversa de la Planta)
* **Concepto:** A diferencia de la identificación normal, aquí la red aprende la dinámica al revés: toma las salidas de la planta como sus entradas, y las entradas de la planta como sus salidas deseadas.

---

> ### 🔄 El Lazo de Control Inverso
> Una vez que la red entiende el "modelo inverso", se coloca antes de la planta. Alimenta a la red con la salida que deseas obtener, y la red calculará automáticamente la entrada exacta que debe inyectarse a la planta para lograr ese resultado.
