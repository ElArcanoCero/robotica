function [M] = matrizIncial(liminf,limsup) 
   
    M = (limsup-liminf).*rand(10,3) + liminf;
    
end

