---
layout: default
title: Cinemática de Brazo 2 GDL
parent: Robótica y Control
nav_order: 1
---

# Análisis Cinematográfico: Brazo de 2 GDL
En esta práctica se programa la cinemática directa e inversa de un manipulador plano de dos grados de libertad.

## 💻 Código en MATLAB
Este script permite visualizar el espacio de trabajo y calcular los ángulos necesarios para alcanzar un punto en el espacio.

```matlab
% Parámetros del robot
l1 = 0.2; % metros
l2 = 0.15; % metros

% Generación de ángulos para entrenamiento
n = 1000;
th1 = 360 * rand(n, 1);
th2 = 360 * rand(n, 1);

% Cinemática Directa (Posición final)
x = l1 * cosd(th1) + l2 * cosd(th1+th2);
y = l1 * sind(th1) + l2 * sind(th1+th2);

% Graficación
scatter(x, y, 5, 'filled');
title('Espacio de Trabajo del Robot');
grid on; axis equal;
