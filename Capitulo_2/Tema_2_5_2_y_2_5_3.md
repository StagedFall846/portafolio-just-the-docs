---
layout: default
title: "Controladores Adaptativos y Ajustes (Secciones 2.5.2 y 2.5.3)"
parent: "Capítulo 2: Sistemas Difusos"
has_children: true
nav_order: 6
---

# 2.5.2. Controladores Difusos Adaptativos

Son sistemas dinámicos avanzados capaces de modificar sus propios parámetros internos en tiempo real. Esta arquitectura les permite autorregularse y ajustarse automáticamente ante variaciones imprevistas en la planta o perturbaciones externas del entorno.

* **Capacidad de Autoajuste:** Modifican de forma dinámica tanto las **funciones de membresía** (límites y formas geométricas) como el **conjunto de reglas lógicas** (*If-Then*).
* **Propósito Operativo:** Mantener un índice de desempeño óptimo aun cuando el sistema físico sufra desgaste estructural o cambios abruptos en sus condiciones de operación.

# 2.5.3. Ajustes de Controladores Difusos

El proceso de sintonización (*tuning*) consiste en alterar de manera estratégica los parámetros de las funciones de membresía y/o los pesos asignados a las reglas con el objetivo primordial de **minimizar el error de seguimiento** del sistema lazo cerrado.

Este procedimiento puede abordarse bajo dos esquemas fundamentales:
1. **Ajuste Manual:** Basado enteramente en la intuición, experiencia empírica y conocimiento cualitativo del experto u operador técnico.
2. **Técnicas Automáticas:** Implementación de algoritmos computacionales (como optimización por enjambre de partículas, algoritmos genéticos o redes neuro-difusas ANFIS) que calibran el controlador de forma autónoma bajo criterios analíticos específicos.

---

### 📊 Arquitectura del Sistema

A continuación se detalla la configuración de lazo cerrado para este tipo de estrategias:

<p align="center">
  <img src="assets/images/diagrama_control_difuso.png" alt="Diagrama de bloques de un sistema de control con modelo difuso y retroalimentación" width="80%">
  <br>
  <em><b>Figura 2.3:</b> Diagrama de bloques de un sistema de control con modelo difuso y retroalimentación. (Generada mediante inteligencia artificial.)</em>
</p>

---

> ### ⚙️ Nota de Diseño
> El control adaptativo mitiga la degradación del desempeño que sufren los controladores estáticos tradicionales ante fenómenos variables en el tiempo (como el calentamiento de actuadores o cambios de masa), convirtiéndose en un pilar clave para la automatización de sistemas mecatrónicos complejos.
