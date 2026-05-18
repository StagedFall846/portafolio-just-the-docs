---
layout: default
title: "4.5 Algoritmo Evolutivo Continuo"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 5
---

## Solución del Ejercicio 3: Conceptos de Dominancia de Pareto y Multiobjetivo

Recuerda que para que una solución $u$ domine a otra solución $v$ ($u \prec v$) en un problema de minimización, se debe cumplir que $u$ no sea peor que $v$ en ningún objetivo, y estrictamente mejor en al menos uno.

### 1. Identificación del Frente de Pareto

Analicemos caso por caso evaluando los vectores $(f_1, f_2')$ donde buscamos minimizar ambos:

* **A (120, 0.15):** Nadie tiene mejor costo y mejor ineficiencia a la vez. Es **no dominada**.
* **B (150, 0.10):** Tiene el segundo costo más alto, pero la menor ineficiencia de todos. Nadie le gana en ineficiencia. Es **no dominada**.
* **C (130, 0.20):** Es **dominada por A**, ya que A tiene menor costo ($120 < 130$) y menor ineficiencia ($0.15 < 0.20$).
* **D (110, 0.35):** Tiene el menor costo de todos. Nadie le gana en costo. Es **no dominada**.
* **E (160, 0.12):** Es **dominada por B**, ya que B tiene menor costo ($150 < 160$) y menor ineficiencia ($0.10 < 0.12$).

> **Resultado:** El Frente de Pareto está compuesto por las soluciones: **{A, B, D}**.

### 2. Demostración matemática de la relación entre B y E

* **Objetivo 1 (Costo):** $f_1(B) = 150$ y $f_1(E) = 160 \implies f_1(B) < f_1(E)$ *(B es estrictamente mejor)*
* **Objetivo 2 (Ineficiencia):** $f_2'(B) = 0.10$ y $f_2'(E) = 0.12 \implies f_2'(B) < f_2'(E)$ *(B es estrictamente mejor)*

Como la solución B es estrictamente mejor que E en ambos criterios de minimización, queda demostrado matemáticamente que B domina a E ($B \prec E$).

---

## Solución del Ejercicio 4: Implementación en MATLAB

El código base está estructurado de forma correcta. Para que el script sea completamente funcional y ejecutable de manera autónoma, se agregó una función principal contenedora para asegurar que las funciones locales (como el torneo) operen sin conflictos y no existan desajustes en las dimensiones de los arreglos durante la asignación del ciclo.

Aquí tienes el script corregido y optimizado, listo para guardarlo como `algoritmo_evolutivo_continuo.m` y ejecutarlo:

```matlab
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
```

<a href="ejercicio1_aproximacion.m" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar ejercicio1_aproximacion.m
</a>
