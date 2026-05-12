---
layout: default
title: "3.7 ANN en control"
nav_order: 6
---

# Sección 3.7: ANN en control

En el ámbito de la automatización y la mecatrónica, las Redes Neuronales Artificiales (ANN) se consolidan como una herramienta robusta para superar las limitaciones de los algoritmos de control clásicos ante plantas altamente no lineales, variantes en el tiempo o con dinámicas complejas. 

Esta sección explora cómo se acoplan las arquitecturas neuronales dentro de los lazos de regulación industriales, enfocándose principalmente en la emulación e hibridación de estrategias de control preexistentes.

---

## Esquemas Fundamentales de Control Neuronal

De acuerdo con la topología del lazo y el rol que desempeña la red, se implementan tres configuraciones principales:

1. **Identificación de Sistemas:** La red neuronal actúa como un estimador dinámico en paralelo, aprendiendo la función de transferencia o el comportamiento en variables de estado de la planta a partir de datos históricos de entrada y salida.
2. **Control Supervisado:** La red se entrena utilizando como "maestro" o supervisor a un controlador ya operativo (ya sea un PID convencional, un operario humano o un sistema difuso heurístico). El objetivo es que la red aprenda a replicar fielmente la ley de control, ofreciendo menor tiempo de cómputo y mayor flexibilidad ante perturbaciones.
3. **Control Inverso:** Se obtiene computacionalmente el modelo inverso del sistema físico. La red procesa la salida deseada (referencia) para calcular de manera directa la señal de excitación adecuada que debe inyectarse al actuador.

---

## Entorno Experimental en Simulink

Como puente hacia las aplicaciones multidisciplinarias de este portafolio, se utiliza un entorno de simulación dinámico en **Simulink** que contrasta un lazo de control clásico frente a un esquema de **Control Difuso Adaptativo**. 

A través de este modelo, se adquieren las señales temporales del error del sistema ($e$) y la acción de control resultante ($u$). Estas variables constituyen el conjunto de datos (*dataset*) fundamental para el entrenamiento supervisado de redes autorregresivas, permitiendo la transición matemática de un controlador heurístico a uno inteligente de alta velocidad.

---

¿Deseas explorar los detalles del controlador base utilizado para la recolección de datos? Consulta el apartado de implementación técnica a continuación.
