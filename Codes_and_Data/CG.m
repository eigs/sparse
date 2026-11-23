  function [sol,res] = CG (A, rhs, x0, m, tol) 
%--------------------------------------------- 
% function [sol,res] = CG (A, rhs, x0, m, tol) 
% x0  = initial guess on entry -- 
% rhs = rhs, m = number of steps 
% m   = max number of steps 
% tol = tolerance
% res = residual norm history 
% sol = app sol on return
%--------------------------------------------- 
 sol   = x0; 
 r     = rhs - A * sol;
 p     = r ; 
 ro1   = r' * r; 
 res(1)= sqrt(ro1) ;
 tol1  = tol*tol*ro1; 
%-------------------- main loop 
 j = 0; 
 while (j < m && ro1 > tol1) 
	 j = j+1; 
	 ro = ro1; 
%%-------------------- A*p
	 Ap = A * p; 
	 alp = ro / ( p'*Ap ) ;
%%-------------------- sol 
	 sol = sol + alp * p ;
%%-------------------- res
	 r = r - alp * Ap; 
	 ro1= r'*r;
         res(j+1) = sqrt(ro1) ;
	 bet = ro1 / ro ;
	 p = r + bet * p; 
  end
 end 

         
