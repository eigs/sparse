  function x = Lsolv(A,b) 
%----------------------------------
% function x = Lsolv(A,b) - Row vers
% Solves a lower  triangular system
%----------------------------------
 n = size(A,1); 
 x = b;
 for i=1:n 
   x(i) = x(i)- A(i,1:i-1)*x(1:i-1);
   x(i) = x(i)/A(i,i);
   fprintf(1,' step %d',i)
   x(1:i) 
   pause 
 end
 
%%

