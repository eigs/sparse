%%
A = lap2D(10,10);
n = size(A,1);

D = diag(diag(A));
E = -tril(A,-1);
F = -triu(A,1);
%%-------------------- sor - 
om = 1.7;
L = D-om*E;
U = om*F + (1-om)*D;
%%
x = randn(n,1);
b = A*ones(n,1);

for i=1:50 
  x = L \ (U*x + om*b);
  t = norm(x-ones(n,1));
     fprintf(1,' iter %4d, err %14.3e \n',i,t);  
end
 
norm(x - ones(n,1),1)



