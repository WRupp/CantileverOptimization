function [Lag]=L_Barras(h)
% Calcula a funcao lagrangeana para  o problema do trabalho final da
% disciplina de otimizacao

global rho mu ng P;

% funcao objetivo
[U,~] = funcaoSistema(h);
Lag = (1/2)*dot(U,P);

%funcao de igualdade
%será zero pois U já é tal que a igualdade é respeitada

%funcoes de desigualdade
    for i=1:ng
    %avalia a i-esima restricao
        avalia = gIneq(h,i)+mu(i)/rho(i);
        if avalia>=0
            Lag = Lag + mu(i)*gIneq(h,i)+(1/2)*rho(i)*gIneq(h,i).^2;
   
        else
            Lag = Lag - (1/2)*(1/rho(i)).*mu(i).^2;
        end
    end   

end