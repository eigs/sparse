   function mygplot(A,xy, lab, ND)
%% function mygplot(A, xy, lab, ND)
%%
%% Modification of the gplot utility to color
%% different sugraphs   with   different
%% colors.  A, xy are the same as in gplot
%% lab is a label array. lab(x) is label of
%% vertex i. ND is the number of subgraphs
%% Works for a number of subgraphs  <= 12

[i,j] = find(A);
ll = lab(j);
[ll, p] = sort(ll);
%%--------------------[ignore, p] = sort(max(i,j));
i = i(p);
j = j(p);
%%
%%colors='rbgkcm';
dots = 'dox*+vs<oxs<';
%%
xcol = kron([0.1 0.25 0.50  1],[0 1 2]);
ycol = kron([0.1 0.25 0.50  1],[1 2 0]);
zcol = kron([0.1 0.25 0.50  1],[2 0 1]);
ccol = [xcol', ycol', zcol'];
%%rand(12,3))
colors = exp(-2*ccol) ;
%
typ = 0;
for ncurv=1:ND
    X = [];
    Y = [];
    list = find(ll==ncurv);
    for k = list(:)' 
        ii = i(k);
        jj = j(k);
        if (ii < jj) 
            continue;
        end  
        if (lab(ii)==lab(jj)) 
          X = [X, xy(ii,1), xy(jj,1), NaN] ;
          Y = [Y, xy(ii,2), xy(jj,2), NaN]  ;
        end %%if
    end  %% for k
   typ = mod(typ,12)+1;
   plot(X,Y,'linestyle','-','marker',dots(typ),'color',colors(typ,:),...
   'linewidth',2);
hold on
end  

