function [lev] = levSch(L) 
%% determines levels
n = size(L,1);
lev = zeros(1,n);
for i=2:n
    [ii, jj, vals] = find(L(i,:));
    if (length(jj) >0) 
       lev(i)  = 1 + max(lev(jj));
    end
end 



