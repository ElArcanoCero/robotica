function [error] = funciongen1(x,y,z)
   fun1 = ((x)*3) + ((y)*8)+ ((z)*2);   
   fun2 = ((x)) - ((y)*2)+ ((z)*4); 
   fun3 = -((x)*5)+ ((y)*3)+ ((z)*11); 
   error = (abs(25-fun1)+ abs(12-fun2)+ abs(4-fun3));
end
%funciongen1(4.643,0.821,2.25) probar en command