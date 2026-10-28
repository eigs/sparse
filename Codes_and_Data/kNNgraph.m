function adj_list = kNNgraph(X,k)
%       adj_list = kNNgraph(X)
% Construct the kNN graph
% Input arguments:
% X: data matrix (each column corresponds to a data sample)
% adj_list  : adjacency list

N = size(X,2);  % number of data samples
K = X'*X;
% compute the norm of each data sample
norms = sqrt(sum(X.^2));

% build the adjacency list and determine degrees of vertices (columns of A)
adj_list = cell(N,1);
for ii = 1:N
    dist = sqrt((norm(X(:,ii)).^2)*ones(size(norms)) + norms.^2 - 2*K(ii,:));
    [y,ind] = sort(dist);
    % determine the k nearest neighbors
%    neigh = ind(2:k+1);
    neigh = ind(1:k+1);
    neigh = setdiff(neigh,ii);
    adj_list{ii} = union(adj_list{ii},neigh);    
end
%disp('adjacency list was built...')
