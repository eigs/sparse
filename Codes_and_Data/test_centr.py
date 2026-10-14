  
run init.py
X = np.loadtxt('CC.txt')
X = X-1
rows = X[:,0].astype(int)
cols = X[:,1].astype(int)
vals = np.ones_like(rows);

B = coo((vals,(rows,cols)),shape=(6,6))
G = nx.from_scipy_sparse_array(B)
nx.draw(G,with_labels=True)
plt.show()

nx.degree_centrality(G)

nx.betweenness_centrality(G)

nx.closeness_centrality(G)


