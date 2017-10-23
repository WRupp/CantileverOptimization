function [valor]=gIneq(h,i)
%Avalia a i-esima funcao desigualdade no ponto h 
%de acordo com a numeracao
% % %Desigualdade
% %     % V<=Vmax
% %     g1=b(1)*L(1)*h(1)+b(2)*L(2)*h(2)+b(3)*L(3)*h(3)-Vmax;
% %     % h>=hmin
% %     g2=-h(1)+hmin;
% %     g3=-h(2)+hmin;
% %     g4=-h(3)+hmin;
% %     % h<=hmax
% %     g5=h(1)-hmax;
% %     g6=h(2)-hmax;
% %     g7=h(3)-hmax;

global b L Vmax hmin hmax;

% FUNCOES

if i==1
 valor= (b*L*(h(1)+h(2)+h(3))-Vmax)/Vmax;      
end

if i==2
 valor=(-h(1)+hmin)/hmin;
end

if i==3
  valor=(-h(2)+hmin)/hmin;
end

if i==4
  valor=(-h(3)+hmin)/hmin;
end

if i==5
  valor=(h(1)-hmax)/hmax;
end

if i==6
  valor=(h(2)-hmax)/hmax;
end

if i==7
  valor=(h(3)-hmax)/hmax;
end
end