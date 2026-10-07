%%------------ generate a 2-D laplacean 
nx = 50*7; ny = 50*7; nz = 1;
A = fd3d(nx, ny, nz, 0, 0, 0, 0);
%%------------ size? 
n = size(A,1) 
%%------------ artificial right-hand side
b = randn(n,1);
%%------------solve with `back-slash'
tic;
x = A\b;
toc
pause(1) 
%%------------ Lets do this again for a 3D Pb
%%             of *same size 10,000 * 
nx = 50; ny = 50; nz = 49;
A = fd3d(nx, ny, nz, 0, 0, 0, 0);
%%------------ size? 
n = size(A,1) 
%%------------ solve again - same RHS 
tic;
x = A\b;
toc


