## Algoritmo del Perceptrón Simple (2 entradas)

**Proyecto:** Clasificación de la función lógica OR  
**Objetivo general:** Entrenar un **perceptrón** para clasificar correctamente la **función lógica OR** ajustando los pesos mediante aprendizaje supervisado.


---

## Objetivo de la práctica
- Implementar y entrenar un perceptrón para resolver la función lógica OR con dos entradas. El objetivo es ajustar los pesos del perceptrón mediante aprendizaje supervisado hasta que clasifique correctamente todas las combinaciones de entradas.

---

## Descripción del ejercicio

En este ejercicio se implementa un perceptrón de dos entradas para aprender la función lógica **OR**.

El modelo recibe pares de entrada `(x1, x2)` y debe clasificarlos correctamente en dos clases:

- **1** → Verdadero  
- **-1** → Falso  

La clave del ejercicio es que este problema es **linealmente separable**, por lo que el perceptrón puede encontrar una solución.

### Tabla de verdad de la función OR

| x1  | x2  | Salida (t) |
|-----|-----|------------|
|  0  |  0  |     -1     |
|  0  |  1  |     1      |
|  1  |  0  |     1      |
|  1  |  1  |     1      |

### Proceso de entrenamiento

El entrenamiento se repite durante varias **épocas** hasta que el perceptrón clasifica correctamente todas las combinaciones, ajustando la **línea de decisión** en cada iteración. El objetivo es observar cómo el modelo aprende a separar las clases y ajusta sus pesos para mejorar su desempeño.

---

## Código

```matlab
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
```
