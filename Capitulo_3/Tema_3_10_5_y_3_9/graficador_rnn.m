% 1. Gráficas de desempeño estadístico
figure('Name', 'Rendimiento de Entrenamiento');
plotperform(info_entrenamiento); 

figure('Name', 'Regresión (Predicción vs Real)');
% Reemplazamos las variables anteriores por u y x
plotregression(x, red_estatica(u)); 

% 2. Prueba de simulación (Evaluación directa, sin bucle recursivo)
pasos_simulacion = 1000; 

% La red calcula todos los estados simulados evaluando directamente el vector de torque
x_simulado = red_estatica(u(1:pasos_simulacion));

% Graficar la comparación de la variable q0 (primer eslabón)
figure('Name', 'Prueba Dinámica: Posición q0');
plot(1:pasos_simulacion, x(1, 1:pasos_simulacion), 'b', 'LineWidth', 1.5); hold on;
plot(1:pasos_simulacion, x_simulado(1, :), 'r--', 'LineWidth', 1.5);
legend('Dinámica Real', 'Predicción de Red Estática');
title('Comparación de q_0 en el tiempo');
xlabel('Muestras'); ylabel('Posición');

% 3. Exportación a Simulink y visualización
gensim(red_estatica, -1);
view(red_estatica)