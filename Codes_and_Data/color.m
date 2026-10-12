   function [colors, p, ptr] = color(A, maxcol)  
%% function [colors, p, ptr] = color(A, maxcol)  
%% colors = colors of each node
%% p = multicoloring permutation
%% ptr = ptr to start of each color set       
n = size(A,1);
colors = zeros(n,1);
il = zeros(maxcol,1);
for  i=1:n
%-------------------- determine colors already assigned
   [ii, jj, val] = find(A(:,i));
   for k=1:length(ii) 
         j = ii(k) ;
         icol = colors(j);
         if (icol ~= 0) 
             il(icol) = 1; 
         end
   end
   mycol = 1;
   while (mycol <= maxcol)
       if (il(mycol) == 0)
           break;
       end
       mycol = mycol+1;
   end
   if (mycol > maxcol) 
       error('MAX num of colors exceeded');
   end
   colors(i) = mycol;
   il = zeros(maxcol,1);
end
numcol = max(colors);
p = [];
ptr(1) = 1;
for col=1:numcol
    q = find(colors==col);
    p = [p;q];
    ptr(col+1) = ptr(col)+length(q);
end
