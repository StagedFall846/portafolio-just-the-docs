%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable.

clear;
clc;
close all;

%% 1. Configuración del Set de Entrenamiento (Teacher)
% Representación de la función OR
% Entradas: x1, x2 | Salida esperada: t
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1]; % Salida deseada (-1 para falso, 1 para verdadero)

%% 2. Condiciones Iniciales y Parámetros de Entrenamiento
% Pesos sinápticos iniciales (w0=bias, w1=x1, w2=x2)
w = [0.0679 0.0758 0.0743]; 

% Hiperparámetros
eps = 0.01;      % Coeficiente de velocidad de entrenamiento (Learning Rate)
epoca = 0;       % Contador de épocas
lim_ep = 20;     % Límite máximo de iteraciones

% Vector para graficar la línea de decisión
x1v = [-1.5:0.01:1.5];

%% 3. Inicialización de la Gráfica
figure(1);
hold on;
grid on;
title('Entrenamiento del Perceptrón - Función OR');
xlabel('Entrada x1');
ylabel('Entrada x2');

% Dibujar los puntos de entrenamiento
for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3, 'MarkerFaceColor', 'b');
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3, 'MarkerFaceColor', 'r');
    end
end

%% 4. Ciclo de Entrenamiento (Iteraciones)
for i = 1:lim_ep
    flag = 0;
    vector_error = [];
    
    for j = 1:length(t)
        % Definición del vector de entrada con bias (X0 = 1)
        X = [1 x1(j) x2(j)];
        
        % Cálculo de la suma ponderada (Potencial de activación)
        V = w * X';
        
        % Función de Activación (Signo/Escalón)
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        % Cálculo del error (Deseado - Obtenido)
        e = t(j) - y;
        
        % Regla de aprendizaje: Actualización de pesos
        w = w + eps * X * e;
        
        % Almacenar error para verificar convergencia
        vector_error = [vector_error e];
    end
    
    % Actualización de la frontera de decisión en la gráfica
    % Ecuación: w0 + w1*x1 + w2*x2 = 0  => x2 = (-w1/w2)*x1 - (w0/w2)
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    
    % Graficar la evolución de la línea
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5, 0.3], 'LineWidth', 1); 
    axis([-1 1 -1 1]);
    axis square;
    
    % Verificación de convergencia (Norma del error = 0)
    if norm(vector_error) == 0
        flag = 1;
        plot(x1v, x2v, 'g', 'LineWidth', 2.5); % Frontera final en verde
        fprintf('Condición alcanzada en la época: %d\n', epoca);
        break
    end
    
    epoca = epoca + 1;
    pause(0.5); % Pausa para visualizar la animación
end

%% 5. Resultado Final
if flag == 0
    disp('Se alcanzó el límite de épocas sin convergencia total.');
else
    disp('Entrenamiento completado exitosamente.');
end

% Mostrar pesos finales
fprintf('Pesos finales: w0=%.4f, w1=%.4f, w2=%.4f\n', w(1), w(2), w(3));
