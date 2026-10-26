function [A] = mark(m) 
%% [A] = mark(m) 
%% generates a Markov chain matrix for a random walk
%% on a triangular ggrid --
%% The matrix is sparse -- and of size n= m*(m+1)/2 
%% produces transpose of transition prob matrix
%%-------------------------------------------------- 
      ix = 0;
      cst = 0.5/(m-1) ; 
      n = (m*(m+1))/2;
      A = sparse(n,n) ;
%%--------------------   sweep y coordinates;
      for i=1:m
        jmax = m-i+1; 
%%--------------------   sweep x coordinates;
        for j=1:jmax,
           ix = ix + 1;  
           if (j<jmax) 
              pd = cst*(i+j-1) ;
%%--------------------   north move
              jx =  ix + 1;
              A(ix,jx) = pd;
              if (i == 1) 
                 A(ix,jx) = A(ix,jx)+pd;
              end 
%%--------------------   east move
              jx = ix + jmax;
              A(ix,jx) = pd;
              if (j == 1) 
                 A(ix,jx) = A(ix,jx)+pd;
              end
         end  
%%--------------------   south move 
           pu = 0.5 - cst*(i+j-3) ;
           if ( j>1) 
               jx = ix-1; 
               A(ix,jx) = pu;
            end
%%--------------------   west move
            if ( i > 1) 
               jx = ix - jmax - 1 ;
               A(ix,jx) = pu;
             end 
    end 
 end
