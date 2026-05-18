---
layout: default
title: "Ejercicio Práctico de Aplicación"
parent: "5.1 Casos de Estudio y Ejercicios Prácticos"
grand_parent: "Capítulo 5: Implementación y Proyectos Avanzados"
nav_order: 1
---

## Ejercicio 2 y 4: Implementación de Hill Climbing

El algoritmo de **Hill Climbing** (escalada de colinas) busca mejorar una solución moviéndose continuamente hacia vecinos con mejor desempeño. Dado que nuestro objetivo en este problema es **minimizar** la función, implementamos una variante de descenso (*Gradient Descent* estocástico o *Local Search*).

---

### Lógica del algoritmo

1. **Inicialización:** Se comienza a partir de un punto inicial aleatorio o predefinido.
2. **Generación de vecindario:** Se calcula un nuevo punto (vecino) aplicando una perturbación aleatoria al estado actual.
3. **Criterio de aceptación:** Si el costo/evaluación del vecino es menor (mejor) que el actual, nos movemos a esa nueva posición.
4. **Ciclo:** El proceso se repite iterativamente hasta alcanzar el número máximo de iteraciones configuradas.

---

### Código en MATLAB

```matlab
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
```

[[Descargar algoritmo_evolutivo_continuo.m](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo4/Tema_4_11/algoritmo_evolutivo_continuo.m){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_5/hill_climbing_ejercicio.m)
