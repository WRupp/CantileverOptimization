function [x,k]=BFGS(fnome,cnome,x0,tol)
% Metodo BFGS com busca de Armijo
% x - minimizador
% k - Numero de iteracoes

x=x0;
k=1;
Nc=tol+1;   

n=size(x0,1);
H=eye(n);   %Estimativa inicial para a Hessiana

while(Nc>tol)    

c(:,k)=feval(cnome,x);
Nc=norm(c(:,k));

d(:,k)=-(H\c(:,k)); 
 
   [alphaK,~] = LSArmijo(fnome, x, d(:,k), c(:,k));

    x=x+alphaK*d(:,k);
    GFGD(:,k)=x;

c(:,k+1)=feval(cnome,x);

s(:,k)=alphaK*d(:,k);
y(:,k)=c(:,k+1)-c(:,k);

D=(y(:,k)*y(:,k)')/(dot(s(:,k),y(:,k)));
E=(c(:,k)*c(:,k)')/(dot(c(:,k),d(:,k)));
H=H+D+E;

k=k+1;
end

asd

end
   
