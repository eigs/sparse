%%---------- virtual x-y grid
nx     = 21;  hx = 1/(nx-1);
theta  = [0:hx:1]*pi;
%%---------- generate points 
r = [0.4:0.2:1];
nr = length(r);
X   = kron(r,cos(theta)) ;
Y   = kron(r,sin(theta));
%%---------- to count # triangles 
nt=0;
%%---------- generate triangles 
for j=1:nr-1
    for i=1:nx-1
        nt = nt+1;
        l = (j-1)*nx+ i;
%%---------- first triangle in box: 
        tri(nt,:) = [l, l+1, l+nx+1] ;
%%---------- Second triangle in box: 
        nt = nt+1;
        tri(nt,:) = [l,l+nx+1,l+nx];
    end
end
XY  = [X', Y'];
A = assmbl1(tri, XY); 
gplot(A,XY,'b-');
hold on
axis([-1.1 1.1 0.0 1.1]);
axis equal;
plot([-1 1], [0 0], 'r-', 'linewidth',2);
plot([0 0], [0 1 ], 'r-', 'linewidth',2);

if (0) 
for i=1:length(X)
    %%     text(X(i)+.01*sign(X(i)),Y(i)+.02,num2str(i),'fontsize',12);
     text(X(i),Y(i)+.02,num2str(i),'fontsize',14);
end
end