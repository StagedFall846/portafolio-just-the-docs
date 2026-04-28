# 🧠 Algoritmo del Perceptrón Simple (2 entradas)

**Proyecto:** Clasificación de la función lógica OR  
**Objetivo:** Encontrar la frontera de decisión linealmente separable.

---

## 💻 Código

``` matlab
%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable

clear; 
clc; 
close all;

%% 1. Configuración del Set de Entrenamiento (Teacher)
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1]; % Salida deseada (-1: Falso, 1: Verdadero)

%% 2. Condiciones Iniciales y Parámetros
w = [0.0679 0.0758 0.0743]; % Pesos iniciales [bias, w1, w2]
eps = 0.01; % Coeficiente de aprendizaje
epoca = 0;
lim_ep = 20;

x1v = -1.5:0.01:1.5; % Vector para graficar frontera

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

%% 4. Ciclo de Entrenamiento (Iteraciones)
for i = 1:lim_ep
    
    vector_error = [];
    
    for j = 1:length(t)
        X = [1 x1(j) x2(j)]; % Vector de entrada con bias
        V = w * X';          % Potencial de activación
        
        % Función de Activación
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        e = t(j) - y;        % Error
        w = w + eps * X * e; % Actualización de pesos
        
        vector_error = [vector_error e];
    end

    % Frontera de decisión
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5], 'LineWidth', 1);

    axis([-1 1 -1 1]); 
    axis square;

    % Verificación de convergencia
    if norm(vector_error) == 0
        plot(x1v, x2v, 'g', 'LineWidth', 2.5); % Línea final
        fprintf('Condición alcanzada en la época: %d\n', epoca);
        break
    end

    epoca = epoca + 1;
    pause(0.1);
end

%% 5. Resultado Final
fprintf('\n-----------------------------\n');

if norm(vector_error) ~= 0
    disp('Resultado: Límite de épocas alcanzado sin convergencia.');
else
    disp('Resultado: Entrenamiento completado exitosamente.');
end

fprintf('Pesos finales: w0=%.4f, w1=%.4f, w2=%.4f\n', w(1), w(2), w(3));
fprintf('-----------------------------\n');
```
