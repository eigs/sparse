 close all
 clear 
 %%-------------------- use the half disk example seen earlier
%letterC;
 hdisk1;
%%-------------------- put coordinates in one array
 X = X(:);
 Y = Y(:);
 N  = size(A,1) ;
 XY = [X, Y];
%%-------------------- make A  a graph laplacean 
 A = spones(A);
 A = spdiags(zeros(N,1),0,A);
 D = A*ones(N,1) ;
 A = spdiags(D,0,N,N) - A;
%%
   nev = 2;
%%-------------------- get Fiedler vector 
%%                     need 3 
    [YY, lam] = eigs(A, nev,'SA');

   [lam, iii] = sort(diag(lam),'ascend') ;
   nev = iii(nev);
   v = YY(:,nev);
   [t, kmed] = min(abs(v-median(v)));
   t = v(kmed);
   indm = []; indp = [];
%%------------
   ip = find(v-t>0);
   lab(ip)  = 1;
   %%-------------------- second set
   ip = find(v-t<=0);
   lab(ip)  = 2;

figure(2); 
  mygplot(A,XY,lab,2) ;
