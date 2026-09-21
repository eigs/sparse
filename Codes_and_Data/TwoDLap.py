import scipy.sparse as sp

from create_sp_tridiag import*

def TwoDLap(nx,ny):
    #  creates 2-D laplacean nx x ny mesh
    Tx = create_sp_tridiag(nx,-1,2,-1)
    Ty = create_sp_tridiag(ny,-1,2,-1)
    A = sp.kron(sp.eye(ny),Tx) + sp.kron(Ty,sp.eye(nx))
    return(A) 
