function demo_digits(dat, METH) 
%-------------------------
%   EMBEDDING OF DIGITS
%-------------------------
%%%load binaryalphadigs;
%%
X = zeros(320,39*10);
label = zeros(39*10,1);
count = 1;
for ii=1:10
    for jj = 1:39
        X(:,count) = double(reshape(dat{ii,jj},320,1));
        label(count) = ii-1;
        count = count + 1;
    end
end
N = 390;
%% does only digits i1 to i2
i1 = 6;
i2 = 9;
%%%%%%%%%%%%%%%%%%
n1 = 39*i1 +1 ;
n2 = 39*(i2+1);
switch lower(METH) 
     case {'pca'} 
         [proj,U] = PCA(X(:,n1:n2),2);
     case('onpp') 
         [proj] = ONPP(X(:,n1:n2),16,2);
     case('lle') 
         [proj] = LLE(X(:,n1:n2),16,2);
     case('emaps') 
         [proj] = EMAPS(X(:,n1:n2),16,2);
     case('kpca') 
         [proj] = KPCA(X(:,n1:n2),16,2);
     otherwise
     disp('method not implemented');
         return 
     end
smbls={'r+','gx','bo','m^','cs'};
colordef white;
close all

figure(1);
hold on;
%%

for jj = i1:i2
  k1 = (jj-i1)*39+1;
  k2 = (jj-i1)*39 + 39;
  plot(proj(1,k1:k2),proj(2,k1:k2),smbls{jj-i1+1},'linewidth',2)
  leg(jj-i1+1) = {num2str(jj)};
end
legend(leg) ;
title(['digits : ',num2str(i1),' -- ',num2str(i2)]);


