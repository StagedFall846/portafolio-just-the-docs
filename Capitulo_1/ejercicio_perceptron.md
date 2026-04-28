# 🧠 Ejercicio: Perceptrón

Este ejercicio implementa un **perceptrón de dos entradas**, uno de los modelos más básicos dentro del campo del aprendizaje supervisado y base de las redes neuronales artificiales.

---

## 🎯 Objetivos

- Comprender el funcionamiento del algoritmo del perceptrón.
- Implementar el entrenamiento con datos simples.
- Analizar el ajuste de pesos en función del error.
- Visualizar la frontera de decisión.
- Aplicar el modelo a una función lógica (OR).

---

## 📊 Problema

Se entrena el perceptrón para aprender la función lógica **OR**:

| x1 | x2 | t  |
|----|----|----|
| 0  | 0  | -1 |
| 1  | 0  |  1 |
| 0  | 1  |  1 |
| 1  | 1  |  1 |

---

## 💻 Código

```matlab
%% Algoritmo para perceptrón, 2 entradas
clear;
clc;
close all;

% Tabla de verdad (FUNCIÓN OR)
x1 = [0 1 0 1];
x2 = [0 0 1 1];
t = [-1 1 1 1];

% Condiciones iniciales
w = [0.0679 0.0758 0.0743];
eps = 0.01;
epoca = 0;
lim_ep = 20;

x1v = -1.5:0.01:1.5;

figure(1);
hold on;
grid on;

for p = 1:length(t)
    plot(x1(p),x2(p), 'ob', 'LineWidth', 3)
end

%% Iteraciones
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

    x2v = (-w(2)/w(3))*x1v - (w(1)/w(3));
    plot(x1v, x2v, 'LineWidth', 1.5);

    axis([-1 1 -1 1]);
    axis square;
    axis tight;

    if norm(vector_error) == 0
        disp('Condición alcanzada')
        break
    end

    epoca = epoca + 1;
    pause(1);
end
