% -------------------------------------------------------------------
% METODO: LSArmijo
% Armijo Criterion for Line Search
% -------------------------------------------------------------------

function [s,Xs] = LSArmijo(Fnome, X, d, g)

rho1 = 0.8;
rho2 = 0.1;
nUP = 2;                  % coefficient for interval increment
nDOWN = 0.7;              % coefficient for backtracking


g0 = g;                   % f'(0)
f0 = feval(Fnome,X);      % f(0)
s = 1;                    % Initial step value

Xs = X + s*d;             % X(s)
fXs = feval(Fnome,Xs);    % f(Xs)

% DENTRO DA condição (9.4)livro do ARORA

gfd = g0'*d;
if gfd > 0
    error('no descent direction')
end

while(fXs <= (f0 + s*rho1*g0'*d) )
    s = nUP*s; 
    Xs = X + s*d;           
    fXs = feval(Fnome,Xs);    
end

while(fXs > (f0 + s*rho2*g0'*d))
    s = nDOWN*s;            % alpha NOVO
    Xs = X + s*d;              % X(alpha)
    fXs = feval(Fnome,Xs);    % f(alpha)
end




