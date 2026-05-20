---
layout: default
title: "Implementación de UCB"
parent: "Algoritmo UCB"
grand_parent: "Capítulo 4: Algoritmos Evolutivos"
nav_order: 1
---


## Algoritmo UCB (Upper Confidence Bound) (MATLAB)

**Proyecto:** Implementación del Algoritmo UCB para el Problema del K-Armed Bandit

**Objetivo general:** Evaluar el comportamiento del algoritmo UCB, el cual basa su estrategia de exploración en la evaluación de la incertidumbre y el potencial estimado de las acciones, logrando una adaptación automática entre exploración y explotación en un entorno simulado de MATLAB.

---

## Objetivos de la práctica
- Implementar la estrategia UCB asignando puntuaciones de confianza a cada acción en lugar de depender de la aleatoriedad.
- Aplicar la fórmula matemática de límite superior de confianza para equilibrar la toma de decisiones.
- Ejecutar una fase de inicialización obligatoria para muestrear cada brazo y evitar errores de división por cero.
- Observar y analizar la convergencia más rápida hacia el brazo óptimo en comparación con métodos basados puramente en políticas como $\epsilon$-greedy.

---

## Descripción del ejercicio

A diferencia de las estrategias $\epsilon$-greedy, el algoritmo **UCB (Upper Confidence Bound)** no depende de la aleatoriedad para explorar el entorno. En su lugar, asigna una puntuación de confianza a cada acción (brazo). Esta puntuación está diseñada para priorizar inteligentemente dos tipos de acciones: aquellas que parecen ser prometedoras (tienen una alta recompensa promedio registrada) y aquellas que han sido poco muestreadas (tienen una alta incertidumbre).

### Fundamento Teórico

Para elegir la acción óptima en cada paso de tiempo $t$, el algoritmo implementa la siguiente fórmula matemática:

$$A_t = \arg \max_a \left[ Q_t(a) + c \sqrt{\frac{\ln t}{N_t(a)}} \right]$$

Donde:
- $Q_t(a)$ es el valor estimado actual de la acción.
- $c$ es el **Coeficiente de Exploración**. Un valor más alto fuerza al sistema a explorar más.
- $t$ es el paso de tiempo actual de la simulación.
- $N_t(a)$ es el número total de veces que la acción $a$ ha sido seleccionada hasta el momento.

> **Nota de programación:** Para evitar una indeterminación matemática (división por cero) al calcular el término $\frac{\ln t}{N_t(a)}$, es imperativo que el algoritmo "jale" o interactúe con cada brazo al menos una vez al inicio del bucle de aprendizaje.

Si ejecutas este código, notarás la principal ventaja de este método: el propio algoritmo adapta automáticamente sus necesidades de exploración y explotación a medida que recopila más información, logrando por lo general una convergencia más rápida al brazo óptimo (el de $\mu = 2.0$) que el algoritmo $\epsilon$-greedy.

---

## Código
```matlab
% =========================================================================
% Algoritmo UCB (Upper Confidence Bound) para el K-Armed Bandit
% =========================================================================

clear; clc; close all;

% 1. Definición del entorno (3 Máquinas) según el problema planteado
mu = [1.0, 2.0, 1.5];       % Medias de la recompensa de A1, A2, A3
sigma = [0.5, 0.5, 1.5];    % Desviaciones estándar de A1, A2, A3
K = length(mu);             % Número total de brazos (acciones)

% 2. Parámetros del algoritmo
c = 2.0;                    % Coeficiente de exploración (controla la incertidumbre)
pasos = 1000;               % Número total de iteraciones de tiempo (t)

% 3. Inicialización
Q = zeros(1, K);            % Estimaciones de recompensa iniciales
N = zeros(1, K);            % Conteo de veces que se elige cada acción
historial_recompensas = zeros(1, pasos); % Para graficar el desempeño

fprintf('==========================================================\n');
fprintf(' SIMULACIÓN DEL K-ARMED BANDIT (ALGORITMO UCB)\n');
fprintf('==========================================================\n');

% --- Fase de Inicialización Obligatoria ---
% Para usar la fórmula UCB sin dividir por cero (N_t(a) = 0), 
% debemos probar cada brazo exactamente una vez al inicio.
for t = 1:K
    accion = t;
    % Obtener recompensa muestreando la distribución normal
    R = mu(accion) + sigma(accion) * randn(); 
    
    N(accion) = 1;
    Q(accion) = R;
    historial_recompensas(t) = R;
end

% 4. Bucle principal de aprendizaje
for t = (K + 1):pasos
    
    % --- Selección de Acción (Fórmula UCB) ---
    % log(t) calcula el logaritmo natural (ln) en MATLAB
    % Esta operación es vectorizada (calcula UCB para todos los brazos a la vez)
    ucb_valores = Q + c * sqrt(log(t) ./ N);
    
    % Elegir la acción que maximice la ecuación UCB
    [~, accion] = max(ucb_valores);
    
    % --- Interacción con el Entorno ---
    % Generar la recompensa (R) muestreando la distribución normal
    R = mu(accion) + sigma(accion) * randn();
    
    % --- Actualización de Estimaciones ---
    N(accion) = N(accion) + 1;
    
    % Fórmula de promedio incremental para Q_{t+1}(a)
    Q(accion) = Q(accion) + (1 / N(accion)) * (R - Q(accion));
    
    % Guardar la recompensa obtenida
    historial_recompensas(t) = R;
end

% 5. Visualización de Resultados
recompensa_promedio_acumulada = cumsum(historial_recompensas) ./ (1:pasos);

figure('Color', 'w');
plot(1:pasos, recompensa_promedio_acumulada, 'r', 'LineWidth', 1.5);
hold on;
yline(2.0, '--k', 'Óptimo (Q^* = 2.0)', 'LineWidth', 1.5); % Línea del valor óptimo
title('Algoritmo UCB (Upper Confidence Bound)');
xlabel('Pasos de Tiempo (t)');
ylabel('Recompensa Promedio Acumulada');
grid on;

% Mostrar resultados en consola
disp('Valores Q reales (mu):');
disp(mu);
disp('Valores Q estimados por el agente:');
disp(Q);
disp('Número de veces que se jaló cada brazo:');
disp(N);
```

[Descargar Algoritmo_UCB.m](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_4/UCB/Algoritmo_UCB.m){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
