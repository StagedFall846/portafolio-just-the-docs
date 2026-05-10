---
layout: default
title: "Control Difuso de Acción Derivativa"
parent: "2.6 Controladores difusos convencionales (implícito)"
grand_parent: "Capítulo 2: Sistemas Difusos"
nav_order: 1
---


# Documentación Técnica: Control Difuso de Acción Derivativa (`PID_Derivado.fis`)

## Objetivos del Ejercicio

- **Diseñar un Sistema de Inferencia Difuso (FIS)** tipo Mamdani optimizado para calcular dinámicamente la variación de la acción derivativa ($d\_u$) de un lazo de control.
- **Mitigar el sobretiro dinámico (*overshoot*)** en plantas propensas a oscilaciones bruscas ante cambios tipo escalón.
- **Analizar el impacto de derivadas de orden superior** (error, primera derivada y segunda derivada del error) en la anticipación del comportamiento transitorio del sistema.

---

## Descripción General y Enfoque

La acción derivativa clásica en un PID ($K_d \cdot \frac{de(t)}{dt}$) permite "mirar al futuro" y frenar el sistema si se aproxima demasiado rápido a la referencia. Sin embargo, un término derivativo estático es muy sensible al ruido y puede desgastar los actuadores.

**`PID_Derivado.fis`** es un enfoque **inteligente y simplificado**, usando solo **3 reglas** que mapean el estado dinámico del error para generar un ajuste derivativo suave ($d\_u$).

El sistema analiza no solo la dirección del error, sino también **la aceleración del error** ($dd\_error$).

---

## Análisis y Consideraciones (Errores Comunes)

### 1. Amplificación de Ruido por Doble Derivación

La segunda derivada ($dd\_error$) amplifica cualquier perturbación.

**Prevención:** usar **filtros pasa-bajos** en los bloques derivados antes de entrar al FIS.

```text
Señal de Error ──>[Derivada]──>[Filtro Pasa-Bajos]──> d_error
```

### Saturación de Salida

Con el rango `[-10 10]`, si la escala en Simulink no está calibrada, $d\_u$ puede quedarse en +10/-10, actuando como un control On-Off en lugar de suave.

---

## Resultados Esperados

Al implementar este controlador en `PID_para_RNN.slx`:

- **Curva de respuesta temporal:** acercamiento suave a la referencia, críticamente amortiguado, con pico de sobretiro reducido.  
- **Esfuerzo de control:** señal al actuador sin oscilaciones de alta frecuencia gracias a la salida Gaussiana.

---

## 6. Detalles Adicionales: Segunda Derivada

- $e$ → posición relativa al objetivo  
- $d\_error$ → velocidad de aproximación o alejamiento  
- $dd\_error$ → aceleración del error  

Con $dd\_error$, el controlador puede **predecir** y ajustar la acción derivativa antes de que ocurra un sobretiro o choque contra la referencia.

---
