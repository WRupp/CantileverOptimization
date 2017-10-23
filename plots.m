%% Plots

% Evolucao da altura
figure(1);
plot(1:k,h,'-*');
title('Evolu��o da Altura');
xlabel('k [itera��o]');
ylabel('h [mm]');
legend('h_1','h_2','h_3');

%Evolucao da funcao objetivo
figure(2);
plot(1:k,fObjetivo,'-*');
title('Evolu��o da Fun��o objetivo')
xlabel('k [itera��o]');
ylabel('f(h)');


% Evolucao do gradiente
figure(3);
plot(1:k,gradLagrangeano,'-*');

% Evolucao da restricao volume
figure(4);
plot(1:k,rVol,'-*');
title('Evolu��o da restri��o de volume (normalizada por Vmax)');
xlabel('k [itera��o]');
ylabel('g1(h)');

%Evolucao dos multipliacadores
figure(5);
plot(1:k,multiplicadores,'-*');
title('Evolu��o dos multiplicadores de Lagrange');
xlabel('k [itera��o]');
ylabel('\mu');
legend('\mu_1','\mu_2','\mu_3','\mu_4','\mu_5','\mu_6');