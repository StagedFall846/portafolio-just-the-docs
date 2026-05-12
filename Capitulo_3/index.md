---
layout: default
title: "Capítulo 3: Redes Neuronales Artificiales"
nav_order: 7
has_children: true
---

# Capítulo 3: Redes Neuronales Artificiales

En este capítulo se explora el diseño, entrenamiento e implementación de sistemas basados en **Redes Neuronales Artificiales** (ANN). A diferencia de la lógica difusa basada en reglas heurísticas lingüísticas, este enfoque se fundamenta en la capacidad de aprendizaje a partir de datos dinámicos, permitiendo aproximar comportamientos altamente complejos, no lineales y paralelos, ideales para la identificación y el control inteligente de sistemas mecatrónicos.

## Fundamentos de las Redes Neuronales
Una red neuronal artificial actúa como un **procesador paralelo masivamente distribuido** que almacena conocimiento experimental mediante un proceso estructurado en tres componentes esenciales:
1. **Arquitectura y Topología:** Organización de unidades de procesamiento simple (neuronas) en estructuras monocapa (como el perceptrón lineal) o multicapa (MLP) con conexiones autorrecurrentes o unidireccionales.
2. **Mecanismo de Aprendizaje:** Ajuste dinámico de los pesos sinápticos y *bias* a través de algoritmos de entrenamiento supervisados (regla de Hebb, *Backpropagation*), no supervisados o por refuerzo.
3. **Esquemas de Control Inteligente:** Integración de las redes neuronales en lazo cerrado para la identificación de plantas dinámicas, control inverso o control supervisado mediante el mapeo de trayectorias de referencia.

## Contenido del Capítulo
A continuación, se presentan las aplicaciones y simulaciones prácticas desarrolladas en este módulo:

### 1. Modelado e Identificación de Sistemas (Sección 3.9)
* **Persistencia de Excitación (PE):** Análisis y pruebas de señales de entrada de alta riqueza espectral (como ruido PRBS, RBS y BLWN) diseñadas para excitar todos los modos dinámicos de una planta y garantizar un entrenamiento neuronal robusto.

### 2. Control Inteligente Supervisado (Sección 3.6.2)
* **modelo2_claseSemana5.fis:** Implementación de una estructura híbrida en Simulink donde un controlador clásico PID($s$) opera como supervisor en paralelo con un bloque de control inteligente. El objetivo es evaluar la capacidad de aproximación y la estabilidad de la planta ante perturbaciones dinámicas.

---

> **Nota Técnica:** Los ejercicios analíticos del capítulo incluyen simulaciones de clasificación lineal mediante el perceptrón simple (funciones AND, OR, NAND, NOR) y la resolución de problemas no lineales mediante el perceptrón multicapa con optimización basada en el gradiente descendiente.

Utiliza el menú lateral para explorar las metodologías de entrenamien
