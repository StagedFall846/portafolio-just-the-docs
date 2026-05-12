---
layout: default
title: "Control Difuso de Acción Derivativa"
nav_order: 1
---

## Control Difuso de Acción Derivativa (`PID_Derivado.fis`)

**Proyecto:** Diseño e implementación de un Sistema de Inferencia Difusa (FIS) de estructura reducida para la modulación inteligente de la ganancia derivativa en un lazo de control cerrado.  
**Objetivo general:** Mitigar de manera preventiva el sobretiro dinámico (*overshoot*) y eliminar las oscilaciones transitorias en plantas complejas mediante el análisis del error y sus derivadas de orden superior.

---

## Objetivo de la práctica

- Configurar un controlador difuso Mamdani optimizado que actúe sobre la componente derivativa de la ley de control general.
- Incorporar la segunda derivada del error ($dd\_error$) para dotar al sistema de una interpretación de la aceleración del error dinámico.
- Diseñar una base de conocimiento ultra-simplificada de solo 3 reglas lógicas capaces de gobernar el comportamiento transitorio de la planta.
- Validar la suavidad de la señal de control mediante el uso de funciones de membresía de salida Gaussianas.

---

## Descripción del ejercicio

La acción derivativa convencional en un controlador PID ($K_d \cdot \frac{de(t)}{dt}$) tiene un carácter predictivo; sin embargo, un valor estático suele amplificar el ruido de alta frecuencia y provocar un esfuerzo de control violento en los actuadores. 

El sistema `PID_Derivado.fis` resuelve esta problemática operando como un controlador difuso de orden superior. Recibe constantemente tres señales del lazo: el error instantáneo, la velocidad con la que cambia dicho error (primera derivada) y la aceleración del mismo (segunda derivada). 

A través de un motor de inferencia conciso, el sistema determina si la planta se está aproximando peligrosamente a la referencia a una velocidad excesiva. Si detecta un riesgo inminente de sobretiro, inyecta una acción de control derivativa proporcional para "frenar" suavemente la respuesta transitoria antes de que ocurra la colisión o el desvío.

### Estructura del sistema difuso

- **Entradas:** 3 (Error, d_error, dd_error)
- **Salida(s):** 1 (d_u)
- **Reglas difusas:** 3 reglas fundamentales
- **Tipo de FIS:** Mamdani

---

### Variables del sistema

#### Entradas:
- **error** : `[-10 10]` (Funciones de membresía: *Negativo*, *Zero*, *Positivo*)  
- **d_error** : `[-10 10]` (Funciones de membresía: *Negativo*, *Zero*, *Positivo*)  
- **dd_error** : `[-10 10]` (Funciones de membresía: *Negativo*, *Zero*, *Positivo*)  

#### Salida(s):
- **d_u** : `[-10 10]` (Funciones de membresía Gaussianas: *Negativo*, *Zero*, *Positivo*)  

---

### Lógica de Control Difusa

A pesar del alto número de combinaciones matemáticas teóricas ($3 \times 3 \times 3 = 27$), el sistema se gobierna de forma eficiente mediante las siguientes directrices heurísticas mapeadas en la base de reglas:  

- Si el error es controlado o se encuentra cerca de la zona de estabilidad (*Zero*) y la velocidad no indica cambios abruptos $\rightarrow$ La salida se mantiene en *Zero* para no estresar al actuador.
- Si el sistema experimenta una aceleración crítica hacia el extremo opuesto $\rightarrow$ Se genera una acción de amortiguamiento preventivo (*Positivo* o *Negativo* según la dirección) para contrarrestar la inercia transitoria.

---

### Comportamiento esperado

- **Reducción del Overshoot:** Al simularse frente a una entrada tipo escalón en Simulink, la curva de respuesta temporal debe aproximarse a la referencia de forma críticamente amortiguada, reduciendo significativamente el primer pico con respecto a un PID clásico.
- **Atenuación de Oscilaciones:** El lazo cerrado debe estabilizarse en un tiempo menor, eliminando los ciclos de oscilación alrededor del valor de consigna (*setpoint*).
- **Esfuerzo de Control Suave:** Gracias a las funciones de membresía Gaussianas de la salida `d_u`, la señal enviada a la planta carecerá de discontinuidades o saltos matemáticos bruscos.

---

## Consideraciones importantes

### 1. Amplificación del Ruido por Doble Derivación
El cálculo numérico de la segunda derivada ($dd\_error$) es intrínsecamente susceptible a amplificar ruidos de alta frecuencia de los sensores. Es indispensable prever el uso de filtros pasa-bajos de primer o segundo orden en el diagrama de bloques de Simulink antes de ingresar las señales al bloque FIS.

### 2. Sintonización de los Factores de Escala
Dado que el universo de discurso de todas las variables está normalizado en el rango `[-10 10]`, se deben ajustar cuidadosamente las ganancias de ganancia externas (*Gain blocks*) en Simulink para evitar que las variables saturen constantemente en los extremos, lo que degradaría el control difuso en una conmutación binaria tipo *On-Off*.

### 3. Base de Reglas Compacta
Cualquier modificación o adición de una cuarta regla debe justificarse minuciosamente bajo las leyes de la dinámica de sistemas, ya que la elegancia y velocidad de cómputo de este archivo radican en mantener su matriz de inferencia en un esquema estrictamente minimalista de 3 reglas.

---

[Descargar `PID_Derivado.fis`](/assets/PID_Derivado.fis){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
