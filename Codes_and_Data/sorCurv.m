   function [om, rho] = sorCurv (A, h)
%% function [om, rho] = sorCurv (A, h)
 D = diag(diag(A));
 E = -tril(A,-1);
 F = -triu(A,1);
 k =1;
 for t = 0:h:2 
   L = D-t*E;
   U = t*F + (1-t)*D;
%%-------------------- record spect. radius 
   e = eig(full(L\U));
   rho(k) = max(abs(e));
   om(k) = t;
   k = k+1;
end

