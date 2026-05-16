---
layout: default
title: "Controladores Difusos Adaptativos"
parent: "Capítulo 2: Sistemas Difusos"
has_children: true
nav_order: 5
---

# Controladores Difusos Adaptativos

Este subtema explora el diseño de sistemas de control capaces de modificar sus propios parámetros, como las funciones de membresía o las reglas de inferencia, en tiempo real. El objetivo principal es lograr que el controlador se ajuste dinámicamente ante cambios en la dinámica de la planta o la presencia de perturbaciones externas imprevistas.

---

## Capacidades de Adaptación
A diferencia de un controlador difuso convencional (estático), un sistema adaptativo se caracteriza por:

| Característica | Descripción |
| :--- | :--- |
| **Auto-sintonía** | Ajuste automático de las ganancias (Kp, Ki, Kd) según el estado del error. |
| **Robustez dinámicas** | Capacidad de mantener el desempeño si la planta cambia sus parámetros físicos. |
| **Optimización de Reglas** | Modificación de la base de conocimiento basada en el desempeño histórico o actual. |
| **Manejo de Incertidumbre** | Respuesta eficiente ante ruidos o señales no modeladas inicialmente. |

---

## Ejercicios Prácticos

A continuación se presentan los desarrollos y archivos de configuración para este subtema:

### 1. Sistema de Inferencia Difuso (`PID_autosinto.fis`)
Implementación de un controlador PID cuyas ganancias se sintonizan automáticamente. Este archivo contiene la definición de 3 entradas (Referencia, Error y Derivada del Error) y 3 salidas correspondientes a los parámetros de control.



### 2. Configuración de Funciones de Membresía
Definición de universos de discurso y etiquetas lingüísticas para las variables de entrada y salida:
* **Entradas:** Uso de 5 MFs para la referencia y 7 MFs (de NG a PG) para el error y su derivada, permitiendo una resolución fina en el control.
* **Salidas:** Definición de rangos de [0 20] para las ganancias, categorizadas desde "Zero" hasta "Muy Grande".

### 3. Base de Reglas Adaptativas
Desarrollo de las 133 reglas de inferencia tipo Mamdani que gobiernan la lógica de adaptación. Estas reglas determinan, por ejemplo, cómo aumentar la ganancia proporcional ($K_p$) cuando el error es grande para acelerar la respuesta del sistema.

---

**Punto Crítico:** La efectividad de un controlador difuso adaptativo reside en el diseño correcto de la base de reglas; una sintonía agresiva puede llevar al sistema a la inestabilidad, mientras que una muy conservadora anula las ventajas de la adaptabilidad en tiempo real.
