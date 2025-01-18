%% RNA NORMALIZADA
%Los vectores tiene que ser transpuestos para que se puedan normalizar
%mapminmax solo normaliza vectores fila
[Un,Pu] = mapminmax(U'); % Un vector de entrada normalizado entre -1 y 1
U1n = mapminmax('apply',U1',Pu); % U1n vector de entrada retrazado normalizado entre -1 y 1 

[Sn,PS] = mapminmax(S'); % Sn vector de salida normalizado entre -1 y 1
S1n = mapminmax('apply',S1',PS); % S1n vector de salida normalizado entre -1 y 1
S2n = mapminmax('apply',S2',PS); % S1n vector de salida normalizado entre -1 y 1

input_data={Un;U1n;Sn;S1n;S2n}; % vector de entradas a la red normalizadas en arreglo de celdas
input_data_vec=[Un;U1n;Sn;S1n;S2n]; %vector de entradas a la red normalizadas en arreglo vector
                                    % para simular
%net=feedforwardnet;% por defecto 10 neuronas a la entrada
%para mas capas con tansig por defecto
net=feedforwardnet([10 5],'trainlm');%capaentrada=10 capaoculta=5
net.numinputs = 5;% numero de entradas a la red
net.inputConnect = [1 1 1 1 1;0 0 0 0 0;0 0 0 0 0];% conexion de entradas a capas internas
% Hidden Layer(HL) [   HL1   ;    HL2  ;  output ]
%Se conectan las 5 caracteristica Un;U1n;Sn;S1n;S2n a la capa de entrada
net = configure(net,input_data);% configura la red para 'Un' entradas toma la dimension de input_data
%net.layers{1}.transferFcn='logsig'; Neuron Model (logsig, tansig, purelin)
%view(net);% ploteo de la topología de la red

net = train(net,input_data,Sn);% entrenamiento de la red normalizada
y=net(input_data);% estimacion de datos de entrada para calcular el desepeño
perf = perform(net,y,Sn);% calculo del desempeño
%yred=sim(net,input_data_vec); % se simula la red con las entradas

%figure (1)
%plot(1:length(yred),yred,'*',1:length(yred),Sn);% red entrenada vs salida deseada normalizada
%legend('RNA trained','Y Norm');
%grid;
gensim(net); % generación del bloque de la red en simulink