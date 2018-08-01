
% % Aluno: Wagner Rupp 
% % Data: 07/10/2017
%% Formulacao do problema
% % %Objetivo
% %     f=1/2*U'*K*U;
% % %Desigualdade
% %     % V<=Vmax
% %     g1=(b*L*h(1)+b*L*h(2)+b*L*h(3)-Vmax)/Vmax;
% %     % h>=hmin
% %     g2=(-h(1)+hmin)/hmin;
% %     g3=(-h(2)+hmin)/hmin;
% %     g4=(-h(3)+hmin)/hmin;
% %     % h<=hmax
% %     g5=(h(1)-hmax)/hmax;
% %     g6=(h(2)-hmax)/hmax;
% %     g7=(h(3)-hmax)/hmax;
% % %Igualdade (vide metodo adjunto)
% %     h1=K*U-F;
close all;
clear;
clc;
global rho ng mu;
global b L E Vmax hmin hmax P;


%% Constantes

ng = 7; % numeros de condicoes de desigualdade
 
L = 200;
b = 10;
E = 2e5;

Vmax = 2.4e5;

hmin = 10;
hmax = 80;
P =[0 0 0 0 -200 0]';

%% Condicoes iniciais

hinicial = 40;  %Primeira tentativa

mu = ones(ng,1);  %Multiplicadores de lagrange iniciais
rho(1:ng) = 100;    %Fator de penalizacao inicial
beta1 = 1.5;  % Parametro para penalizacao
alpha1 = 3;  % Parametro de descrescimento

Kviolacao=inf;
maxIter = 1e3;
tolOtim = 1e-6;   % Tolerancia BFGS
tol1=1e-5;        % Tolerancia KKT
tol2=1e-5;        % Tolerancia Penalizacao

%Estimativa inicial
h(:,1) = [hinicial; hinicial; hinicial];
fObjetivo(1)=feval('f_Objetivo',h(:,1));
gradLagrangeano(:,1)=feval('gradL_Barras',h(:,1));
% multiplicadores(:,1)=mu;
% rVol(1)=gIneq(h(:,1),1);

%% Processo iterativo

for k=2:maxIter

    %minimizar a funcao lagrangeana 
    [h(:,k),~] = BFGS('L_Barras','gradL_Barras',h(:,k-1),tolOtim);
    
    fObjetivo(k)=feval('f_Objetivo',h(:,k));
    gradLagrangeano(:,k)=feval('gradL_Barras',h(:,k));

    %avaliar maxima violacao
    for i=1:ng
       violacao(i)=max([gIneq(h(:,k),i) ; -(mu(i)./rho(i))]);   
    end

    Kbarra= max(violacao);

    % Criterio de parada (pg.481 arora)
    if (Kbarra<tol1 && ...
        norm(gradL_Barras(h(:,k)))<=(tol2*max([1 ; abs(L_Barras(h(:,k)))])))   
    
        rVol(k)=gIneq(h(:,k),1);
        multiplicadores(:,k)=mu;
        break;
        
    else
        if Kbarra>Kviolacao
            rho(:)=rho(:).*beta1; 
        else
    %     update dos multiplicadores 
            for i=1:ng
                mu(i)=mu(i)+rho(i)*violacao(i);         
            end
    %     update da penalizacao     
            if Kbarra<Kviolacao/alpha1
               rho(:)=rho(:).*beta1;
               Kviolacao=Kbarra;
            end 
        end
        multiplicadores(:,k)=mu;
        rVol(k)=gIneq(h(:,k),1);        
    end          
end


