 function [Lst, Mark] = dfs (u, A, Lst, Mark)
   %% function [Lst, Mark] = dfs(u, A, Lst, Mark)
   %% u = first node in traversal
   %% A = matrix [graph]
   %% List = list of nodes visited
   %% mark = marks 1 if node is visited.
   %% dfs from node u - Post-order list
[ii, jj, ~] = find(A(:,u));
Mark(u) = 1;
%%------------------visit each near. neighbor in turn
for k=1:length(ii) 
  v = ii(k);  
  if (~Mark(v)) 
    [Lst, Mark] = dfs(v, A, Lst, Mark);
  end
end
%%-------------------- post order .
Lst = [u,Lst];    %% common reverse post-order list 
%%%Lst = [Lst,u];


