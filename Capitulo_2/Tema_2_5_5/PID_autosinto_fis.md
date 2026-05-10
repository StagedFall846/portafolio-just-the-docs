---
layout: default
title: "Sintonía Automática de PID Difuso"
parent: "2.5.2 Controladores Difusos Adaptativos"
nav_order: 1
---

## Sintonía Automática de PID Difuso (`PID_autosinto.fis`)

**Proyecto:** Control PID con auto-sintonía mediante lógica difusa  
**Objetivo general:** Diseñar e implementar un sistema de inferencia difusa tipo Mamdani para la sintonización automática de las ganancias \(K_p\), \(K_i\) y \(K_d\), mejorando el desempeño dinámico de un sistema en lazo cerrado.

---

## Objetivo de la práctica

- Implementar un sistema de inferencia difusa (FIS) para ajustar automáticamente un controlador PID.
- Mejorar la respuesta dinámica del sistema reduciendo:
  - Sobretiro (overshoot)
  - Tiempo de establecimiento (\(t_s\))
  - Error en estado estable (\(e_{ss}\))
- Evaluar la respuesta del sistema ante cambios en la referencia y perturbaciones externas.
- Integrar el sistema en Simulink para su análisis en tiempo real.

---

## Descripción del ejercicio

En este ejercicio se implementa un sistema de **sintonía automática difusa de un PID**, donde un FIS tipo Mamdani ajusta en tiempo real las ganancias:

- \(K_p\) (proporcional)
- \(K_i\) (integral)
- \(K_d\) (derivativa)

El sistema recibe tres entradas principales:

- Error \(e(t)\)
- Derivada del error \(de/dt\)
- Referencia \(r(t)\)

Y genera como salida el ajuste dinámico del controlador PID.

### Estructura del sistema difuso

- **Entradas:** 3
- **Salidas:** 3
- **Reglas difusas:** 133 reglas
- **Tipo de FIS:** Mamdani

---

### Variables del sistema

#### Entradas:
- Referencia \(r\): `[0, 20]`
- Error \(e\): `[-20, 20]`
- Derivada del error \(de/dt\): `[-20, 20]`

#### Salidas:
- \(K_p, K_i, K_d\): `[0, 20]`

---

### Lógica de control difusa

El sistema ajusta las ganancias según las siguientes reglas generales:

- Error grande → aumentar \(K_p\)
- Cambio rápido del error → aumentar \(K_d\)
- Error pequeño sostenido → aumentar \(K_i\)
- Sistema estable → reducir ganancias

---

### Comportamiento esperado

El sistema difuso permite adaptar el PID en tiempo real:

- Respuesta más rápida ante cambios en la referencia
- Menor sobreoscilación
- Mayor estabilidad en régimen permanente
- Mejor rechazo a perturbaciones

---

## Consideraciones importantes

### Windup integral

El ajuste dinámico de \(K_i\) puede generar acumulación de error si el sistema entra en saturación.

**Solución:**
- Activar anti-windup en el bloque PID (clamping o back-calculation)

---

### Transiciones bruscas

Un mal diseño de funciones de membresía puede generar cambios abruptos en las ganancias.

---

### Estabilidad del sistema

Valores altos de \(K_p, K_i, K_d\) pueden provocar inestabilidad en sistemas subamortiguados.


<a href="PID_autosinto.fis" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar PID_autosinto.fis
</a>
