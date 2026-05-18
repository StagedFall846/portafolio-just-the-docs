---
layout: default
title: "3.10.5 Entrenamiento y Modelado"
parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
has_children: true
nav_order: 11
---

# Entrenamiento y Evaluación del Modelo

Esta sección define cómo sabemos si nuestra red neuronal realmente "aprendió" a comportarse como el sistema físico, conectando la calidad de los datos iniciales con las métricas finales de evaluación en MATLAB.

## 1. La Base del Éxito (El Modelado)
Antes de evaluar los resultados, se recalca una regla inquebrantable: el éxito del entrenamiento depende absolutamente de la calidad y "riqueza" de la señal de entrada $u(k)$ (los datos que le proporcionamos para aprender). Si la entrada es pobre o carece de dinámica, el entrenamiento fracasará sin importar la complejidad de la red neuronal.

## 2. Métricas de Calidad
Una vez entrenada la red, MATLAB proporciona dos indicadores estadísticos clave para calificar su desempeño:

* **MSE (Error Cuadrático Medio):** Mide qué tan equivocada está la red respecto al comportamiento real. El objetivo es que este valor sea lo más cercano a 0. Un MSE alto significa que la red no logró imitar la dinámica de la planta.
* **Regresión (R):** Mide la correlación lineal entre la salida deseada (lo que queríamos que la red predijera) y la salida real obtenida. El objetivo es que sea lo más cercano a 1. Un valor de $R = 1$ significa una calca perfecta; un valor bajo indica que las predicciones están muy dispersas.

---

> ### 🔄 Diseño Iterativo
> El entrenamiento no es un proceso de un solo intento. Es normal (y estrictamente necesario) entrenar la red, evaluar el MSE y R, y si los resultados no son óptimos, regresar para modificar la topología (ej. añadir más neuronas o capas ocultas) o enriquecer los datos de entrenamiento hasta conseguir el modelo ideal.
