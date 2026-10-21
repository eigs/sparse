%%
%% X, Y 
fid=fopen('mesh.xy');
x = str2num(fgetl(fid)) 
nn=x;
%%
X = zeros(nn,1);
Y = zeros(nn,1);
%
for i=1:nn 
 s = fgetl(fid);
 x = str2num(s); 
 X(i) = x(1);
 Y(i) = x(2);
end
fclose(fid) ;
%% edges 
 fid=fopen('mesh.edge');
 x = str2num(fgetl(fid)) 
 nn=x(1)
 ned = x(2) 
%%
 A = sparse(nn,nn);
 for i=1:nn 
   s = fgetl(fid);
   x = str2num(s); 
   nz = x(1);
   ind = x(2:nz+1);
   for k=ind(:)'
%%       A(k,i) = exp(-0.1*((X(k) - X(i))^2 + (Y(k) - Y(i))^2 )) ; 
   A(ind,i) = 1 ; 
   end 
end
  fclose(fid) ;
%%  gplot(A, [X, Y]);
