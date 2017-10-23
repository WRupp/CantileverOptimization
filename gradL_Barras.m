function [gradL]=gradL_Barras(h)
% Calcula a derivada da funcao lagrangeana para o problema das barras
 
global rho mu ng;

[U,~] = funcaoSistema(h);

gradL=zeros(3,1);

for j=1:3
%Gradiente da funcao objetivo

    [dK]=derivadasK(h,j);
    
    gradL(j)=dot(-dK*U,U)*1/2;
    
%Gradiente das restricoes
    for i=1:ng
        avalia = gIneq(h,i)+mu(i)./rho(i);
        if avalia>=0
       gradL(j)= gradL(j) + (mu(i) + rho(i).*gIneq(h,i) ).*gradgIneq(i,j);
        end
    end   
end

end