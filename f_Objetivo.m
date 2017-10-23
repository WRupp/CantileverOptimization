function [f]=f_Objetivo(h)
%Calcula a funcao objetivo - Minimizacao da energia de deformacao

[U,K] = funcaoSistema(h);
f=1/2*dot(U,K*U);
end