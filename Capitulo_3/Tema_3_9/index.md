---
layout: default
title: "3.9 Modelado de sistemas con redes neuronales"
parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
has_children: true
nav_order: 9
---

# 3.9/3.9.1/3.10.2 Modelado y Preparación de Datos

Esta sección aborda el paso más crítico antes de entrenar una red neuronal en software: garantizar que los datos recolectados sirvan para capturar la dinámica real del sistema físico.

## 1. Modelado de Sistemas
El objetivo primordial es que la red "aprenda" el comportamiento dinámico de la planta a partir de su historial de entradas y salidas. El éxito del modelo final no depende tanto de la complejidad de la arquitectura de la red en sí, sino de la "riqueza" y variabilidad de la señal de entrada original <span class="math">u(k)</span>.

* **Captura Dinámica:** La señal debe ser capaz de inducir transitorios que muestren cómo reacciona el sistema ante diferentes condiciones de operación.
* **Fidelidad del Modelo:** Si la señal de estímulo es excesivamente simple, la red neuronal se quedará corta y será incapaz de generalizar el modelo completo frente a perturbaciones externas o cambios de frecuencia.

## 2. Preparación de Datos
Antes de alimentar la red en entornos de simulación y desarrollo (como MATLAB), la información empírica recolectada debe estructurarse de manera rigurosa:

* **Formato Matricial:** Se utilizan vectores o matrices bien definidos para agrupar ordenadamente las variables de entrada y sus respectivas salidas.
* **Regla Estricta de Consistencia:** Las dimensiones de los conjuntos de datos deben coincidir de forma exacta (el número de muestras o ejemplos de entrada debe ser perfectamente idéntico al número de muestras de salida). Dependiendo de la función o herramienta de la librería, los vectores se organizarán como filas o como columnas, pero siempre respetando la correspondencia temporal uno a uno.

---

> ### 🔑 Regla de Oro: Persistencia de Excitación (PE)
> Es el pilar fundamental en la identificación de sistemas. Establece que la señal de entrada debe poseer un espectro lo suficientemente amplio de frecuencias para **"excitar"** todos los modos dinámicos posibles de la planta (tanto las respuestas rápidas y transitorias como los comportamientos lentos de estado estacionario).
