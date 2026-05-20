---
layout: default
title: "Algoritmos de Búsqueda Básica"
parent: "5.1 Búsqueda Básica"
grand_parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
nav_order: 1
---


## Optimización de Funciones Polinomiales

En este ejercicio clásico de fundamentos de optimización, se analiza el comportamiento de dos algoritmos de búsqueda aplicados a una función objetivo polinomial de cuarto grado:

$$f(x) = x^4 + 5x^3 + 4x^2 - 4x + 1$$

### Conceptos Clave

*   **Hill Climbing (Escalada de Colinas):** Es un algoritmo de optimización local. Comienza con una solución aleatoria e intenta encontrar una mejor evaluando variaciones incrementales (dando pequeños pasos en $x$). El proceso se repite iterativamente hasta que no se puedan encontrar mejoras en su vecindario inmediato.
*   **Random Search (Búsqueda Aleatoria):** Es un algoritmo de optimización global. Explora de forma aleatoria todo el espacio de búsqueda definido, evaluando la función (fitness) en múltiples puntos simultáneamente para calificar y encontrar la mejor solución sin depender de una posición inicial.

---

## Código en MATLAB: Implementación Comparativa

El siguiente script resuelve el problema implementando ambos métodos de forma clara y permitiendo comparar sus resultados tanto en consola como gráficamente.

```matlab
% =========================================================================
% Optimización: Hill Climbing vs Random Search
% Función objetivo: f(x) = x^4 + 5x^3 + 4x^2 - 4x + 1
% =========================================================================

clear; clc; close all;

% 1. Definir la función objetivo como una función anónima
f = @(x) x.^4 + 5*x.^3 + 4*x.^2 - 4*x + 1;

% Rango para visualización (sabemos por cálculo que los mínimos están entre -4 y 1)
x_plot = linspace(-4, 1.5, 100);
y_plot = f(x_plot);

figure('Color', 'w');
plot(x_plot, y_plot, 'k', 'LineWidth', 1.5); hold on;
title('Optimización: f(x) = x^4 + 5x^3 + 4x^2 - 4x + 1');
xlabel('x'); ylabel('f(x)');
grid on;

%% --- ALGORITMO 1: HILL CLIMBING ---
disp('--- Algoritmo de Hill Climbing ---');

% Parámetros iniciales
x_actual = 0;       % Punto de partida (Pruébalo también con -3.5 para ver el otro mínimo)
step = 0.01;        % Tamaño del paso incremental
max_iter = 1000;    % Límite de iteraciones
y_actual = f(x_actual);

plot(x_actual, y_actual, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); % Graficar inicio

for i = 1:max_iter
    % Evaluar las soluciones vecinas (izquierda y derecha)
    x_izq = x_actual - step;
    x_der = x_actual + step;
    
    y_izq = f(x_izq);
    y_der = f(x_der);
    
    % Decidir el mejor movimiento (el que minimice más la función)
    if y_izq < y_actual && y_izq <= y_der
        x_actual = x_izq;
        y_actual = y_izq;
    elseif y_der < y_actual && y_der < y_izq
        x_actual = x_der;
        y_actual = y_der;
    else
        % Si ningún vecino es menor, hemos llegado a un mínimo (local o global)
        disp(['Convergencia alcanzada en la iteración: ', num2str(i)]);
        break;
    end
end

fprintf('Mínimo (Hill Climbing) en x = %.4f con f(x) = %.4f\n\n', x_actual, y_actual);
plot(x_actual, y_actual, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Graficar final HC

%% --- ALGORITMO 2: RANDOM SEARCH ---
disp('--- Algoritmo de Random Search ---');

% Parámetros iniciales
N = 10000;      % Número de muestras aleatorias
lb = -4;        % Límite inferior del espacio de búsqueda
ub = 1.5;       % Límite superior del espacio de búsqueda

% 1. Generar N puntos aleatorios dentro del límite [lb, ub]
x_rand = lb + (ub - lb) * rand(1, N);

% 2. Evaluar la función fitness para todos los puntos generados
y_rand = f(x_rand);

% 3. Encontrar el punto que dio el valor mínimo
[y_min_rs, indice_min] = min(y_rand);
x_min_rs = x_rand(indice_min);

fprintf('Mínimo (Random Search) en x = %.4f con f(x) = %.4f\n', x_min_rs, y_min_rs);
plot(x_min_rs, y_min_rs, 'b*', 'MarkerSize', 10); % Graficar final RS

legend('f(x)', 'Inicio Hill Climbing', 'Mínimo Hill Climbing', 'Mínimo Random Search', 'Location', 'North');
```

[Descargar hill_climbing_ejercicio.m](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_5/H%26R/hill_climbing_ejercicio.m){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
