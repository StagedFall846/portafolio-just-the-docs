## Algoritmo del Perceptrón Simple (2 entradas)

**Proyecto:** Clasificación de la función lógica OR  
**Objetivo general:** Encontrar la frontera de decisión linealmente separable.

---

## Objetivos de la práctica

- Comprender el funcionamiento del perceptrón simple  
- Aplicar aprendizaje supervisado a un problema lógico  
- Analizar el ajuste iterativo de los pesos  
- Visualizar la frontera de decisión  
- Verificar la convergencia del algoritmo  

---

## Descripción del ejercicio

En este ejercicio se implementa un perceptrón de dos entradas para aprender la función lógica **OR**.

El modelo recibe pares de entrada `(x1, x2)` y debe clasificarlos correctamente en dos clases:

- **1** → Verdadero  
- **-1** → Falso  

La clave del ejercicio es que este problema es **linealmente separable**, por lo que el perceptrón puede encontrar una solución.

---

## Código

```matlab
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
w = [0.0679 0.0758 0.0743];
eps = 0.01;
epoca = 0;
lim_ep = 20;

x1v = -1.5:0.01:1.5;

%% 3. Gráfica inicial
figure(1);
hold on;
grid on;

title('Entrenamiento del Perceptrón - OR');
xlabel('x1');
ylabel('x2');

for p = 1:length(t)
    if t(p) == 1
        plot(x1(p), x2(p), 'ob', 'LineWidth', 3, 'MarkerFaceColor', 'b');
    else
        plot(x1(p), x2(p), 'or', 'LineWidth', 3, 'MarkerFaceColor', 'r');
    end
end

%% 4. Entrenamiento
for i = 1:lim_ep
    
    vector_error = [];
    
    for j = 1:length(t)
        X = [1 x1(j) x2(j)];
        V = w * X';
        
        if V > 0
            y = 1;
        elseif V == 0
            y = 0;
        else 
            y = -1;
        end
        
        e = t(j) - y;
        w = w + eps * X * e;
        
        vector_error = [vector_error e];
    end

    x2v = (-w(2)/w(3)) * x1v - (w(1)/w(3));
    plot(x1v, x2v, 'Color', [0.5 0.5 0.5], 'LineWidth', 1);

    axis([-1 1 -1 1]); 
    axis square;

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
```
fprintf('Pesos finales: %.4f %.4f %.4f\n', w(1), w(2), w(3));
fprintf('-----------------------------\n');
