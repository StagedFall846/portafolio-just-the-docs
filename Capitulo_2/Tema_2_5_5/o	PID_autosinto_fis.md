# Simulación de Sintonía Automática de PID Difuso y Análisis de Desempeño  
## Proyecto: Evaluación de un Sistema Fuzzy Self-Tuning PID en Sistemas Dinámicos

---

## 🎯 Objetivo general

Evaluar el desempeño de un sistema de inferencia difusa (FIS) tipo Mamdani aplicado a la sintonía automática de un controlador PID, analizando su capacidad para mejorar la respuesta dinámica de un sistema mediante simulación en MATLAB y su integración en Simulink.

---

## 📌 Objetivos de la práctica

- Analizar el comportamiento dinámico del sistema bajo control PID clásico vs PID difuso adaptativo.
- Evaluar la mejora en métricas de desempeño como:
  - Sobretiro (overshoot)
  - Tiempo de establecimiento
  - Error en estado estacionario
- Verificar la respuesta del sistema ante perturbaciones externas.
- Analizar el impacto del ajuste dinámico de \(K_p\), \(K_i\) y \(K_d\).
- Implementar el sistema difuso en Simulink para su integración en lazo cerrado.

---

## 🧠 Descripción del ejercicio

En este ejercicio se implementa y evalúa un sistema de **sintonía automática difusa de un controlador PID**, utilizando un archivo `.fis` con arquitectura:

- 3 entradas:
  - Error \(e(t)\)
  - Derivada del error \(de/dt\)
  - Referencia \(r(t)\)

- 3 salidas:
  - \(K_p\)
  - \(K_i\)
  - \(K_d\)

El sistema utiliza un conjunto de **133 reglas difusas** que permiten ajustar las ganancias del controlador en tiempo real según el comportamiento dinámico del sistema.

---

## ⚙️ Metodología de evaluación

### 1. Análisis del sistema de inferencia difusa

Se evalúa el comportamiento del FIS mediante:

- Superficies de control (control surfaces)
- Distribución de funciones de membresía
- Consistencia de reglas difusas

---

### 2. Evaluación del desempeño dinámico

Se compara la respuesta del sistema en dos escenarios:

#### 🔹 Control PID clásico
- Ganancias constantes
- Respuesta fija ante perturbaciones

#### 🔹 Control PID difuso adaptativo
- Ganancias variables en tiempo real
- Ajuste automático según el error

---

### 3. Análisis de respuesta temporal

Se estudian las siguientes variables:

- Respuesta al escalón
- Tiempo de establecimiento (\(t_s\))
- Sobreimpulso máximo
- Estabilidad ante perturbaciones externas

---

### 4. Implementación en Simulink

Se genera el modelo equivalente en Simulink integrando:

- Bloque FIS (`.fis`)
- Controlador PID adaptativo
- Planta dinámica del sistema
- Señales de referencia y perturbación

---

## 📊 Resultados esperados

Se espera que el sistema difuso presente:

- Menor sobretiro respecto al PID clásico
- Reducción del tiempo de asentamiento
- Mayor robustez ante cambios en la planta
- Respuesta más suave y estable

---

## 📈 Comparación de comportamiento

```
Amplitud
  ^
  |            /-------------------- Referencia
  |           /
  |          /   PID clásico (oscilaciones)
  |         /  /\_/\_
  |        /
  |       /        PID difuso (respuesta suave)
  |______/______________________________> Tiempo
```

---

## 🧩 Conclusión

El uso de un sistema de sintonía difusa permite transformar un controlador PID convencional en un sistema adaptativo inteligente, capaz de ajustar sus parámetros en función del estado dinámico del sistema.

Esto se traduce en:

- Mejor desempeño transitorio
- Mayor estabilidad del sistema
- Respuesta más robusta ante incertidumbre
- Adaptación automática sin intervención manual

---

## 🚀 Aplicaciones futuras

- Control de procesos industriales no lineales
- Sistemas robóticos con incertidumbre dinámica
- Optimización mediante algoritmos evolutivos
- Integración con redes neuronales (neuro-difuso)
