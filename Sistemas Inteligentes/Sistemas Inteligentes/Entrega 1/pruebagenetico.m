clc ; clear; close all;
liminf = -100;
limsup = 100;
M = matrizIncial(liminf, limsup);
M2 = [30 ; 4];
M3 = [30 ; 3];
M4 = [100000;1];


for i = 1:10
    [error] = funciongen1(M(i,1),M(i,2),M(i,3));
     M2(i,1)= M(i,1); 
     M2(i,2)= M(i,2);
     M2(i,3)= M(i,3);
     M2(i,4)= error; 
end
orde = sort(M2,1);
%B = min(M2,[],1);
k = 1;
while orde(1,4) > 0.001 
      punt = find(M2(:,4) == orde(1,4));% el mejor dato
      l = length(punt);
      if l > 1
        punt = find(punt,1,'first');
      end
      punt2 = find(M2(:,4) == orde(2,4));% el segundo mejor mejor dato
      l2 = length(punt2);
      if l2 > 1
        punt2 = find(punt2,1,'first');
      end
      for i = 1:3% pongo los mejores x y z en la posicion de la linea 1 y 2
        M3(1,i) = M2(punt,i);  
        M3(2,i) = M2(punt2,i);
      end
      if M3(1,1)==M3(2,1) && M3(1,2)==M3(2,2)&& M3(1,3)==M3(2,3)% aseguro que el mejor y el segundo mejor no sean iguales
          
          M3(2,1) = M3(2,1)+ rand;
          M3(2,2) = M3(2,2)+ rand;
          M3(2,3) = M3(2,3)+ rand;
      end
     
      b = mod(k,2);
      
     if b ~= 0 
          for j = 3:2:20 %lleno la matriz  con copias de los dos mejores hasta la posicion 20
              for i = 1:3
                M3(j,i) = M3(1,i);   
                M3(j+1,i) = M3(2,i);
              end

          end
     end
     if b == 0 
          for j = 3:20 %lleno la matriz  con copias del mejor hasta la posicion 20
              for i = 1:3
                M3(j,i) = M3(1,i);   
              end

          end
     end
      
      for j = 3:20% muto los x y z 
        if b ~= 0
              % intento 1
            switch j
                    case 3
                        M3(j,1) = M3(2,1);                   
                        M3(j+1,1) = M3(1,1);                  
                    case 5                    
                        M3(j,2) = M3(2,2);                   
                        M3(j+1,2) = M3(1,2);                      
                    case 7                     
                        M3(j,3) = M3(2,3);
                        M3(j+1,3) = M3(1,3);
                    case 9
                        M3(j,1) = M3(1,1)+1;
                        M3(j+1,1) = M3(1,1)-1;
                    case 11
                        M3(j,1) = M3(1,1)+0.5;
                        M3(j+1,1) = M3(1,1)-0.5;
                    case 13                  
                        M3(j,2) = M3(1,2)+1;
                        M3(j+1,1) = M3(1,1)-1;
                    case 15
                        M3(j,2) = M3(1,2)+0.5;
                        M3(j+1,1) = M3(1,1)-0.5;
                    case 17
                        M3(j,3) = M3(2,3)+1;
                        M3(j+1,3) = M3(2,3)-1;
                    case 19
                        M3(j,3) = M3(2,3)+0.5;
                        M3(j+1,3) = M3(2,3)-0.5;
             end
         end
         % intento 2 
         if b == 0
             switch j
                case 3
                    M3(j,1) = M3(1,1)+0.1;
                    M3(j+1,2) = M3(1,2)+0.1;
                    M3(j+2,3) = M3(1,3)+0.1;
                case 6
                    M3(j,1) = M3(1,1)+0.01;
                    M3(j+1,2) = M3(1,2)+0.01;
                    M3(j+2,3) = M3(1,3)+0.01;
                case 9
                    M3(j,1) = M3(1,1)+0.001;
                    M3(j+1,2) = M3(1,2)+0.001;
                    M3(j+2,3) = M3(1,3)+0.001;
                case 12
                    M3(j,1) = M3(1,1)-0.1;
                    M3(j+1,2) = M3(1,2)-0.1;
                    M3(j+2,3) = M3(1,3)-0.1;
                case 15
                    M3(j,1) = M3(1,1)-0.01;
                    M3(j+1,2) = M3(1,2)-0.01;
                    M3(j+2,3) = M3(1,3)-0.01;
                case 18
                    M3(j,1) = M3(1,1)-0.001;
                    M3(j+1,2) = M3(1,2)-0.001;
                    M3(j+2,3) = M3(1,3)-0.001;
             end
         end
      end
%      
      M = matrizIncial(liminf, limsup); % relleno la matriz
      for j = 1:10
        for i = 1:3
            M3(j+20,i) = M(j,i);  
        end
      end
      
      for i = 1:30
        [error] = funciongen1(M3(i,1),M3(i,2),M3(i,3));
          M2(i,1) = M3(i,1); 
          M2(i,2) = M3(i,2);
          M2(i,3) = M3(i,3);
          M2(i,4) = error; 
      end
      orde = sort(M2,1);% ordena M2 de menor a mayor las columnas
      M4(k,1) = orde(1,4);
      k = k + 1;
      
      %controlador de limites 
      if k == 10000 || k == 20000 || k == 30000 
          orde2 = sort(M3(1,:),2);% ordena de menos a meyor la fila
          liminf = orde2(1,1)-1;
          limsup = orde2(1,3)+1;   
      end
      if k == 40000 || k == 50000 || k == 60000 
          orde2 = sort(M3(1,:),2);
          liminf = orde2(1,1)-0.5;
          limsup = orde2(1,3)+0.5;   
      end
      if k == 70000 || k == 80000 || k == 90000 
          orde2 = sort(M3(1,:),2);
          liminf = orde2(1,1);
          limsup = orde2(1,3);   
      end
      if k > 100000
           break
      end 
end
plot(M4);
[error1, error2, error3] = valorar(M3(1,1),M3(1,2),M3(1,3));
