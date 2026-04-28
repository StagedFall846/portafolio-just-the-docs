%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable

clear; 
clc; 
close all;

%% 1. Configuración del Set de Entrenamiento
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1]; % Salida deseada

%% 2. Parámetros iniciales
w = [0.0679 0.0758 0.0743]; % Pesos iniciales
eps = 0.01; % Tasa de aprendizaje
epoca = 0; % Inicialización de épocas
lim_ep = 20; % Límite de épocas

x1v = -1.5:0.01:1.5;

%% 3. Gráfica inicial
figure(1);
hold on;
grid on;

title('Entrenamiento del Perceptrón - OR');
xlabel('x1');
ylabel('x2');

% Graficamos los puntos de entrada (x1, x2)
for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3, 'MarkerFaceColor', 'b');
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3, 'MarkerFaceColor', 'r');
    end
end

%% 4. Entrenamiento
for i = 1:lim_ep
    
    % Vector de errores
    vector_error = [];
    
    for j = 1:length(t)
        X = [1 x1(j) x2(j)]; % Incluimos el sesgo
        V = w * X'; % Producto punto entre pesos y entrada
        
        % Determinamos la salida predicha
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        % Cálculo del error
        e = t(j) - y;
        
        % Actualización de los pesos
        w = w + eps * X * e;
        
        % Guardamos el error
        vector_error = [vector_error e];
    end

    % Calculamos la nueva frontera de decisión
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5], 'LineWidth', 1);

    % Ajuste de los límites de la gráfica
    axis([-1 1 -1 1]); 
    axis square;
    axis tight;

    % Verificación de convergencia
    if norm(vector_error) == 0
        plot(x1v, x2v, 'g', 'LineWidth', 2.5);
        fprintf('Condición alcanzada en la época: %d\n', epoca);
        break
    end

    epoca = epoca + 1;
    pause(0.1);
end

%% 5. Resultado
fprintf('\n-----------------------------\n');

if norm(vector_error) ~= 0
    disp('No convergió.');
else
    disp('Entrenamiento exitoso.');
end

fprintf('Pesos finales: %.4f %.4f %.4f\n', w(1), w(2), w(3));
fprintf('-----------------------------\n');
