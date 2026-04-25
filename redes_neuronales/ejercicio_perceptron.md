---
layout: default
title: Entrenamiento del Perceptrón
parent: Redes Neuronales
nav_order: 1
---

# Ejercicio 1: Regla de Hebb y Perceptrón
En este ejercicio se implementa un perceptrón simple para resolver una función lógica OR, aplicando la regla de aprendizaje de Hebb.

## 📝 Contexto del problema
El objetivo es encontrar los pesos $w$ que permitan clasificar correctamente las entradas binarias. 

## 💻 Implementación en MATLAB
A continuación, se muestra el código utilizado para el entrenamiento:

```matlab
% Inicialización de pesos y bias
w = [0.5; -0.2];
b = 0.1;
alpha = 0.1; % Tasa de aprendizaje

% Datos de entrada (Función OR)
x = [0 0; 0 1; 1 0; 1 1];
t = [0; 1; 1; 1];

for i = 1:length(x)
    y = hardlim(x(i,:)*w + b);
    e = t(i) - y;
    w = w + alpha * e * x(i,:)'; % Actualización de pesos
end
