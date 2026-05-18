function hill_climbing_ejercicio()

    % Funcion objetivo
    f = @(x) x.^4 + 5*x.^3 + 4*x.^2 - 4*x + 1;

    % Configuracion inicial
    x_actual = 0;
    step_size = 0.05;
    max_iter = 100;

    % Historial para graficar
    historial_x = zeros(max_iter,1);
    historial_f = zeros(max_iter,1);

    % Bucle principal
    for i = 1:max_iter

        historial_x(i) = x_actual;
        historial_f(i) = f(x_actual);

        % Generar vecino mediante perturbacion gaussiana
        filtrado = step_size * randn();
        x_vecino = x_actual + filtrado;

        % Criterio de aceptacion (Minimizacion)
        if f(x_vecino) < f(x_actual)
            x_actual = x_vecino;
        end
    end

    % Resultados en consola
    fprintf('--- RESULTADOS HILL CLIMBING ---\n');
    fprintf('X final encontrado: %.4f\n', x_actual);
    fprintf('Valor minimo f(x): %.4f\n', f(x_actual));

    % Grafica de convergencia
    figure('Color', 'w');
    plot(historial_f, '-o', 'LineWidth', 1.5, 'Color', [0.2 0.6 0.8]);
    title('Evolución de Hill Climbing');
    xlabel('Iteración');
    ylabel('Valor de f(x)');
    grid on;

end