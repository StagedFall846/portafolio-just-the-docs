function recompensa = generarRecompensa(maquina)
% Genera una recompensa aleatoria basada en una distribución de
% probabilidad normal (gaussiana)

switch maquina
    case 1
        mu = 1.0;
        sigma = 0.5;
    case 2
        mu = 2.0;
        sigma = 0.5;
    case 3
        mu = 1.5;
        sigma = 1.5;
    otherwise
        error('Maquina no válida')

end
% Genera la recompensa
recompensa = normrnd(mu, sigma, 1, 1);
% Elimina valores negativos
recompensa = max(0, recompensa);
end