IJ = load('CC.txt');
nz = size(IJ,1);
z = ones(nz,1) ;
n = max(max(IJ(:,2)),max(IJ(:,1)));
B = sparse(IJ(:,1), IJ(:,2), z,n,n);
  
G = graph(B,'upper');
format compact;
%%------------------- shortest path
disp('showing graph')
plot(G) 


%%------------------- shortest path
disp('shortest path between 4 and 5')
p = shortestpath(G,4,5) 
pause

%%-------------------- degree centrality
disp('Degree centrality')
cd = centrality(G,'degree')
pause
%%-------------------- closeness centrality
disp('Closeness centrality')

cc = centrality(G,'closeness')
pause
%%-------------------- betweenness centrality
disp('Betweenness centrality')
cb = centrality(G,'betweenness')
pause

