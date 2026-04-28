%% Algoritmo para perceptrón, 2 entradas
clear;
clc;
close all;

% Tabla de verdad (Teacher-Ejemplo de entrenamiento
% FUNCIÓN OR
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1];

% Condiciones iniciales y parámetros de entrenamiento
w = [0.0679 0.0758 0.0743];
eps = 0.01; % Coeficiente de velocidad de entrenamiento
epoca = 0; % Inicializo mis epocas
lim_ep = 20; %Límite máximo de epocas

x1v = [-1.5:0.01:1.5];
figure(1);
hold on;
grid on;
for p = 1:length(t)
    plot(x1(p),x2(p), 'ob', 'LineWidth', 3)
end

%% Iteraciones
for i=1:lim_ep
    flag=0;
    vector_error = [];
    for j=1:length(t)
        X = [1 x1(j) x2(j)];
        V = w*X'

        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        y
        % Calculo el error
        e = t(j)-y
        % Defino proximos pesos
        w = w + eps*X*e
        vector_error = [vector_error e];
    end
    x2v = (-w(2)/w(3))*x1v-(w(1)/w(3))
    plot(x1v, x2v, LineWidth=1.5)
    axis([-1 1 -1 1]);
    axis square;
    axis tight;
    % Cálculo de norma del error
    if norm(vector_error) == 0
        flag = 1;
        disp('Condición alcanzada')
        break
    else
        flag = 0;
    end
    epoca = epoca + 1
    pause(1);
end