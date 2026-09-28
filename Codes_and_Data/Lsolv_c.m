  function x = Lsolv_c(A,b) 
%----------------------------------
% function x = Lsolv(A,b) - COLUMN
% Solves a lower  triangular system
%----------------------------------
 n = size(A,1); 
 x = b;
 for j=1:n 
   x(j) = x(j)/A(j,j);
   x(j+1:n) = x(j+1:n)-x(j)*A(j+1:n,j);
   x
   pause 
 end
 
%%

