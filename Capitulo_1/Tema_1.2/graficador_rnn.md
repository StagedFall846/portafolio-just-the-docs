---
layout: default
title: "Simulación de Red Estática y Desempeño"
parent: "1.2 Control Convencional e Inteligente"
grand_parent: "Capítulo 1: Redes Neuronales"
nav_order: 2
---


## Simulación de Red Estática y Análisis de Desempeño

**Proyecto:** Evaluación de Redes Neuronales Estáticas en Sistemas Dinámicos.
**Objetivo general:** Evaluar el rendimiento de una red neuronal estática entrenada para predecir el comportamiento dinámico de un sistema, analizando su precisión mediante herramientas de regresión y simulación directa en MATLAB.

---

## Objetivos de la práctica
- Analizar el desempeño estadístico del entrenamiento mediante la curva de error.
- Evaluar la capacidad de generalización de la red usando gráficas de regresión lineal.
- Comparar la respuesta temporal de la dinámica real frente a la predicción de la red neuronal.
- Generar el bloque equivalente en **Simulink** para su posterior integración en sistemas de control.


---

## Descripción del ejercicio

En este ejercicio se evalúa una **red neuronal estática (`red_estatica`)** previamente entrenada, utilizando:

- Métricas de desempeño del entrenamiento
- Análisis de regresión
- Simulación directa del sistema
- Exportación a Simulink

El objetivo es verificar qué tan bien la red logra aproximar el comportamiento de un sistema dinámico real.

---

## Código
```matlab
% 1. Gráficas de desempeño estadístico
figure('Name', 'Rendimiento de Entrenamiento');
plotperform(info_entrenamiento); 

figure('Name', 'Regresión (Predicción vs Real)');
% Reemplazamos las variables anteriores por u y x
plotregression(x, red_estatica(u)); 

% 2. Prueba de simulación (Evaluación directa, sin bucle recursivo)
pasos_simulacion = 1000; 

% La red calcula todos los estados simulados evaluando directamente el vector de torque
x_simulado = red_estatica(u(1:pasos_simulacion));

% Graficar la comparación de la variable q0 (primer eslabón)
figure('Name', 'Prueba Dinámica: Posición q0');
plot(1:pasos_simulacion, x(1, 1:pasos_simulacion), 'b', 'LineWidth', 1.5); hold on;
plot(1:pasos_simulacion, x_simulado(1, :), 'r--', 'LineWidth', 1.5);
legend('Dinámica Real', 'Predicción de Red Estática');
title('Comparación de q_0 en el tiempo');
xlabel('Muestras'); ylabel('Posición');

% 3. Exportación a Simulink y visualización
gensim(red_estatica, -1);
view(red_estatica)
```

<a href="graficador_rnn.m" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar graficador_rnn.m
</a>
