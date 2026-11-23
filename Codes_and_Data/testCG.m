
clear
clf
%%-------------------- for lap2D, steep, mr
addpath ../general 
addpath ../iters1Dim

A = lap2D(30,30);
n = size(A,1);
%%%b = A*ones(n,1);
b = randn(n,1);
x = randn(n,1);
nits=80;
tol = 1.e-06;
%%-------------------- test 3 iter. methods
[x1, r1] = steep(A, b, x, nits, tol);
[x2, r2] = mr(A, b, x, nits, tol);
[x3, r3] = CG(A, b, x, nits, tol);
%%-------------------- plot
semilogy([1:length(r1)], r1, 'linewidth',2)
hold on 
semilogy([1:length(r2)], r2,'r--', 'linewidth',2) 
semilogy([1:length(r3)], r3,'m-^', 'linewidth',2)
h=legend('Steep. desc.','min-res.','cg',...
	 'location','SouthWest') ;
set(h,'fontsize',18) 
