   function [A] = assmbl1(tri,XY) 
%% function [A] = assmbl0(tri,XY) 
%% assembles the adjacency matrix from
%% triangles. Constants==1 in each triangle
%% XY used only to get dimensions 
[n, m] = size(XY); 
%-------------------- Now make adjacency matrix
A = sparse(n,n);
for i = 1:size(tri,1)
    K = tri(i,:);
    Ae = ones(3,3);
    A(K,K) = A(K,K)+Ae;
end


