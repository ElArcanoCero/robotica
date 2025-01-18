function [ FitnessValue ] = fitness(individuo)
sistemaEcuaciones = [ 3 8 2 25;
                      1 -2 4 12;
                     -5 3 11 4];
[f, c] = size(sistemaEcuaciones);
diferencia = 0;
for i=1:f
    resultado = 0;
    for j=1:(c-1)
    resultado = resultado + sistemaEcuaciones(i,j)*individuo(j);
    end
    diferencia = diferencia + abs(sistemaEcuaciones(i, c) - resultado);
end
FitnessValue = diferencia;
end


