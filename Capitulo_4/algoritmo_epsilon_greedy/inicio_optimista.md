---
layout: default
title: "Algoritmo Epsilon-Greedy"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 1
---

## Algoritmo $\epsilon$-Greedy con Inicio Optimista (MATLAB)

**Proyecto:** Algoritmo $\epsilon$-Greedy con Inicio Optimista para el Problema del K-Armed Bandit
**Objetivo general:** Evaluar el comportamiento y rendimiento de la estrategia de inicio optimista en un problema de decisión secuencial (multi-armed bandit) de 3 brazos, analizando la tasa de exploración inicial y la convergencia hacia la recompensa óptima en MATLAB.

---

## Objetivos de la práctica
- Implementar la estrategia de inicio optimista asignando valores iniciales altos a las recompensas estimadas ($Q$).
- Aplicar el método de actualización por promedio incremental para el ajuste continuo de las estimaciones del valor de acción.
- Analizar cómo la sobreestimación inicial fuerza una exploración completa de todas las opciones sin depender exclusivamente del parámetro $\epsilon$.
- Visualizar y contrastar la evolución de la recompensa promedio acumulada frente al valor óptimo real de las máquinas.

---

## Descripción del ejercicio

En este ejercicio se implementa una variación de los algoritmos de **aprendizaje por refuerzo clásico** para resolver el dilema de exploración-explotación en un entorno controlado:

El modelo simula el problema de las **3 máquinas (brazos)** definidas con diferentes distribuciones de recompensa para evaluar la efectividad de la inicialización de valores de forma optimista:

- **Inicio Optimista** $\rightarrow$ Esta variación del algoritmo inicializa las recompensas estimadas de todos los brazos con un valor significativamente alto ($Q_1(a) = 5.0$). Al hacer esto, todas las opciones parecen igualmente prometedoras al inicio, lo que fuerza al algoritmo a explorar intensamente al principio del proceso.
- **Exploración sin depender de $\epsilon$** $\rightarrow$ Gracias a este valor inicial alto, el agente se ve obligado a probar todas las acciones antes de que sus valores estimados caigan por debajo del umbral real de explotación. De este modo, se logra una exploración inicial completa y sistemática sin depender de la aleatoriedad pura del parámetro $\epsilon$.
- **Actualización del valor** $\rightarrow$ Para estimar el valor de la recompensa de manera eficiente, el código utiliza un promedio incremental que actualiza el valor histórico estimado $Q_t(a)$ a partir de la recompensa actual $R_{t+1}$ y el conteo de ejecuciones $n_t(a)$.

La fórmula matemática aplicada en cada iteración es:

\[
Q_{t+1}(a) = Q_t(a) + \frac{1}{n_t(a)}(R_{t+1} - Q_t(a))
\]

---

### Configuración del Entorno de Prueba (Máquinas)

| Acción / Brazo | Media Real (\(\mu\)) | Desviación Estándar (\(\sigma\)) | Comportamiento Esperado |
| :--- | :--- | :--- | :--- |
| Brazo 1 (\(A_1\)) | 1.0 | 0.5 | Recompensa baja, baja variabilidad |
| Brazo 2 (\(A_2\)) | 2.0 | 0.5 | **Brazo Óptimo** (\(Q^* = 2.0\)) |
| Brazo 3 (\(A_3\)) | 1.5 | 1.5 | Recompensa media, alta variabilidad |

---

### Proceso de Cálculo y Visualización

El algoritmo implementado en MATLAB ejecuta un ciclo iterativo a lo largo de **1000 pasos de tiempo**:
1. Inicializa el vector de estimaciones $Q$ en un nivel optimista ($5.0$) superior a cualquiera de las medias reales del entorno.
2. En cada paso $t$, utiliza una política $\epsilon$-greedy ($\epsilon = 0.1$) que combina una baja probabilidad de exploración aleatoria con una explotación estricta basada en el valor máximo de $Q$.
3. Al interactuar con el entorno, calcula de forma dinámica las nuevas estimaciones utilizando la fórmula del promedio incremental.
4. Al concluir las iteraciones, genera una gráfica comparativa que muestra:
   - La **recompensa promedio acumulada** calculada mediante una suma acumulativa normalizada (`cumsum`).
   - Una línea de referencia horizontal que marca el **valor óptimo real esperado** (\(Q^* = 2.0\)).

---

## Código
```matlab
% =========================================================================
% Algoritmo e-greedy con inicio optimista para el K-Armed Bandit
% =========================================================================

clear; clc; close all;

% 1. Definición del entorno (3 Máquinas) según el problema planteado
mu = [1.0, 2.0, 1.5];       % Medias de la recompensa de A1, A2, A3
sigma = [0.5, 0.5, 1.5];    % Desviaciones estándar de A1, A2, A3
K = length(mu);             % Número total de brazos (acciones)

% 2. Parámetros del algoritmo
epsilon = 0.1;              % Probabilidad de exploración aleatoria (10%)
pasos = 1000;               % Número total de iteraciones de tiempo (t)
valor_optimista = 5.0;      % Valor inicial alto (supera a la mejor media real de 2.0)

% 3. Inicialización
% Aquí radica la clave del algoritmo: inicializar Q con el valor optimista
Q = ones(1, K) * valor_optimista; 
N = zeros(1, K);            % n_t(a): Conteo de veces que se elige cada acción
historial_recompensas = zeros(1, pasos); % Para graficar el desempeño

fprintf('==========================================================\n');
fprintf(' SIMULACIÓN DEL K-ARMED BANDIT (INICIO OPTIMISTA)\n');
fprintf('==========================================================\n');

% 4. Bucle principal de aprendizaje
for t = 1:pasos
    
    % --- Selección de Acción (e-greedy) ---
    if rand() < epsilon
        % Exploración aleatoria
        accion = randi(K);
    else
        % Explotación: Elegir el brazo con la mayor recompensa estimada
        % Al inicio, como todas valen 5, probará diferentes brazos.
        % A medida que obtiene recompensas reales (< 5), los valores Q bajarán.
        [~, accion] = max(Q);
    end
    
    % --- Interacción con el Entorno ---
    % Generar la recompensa (R) muestreando la distribución normal del brazo
    R = mu(accion) + sigma(accion) * randn();
    
    % --- Actualización de Estimaciones ---
    N(accion) = N(accion) + 1; % Actualizar el contador de la acción
    
    % Fórmula de promedio incremental para Q_{t+1}(a)
    Q(accion) = Q(accion) + (1 / N(accion)) * (R - Q(accion));
    
    % Guardar la recompensa obtenida en este paso
    historial_recompensas(t) = R;
end

% 5. Visualización de Resultados
% Calcular la recompensa promedio acumulada hasta el paso t
recompensa_promedio_acumulada = cumsum(historial_recompensas) ./ (1:pasos);

figure('Color', 'w');
plot(1:pasos, recompensa_promedio_acumulada, 'g', 'LineWidth', 1.5);
hold on;
yline(2.0, '--k', 'Óptimo (Q^* = 2.0)', 'LineWidth', 1.5); % Línea del valor óptimo
title('\epsilon-Greedy con Inicio Optimista');
xlabel('Pasos de Tiempo (t)');
ylabel('Recompensa Promedio Acumulada');
grid on;

% Mostrar los valores estimados finales en consola
disp('Valores Q reales (mu):');
disp(mu);
disp('Valores Q estimados por el agente:');
disp(Q);
disp('Número de veces que se jaló cada brazo:');
disp(N);
```
