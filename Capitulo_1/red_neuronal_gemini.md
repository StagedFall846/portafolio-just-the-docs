---
layout: default
title: "Comparativa de Arquitecturas NNET en Simulink"
parent: "Capítulo 1: Redes Neuronales"
nav_order: 2
---

## Generador de Entrenamiento: Cinemática Inversa 2GDL con Red Neuronal

**Proyecto:** Resolución de Cinemática Inversa para un Robot de 2 Grados de Libertad usando Redes Neuronales  
**Objetivo general:** Entrenar una red neuronal para resolver la cinemática inversa de un robot 2GDL, prediciendo los ángulos articulares y evaluando su desempeño.

---

## Objetivos de la práctica

- Entrenar una red neuronal para resolver el problema de la cinemática inversa de un robot de 2 grados de libertad (2GDL).
- Predecir los ángulos de las articulaciones (θ1, θ2) a partir de las coordenadas X, Y de un punto en el espacio de trabajo del robot.
- Evaluar el desempeño de la red neuronal mediante visualización y pruebas comparando las predicciones con los valores reales.
- Generar un diagrama de Simulink para integrar la red neuronal con una planta en Simulink.

---

## Descripción del ejercicio

Este ejercicio utiliza una red neuronal para resolver el problema de la cinemática inversa de un robot de 2 grados de libertad (2GDL). El objetivo es entrenar la red para que, dado un punto en el espacio de trabajo del robot (coordenadas X, Y), la red prediga los ángulos de las articulaciones (θ1, θ2) necesarios para alcanzar ese punto.

---

## Código

```matlab
%% Generador de entrenamiento: Cinemática Inversa 2GDL con Red Neuronal
% Optimizado para aprendizaje didáctico y visualización
clear; clc; close all;

l1 = 0.2; % [m]
l2 = 0.15; % [m]

%% 1. Generación de Datos de Entrenamiento (Optimizada)
% Aumentamos los datos para un mejor mapeo del espacio continuo
n = 5000; 

% Restringimos el espacio articular para asegurar un mapeo UNO a UNO.
% Theta 1: de 0 a 180 grados (0 a pi rad)
th1 = 360 * rand(1, n); 
% Theta 2: de 0 a 180 grados (Obligamos a la configuración "codo abajo")
th2 = 180 * rand(1, n);

% Cinemática Directa (Ecuaciones para generar las entradas de la red)
x = l1 * cosd(th1) + l2 * cosd(th1+th2);
y = l1 * sind(th1) + l2 * sind(th1+th2);

% Visualización del Espacio de Trabajo del Robot
figure('Name', 'Espacio de Trabajo del Robot');
scatter(x, y, 5, 'filled', 'MarkerFaceAlpha', 0.5);
title('Espacio de Trabajo Alcanzable (Datos de Entrenamiento)');
xlabel('X [m]'); ylabel('Y [m]');
axis equal; grid on;

% ATENCIÓN AL CAMBIO: 
% Para cinemática inversa, las entradas de la red son las coordenadas (x,y)
% y las salidas esperadas (targets) son los ángulos (th1, th2).
Ent = [x; y];      
Sal = [th1; th2];  

%% 2. Creación y Configuración de la Red Neuronal
% Usamos feedforwardnet (más moderno y limpio que 'network' manual)
% Arquitectura: 2 capas ocultas con 20 y 15 neuronas
net = feedforwardnet([20 15]);

% --- Configuración de Funciones de Activación ---
% Capa 1: 'tansig' (Tangente hiperbólica). Excelente para mapear la no linealidad del seno/coseno.
net.layers{1}.transferFcn = 'tansig'; 
% Capa 2: 'poslin' (ReLU). Ayuda a evitar el desvanecimiento del gradiente.
net.layers{2}.transferFcn = 'poslin'; 
% Capa de Salida (Capa 3): 'purelin' (Lineal). Obligatoria en la salida para predecir valores continuos (grados).
net.layers{3}.transferFcn = 'purelin';

% División de datos: 70% Entrenamiento, 15% Validación, 15% Prueba
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio   = 15/100;
net.divideParam.testRatio  = 15/100;

% Algoritmo de entrenamiento: Levenberg-Marquardt (rápido para regresión de este tamaño)
net.trainFcn = 'trainlm'; 
view(net);
%% 3. Entrenamiento de la Red
disp('Entrenando la red neuronal... (Esto tomará unos segundos)');
[net, tr] = train(net, Ent, Sal);

% Obtenemos las predicciones de toda la base de datos para análisis
Sal_pred = net(Ent);

%% 4. Gráficas Didácticas (Regresión y Desempeño)
% 1. Rendimiento del entrenamiento (Error Cuadrático Medio vs Épocas)
figure('Name', 'Rendimiento de la Red');
plotperform(tr);

% 2. Regresión Lineal: Compara las salidas de la red (Y) contra los datos reales (T)
% Si la red es perfecta, todas las líneas estarán sobre R = 1 (una diagonal perfecta a 45 grados).
figure('Name', 'Análisis de Regresión Lineal');
plotregression(Sal(1,:), Sal_pred(1,:), 'Regresión Theta 1', ...
               Sal(2,:), Sal_pred(2,:), 'Regresión Theta 2');

%% 5. Prueba de la Red (Cinemática Inversa en Acción)
% Probaremos con un punto válido DENTRO del espacio de trabajo.
x_test = 0.2;
y_test = -0.1;
Punto_Prueba = [x_test; y_test];

% 1. La Red Neuronal predice los ángulos
Angulos_Predichos = net(Punto_Prueba);
th1_p = Angulos_Predichos(1);
th2_p = Angulos_Predichos(2);

fprintf('\n--- Resultados de la Prueba ---\n');
fprintf('Punto deseado: X = %.2f m, Y = %.2f m\n', x_test, y_test);
fprintf('Ángulos calculados por la Red: Theta1 = %.2f°, Theta2 = %.2f°\n', th1_p, th2_p);

% 2. Comprobación matemática (Cinemática Directa con los ángulos de la red)
x_calc = l1 * cosd(th1_p) + l2 * cosd(th1_p+th2_p);
y_calc = l1 * sind(th1_p) + l2 * sind(th1_p+th2_p);
fprintf('Punto real alcanzado con esos ángulos: X = %.4f m, Y = %.4f m\n', x_calc, y_calc);
fprintf('Error Euclidiano: %.4f metros\n', norm([x_test-x_calc; y_test-y_calc]));

% 3. Gráfica de los eslabones del robot
figure('Name', 'Postura del Robot');
% Trazar eslabones: (0,0) -> Articulación 2 -> Efector final
plot([0, l1*cosd(th1_p), x_calc], [0, l1*sind(th1_p), y_calc], '-o', 'LineWidth', 4, 'MarkerSize', 8);
hold on;
plot(x_test, y_test, 'rx', 'MarkerSize', 12, 'LineWidth', 2); % El objetivo marcado con una X roja
axis([-0.4 0.4 -0.4 0.4]); grid on;
title('Prueba del Robot con Ángulos Predichos');
legend('Eslabones del Robot', 'Punto Objetivo');

%% 6. Generar Bloque de Simulink
% Genera un diagrama de bloques listo para conectarse a una planta en Simulink
gensim(net);
```

<a href="red_neuronal_gemini.m" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar red_neuronal_gemini.m
</a>
