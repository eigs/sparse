function [Lst] = TopSort1(L, ii)
%% function [Lst] = TopSort(L,b)
%% restricts search to upper j x j part  
%% finds the pattern of L \ b for a 
%% sparse lower triangular L and a sparse b
%% 
n = size(L,1);
Mark = zeros(n,1); Lst = [];
%%--------------------
for k=1:length(ii) 
    u = ii(k);
    %%if (u > jk) , continue; , end
    if (Mark(u) == 0) 
        [Lst, Mark] = dfs(u, L, Lst, Mark);
    end
end
