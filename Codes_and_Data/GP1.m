  function [L, U] = GP1(A) 
%---------------------------------------------
% function [L,U] = GP1(A) 
% computes the sparse LU factorization of 
% A by the Gilbert-Peierls algorithm
%---------------------------------------------
 n = size(A,1) ;
 L = sparse(n,n);
 U = sparse(n,n);
 for j=1:n
     [ii jj v] = find(A(:,j));
     Lst = TopSort1(L, ii);
     l   = length(Lst);
%%-------------------- create a sparse column first.
     w = sparse(Lst,ones(l,1),zeros(l,1),n,1);
     w(ii) = v;
     for i=1:l 
         k = Lst(i) ;
         w(k+1:n) = w(k+1:n) - w(k)*L(k+1:n,k); 
     end
     U(1:j,j) = w(1:j);
     L(j+1:n,j) = w(j+1:n)/w(j);
 end 
 L = L+speye(n,n);
