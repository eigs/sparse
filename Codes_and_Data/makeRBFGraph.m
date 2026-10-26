   function [W, xi, yi] = makeRBFGraph(X,sigmaX, sigmaI, r)
%% function [W, xi, yi] = makeRBFGraph(X,sigmaX, sigmaI, r)
%% X is the image in 2D
X=double(X);
[m,n,panels] = size(X)
%%
%%
mx = max(m,n);
h = 1/mx;
sigX = sigmaX^2;
sigI = sigmaI^2;
%%==================== make up coordinates
yi = [0:m-1]*h;
xi = [0:n-1]*h;
%%==================== make up Gaussian kernel
%%
node = 0;
kn   = 0;
for j=1:n 
  jmin   = max(1,j-r) ;
  jmax   = min(n,j+r) ;
  for i = 1:m
    %%-------------------- find near-by points
    node = node+1 ;      %% 
    imin   = max(1,i-r) ;
    imax   = min(m,i+r) ;
    for kj=jmin:jmax
      for ki = imin:imax
        kn = kn+1;
        ii(kn)  = (kj-1)*m+ki;
        jj(kn)  = node;
        %%pause
        fij =  X(i,j,:) - X(ki,kj,:);
        fij = reshape(fij,3,1);
        xij = [xi(j)-xi(kj);yi(i)-yi(ki)];
        val(kn)=exp(-fij'*fij/sigI)*exp(-xij'*xij/sigX);
      end
    end
  end
end
n = node;
W = sparse(ii,jj,val,n,n);

%%-------------------- make it a graph Laplacean
W = spdiags(zeros(n,1),0,W); 
b = W*ones(n,1);
W = spdiags(b,0,-W); 
