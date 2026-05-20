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