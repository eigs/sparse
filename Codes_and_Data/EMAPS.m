function [Y] = LPP(X,K,d) 
%%  function [V] = LPP(X,K,d) 
% Inputs:
% X = data as m x N matrix (m = dimensionality, N = #points)
% label = vector of labels 
% K = number of neighbors 
% d = embedding dimensionality
% V =  projected data 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n] = size(X)
%%-------------------- do PCA projection -- 
X = double(X);
adj_list = kNNgraph(X,K);
%%
%
if (m>n) 
   [U0, S0, V0] = svd(X);
   X = U0(1:n,1:n)*S0(1:n,1:n)*V0';
end
v = sum(X,2)/m;
X = X - v*ones(1,n);

%%if(K>D) 
if(K>0) 
  fprintf(1,'   [note: K>m; regularization will be used]\n'); 
  tol=1e-3; % regularlizer in case constrained fits are ill conditioned
else
  tol=0;
end
%%-------------------- get graph 
%compute the local graph matrix and W coefficients
W = sparse(n,n); 
for ii=1:n
   indi = adj_list{ii}; 
   nc = length(indi);
   for j=1:nc
       W(ii,indi(j)) = -1;
   end
end
ee = -W*ones(n,1);
for i=1:n
   W(i,i) = ee(i);
end
DD = diag(ee);
min(ee) 

% STEP 3: COMPUTE EMBEDDING FROM EIGENVECTS OF COST MATRIX M=(I-W)'(I-W)
%fprintf(1,'-->Computing embedding.\n');
% CALCULATION OF EMBEDDING
%%%options.disp = 0; options.isreal = 1; options.issym = 1; 
[V,Eigs] = eig(full(W));  
%%
[eigval,index] = sort(diag(Eigs));
V = V(:,index);
Y = V(:,2:d+1)';
%%%%Y = V'*X;

