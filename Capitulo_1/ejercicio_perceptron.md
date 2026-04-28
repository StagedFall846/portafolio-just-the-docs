%% ALGORITMO DEL PERCEPTRÓN SIMPLE (2 ENTRADAS)
% Proyecto: Clasificación de la función lógica OR
% Objetivo: Encontrar la frontera de decisión linealmente separable

clear;  % Limpiar las variables previas
clc;    % Limpiar la ventana de comandos
close all;  % Cerrar cualquier ventana de gráfico abierta

%% 1. Configuración del Set de Entrenamiento
x1 = [0 1 0 1];  % Entradas x1 de la función OR
x2 = [0 0 1 1];  % Entradas x2 de la función OR
t = [-1 1 1 1];  % Salidas deseadas para la función OR

% Se definen las entradas (x1, x2) y las salidas deseadas (t) según la tabla de verdad de la función OR:
% La salida debe ser -1 cuando (x1, x2) = (0, 0), y 1 para los demás casos.

%% 2. Parámetros iniciales
w = [0.0679 0.0758 0.0743];  % Pesos iniciales [w0 (sesgo), w1, w2]
eps = 0.01;  % Tasa de aprendizaje (coeficiente de velocidad)
epoca = 0;  % Inicialización de la variable de época (iteración)
lim_ep = 20;  % Límite máximo de épocas (número de iteraciones)

x1v = -1.5:0.01:1.5;  % Rango de valores para graficar la frontera de decisión

% Se establecen los parámetros de entrenamiento, incluyendo la tasa de aprendizaje y los pesos iniciales. 
% Además, el límite de épocas es 20, lo que significa que el algoritmo intentará aprender durante 20 iteraciones como máximo.

%% 3. Gráfica inicial
figure(1);  % Crear una nueva figura para graficar
hold on;  % Mantener la gráfica para agregar más elementos
grid on;  % Activar la cuadrícula en el gráfico

title('Entrenamiento del Perceptrón - OR');  % Título del gráfico
xlabel('x1');  % Etiqueta del eje x
ylabel('x2');  % Etiqueta del eje y

% Graficamos los puntos de entrada de acuerdo con su clase (t).
% Los puntos donde t = 1 se grafican en azul, y donde t = -1 se grafican en rojo.

for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3, 'MarkerFaceColor', 'b');  % Puntos positivos (1) en azul
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3, 'MarkerFaceColor', 'r');  % Puntos negativos (-1) en rojo
    end
end

%% 4. Entrenamiento
for i = 1:lim_ep  % Entrenamos durante un número máximo de épocas
    
    vector_error = [];  % Lista para almacenar los errores en cada iteración
    
    % Para cada punto de entrenamiento, aplicamos el algoritmo de ajuste de pesos.
    for j = 1:length(t)  % Iteramos sobre cada punto de la tabla de verdad
        % Construcción del vector de entradas [1, x1(j), x2(j)] (incluye el sesgo)
        X = [1 x1(j) x2(j)]; 
        
        % Cálculo de la salida del perceptrón (producto punto de los pesos y las entradas)
        V = w * X';  % Producto punto entre pesos y entradas
        
        % Función de activación: Determina la salida según el valor de V
        if V > 0
            y = 1;  % Salida positiva (1)
        elseif V == 0
            y = 0;  % Si V es cero, asignamos 0 (no es común, pero lo dejamos para seguridad)
        else
            y = -1;  % Salida negativa (-1)
        end
        
        % Cálculo del error (diferencia entre la salida esperada t(j) y la salida obtenida y)
        e = t(j) - y;
        
        % Actualización de los pesos (Regla de aprendizaje del perceptrón)
        w = w + eps * X * e;  % Ajuste de los pesos en función del error
        
        vector_error = [vector_error e];  % Guardamos el error para análisis posterior
    end

    % Graficamos la frontera de decisión en función de los pesos actualizados
    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));  % Ecuación de la recta (frontera de decisión)
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5], 'LineWidth', 1);  % Dibujamos la frontera de decisión

    % Configuramos los límites de la gráfica
    axis([-1 1 -1 1]);  % Definimos los límites de la gráfica
    axis square;  % Aseguramos que los ejes sean proporcionales

    % Verificamos si el error es cero, lo que significa que hemos alcanzado la convergencia
    if norm(vector_error) == 0
        plot(x1v, x2v, 'g', 'LineWidth', 2.5);  % Mostrar la frontera de decisión final en verde
        fprintf('Condición alcanzada en la época: %d\n', epoca);  % Mostrar mensaje de convergencia
        break  % Detener el entrenamiento si hemos encontrado la solución
    end

    epoca = epoca + 1;  % Aumentamos el contador de épocas
    pause(0.1);  % Pausamos brevemente para ver la evolución del gráfico
end

%% 5. Resultado
fprintf('\n-----------------------------\n');

if norm(vector_error) ~= 0
    disp('No convergió.');  % Si el error no es cero, el algoritmo no ha convergido
else
    disp('Entrenamiento exitoso.');  % Si el error es cero, el entrenamiento fue exitoso
end

fprintf('Pesos finales: %.4f %.4f %.4f\n', w(1), w(2), w(3));  % Mostrar los pesos finales
fprintf('-----------------------------\n');
