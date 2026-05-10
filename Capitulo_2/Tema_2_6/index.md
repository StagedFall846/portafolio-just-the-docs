---
layout: default
title: "2.6 Controladores difusos convencionales (implícito)"
parent: "Capítulo 2: Sistemas Difusos"
has_children: false
nav_order: 6
---

# Tema 2.6: Controladores difusos convencionales (implícito)

En este subtema se analiza el diseño y la aplicación de los controladores difusos convencionales. A diferencia de las estructuras auto-sintonizables complejas, aquí se explora cómo mapear la experiencia heurística directamente sobre acciones de control específicas y cómo estas estructuras sirven como base comparativa frente a metodologías de control inteligente basados en redes neuronales.

---

## Comparativa de Estructuras de Control
La implementación de lógica difusa convencional se contrasta con enfoques híbridos mediante los siguientes criterios:

| Enfoque Convencional (`PID_Derivado.fis`) | Enfoque Híbrido (`PID_para_RNN`) |
| :--- | :--- |
| **Mapeo Heurístico Directo:** Se diseña con un número reducido de reglas basadas puramente en la experiencia. | **Generación de Datos de Entrenamiento:** Sirve como la estructura de control base de donde se extraen las señales de error y acción. |
| **Acción Específica:** Centrado en modular componentes específicos de la ley de control (ej. acción derivativa para mitigar el sobretiro). | **Hibridación:** Combina la robustez y suavidad de la lógica difusa con la capacidad de aprendizaje dinámico de las redes neuronales. |

---

## Ejercicios Prácticos

A continuación se presentan los desarrollos aplicados para este subtema:

### 1. Control de la Acción Derivativa (`PID_Derivado.fis`)
Implementación de un sistema de inferencia difusa (FIS) de tipo Mamdani optimizado para actuar sobre la componente derivativa del lazo de control. El sistema utiliza 3 entradas (Error, Derivada y Segunda Derivada del Error) y solo 3 reglas lógicas fundamentales para suavizar la respuesta transitoria y eliminar oscilaciones críticas sin saturar los actuadores.

### 2. Estructura de Control Base para Datos (`PID_para_RNN`)
Modelo en Simulink diseñado para simular el comportamiento de un controlador clásico/difuso convencional frente a la planta. Este archivo actúa como el entorno experimental inicial para recolectar la señal de control real ($u$) y el error dinámico ($e$), datos que posteriormente se exportan al espacio de trabajo para entrenar arquitecturas de Redes Neuronales Recurrentes (RNN).

---

**Punto Crítico:** Mientras que un controlador difuso convencional como `PID_Derivado.fis` ofrece una estructura simple y sumamente intuitiva de sintonizar por un experto, su acoplamiento en modelos de simulación como `PID_para_RNN` es el puente necesario para la transición hacia controladores inteligentes capaces de emular y optimizar estas dinámicas en lazo cerrado.
