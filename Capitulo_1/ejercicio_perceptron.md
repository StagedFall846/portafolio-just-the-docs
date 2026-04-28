%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable.

clear;
clc;
close all;

%% 1. Configuración del Set de Entrenamiento (Teacher)
% Representación de la función OR
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1]; % Salida deseada

%% 2. Condiciones Iniciales y Parámetros
w = [0.0679 0.0758 0.0743]; % Pesos iniciales [bias, w1, w2]
eps = 0.01;                 % Learning rate
epoca = 0;
lim_ep = 20;
x1v = [-1.5:0.01:1.5];

%% 3. Inicialización de la Gráfica
figure(1);
hold on;
grid on;
title('Entrenamiento del Perceptrón - Función OR');
xlabel('Entrada x1');
ylabel('Entrada x2');

% Dibujar puntos de entrenamiento
for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3, 'MarkerFaceColor', 'b');
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3, 'MarkerFaceColor', 'r');
    end
end

%% 4. Ciclo de Entrenamiento
for i = 1:lim_ep
    flag = 0;
    vector_error = [];
    
    for j = 1:length(t)
        X = [1 x1(j) x2(j)]; % Vector de entrada con bias
        V = w * X';          % Potencial de activación
        
        % Función de Activación (Signo)
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        e = t(j) - y;        % Cálculo del error
        w = w + eps * X * e; % Actualización de pesos
        vector_error = [vector_error e];
    end
    
    % Actualización de la frontera de decisión
    % Ecuación: w0 + w1*x1 + w2*x2 = 0 => x2 = (-w1/w2)*x1 - (w0/w2)
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    
    % Graficar evolución
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5, 0.3], 'LineWidth', 1); 
    axis([-1 1 -1 1]);
    axis square;
    
    % Verificación de convergencia
    if norm(vector_error) == 0
        flag = 1;
        plot(x1v, x2v, 'g', 'LineWidth', 2.5); % Frontera final en verde
        fprintf('Condición alcanzada en la época: %d\n', epoca);
        break
    end
    
    epoca = epoca + 1;
    pause(0.2); 
end 

%% 5. Verificación Final
if flag == 0
    disp('Se alcanzó el límite de épocas sin convergencia total.');
else
    disp('Entrenamiento completado exitosamente.');
end
