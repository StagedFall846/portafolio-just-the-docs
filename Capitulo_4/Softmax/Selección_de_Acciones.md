---
layout: default
title: "Implementación Softmax"
parent: "Algoritmo Softmax"
grand_parent: "Capítulo 4: Algoritmos Evolutivos"
nav_order: 1
---


## Selección de Acciones mediante Softmax (Multi-Armed Bandit)

El problema del **Multi-Armed Bandit** (el dilema de las máquinas tragamonedas o "bandidos multibrazo") representa uno de los desafíos fundamentales del Aprendizaje por Refuerzo (*Reinforcement Learning*): el equilibrio entre **exploración** (probar nuevas opciones para descubrir su potencial) y **explotación** (elegir la mejor opción conocida hasta el momento).

En lugar de utilizar una estrategia rígida como $\epsilon$-greedy —que elige de forma puramente aleatoria al explorar—, la estrategia **Softmax** (basada en la distribución de Boltzmann) asigna a cada acción una probabilidad de selección proporcional al valor estimado de su recompensa $Q(A_i)$.

---

### El Modelo Matemático de Softmax

La probabilidad $P(a)$ de elegir la acción $a$ en el paso de tiempo $t$ se calcula mediante la siguiente función de distribución:

$$P(a) = \frac{e^{Q_t(a) / \tau}}{\sum_{b=1}^{k} e^{Q_t(b) / \tau}}$$

Donde las variables clave definen el comportamiento del agente:

* **$Q_t(a)$:** Representa el valor estimado o recompensa promedio esperada de la acción $a$ hasta el momento actual.
* **$\tau$ (tau):** Es el parámetro de temperatura que controla el grado de aleatoriedad del sistema:
  * Si $\tau \to \infty$, las probabilidades de todas las acciones se igualan, dando lugar a una **exploración puramente aleatoria**.
  * Si $\tau \to 0$, el peso se concentra por completo en la acción con el valor de $Q$ más alto, convirtiéndose en una **explotación pura**.

---

### Código en MATLAB: Simulación del Entorno

Este script simula un entorno con **4 máquinas tragamonedas** donde cada una cuenta con una probabilidad real y oculta de entregar una recompensa. El algoritmo Softmax interactúa con ellas de manera autónoma para descubrir y explotar la alternativa óptima.

```matlab
function softmax_multi_armed_bandit()
    clear; clc; close all;

    % 1. Configuración del Entorno (Multi-Armed Bandit)
    num_acciones = 4;        % Número de máquinas disponibles (A1, A2, A3, A4)
    max_pasos = 500;         % Cantidad de jugadas o intentos de la simulación
    tau = 0.2;               % Parámetro de temperatura para el control de Softmax

    % Recompensas reales promedio ocultas (el agente debe descubrirlas)
    recompensas_reales = [0.2, 0.8, 0.5, 0.3]; 

    % 2. Inicialización del Agente
    Q = zeros(1, num_acciones);       % Valores estimados iniciales de cada acción
    N = zeros(1, num_acciones);       % Contador de ejecuciones por cada acción

    % Historiales para análisis y graficación
    historial_recompensa = zeros(1, max_pasos);
    historial_Q = zeros(max_pasos, num_acciones);

    % 3. Bucle Principal de Aprendizaje
    for t = 1:max_pasos
        
        % --- ALGORITMO SOFTMAX (Selección de Acción) ---
        % Estabilización numérica para prevenir desbordamientos por overflow (Inf)
        Q_estabilizado = Q - max(Q);
        exp_Q = exp(Q_estabilizado / tau);
        probabilidades = exp_Q / sum(exp_Q);

        % Selección estocástica de la acción basada en las probabilidades
        accion = seleccionar_por_probabilidad(probabilidades);

        % --- ENTORNO (Generación de la Recompensa) ---
        % Evaluamos de forma probabilística si la máquina otorga premio
        recompensa = rand() < recompensas_reales(accion);

        % --- ACTUALIZACIÓN DE CONOCIMIENTO ---
        N(accion) = N(accion) + 1;
        
        % Actualización incremental del promedio móvil del valor Q
        Q(accion) = Q(accion) + (1 / N(accion)) * (recompensa - Q(accion));

        % Almacenamiento en el historial
        historial_recompensa(t) = recompensa;
        historial_Q(t, :) = Q;
    end

    % 4. Despliegue de Resultados en Consola
    fprintf('=== RESULTADOS DE LA SIMULACIÓN SOFTMAX ===\n\n');
    fprintf('Valores Reales de las Máquinas:    [%s]\n', numstr(recompensas_reales, ' %.2f '));
    fprintf('Valores Estimados por el Agente (Q): [%s]\n', numstr(Q, ' %.2f '));
    fprintf('Número de veces que eligió cada una: [%s]\n\n', numstr(N, ' %d '));
    
    [~, mejor_maquina] = max(Q);
    fprintf('El agente determinó que la mejor máquina es la: A%d\n', mejor_maquina);

    % 5. Gráficas de Rendimiento
    graficar_evolucion(historial_Q, num_acciones);
end

% --- FUNCIÓN AUXILIAR: SELECCIÓN ESTOCÁSTICA ---
function accion = seleccionar_por_probabilidad(probs)
    % Implementa una selección por método de ruleta (Distribución Acumulada)
    cumulative_sum = cumsum(probs);
    r = rand();
    accion = find(r <= cumulative_sum, 1, 'first');
end

% --- FUNCIÓN AUXILIAR: VISUALIZACIÓN ---
function graficar_evolucion(historial_Q, num_acciones)
    figure('Color', [1 1 1]);
    plot(historial_Q, 'LineWidth', 2);
    title('Evolución de las Estimaciones de Valor Q (Softmax)');
    xlabel('Pasos de Tiempo (Iteraciones)');
    ylabel('Valor Estimado Q(A_i)');
    
    % Generación dinámica de leyendas
    leyendas = cell(1, num_acciones);
    for i = 1:num_acciones
        leyendas{i} = sprintf('Máquina A%d', i);
    end
    legend(leyendas, 'Location', 'southeast');
    grid on;
end
```

[Descargar](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_4/Softmax/softmax_multi_armed_bandit.m){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
