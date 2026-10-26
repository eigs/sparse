 
%%-------------------- USES the SHI-MALIK APPROACH -- 
    N = 45
    X = mir(N);
    sigmaX = 0.75*sqrt(N);
    %    sigmaX = 5.0;
    sigmaI = 0.1; 
%%    
    [mm, nn, col] = size(X);
    figure(1)
    imagesc(X)
    X = double(X);
    pause 
    [W, xi, yj] = makeRBFGraph(X,sigmaX, sigmaI,3);
    disp('makeRBFGraph out') 
    n = size(W,1);
 %%-------------------- scale 
     D = spdiags(W,0);
     D = 1.0 ./  sqrt(D);
     D1 = spdiags(D,0,n,n);
     W = D1*(W*D1);
     Nc = 4;
     neig = 3;
     % [V, lam] = Lan(W, neig+1, msteps, 'ascend');
     W = 0.5*(W+W');
     [V, D] = eigs(W, neig+1,.0);
     lam = diag(D);
     disp('eigs out ..')
%%-------------------- call kmeans on eivec's  
     %%[ctr, indx] = myKmeans(V(:,2:neig+1)', Nc);
     [indx, ctr] = kmeans(V(:,2:neig+1), Nc);
     
     lab2 = reshape(indx,mm,nn);
     lab4 =fix(((lab2-1)/Nc)*255) ;

     figure(2)
     imagesc(lab4)
     
 %%-------------------- convert indices
 
 %%%return
