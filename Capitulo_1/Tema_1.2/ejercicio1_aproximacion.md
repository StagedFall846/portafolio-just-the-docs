---
layout: default
title: "Aproximación por Rectas Secantes"
parent: "1.2 Control Convencional e Inteligente"
grand_parent: "Capítulo 1: Redes Neuronales"
nav_order: 1
---


## 1.2: Aproximación por Rectas Secantes (MATLAB)

**Proyecto:** Aproximación de una Función No Lineal mediante Segmentos Lineales (Rectas Secantes)
**Objetivo general:** Aproximar una función no lineal utilizando múltiples rectas secantes en intervalos definidos, evaluando la precisión de la aproximación y su representación gráfica en MATLAB.

---

## Objetivos de la práctica
- Implementar una aproximación por tramos de una función no lineal usando rectas.
- Calcular la ecuación de cada recta secante en distintos intervalos del dominio.
- Visualizar la comparación entre la función original y su aproximación lineal.
- Analizar cómo el tamaño y solapamiento de los intervalos afecta la precisión.


---

## Descripción del ejercicio

En este ejercicio se implementa una técnica de **control convencional** para aproximar la función no lineal:

\[
y = -2x - x^2
\]

mediante el uso de **rectas secantes** calculadas por tramos.

El modelo divide el dominio de la función original en **5 intervalos específicos** (algunos con solapamiento) para calcular la ecuación de la recta (y = mx + b) que mejor represente cada segmento:

- **Aproximación Lineal** → Cada tramo se trata como un modelo matemático exacto.  
- **Cálculo de Pendientes** → Se determinan los valores de \(m\) y \(b\) basándose en los puntos extremos de cada rango.  

La clave del ejercicio es observar cómo, al fragmentar una curva compleja en segmentos lineales más simples, es posible emular su comportamiento sin necesidad de recurrir inicialmente a un modelo de control inteligente.

---

### Rangos y Funciones de Aproximación

| Función | Intervalo \([x1, x2]) | Color Asignado |
| :--- | :--- | :--- |
| \(f_1\) | \(-10\) a \(-6\) | Verde |
| \(f_2\) | \(-8\) a \(0\) | Azul |
| \(f_3\) | \(-4\) a \(2\) | Rojo |
| \(f_4\) | \(-2\) a \(6\) | Gris |
| \(f_5\) | \(4\) a \(8\) | Negro |

---

### Proceso de Cálculo y Visualización

El algoritmo en MATLAB procesa cada rango definido en la matriz de datos para obtener los puntos exactos sobre la parábola. Posteriormente, genera la visualización comparativa entre:

- La **función original** (representada en gris de fondo)  
- Las **5 rectas secantes** resultantes  

Esto permite analizar visualmente el **error de aproximación**, especialmente en las zonas donde los intervalos se solapan.

---

## Código
```matlab
% ========================================================================
% Programa: Aproximación por 5 Rectas (Rangos Solapados)
% Función base: y = -2x - x^2
% ========================================================================

clear; clc; close all;

% Definimos los datos exactos de la tabla en la imagen
% Estructura: [x_inicial, x_final, R (Red), G (Green), B (Blue)]
data = [
    -10, -6,  0,   0.8, 0;    % f1: Verde
     -8,  0,  0,   0.4, 1;    % f2: Azul
     -4,  2,  0.8, 0.2, 0.2;  % f3: Rojo
     -2,  6,  0.5, 0.5, 0.5;  % f4: Gris
      4,  8,  0,   0,   0     % f5: Negro
];

num_funciones = size(data, 1);

fprintf('==========================================================\n');
fprintf(' CÁLCULO DE LAS 5 RECTAS (y = mx + b)\n');
fprintf('==========================================================\n');

% Preparamos la figura
figure('Color', 'w');
hold on; grid on;

% 1. Graficar la función original (Parábola) de fondo
x_fino = linspace(-12, 12, 500);
y_real = -2*x_fino - x_fino.^2;
plot(x_fino, y_real, 'Color', [0.8 0.8 0.8], 'LineWidth', 3, 'DisplayName', 'Original: -2x - x^2');

% 2. Bucle para calcular y graficar cada una de las 5 funciones
for i = 1:num_funciones
    x1 = data(i, 1);
    x2 = data(i, 2);
    color_linea = data(i, 3:5);
    
    % Calcular y1 y y2 usando la función original
    y1 = -2*x1 - x1^2;
    y2 = -2*x2 - x2^2;
    
    % Calcular pendiente (m) y ordenada (b)
    m = (y2 - y1) / (x2 - x1);
    b = y1 - (m * x1);
    
    % Mostrar la ecuación en consola
    fprintf('f%d -> Rango [%2d, %2d] | Puntos: (%d, %d) a (%d, %d)\n', ...
            i, x1, x2, x1, y1, x2, y2);
    
    % Formato condicional para el signo de b
    if b >= 0
        fprintf('      Ecuación: y = %.2fx + %.2f\n', m, b);
    else
        fprintf('      Ecuación: y = %.2fx - %.2f\n', m, abs(b));
    end
    fprintf('----------------------------------------------------------\n');
    
    % Graficar el segmento de recta
    x_seg = [x1, x2];
    y_seg = [y1, y2];
    plot(x_seg, y_seg, 'o-', 'LineWidth', 2, 'Color', color_linea, ...
        'MarkerFaceColor', color_linea, 'DisplayName', sprintf('f%d', i));
    
    % Extender visualmente la recta (punteada) para ver la tangente/secante
    % x_ext = linspace(x1-1, x2+1, 10);
    % plot(x_ext, m*x_ext + b, '--', 'Color', color_linea, 'LineWidth', 1);
end

% Decoración del gráfico
title('Aproximación por 5 Funciones (Secantes)');
xlabel('x'); ylabel('y');
legend('Location', 'South');
axis([-11 9 -90 10]); % Ajustar zoom
```

<a href="ejercicio1_aproximacion.m" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar ejercicio1_aproximacion.m
</a>
