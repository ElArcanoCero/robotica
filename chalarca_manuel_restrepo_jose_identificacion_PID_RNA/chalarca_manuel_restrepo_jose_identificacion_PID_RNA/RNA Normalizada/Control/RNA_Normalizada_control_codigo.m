%% RNA NORMALIZADA
%Los vectores tiene que ser transpuestos para que se puedan normalizar
%mapminmax solo normaliza vectores fila

%En esta simulación no se utiliza el mismo preset, son
%variables con dinamicas diferentes
error_n = mapminmax(error_control'); % Un vector de entrada normalizado entre -1 y 1
Integral_e_n = mapminmax(Integral_e'); % Un vector de entrada retrazado normalizado entre -1 y 1 

SalidaPI_n = mapminmax(SalidaPI'); % Sn vector de salida normalizado entre -1 y 1

input_data={error_n;Integral_e_n}; % vector de entradas a la red normalizadas en arreglo de celdas
input_data_vec=[error_n;Integral_e_n]; %vector de entradas a la red normalizadas en arreglo vetor
                                    % para simular
net=feedforwardnet([10 5],'trainlm');%capaentrada=10 capaoculta=5
net.numinputs = 2;% numero de entradas a la red
net.inputConnect = [1 1;0 0;0 0];% conexion de entradas a capas internas
net = configure(net,input_data);% configura la red para x entradas toma la dimension de input_data
net = train(net,input_data,SalidaPI_n);% entrenamiento de la red normalizada
view(net); %ploteo de la topología de la red
yred=sim(net,input_data_vec); % se simula la red con las entradas
figure (1)
plot(1:length(yred),yred,'*',1:length(yred),SalidaPI_n);% red entrenada vs salida deseada normalizada
legend('RNA trained','Y Norm');
grid;
gensim(net); % generación del bloque de la red en simulink

