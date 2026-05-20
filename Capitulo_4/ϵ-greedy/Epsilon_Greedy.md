---
layout: default
title: "Implementación de ϵ-greedy"
parent: "Algoritmo ϵ-greedy"
grand_parent: "Capítulo 4: Algoritmos Evolutivos"
nav_order: 1
---

## El Modelo Matemático

### 1. Cálculo de la estimación $Q_t(a)$

La estimación del valor de una acción es simplemente el promedio de las recompensas recibidas por esa acción específica hasta el momento actual:

$$Q_t(a) = \frac{\sum_{i=1}^{t-1} R_i \cdot \mathbb{I}(A_i = a)}{\sum_{i=1}^{t-1} \mathbb{I}(A_i = a)}$$

Para no almacenar todo el historial de recompensas en memoria, se utiliza la regla de actualización incremental iteración tras iteración:

$$Q_{new}(a) = Q_{old}(a) + \frac{1}{N(a)} \left[ R - Q_{old}(a) \right]$$

Donde $R$ es la recompensa obtenida y $N(a)$ es el contador de cuántas veces se ha seleccionado la acción $a$.

### 2. Política de Selección de Acción

La regla de decisión se define formalmente como:

$$\text{Acción} = \begin{cases} \arg\max_a Q_t(a) & \text{con probabilidad } 1 - \epsilon \\ \text{Acción aleatoria uniforme} & \text{con probabilidad } \epsilon \end{cases}$$

---

## Código en MATLAB: Simulación de Multi-Armed Bandit con $\epsilon$-greedy

Este código implementa exactamente la misma estructura y las mismas 4 máquinas del ejercicio anterior para que puedas comparar de manera directa cómo difiere el comportamiento de búsqueda de ambos algoritmos.

```matlab
function epsilon_greedy_bandit()
    clear; clc; close all;

    % 1. Configuración del Entorno (Multi-Armed Bandit)
    num_acciones = 4;        % Máquinas A1, A2, A3, A4
    max_pasos = 500;         % Cantidad de intentos
    epsilon = 0.15;          % Probabilidad de exploración (15% explorar, 85% explotar)

    % Recompensas reales promedio ocultas (Idénticas al ejercicio anterior)
    recompensas_reales = [0.2, 0.8, 0.5, 0.3]; 

    % 2. Inicialización del Agente
    Q = zeros(1, num_acciones);       % Estimaciones iniciales Q_t(a) = 0
    N = zeros(1, num_acciones);       % Contador de ejecuciones por acción

    % Historiales para análisis visual
    historial_recompensa = zeros(1, max_pasos);
    historial_Q = zeros(max_pasos, num_acciones);

    % 3. Bucle Principal de Aprendizaje
    for t = 1:max_pasos
        
        % --- POLÍTICA EPSILON-GREEDY (Selección de Acción) ---
        if rand() < epsilon
            % EXPLORACIÓN: Elige cualquier máquina al azar con igual probabilidad
            accion = randi(num_acciones);
        else
            % EXPLOTACIÓN: Elige la máquina que tiene el valor Q_t(a) más alto
            [~, accion] = max(Q); 
        end

        % --- ENTORNO (Se genera la recompensa binaria) ---
        recompensa = rand() < recompensas_reales(accion);

        % --- CÁLCULO DE LA ESTIMACIÓN Q_t(a) ---
        N(accion) = N(accion) + 1; % Incrementar el contador de la acción
        
        % Fórmula incremental paso a paso para actualizar el promedio Q
        Q(accion) = Q(accion) + (1 / N(accion)) * (recompensa - Q(accion));

        % Guardar datos históricos
        historial_recompensa(t) = recompensa;
        historial_Q(t, :) = Q;
    end

    % 4. Despliegue de Resultados en Consola
    fprintf('=== RESULTADOS DE LA SIMULACIÓN EPSILON-GREEDY ===\n\n');
    fprintf('Valores Reales de las Máquinas:     [%s]\n', num2str(recompensas_reales, ' %.2f '));
    fprintf('Valores Estimados por el Agente (Q): [%s]\n', num2str(Q, ' %.2f '));
    fprintf('Número de veces que eligió cada una: [%s]\n\n', num2str(N, ' %d '));
    
    [~, mejor_maquina] = max(Q);
    fprintf('El agente determinó que la mejor máquina es la: A%d\n', mejor_maquina);

    % 5. Gráficas de Rendimiento
    graficar_evolucion(historial_Q, num_acciones);
end

% --- FUNCIÓN AUXILIAR PARA GRAFICAR ---
function graficar_evolucion(historial_Q, num_acciones)
    figure('Color', [1 1 1]);
    plot(historial_Q, 'LineWidth', 2);
    title('\epsilon-Greedy: Evolución de las Estimaciones de Valor Q_t(a)');
    xlabel('Pasos de Tiempo (Iteraciones)');
    ylabel('Valor Estimado Q_t(A_i)');
    
    leyendas = cell(1, num_acciones);
    for i = 1:num_acciones
        leyendas{i} = sprintf('Máquina A%d', i);
    end
    legend(leyendas, 'Location', 'southeast');
    grid on;
end
```
