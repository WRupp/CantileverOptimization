function [U,K] = funcaoSistema(h)
% sistema de equacoes para o problema de viga
global b L E P;

% Define a matriz de rigidez
I=b/12*h(:).^3;

K=zeros(6,6);
K(1,1)= 12*E/L^3*  (I(1)+I(2));
K(1,2)= 6*E/L^2*   (I(2)-I(1));
K(1,3)= -12*E/L^3*  I(2);
K(1,4)= 6*E/L^2*    I(2);

K(2,1)= 6*E/L^2*   (I(2)-I(1));
K(2,2)= 4*E/L*     (I(1)+I(2));
K(2,3)= -6*E/L^2*   I(2);
K(2,4)= 2*E/L*      I(2);

K(3,1)= -12*E/L^3*  I(2);
K(3,2)= -6*E/L^2*   I(2);
K(3,3)= 12*E/L^3*  (I(2)+I(3));
K(3,4)= 6*E/L^2*   (I(3)-I(2));
K(3,5)= -12*E/L^3*  I(3);
K(3,6)= 6*E/L^2*    I(3);

K(4,1)= 6*E/L^2*    I(2); 
K(4,2)= 2*E/L*      I(2);
K(4,3)= 6*E/L^2*   (I(3)-I(2));
K(4,4)= 4*E/L*     (I(2)+I(3));
K(4,5)= -6*E/L^2*   I(3);
K(4,6)= 2*E/L*      I(3);

K(5,3)= -12*E/L^3*  I(3);
K(5,4)= -6*E/L^2*   I(3);
K(5,5)= 12*E/L^3*   I(3);
K(5,6)= -6*E/L^2*   I(3);

K(6,3)= 6*E/L^2*    I(3);
K(6,4)= 2*E/L*      I(3);
K(6,5)= -6*E/L^2*   I(3);
K(6,6)= 4*E/L*      I(3);

%Define o vetor deslocamentos
% U=linsolve(K,P);
U=K\P;

end