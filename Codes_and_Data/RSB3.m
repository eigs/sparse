   function [Sets, labl] = RSB3(A, A0, maxsets,Sets,oldset)
%  function [Sets, labl] = RSB3(A, A0, maxsets,Sets,oldset)
%  A =sparse matrix, maxsets = number of subgraphs
%-------------------- initialization. make a laplacian
A = myLaplacian(A);
%--------------------Fiedler vector
opts.tol = 1.e-07;
[U, D] = eigs(A, 2, 'SA', opts);
[~, i] = max(diag(D));
x = U(:,i);
%-------------------- split at median
x=sign(x-median(x));
list = Sets{oldset};
listm = find(x>0);
listp = find(x<=0);
newset = length(Sets)+1;
Sets{newset} = list(listm);
Sets{oldset} = list(listp);
%%-------------------- test if we are done
if (newset >= maxsets)
  for i=1:newset
    labl(Sets{i}) = i;
  end
  return
end
%%-------------------- largest set
[~,oldset] = max(cellfun(@length,Sets));
list = Sets{oldset};
[Sets labl] = RSB3(A0(list,list),A0,maxsets,Sets,oldset);
%%-------------------- done 

