from scipy.sparse import diags

def create_sp_tridiag(n, low_val, main_val, up_val):
    """
    generates tridiag(low_val, main_val, up_val)
    """
    D = [[low_val]*(n-1), [main_val]*n, [up_val]*(n-1)]
    offsets=[-1,0,1]
    S = diags(D, offsets,format='csr')
    return(S)
    
