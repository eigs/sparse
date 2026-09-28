import numpy as np
def dfs_py(u, A, Lst, Mark):
    """      function [Lst, Mark] = dfs(u, A, Lst, Mark)
      u = first node in traversal
      A = matrix [graph]
      List = list of nodes visited
      mark = marks 1 if node is visited.
      dfs from node u - Post-order list
      NOTE: uses row format to A is upper triang
    """
    u = int(u)
    ii = A[:,[u]].indices
    #print('node: ',u, 'adj lst', ii)
    Mark[u] = 1
    # ------------------visit each near. neighbor in turn
    for v in ii:
        if (not Mark[v]): 
            Lst, Mark = dfs_py(v, A, Lst, Mark);
    # -------------------- post order .
    #Lst.insert(0,u)
    Lst.append(u)
    print('Lst:',Lst)
    return Lst, Mark

