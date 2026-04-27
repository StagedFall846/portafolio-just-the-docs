% Generador de ejemplos de entrenamiento para una red neuronal
% Robot manipulador de 2GDL
l1 = 0.2; % metros
l2 = 0.15; % metros
% entradas de entrenamiento
% entradas de 0 a 360 grados
n = 1000;
th1 = 360 * rand(n, 1);
th2 = 360 * rand(n, 1);
% salidas del entrenamiento
x = l1 * cosd(th1) + l2 * cosd(th1+th2);
y = l1 * sind(th1) + l2 * sind(th1+th2);
%% Adaptar datos
Ent = [th1 th2];
Sal = [x y];
%% Crear red neuronal

net = feedforwardnet([20 15 10]);
[net, tr, Y, E] = train(net, Sal', Ent');
view(net);

%% Crear red neuronal multicapa

net = network ( ...
    1, ... %número de entradas
    3, ... %número de capas
    [1;1;1], ... %conexión de bias, vector booleano de número de capas (renglones) por 1
    [1;0;0], ... %conexión de las entradas, vector booleano
    [0 0 0;1 0 0;0 1 0], ... %conexión de capas
    [0 0 1]); %conexión de la capa de salida

%establecer número de neuronas
net.layers{1}.size=10;
net.layers{2}.size=10;
net.layers{3}.size=2;

%definir tipo de función de salida
net.layers{1}.transferFcn='poslin';
net.layers{2}.transferFcn='poslin';

%inicializar para entrenar
net = configure(net, Sal', Ent');
net = init(net);

%ver red
view(net)

%se procede al entrenamiento
net.trainFcn = 'trainlm';
[net, tr, Y, E] = train(net, Sal', Ent');

%se prueba
final_output = net([0.35;0])

%generar simulink
gensim(net)