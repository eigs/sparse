close all

get_mesh

 N  = size(A,1) ;
 XY = [X'; Y'];
%%-------------------- RSB1 will make A a graph laplacean 
%%-------------------- call RSB with  ND = 4 as default
 if (~exist('ND')),   ND = 4;  end 
 
%% [Sets, lab] = RSB1(A, ND) ;

 if (1)
   Sets = cell(1);
   Sets{1}= [1:N];
   [Sets, lab] = RSB3(A, A, ND, Sets,1) ;
 end
 
 mygplot(A,XY',lab,ND) ;
 %%-------------------- sizes of partitions.
 for ii=1:ND
    disp(sum(lab==ii))
 end
%% 
