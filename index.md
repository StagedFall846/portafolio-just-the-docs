layout: default
title: Inicio
nav_order: 1
description: "Recursos y ejercicios prácticos para el laboratorio de Control Inteligente."
---

# 📚 Repositorio de Ejercicios: Control Inteligente
Bienvenido al repositorio de materiales del laboratorio de **Control Inteligente**. Aquí encontrarás todo el contenido necesario para el aprendizaje práctico de los algoritmos de control, incluyendo documentación, scripts de MATLAB y modelos de Simulink organizados por temas.

## 🎯 Objetivo de este sitio
Este espacio está diseñado para proporcionar los recursos y guías técnicas necesarios para implementar y entender diversos algoritmos de control. Cada ejercicio está compuesto por:
- **Explicación del problema:** Contexto físico o matemático que aborda el ejercicio.
- **Implementación:** Código documentado en MATLAB o Simulink.
- **Resultados y análisis:** Evaluación de los resultados obtenidos, junto con una interpretación detallada de los mismos.

## 📋 Ejercicio: Control de un Sistema Dinámico No Lineal
### Descripción del ejercicio
En este ejercicio, se busca modelar y controlar un sistema dinámico no lineal que simula un sistema físico real, como un brazo robótico o un vehículo autónomo. El objetivo es aplicar un **algoritmo de control adaptativo** para estabilizar el sistema y minimizar el error entre la salida deseada y la salida real.

La implementación se realiza en **MATLAB**, donde utilizamos técnicas de control no lineales y ajustes dinámicos para obtener una respuesta estable.

### Código del ejercicio
```matlab
% Parámetros del sistema
A = [0 1; -1 -1];  % Matriz del sistema
B = [0; 1];        % Matriz de entrada
C = [1 0];         % Matriz de salida
D = 0;             % Matriz de transmisión directa

% Definición del controlador
Kp = 10;  % Ganancia proporcional
Ki = 5;   % Ganancia integral
Kd = 1;   % Ganancia derivativa

% Configuración del controlador PID
pidController = pid(Kp, Ki, Kd);

% Simulación del sistema con el controlador
sys = ss(A-B*Kp, B, C, D);
t = 0:0.1:10; % Tiempo de simulación
u = sin(t);  % Entrada de control (señal de referencia)
[y, t, x] = lsim(sys, u, t);

% Graficar resultados
figure;
subplot(2,1,1);
plot(t, y);
title('Respuesta del sistema');
xlabel('Tiempo (s)');
ylabel('Salida');
grid on;

subplot(2,1,2);
plot(t, u);
title('Entrada de control');
xlabel('Tiempo (s)');
ylabel('Entrada');
grid on;
