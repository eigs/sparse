 function [V] = LLE(X,K,d)
%  function [V] = LLE(X,K,d)
% Inputs:
% X = data as D x N matrix (D = dimensionality, N = #points)
% K = number of neighbors 
% d = embedding dimensionality
% Outputs:
% V = embedded data dimension d x n 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,N] = size(X);
X=double(X);    %% just in case

%%-------------------- get knn graph
adj_list = kNNgraph(X,K);
%%-------------------- get weight matrix ...
%compute the local graph matrix and W coefficients
W = zeros(K,N);

if(K>m) 
  fprintf(1,'   [note: K>m; regularization will be used]\n'); 
  tol=1e-3; % regularlizer in case constrained fits are ill conditioned
else
  tol=0;
end
%%
for ii=1:N
   z = X(:,adj_list{ii})-repmat(X(:,ii),1,K);    % shift ith pt to origin
   C = z'*z;                                     % local covariance
   C = C + eye(K,K)*tol*trace(C);                % regularlization (K>m)
%   W(:,ii) = C\ones(K,1);                       % solve Cw=1
   W(:,ii) = pinv(C)*ones(K,1);                  % solve Cw=1
   W(:,ii) = W(:,ii)/sum(W(:,ii));               % enforce sum(w)=1
end;

% exk change: construct myW
myW = zeros(N,N);
myW = sparse(myW);
for ii = 1:N
    %ind = neighborhood(:,ii);
    ind = adj_list{ii};
    myW(ind,ii) = W(:,ii);
end

% STEP 3: COMPUTE EMBEDDING FROM EIGENVECTS OF COST MATRIX M=(I-W)'(I-W)
%fprintf(1,'-->Computing embedding.\n');

%%-------------------- ONPP -- commented out
%%%use X(I-W)' instead of (I-W)'...
%% W = myW';
%% Xtilda = X*(eye(N)-W');
%% M = Xtilda*Xtilda';

%this is the original lle code that uses (I-W)'
tmp  = speye(N)-myW;
M = tmp'*tmp;
%%--------------------EMBEDDING
options.disp = 0; options.isreal = 1; options.issym = 1; 
%%[V,eigenvals] = eigs(M,d+1,'SM',options);
[V,eigenvals] = eig(full(M)) ;
[eigval,index] = sort(diag(eigenvals),'ascend');
V = V(:,index);
V = V(:,2:d+1)'; 
