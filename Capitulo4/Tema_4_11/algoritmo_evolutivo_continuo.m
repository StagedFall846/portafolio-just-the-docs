function algoritmo_evolutivo_continuo()
    % 1. Parametros del algoritmo
    N = 60;              % Tamano de poblacion (debe ser par para el cruce)
    lim = [-5.12, 5.12]; % Limites del espacio
    max_gen = 50;        % Generaciones maximas
    pm = 0.2;            % Probabilidad de mutacion por gen
    alpha = 0.6;         % Factor de cruce
    
    % Funcion objetivo (Rastrigin 2D)
    f = @(x) 20 + (x(:,1).^2 - 10*cos(2*pi*x(:,1))) + ...
                  (x(:,2).^2 - 10*cos(2*pi*x(:,2)));

    % 2. Inicializacion de la poblacion
    poblacion = lim(1) + (lim(2) - lim(1)) * rand(N, 2);
    fitness = f(poblacion);
    
    historial_mejor = zeros(max_gen, 1);

    % 3. Ciclo Evolutivo
    for g = 1:max_gen
        descendencia = zeros(N, 2);
        
        % --- REPRODUCCIÓN (SELECCIÓN + CRUCE) ---
        for i = 1:2:N
            % Seleccion por torneo de tamano t = 3
            idx1 = torneo(fitness, 3);
            idx2 = torneo(fitness, 3);
            p1 = poblacion(idx1, :);
            p2 = poblacion(idx2, :);
            
            % Cruce aritmetico completo
            descendencia(i, :)   = alpha * p1 + (1 - alpha) * p2;
            descendencia(i+1, :) = alpha * p2 + (1 - alpha) * p1;
        end
        
        % --- MUTACION GAUSSIANA ---
        for i = 1:N
            for j = 1:2
                if rand() < pm
                    % Mutacion con sigma = 0.1
                    descendencia(i,j) = descendencia(i,j) + 0.1 * randn();
                    % Control de limites (restricciones de caja)
                    descendencia(i,j) = max(min(descendencia(i,j), lim(2)), lim(1));
                end
            end
        end
        
        % --- EVALUACION Y REEMPLAZO ---
        fit_desc = f(descendencia);
        
        % Reemplazo directo (Poblacional generacional puro)
        poblacion = descendencia;
        fitness = fit_desc;
        
        % Guardar el mejor de la generacion actual para analisis posterior
        historial_mejor(g) = min(fitness);
    end
    
    % Desplegar mejores resultados finales
    [mejor_f, idx_mejor] = min(fitness);
    fprintf('\n=========================================\n');
    fprintf('  OPTIMIZACIÓN COMPLETADA (Rastrigin 2D)\n');
    fprintf('=========================================\n');
    fprintf('Mejor solucion encontrada:\n X = [%.4f, %.4f]\n', ...
            poblacion(idx_mejor,1), poblacion(idx_mejor,2));
    fprintf('Valor de la funcion f(X) = %.6f\n', mejor_f);
    fprintf('El optimo global teorico esta en [0, 0] donde f(0,0) = 0\n');
end

function idx = torneo(fitness, t)
    % Selecciona t individuos al azar y regresa el indice del mejor (menor fitness)
    N = length(fitness);
    candidatos = randi(N, [t, 1]);
    [~, mejor_local] = min(fitness(candidatos));
    idx = candidatos(mejor_local);
end