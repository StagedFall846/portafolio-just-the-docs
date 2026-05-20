---
layout: default
title: "Mecanismos de Selección"
parent: "Proceso de Selección"
grand_parent: "Capítulo 5: Algoritmos Genéticos y Evolutivos"
nav_order: 1
---


## Implementación de los 4 Métodos de Selección (MATLAB)

**Proyecto:** Evaluación Comparativa de Métodos de Selección en Algoritmos Genéticos
**Objetivo general:** Implementar y comparar cuatro técnicas de selección clásicas (Ruleta, Estocástico Universal, Torneo y Por Restos) sobre una población simulada para analizar su impacto en el equilibrio entre la exploración de la diversidad genética y la explotación de los mejores individuos.

---

## Objetivos de la práctica
- Generar una población inicial aleatoria asignando valores de aptitud (*fitness*) simulados para decodificar su viabilidad.
- Implementar algorítmicamente cuatro métodos de selección distintos para extraer $k$ individuos de una población de tamaño $n$.
- Analizar el sesgo probabilístico y determinista de cada técnica sobre la calidad promedio de los seleccionados.
- Visualizar de forma gráfica la evaluación comparativa para observar los fenómenos de presión selectiva y elitismo.

---

## Descripción del ejercicio

Este script genera una población aleatoria de $n = 100$, le asigna valores de aptitud aleatorios para simular su evaluación, y luego extrae $k = 10$ individuos utilizando cuatro técnicas evolutivas. Al ejecutar la evaluación comparativa, se notarán comportamientos específicos basados en el dilema de **Explotación vs Exploración**:

- **Selección por ruleta:** Es un método de alta exploración. Genera $k$ números aleatorios independientes $a_j$. Al ser puramente probabilístico, a veces seleccionará excelentes individuos, pero otras veces seleccionará individuos mediocres simplemente por azar. Su aptitud promedio suele ser ligeramente superior a la media de la población, pero con mucha variación.
- **Muestreo estocástico universal:** Al generar un solo número aleatorio $a_u$ y espaciar los demás de forma uniforme mediante la fórmula $a_j = \frac{a_u + j - 1}{k}$, elimina el sesgo del azar repetitivo de la ruleta. Es un método sumamente justo; su aptitud promedio suele ser muy estable y representa fielmente la distribución de aptitud de la población original.
- **Selección por torneo:** Es un método de alta explotación. Al tomar una muestra pequeña y elegir determinísticamente al mejor, empuja la calidad de la población hacia arriba muy rápidamente. En la gráfica notarás que su promedio suele ser de los más altos, pero reduce significativamente la diversidad genética.
- **Muestreo por restos:** Este método es el equilibrio perfecto entre explotación y exploración. Al tomar un grupo inicial determinista (explotación/elitismo) y rellenar el resto de los $k$ lugares mediante ruleta (exploración probabilística), asegura que los "mejores genes" sobrevivan, dando a la vez oportunidad a genes débiles pero potencialmente valiosos a futuro. Su promedio será alto gracias a la inyección de los individuos élite.

---

## Código

Puedes copiar y pegar este código directamente en un archivo llamado `comparacion_seleccion_ag.m` y ejecutarlo en MATLAB para observar la comparativa en consola y la generación de la gráfica de barras.

```matlab
function comparacion_seleccion_ag()
    clc; clear; close all;

    % --- 1. CONFIGURACIÓN INICIAL ---
    n = 100; % Tamaño de la población inicial
    k = 10;  % Número de individuos a seleccionar
    
    % Generamos un fitness aleatorio para los 100 individuos (simulando decodificación)
    % Usamos un rango de 1 a 100 para visualizar bien las diferencias
    fitness = randi([1, 100], n, 1);
    
    % --- CÁLCULOS PREVIOS DE PROBABILIDAD (Para Ruleta y Univ. Estocástico) ---
    suma_f = sum(fitness);          % Suma total de aptitudes
    P = fitness / suma_f;           % Probabilidad de selección Pi
    q = cumsum(P);                  % Probabilidad acumulada qi (ruleta)

    % Vectores para guardar los índices de los individuos seleccionados
    sel_ruleta = zeros(k, 1);
    sel_meu = zeros(k, 1);
    sel_torneo = zeros(k, 1);
    sel_restos = zeros(k, 1);

    % --- 2. SELECCIÓN POR RULETA ---
    % Se generan k números aleatorios y se busca su lugar en qi
    for j = 1:k
        a = rand(); % Número aleatorio entre 0 y 1
        sel_ruleta(j) = find(q >= a, 1, 'first');
    end

    % --- 3. MUESTREO ESTOCÁSTICO UNIVERSAL (MEU) ---
    % Solo se genera un número aleatorio a_u y se espacia uniformemente
    a_u = rand();
    for j = 1:k
        a_j = (a_u + j - 1) / k; 
        % Si a_j supera 1, le aplicamos módulo para que dé la "vuelta" a la ruleta
        if a_j > 1, a_j = a_j - 1; end 
        sel_meu(j) = find(q >= a_j, 1, 'first');
    end

    % --- 4. SELECCIÓN POR TORNEO ---
    % Se elige una muestra pequeña y se selecciona el mejor
    tamano_torneo = 3; % Elegimos 3 al azar para competir
    for j = 1:k
        candidatos = randperm(n, tamano_torneo);
        [~, idx_mejor] = max(fitness(candidatos));
        sel_torneo(j) = candidatos(idx_mejor);
    end

    % --- 5. MUESTREO POR RESTOS ---
    % Se toma un número de individuos menor a k de los mejores, el resto por ruleta
    num_mejores = 4; % Tomamos a los 4 mejores (Elitismo)
    [~, idx_ordenados] = sort(fitness, 'descend');
    
    sel_restos(1:num_mejores) = idx_ordenados(1:num_mejores);
    
    % Los k - num_mejores restantes se sacan por ruleta
    for j = (num_mejores + 1):k
        a = rand();
        sel_restos(j) = find(q >= a, 1, 'first');
    end

    % --- 6. EVALUACIÓN COMPARATIVA (Gráficas y Consola) ---
    % Extraemos el fitness de los seleccionados para compararlos
    fit_ruleta = fitness(sel_ruleta);
    fit_meu = fitness(sel_meu);
    fit_torneo = fitness(sel_torneo);
    fit_restos = fitness(sel_restos);

    fprintf('--- ANÁLISIS DE APTITUD PROMEDIO DE LOS %d SELECCIONADOS ---\n', k);
    fprintf('Promedio Población Original (n=%d): %.2f\n\n', n, mean(fitness));
    fprintf('1. Ruleta:               %.2f\n', mean(fit_ruleta));
    fprintf('2. Estocástico Univ.:    %.2f\n', mean(fit_meu));
    fprintf('3. Torneo (k=3):         %.2f\n', mean(fit_torneo));
    fprintf('4. Por Restos (4 top):   %.2f\n', mean(fit_restos));

    % Visualización
    figure('Name', 'Comparación de Métodos de Selección', 'Position', [100, 100, 900, 500]);
    nombres = {'Población Original', 'Ruleta', 'Estocástico Univ.', 'Torneo', 'Por Restos'};
    promedios = [mean(fitness), mean(fit_ruleta), mean(fit_meu), mean(fit_torneo), mean(fit_restos)];
    
    b = bar(promedios, 'FaceColor', 'flat');
    b.CData(1,:) = [0.7 0.7 0.7]; % Color gris para la original
    ylabel('Fitness Promedio');
    set(gca, 'xticklabel', nombres);
    title('Comparativa de Calidad (Fitness Promedio) por Método de Selección');
    grid on;
end
```
