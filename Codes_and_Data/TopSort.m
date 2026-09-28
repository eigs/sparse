   function [Lst,Mark] = TopSort(L,b) 
%% function [Lst,Mark] = TopSort(L,b) 
%% finds the pattern of L \ b for a 
%% sparse lower triangular L and a sparse b
%% 
 n = size(L,1);
 Mark = zeros(n,1); Lst = [];
 [ii, jj, rr] = find(b);
 for k=1:length(ii) 
     u = ii(k);
     if (Mark(u) == 0) 
         [Lst, Mark] = dfs(u, L, Lst, Mark);
     end
 end
