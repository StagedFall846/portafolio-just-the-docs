%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable

clear; 
clc; 
close all;

%% 1. Configuración del Set de Entrenamiento
% Entradas x1, x2 y las salidas deseadas t para la función OR
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1]; % Salida deseada para cada combinación de entradas

%% 2. Parámetros iniciales
% Inicializamos los pesos aleatoriamente, el coeficiente de aprendizaje y las épocas
w = [0.0679 0.0758 0.0743]; % Pesos iniciales
eps = 0.01; % Tasa de aprendizaje
epoca = 0; % Contador de épocas
lim_ep = 20; % Límite máximo de épocas

% Rango de valores para graficar la frontera de decisión
x1v = -1.5:0.01:1.5;

%% 3. Gráfica inicial
% Visualizamos el conjunto de datos (entradas x1, x2) con sus correspondientes salidas
figure(1);
hold on;
grid on;
for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3); % Puntos positivos (Clase 1)
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3); % Puntos negativos (Clase -1)
    end
end
title('Entrenamiento del Perceptrón - Función OR');
xlabel('x1');
ylabel('x2');

%% 4. Proceso de Entrenamiento
% Aquí realizamos el entrenamiento iterativo del Perceptrón
for i = 1:lim_ep
    
    % Vector de errores de cada iteración
    vector_error = [];
    
    % Iteración sobre el conjunto de entrenamiento
    for j = 1:length(t)
        % Vector de entrada, con un 1 añadido para el sesgo (bias)
        X = [1 x1(j) x2(j)];
        % Producto punto entre los pesos y el vector de entrada
        V = w * X';
        
        % Decisión: si V > 0, clasificación positiva (y = 1); si V <= 0, clasificación negativa (y = -1)
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        % Cálculo del error: diferencia entre la salida deseada t(j) y la salida predicha y
        e = t(j) - y;
        
        % Actualización de los pesos
        w = w + eps * X * e;
        
        % Guardamos el error para ver si el algoritmo converge
        vector_error = [vector_error e];
    end
    
    % Calculamos la nueva frontera de decisión
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    plot(x1v, x2v, 'LineWidth', 1.5);
    
    % Ajuste de los límites de la gráfica
    axis([-1 1 -1 1]);
    axis square;
    axis tight;
    
    % Verificación de convergencia (si el error total es cero, se detiene el entrenamiento)
    if norm(vector_error) == 0
        disp('Condición alcanzada: el perceptrón ha convergido.');
        break;
    end
    
    % Incremento de la época
    epoca = epoca + 1;
    pause(1); % Pausa para visualizar el proceso
end

%% 5. Resultado
% Verificación del resultado final y de los pesos obtenidos
fprintf('Entrenamiento exitoso.\n');
fprintf('Pesos finales: %.4f %.4f %.4f\n', w(1), w(2), w(3));
