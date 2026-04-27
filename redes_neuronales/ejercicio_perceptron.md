---
layout: default
title: "Ejercicio 1 - Perceptrón Simple"
parent: "Capítulo 1: Redes Neuronales"
nav_order: 1
---

# Ejercicio 1: Algoritmo de Perceptrón para Función OR
Este ejercicio documenta la implementación de un perceptrón simple con dos entradas para resolver el problema de clasificación de la compuerta lógica OR.

## 📝 Explicación del Ejercicio
El objetivo es encontrar los pesos sinápticos $w$ que permitan separar linealmente los puntos de la función OR. El algoritmo ajusta los pesos en cada época basándose en el error cometido (diferencia entre el objetivo $t$ y la salida calculada $y$).

- **Entradas:** Vectores $x_1$ y $x_2$ representando la tabla de verdad.
- **Tolerancia:** Se entrena con un coeficiente de aprendizaje $\epsilon = 0.01$.
- **Criterio de Parada:** El entrenamiento finaliza cuando la norma del error es cero o se alcanzan las 20 épocas.

## 💻 Código en MATLAB
A continuación se presenta el script completo. Los bloques de código en esta página mantienen el formato de terminal para facilitar su lectura.

```matlab
%% Algoritmo para perceptrón, 2 entradas
clear; clc; close all;

% Tabla de verdad (Teacher-Ejemplo de entrenamiento)
% FUNCIÓN OR
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1];

% Condiciones iniciales y parámetros de entrenamiento
w = [0.0679 0.0758 0.0743];
eps = 0.01; % Coeficiente de velocidad de entrenamiento
epoca = 0; 
lim_ep = 20; % Límite máximo de épocas

x1v = [-1.5:0.01:1.5];
figure(1); hold on; grid on;
for p = 1:length(t)
    plot(x1(p),x2(p), 'ob', 'LineWidth', 3)
end

%% Iteraciones
for i=1:lim_ep
    flag=0;
    vector_error = [];
    for j=1:length(t)
        X = [1 x1(j) x2(j)];
        V = w*X';
        
        % Función de activación
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        % Cálculo del error y actualización de pesos
        e = t(j)-y;
        w = w + eps*X*e;
        vector_error = [vector_error e];
    end
    
    % Dibujar frontera de decisión en cada época
    x2v = (-w(2)/w(3))*x1v-(w(1)/w(3));
    plot(x1v, x2v, 'LineWidth', 1.5)
    axis([-1 1 -1 1]); axis square; axis tight;
    
    % Verificación de convergencia
    if norm(vector_error) == 0
        disp('Condición alcanzada');
        break;
    end
    epoca = epoca + 1;
    pause(1);
end
