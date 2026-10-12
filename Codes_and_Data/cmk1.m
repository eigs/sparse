  function [p] =cmk1(A,init)
%% function [p] = cmk1(A,init)
%% cuthill McKee ordering -
%% standard queue implementation
 p=[init];
 n = size(A,1);
 mark = zeros(n,1);
 mark(init) = 1;
%%-------------------- GET DEGREES
%% degs = (A ~= 0)*ones(n,1);
 degs = spones(A)*ones(n,1);
%%
for k=1:n 
  j = p(k); 
%%-------------------- scan all points in adj(j)
  [ii, jj, rr] = find(A(:,j));
  [~, ik] = sort(degs(ii));  
  for l = 1:length(ii);
    ij = ii(ik(l));
    if (mark(ij)==0) 
      p = [p, ij] ; 
      mark(ij) = 1;
    end
  end
end
