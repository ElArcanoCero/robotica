%% RNA NORMALIZADA
%Los vectores tiene que ser transpuestos para que se puedan normalizar
%mapminmax solo normaliza vectores fila

[U_Controln,Pu] = mapminmax(U_Control'); 
U_Control_Rn = mapminmax('apply',U_Control_R',Pu); 

[SalidaPlantan,PS] = mapminmax(SalidaPlanta'); % Sn vector de salida normalizado entre -1 y 1
Salida_Planta_Rn = mapminmax('apply',Salida_Planta_R',PS); % S1n vector de salida normalizado entre -1 y 1
Salida_Planta_R1n = mapminmax('apply',Salida_Planta_R1',PS); % S1n vector de salida normalizado entre -1 y 1

input_data={U_Controln;U_Control_Rn;Salida_Planta_Rn;Salida_Planta_R1n}; % vector de entradas a la red normalizadas en arreglo de celdas
input_data_vec=[U_Controln;U_Control_Rn ;Salida_Planta_Rn;Salida_Planta_R1n]; %vector de entradas a la red normalizadas en arreglo vetor
                                    % para simular
net=feedforwardnet([10 5],'trainlm');%capaentrada=10 capaoculta=5
net.numinputs = 4;% numero de entradas a la red
net.inputConnect = [1 1 1 1;0 0 0 0;0 0 0 0];% conexion de entradas a capas internas
net = configure(net,input_data);% configura la red para x entradas toma la dimension de input_data
net = train(net,input_data,SalidaPlantan);% entrenamiento de la red normalizada
view(net); %ploteo de la topología de la red
yred=sim(net,input_data_vec); % se simula la red con las entradas
figure (1)
plot(1:length(yred),yred,'*',1:length(yred),SalidaPlantan);% red entrenada vs salida deseada normalizada
legend('RNA trained','Y Norm');
grid;
gensim(net); % generación del bloque de la red en simulink

