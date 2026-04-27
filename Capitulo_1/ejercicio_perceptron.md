---
layout: default
title: "Ejercicio 1 - Perceptrón Simple"
parent: "Capítulo 1: Redes Neuronales"
nav_order: 1
---

# Ejercicio 1: Algoritmo de Perceptrón Simple

## 🎯 Objetivo del Ejercicio
Implementar el algoritmo del perceptrón simple para clasificar datos linealmente separables. En este ejercicio, el modelo aprenderá a representar el comportamiento de una compuerta lógica (como AND u OR) ajustando sus pesos sinápticos mediante el error obtenido en cada iteración.

## 💻 Código en MATLAB
A continuación se presenta la implementación del entrenamiento del perceptrón:

```matlab
% Inicialización de parámetros
entradas = [0 0; 0 1; 1 0; 1 1];
salidas_deseadas = [0; 0; 0; 1]; % Compuerta AND
pesos = rand(1, 2);
bias = rand();
tasa_aprendizaje = 0.1;
epochs = 10;

% Ciclo de entrenamiento
for e = 1:epochs
    for i = 1:size(entradas, 1)
        % Calcular suma ponderada
        suma = sum(entradas(i, :) .* pesos) + bias;
        
        % Función de activación (Escalón)
        y = double(suma >= 0);
        
        % Calcular error y actualizar
        error = salidas_deseadas(i) - y;
        pesos = pesos + tasa_aprendizaje * error * entradas(i, :);
        bias = bias + tasa_aprendizaje * error;
    end
end

disp('Pesos finales:');
disp(pesos);
