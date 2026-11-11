  function [V,H,bet] = arnoldi (A,v,m) 
% function [V,H,bet] = arnoldi (A,v,m) 
% performs m steps of the arnoldi process. 
% V is n x (m+1) - contains v1 ... v_{m+1} 
% H is (m+1) x m
% bet = || v ||     
%-----------------------------------------------
bet = norm(v);

if (bet == 0);, error('div by 0');,end
V(:,1) = v/bet; 
for j=1:m 
  w = A*V(:,j)  ;
%%-------------------- modified GS  ;
  for i=1:j
    t = w'*V(:,i)  ;
    w = w - t*V(:,i)  ;
    H(i,j) = t  ;
  end
%%-------------------- get V(:,i+1) 
  t = norm(w)  ;
  H(j+1,j) = t  ;
  if (t<=eps*bet), error(' Div by zero');, end
  t = 1.0 / t  ;
  V(:,j+1) = w*t  ;
end  
