function [dK]=derivadasK(h,j)
%Descreve as matrizes de derivadas em relacao a cada variavel
global b L E;

% b*h^3/12;
dI=1/4*b* h(:).^2;

dK=zeros(6,6);
if j==1
%Derivada em relacao a h1

dK(1,1) = 12*E/L^3*    dI(1);
dK(1,2) = 6*E/L^2*    -dI(1);

dK(2,1) = 6*E/L^2*    -dI(1);
dK(2,2) = 4*E/L*       dI(1);

elseif j==2
%Derivada em relacao a h2

dK(1,1) = 12*E/L^3*    dI(2);
dK(1,2) = 6*E/L^2*     dI(2); 
dK(1,3) = -12*E/L^3 *  dI(2);
dK(1,4) = 6*E/L^2 *    dI(2);

dK(2,1) = 6*E/L^2*     dI(2);
dK(2,2) = 4*E/L*       dI(2);
dK(2,3) = -6*E/L^2*    dI(2);
dK(2,4) = 2*E/L*       dI(2);

dK(3,1)= -12*E/L^3*    dI(2);
dK(3,2)= -6*E/L^2*     dI(2);
dK(3,3)= 12*E/L^3*     dI(2);
dK(3,4)= 6*E/L^2*     -dI(2);

dK(4,1)= 6*E/L^2*      dI(2);
dK(4,2)= 2*E/L*        dI(2);
dK(4,3)= 6*E/L^2*     -dI(2);
dK(4,4)= 4*E/L*        dI(2);

elseif j==3
%Derivada em relacao a h3

dK(3,3) = 12*E/L^3*    dI(3);
dK(3,4) = 6*E/L^2*     dI(3);
dK(3,5) = -12*E/L^3*   dI(3);
dK(3,6) = 6*E/L^2*     dI(3);

dK(4,3) = 6*E/L^2*     dI(3);
dK(4,4) = 4*E/L*       dI(3);
dK(4,5) = -6*E/L^2*    dI(3);
dK(4,6) = 2*E/L*       dI(3);

dK(5,3) = -12*E/L^3*   dI(3);
dK(5,4) = -6*E/L^2*    dI(3);
dK(5,5) = 12*E/L^3*    dI(3); 
dK(5,6) = -6*E/L^2*    dI(3);

dK(6,3) = 6*E/L^2*     dI(3);
dK(6,4) = 2*E/L*       dI(3);
dK(6,5) = -6*E/L^2*    dI(3);
dK(6,6) = 4*E/L*       dI(3);

end
end