---
layout: default
title: "Optimización de Funciones"
parent: "Máximo de una Función"
grand_parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
nav_order: 1
---


## Evaluación de Desempeño (MATLAB)

**Proyecto:** Algoritmo Genético Básico con Codificación Binaria

**Objetivo general:** Integrar todas las fases de un Algoritmo Genético clásico empleando codificación binaria para la optimización de una función matemática, evaluando su rendimiento estadístico y convergencia computacional en MATLAB.

---

## Objetivos de la práctica
- Analizar matemáticamente el espacio de búsqueda y calcular el máximo teórico de una función polinomial dado un cromosoma binario de 6 genes.
- Implementar las fases evolutivas de inicialización, decodificación, evaluación, selección por ruleta, cruza de un punto y mutación.
- Registrar el error residual por época comparándolo con el valor máximo teórico esperado.
- Medir y evaluar el tiempo de máquina (tiempo computacional) requerido para la convergencia del algoritmo a lo largo de 1000 iteraciones.

---

## Descripción del ejercicio

Este ejercicio corresponde a una práctica excelente para integrar todas las fases de un Algoritmo Genético básico evaluando su rendimiento estadístico general.

### Análisis Matemático del Problema

Antes de programar, es crucial entender el espacio de búsqueda. El objetivo es maximizar la siguiente función:  

$$y = \frac{x^2}{4} - 2x + 10$$

El individuo está codificado como un cromosoma binario de 6 genes. Esto significa que el valor fenotípico (decimal) de $x$ está limitado por las combinaciones de 6 bits, que van desde 0 (000000) hasta 63 (111111).  

Si analizamos la parábola en el dominio $x \in [0, 63]$, el valor máximo se encuentra exactamente en el límite superior ($x = 63$). Evaluando este punto:

$$y(63) = \frac{63^2}{4} - 2(63) + 10 = 992.25 - 126 + 10 = 876.25$$

Por lo tanto, el máximo teórico esperado es **876.25**. Esta será nuestra referencia para calcular la convergencia al error en cada iteración.  

---

## Código

El script que se diseña a continuación sigue los pasos de un Algoritmo Genético Básico (población inicial, decodificación, evaluación, selección, cruza y mutación). Además, incluye el registro del error y del tiempo de máquina durante 1000 iteraciones continuas.

```matlab
function ga_ejercicio_maximizacion()
    clc; clear; close all;

    % --- 1. PARÁMETROS DEL ALGORITMO ---
    pop_size = 40;       % Tamaño de población
    num_genes = 6;       % Cromosoma binario de 6 genes 
    max_iter = 1000;     % Iteraciones / Épocas a evaluar
    pc = 0.90;           % Probabilidad de cruza (usualmente alta)
    pm = 0.10;           % Probabilidad de mutación (usualmente baja)

    % Función objetivo y valor máximo teórico
    f_obj = @(x) (x.^2)/4 - 2*x + 10; %
    max_teorico = 876.25; 

    % Variables para evaluación de desempeño
    historial_error = zeros(max_iter, 1); %
    
    % Inicialización de población (matriz binaria aleatoria)
    poblacion = randi([0, 1], pop_size, num_genes);

    % Iniciar cronómetro de tiempo máquina
    tic;

    % --- 2. CICLO EVOLUTIVO ---
    for iter = 1:max_iter
        % a) Decodificación de binario a decimal
        % Se usan potencias de 2 (2^5, 2^4... 2^0) para la conversión
        potencias = 2.^(num_genes-1:-1:0);
        x_dec = poblacion * potencias'; 

        % b) Función de aptitud
        fitness = f_obj(x_dec);

        % Registrar el error de la generación actual 
        mejor_fitness_actual = max(fitness);
        historial_error(iter) = max_teorico - mejor_fitness_actual;

        % c) Selección (Método de Ruleta)
        suma_f = sum(fitness); %
        prob_seleccion = fitness / suma_f; %
        prob_acumulada = cumsum(prob_seleccion); %

        nueva_poblacion = zeros(pop_size, num_genes);
        for i = 1:pop_size
            r = rand(); %
            idx = find(prob_acumulada >= r, 1, 'first'); %
            nueva_poblacion(i, :) = poblacion(idx, :);
        end

        % d) Operador de Recombinación / Cruza (1 punto)
        for i = 1:2:pop_size
            if rand() < pc %
                % Punto de corte aleatorio
                punto = randi([1, num_genes-1]);
                temp1 = nueva_poblacion(i, :);
                temp2 = nueva_poblacion(i+1, :);
                
                % Intercambio de material genético
                nueva_poblacion(i, punto+1:end) = temp2(punto+1:end);
                nueva_poblacion(i+1, punto+1:end) = temp1(punto+1:end);
            end
        end

        % e) Operador de Mutación
        for i = 1:pop_size
            for j = 1:num_genes
                if rand() < pm %
                    % Invertir el bit (cambio espontáneo)
                    nueva_poblacion(i, j) = ~nueva_poblacion(i, j);
                end
            end
        end

        % f) Reemplazo de población
        poblacion = nueva_poblacion;
    end

    % Detener cronómetro
    tiempo_total = toc; %

    % --- 3. RESULTADOS DE DESEMPEÑO ---
    % Evaluar población final
    x_dec_final = poblacion * potencias';
    fitness_final = f_obj(x_dec_final);
    [mejor_f_final, idx_mejor] = max(fitness_final);
    mejor_cromosoma = poblacion(idx_mejor, :);

    fprintf('=== MEDIDAS ESTADÍSTICAS DE DESEMPEÑO ===\n\n'); %
    fprintf('Cromosoma óptimo encontrado: [%s]\n', num2str(mejor_cromosoma, '%d '));
    fprintf('Valor decodificado (X):      %d\n', x_dec_final(idx_mejor));
    fprintf('Aptitud máxima alcanzada:    %.4f\n', mejor_f_final);
    fprintf('Error residual final:        %.4f\n', historial_error(end)); %
    fprintf('Tiempo máquina (1000 iter):  %.4f segundos\n', tiempo_total); %

    % --- 4. GRÁFICA DE CONVERGENCIA ---
    figure('Name', 'Evaluación de Desempeño', 'Color', 'w');
    plot(1:max_iter, historial_error, 'LineWidth', 1.5, 'Color', [0.1, 0.4, 0.7]);
    title('Convergencia al Error a lo largo de 1000 Iteraciones'); %
    xlabel('Épocas (Iteraciones)'); %
    ylabel('Error (Máximo Teórico - Mejor Actual)');
    grid on;
end
```
[Descargar](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_5/Medidas_estadisticas/ga_ejercicio_maximizacion.m){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
