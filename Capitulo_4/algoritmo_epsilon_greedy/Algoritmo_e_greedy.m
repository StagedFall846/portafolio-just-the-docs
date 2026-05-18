% =========================================================================
% Algoritmo e-greedy con inicio optimista para el K-Armed Bandit
% =========================================================================

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

figure;
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