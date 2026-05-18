---
layout: default
title: "Control Supervisado Híbrido"
parent: "3.6 ANN en control"
grand_parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
nav_order: 1
---


## Control Supervisado Híbrido (`modelo2_claseSemana5.fis`)

**Proyecto:** Co-simulación y comparación en lazo cerrado de un sistema de control clásico (PID) operando como supervisor en paralelo con un bloque de control inteligente.  
**Objetivo general:** Diseñar e implementar un esquema de control supervisado para evaluar la capacidad de un algoritmo inteligente al aproximar la acción de control de un PID clásico sobre una planta dinámica de segundo orden desestabilizada.

---

## Objetivo de la práctica

- Configurar un entorno de simulación en Simulink con dos lazos de control paralelos sometidos a la misma señal de referencia.
- Analizar el comportamiento de la planta ante la acción del controlador supervisor PID($s$).
- Diseñar la estructura de un sistema de inferencia difuso (o red neuronal) capaz de mapear el error, su derivada y su integral hacia una acción de control unificada.
- Evaluar el desempeño transitorio y el error en estado estacionario de ambos esquemas de control ante una entrada de tipo escalón.

---

## Descripción del ejercicio

El sistema consta de dos lazos de regulación operando bajo una entrada de referencia común de tipo escalón (amplitud = 10). 

En el **lazo superior (Control Clásico)**, un controlador PID estándar procesa el error del sistema $e(t)$ y calcula de manera analítica la señal de control $u(t)$ requerida para estabilizar la planta lineal, cuya función de transferencia está definida por:

$$G(s) = \frac{s+1}{s^2 - s - 10}$$

En el **lazo inferior (Control Fuzzy)**, se estructura un esquema adaptado para la integración de control inteligente. Este bloque recibe el error del sistema, la primera derivada del error ($d\_e(t)$) y la segunda derivada ($dd\_e(t)$), cada uno ponderado por ganancias de sintonización. El bloque difuso/inteligente procesa estas variables bajo un conjunto de reglas y su salida es integrada a través de un bloque $\frac{1}{s}$ para generar la acción de control final hacia la planta duplicada. Este enfoque permite al sistema inteligente actuar como un controlador supervisado que busca replicar el comportamiento óptimo del controlador clásico.

### Estructura del sistema difuso

- **Entradas:** 3 (Error, Derivada del Error, Segunda Derivada del Error)
- **Salida(s):** 1 (Derivada de la acción de control)
- **Reglas difusas:** 5 (Configuración base de prueba)
- **Tipo de FIS:** Mamdani

---

### Variables del sistema

#### Entradas:
- **e(t) [Error]** : `[-15 a 15]`  
- **d_e(t) [Derivada del error]** : `[-50 a 50]`  
- **dd_e(t) [Segunda derivada del error]** : `[-100 a 100]`  

#### Salida(s):
- **u_dot(t) [Salida del bloque difuso]** : `[-20 a 20]`  

---

### Lógica de control difusa

Describe las reglas generales que rigen el comportamiento del controlador inteligente para aproximar la supervisión clásica:  

- Si (Error es Grande Positivo) y (Derivada es Estable) → Salida es Grande Positiva  
- Si (Error es Cero) y (Derivada es Cero) → Salida es Cero  
- Si (Error es Grande Negativo) y (Derivada es Estable) → Salida es Grande Negativa  

---

### Comportamiento esperado

- El controlador clásico PID estabilizará la planta de segundo orden en un tiempo de asentamiento mínimo y con un sobretiro controlado.
- El controlador inteligente (Fuzzy/ANN) emulará la trayectoria de la señal de control $u(t)$ generada por el PID clásico.
- Ambos lazos de control alcanzarán la referencia final (valor de 10) eliminando por completo el error en estado estacionario gracias a la acción integral del sistema.

---



[Descargar modelo2_claseSemana5.slx](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_6/modelo2_claseSemana5.slx){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
