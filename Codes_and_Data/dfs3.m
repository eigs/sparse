  function [Lst, Mark] = dfs3(u, A, Lst, Mark)
% function [Lst, Mark] = dfs3(u, A, Lst, Mark)
% dfs from node u - records LEVEL numbers 
[ii, jj, rr] = find(A(:,u));
time = Mark(u)+1;
Mark(u) = time;
for k=1:length(ii) 
  v = ii(k);
  if (Mark(v) == 0)
    Mark(v) = time;
    [Lst, Mark] = dfs3(v, A, Lst, Mark);
  else
    Mark(v) = max(Mark(v),time);
  end
end
Lst = [u,Lst]


