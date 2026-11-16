  function [x,res] = fom (A, b, x0, m, tol) 
% function [x,res] = fom (A, b, x0, m, tol) 
% solves Ax = b by m steps of FOM -- bare-bone 
% non-restarted version                                     
%%-------------------------------------------------
n  = size(A,1);
r  = b - A*x0;
ro = norm(r);
rs(1) = ro ;
res(1) = ro ;   %%% res records residual norms
V(:,1) = r/ro; 
%%-------------------- main loop
for i=1:m 
  i1 = i + 1  ;
  V(:,i1) = A*V(:,i)  ;
%%-------------------- modified GS  ;
  for j=1:i
    t = V(:,j)'*V(:,i1)  ;
    V(:,i1) = V(:,i1) - t*V(:,j)  ;
    H(j,i) = t  ;
  end
%%-------------------- apply previous eliminations
  for k=2:i
    H(k,i) = H(k,i) - ll(k) * H(k-1,i) ;
  end
%%-------------------- .. to rhs as well when i>1
  if (i > 1) 
    rs(i) = - ll(i) *rs(i-1);
  end
%%-------------------- test for convergence
  t = norm(V(:,i1))  ;   %% == h(m+1,m)
  roi = t*abs(rs(i)/H(i,i));
  res(i1) = roi ;
  if (roi < tol*ro  ||  i==m) 
    y = triu(H) \ rs';
    x = x0 + V(:,1:i)*y ;
    break
  end
%%-------------------- else continue
  H(i1,i) = t  ;
  ll(i1) = t / H(i,i);
  if (t ~= 0.0)  
    t = 1.0 / t  ;
    V(:,i1) = V(:,i1)*t  ;
  end
end  
 


