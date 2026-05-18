---
layout: default
title: "Control Difuso de Acción Derivativa"
parent: "Controladores Difusos Directos (Sección 2.5.1)"
grand_parent: "Capítulo 2: Sistemas Difusos"
nav_order: 1
---


## Control Difuso de Acción Derivativa (`PID_Derivado.fis`)

**Proyecto:** Control derivativo difuso mediante lógica difusa  
**Objetivo general:** Diseñar e implementar un sistema de inferencia difusa tipo Mamdani para calcular dinámicamente la acción derivativa \(d_u\) de un lazo de control, reduciendo sobretiros y oscilaciones bruscas.  

---

## Objetivo de la práctica

- Implementar un sistema de inferencia difusa (FIS) para generar un ajuste derivativo suave.  
- Mitigar sobretiros (*overshoot*) en sistemas con respuesta rápida.  
- Analizar la influencia de derivadas de primer y segundo orden del error en el control transitorio.  
- Integrar el sistema en Simulink para su evaluación en tiempo real.  

---

## Descripción del ejercicio

En este ejercicio se implementa un **control derivativo difuso**, donde un FIS tipo Mamdani ajusta la acción derivativa en función de:  

- Error \(e(t)\)  
- Primera derivada del error \(de/dt\)  
- Segunda derivada del error \(d^2e/dt^2\)  

El sistema busca anticipar el comportamiento transitorio y suavizar la señal de control, evitando picos abruptos y desgaste de actuadores.  

### Estructura del sistema difuso

- **Entradas:** 3  
- **Salida:** 1 (acción derivativa \(d_u\))  
- **Reglas difusas:** 3  
- **Tipo de FIS:** Mamdani  

---

### Variables del sistema

#### Entradas:
- Error \(e\): `[-20, 20]`  
- Derivada del error \(d_error\): `[-20, 20]`  
- Segunda derivada \(dd_error\): `[-20, 20]`  

#### Salida:
- Acción derivativa \(d_u\): `[-10, 10]`  

---

### Lógica de control difusa

- Error creciente → ajustar \(d_u\) para frenar la aproximación  
- Cambio rápido del error → aumentar corrección derivativa  
- Aceleración del error (\(dd_error\)) → predecir sobretiros y suavizar la acción  

---

### Comportamiento esperado

El controlador difuso permite:  

- Acercamiento suave a la referencia  
- Reducción de sobretiro crítico  
- Señal de control sin oscilaciones de alta frecuencia  
- Mejora en estabilidad transitoria  

---

## Consideraciones importantes

### Amplificación de ruido

La segunda derivada amplifica perturbaciones.  
**Prevención:** usar filtros pasa-bajos antes de ingresar la señal al FIS.  

### Saturación de salida

Rango limitado `[-10, 10]` puede producir control tipo On-Off si no se calibra correctamente la escala de Simulink.  

### Integración en Simulink

Recomendada para `PID_para_RNN.slx` con señal de control suavizada y predicción de sobretiros mediante \(dd_error\).  

---

[Descargar](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_2/Tema_2_5_1/PID_Derivado.fis){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
