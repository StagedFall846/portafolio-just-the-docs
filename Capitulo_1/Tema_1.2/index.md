---
layout: default
title: "---- 1.2 Control Convencional e Inteligente ----"
parent: "Capítulo 1: Redes Neuronales"
has_children: true
nav_order: 4
---

# 1.2 Control Convencional e Inteligente

En este subtema se analiza la transición del control basado en modelos matemáticos exactos hacia el control inteligente capaz de manejar la incertidumbre. La elección entre un enfoque y otro depende fundamentalmente de la complejidad de la planta y la disponibilidad de un modelo analítico preciso.

---

## Criterios de Selección
Para determinar qué técnica de control aplicar, se consideran los siguientes criterios basados en la naturaleza del sistema:

| Usar Control Convencional cuando: | Usar Control Inteligente cuando: |
| :--- | :--- |
| El sistema es lineal o fácilmente linealizable. | El sistema es complejo y altamente no lineal. |
| Se cuenta con un modelo matemático exacto de la planta. | Existe mucha incertidumbre o ruido ambiental. |
| Se requiere garantía matemática de estabilidad (Lyapunov, Nyquist). | El sistema requiere adaptación en tiempo real ante cambios constantes. |
| La prioridad es la interpretabilidad de los parámetros. | Se cuenta con datos experimentales pero no con un modelo físico claro. |

---

## Ejercicios Prácticos

A continuación se presentan los desarrollos aplicados para este subtema:

### 1. Aproximación de Funciones (`ejercicio1_aproximacion`)
Utilización de redes neuronales para aproximar funciones matemáticas complejas que serían difíciles de modelar mediante métodos convencionales. Este ejercicio demuestra la capacidad de las redes como **aproximadores universales**.

### 2. Visualización de Redes Recurrentes (`graficador_rnn`)
Herramienta diseñada para visualizar el comportamiento dinámico y el flujo de información dentro de las **Redes Neuronales Recurrentes (RNN)**, destacando su capacidad de memoria temporal.

### 3. Implementación de Control Recurrente (`rnn_control`)
Aplicación práctica de una red recurrente a un sistema de control. A diferencia de los métodos clásicos, este enfoque valida su robustez mediante experimentación y simulaciones extensas, adaptándose a la dinámica del sistema sin depender exclusivamente de una función de transferencia analítica.

---

**Punto Crítico:** Mientras el control convencional ofrece garantías teóricas de estabilidad, el control inteligente se valida frecuentemente mediante simulaciones de Monte Carlo y pruebas estadísticas, operando bajo modelos de caja gris o negra.
