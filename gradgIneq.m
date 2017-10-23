function [valor]=gradgIneq(i,j)
% retorna o valor da derivada da i-esima restricao pela j-esima variavel
global b L Vmax hmin hmax;


if j==1 %Derivadas em relacao a h1 variavel
    if i==1
    valor = b*L/Vmax;
    elseif i==2
    valor = -1/hmin;
    elseif i==5
    valor = 1/hmax;
    else
    valor = 0;
    end
end
if j==2 %Derivadas em relacao a h2 variavel
    if i==1
    valor = b*L/Vmax;
    elseif i==3
    valor = -1/hmin;
    elseif i==6
    valor = 1/hmax;
    else
    valor = 0;
    end
end
if j==3 %Derivadas em relacao a h3 variavel
    if i==1
    valor = b*L/Vmax;
    elseif i==4
    valor = -1/hmin;
    elseif i==7
    valor = 1/hmax;
    else
    valor = 0;
    end
end
end