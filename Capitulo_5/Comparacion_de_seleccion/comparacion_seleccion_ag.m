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