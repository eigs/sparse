 function [sol,res]=gmres(A,rhs,x0,m,tol)
%function [sol,res]=gmres(A,rhs,x0,m,tol) 
%-------------------------------------------------
% basic gmres with max Krylov subspace dim = m 
% A      = matrix
% m     = max krylov subspace dimension
% rhs    = right-hand side
% x0     = initial guess
% tol    = tolerance for stopping criterion
%-------------------------------------------------
 tolmac = eps; 
 n = size(A,1);
 V = zeros(n,m+1);
 ierr = 0 ;
 sol = x0; 
 %%
 V(:,1) = rhs - A*sol ;
 ro = norm(V(:,1)) ; 
 res(1) = ro;
 tol1=tol*ro ;
 t = 1.0/ ro ;
 V(:,1) = V(:,1) * t ;
 %%---initialize 1-st term of rhs of hess.system..
 rs = zeros(m+1,1);
 rs(1) = ro ;
 %%
 for i=1:m
   i1 = i + 1 ;
   V(:,i1) = A*V(1:n,i);
%---------- modified GS ;
   for j=1:i
     t = V(1:n,j)'*V(1:n,i1) ;
     hh(j,i) = t ;
     V(1:n,i1) = 	 V(1:n,i1) - t*V(1:n,j) ;
   end  
   t = norm(V(1:n,i1),2) ;
   hh(i1,i) = t ;
   if (t  ~= 0.0)  
     t = 1.0 / t ;
     V(1:n,i1) = V(1:n,i1)*t ;
   end  
 %%
%---------- apply previous transf on i-th column h ;
   for k=2:i 
     k1 = k-1 ;
     t = hh(k1,i) ;
     hh(k1,i) = c(k1)*t + s(k1)*hh(k,i) ;
     hh(k,i) = -s(k1)*t + c(k1)*hh(k,i) ;
   end
%%
   gam = sqrt(hh(i,i)^2 + hh(i1,i)^2) ;
   gam = max(tolmac,gam);
%---------- get plane rotation + update rhs of LS Pb
   c(i) = hh(i,i)/gam ;
   s(i) = hh(i1,i)/gam ;
   rs(i1) = -s(i)*rs(i) ;
   rs(i) =  c(i)*rs(i) ;
%---------- get res. norm. and test for convergence
   hh(i,i) = c(i)*hh(i,i) + s(i)*hh(i1,i) ;
   ro = abs(rs(i1)) ;
   res(i+1) = ro ; 
%---------- solve upper triangular system
   y(i) = rs(i)/hh(i,i);
   for  k=i-1:-1:1 ;
     t=rs(k) ;
     for j=k+1:i ;
       t = t-hh(k,j)*y(j) ;
     end  
     y(k) = t/hh(k,k) ;
   end
   y = y(:);
   if (ro < tol1), break, end
 end
%---------- form linear combination to get solution 
 sol = sol + V(:,1:i)*y(1:i);

