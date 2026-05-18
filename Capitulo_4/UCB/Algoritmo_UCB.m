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