 function A = fd3d(nx,ny,nz,alpx,alpy,alpz,dshift)
%----------------------------------------------------------------------- 
% function A = fd3d(nx,ny,nz,alpx,alpy,alpz,dshift)
% NOTE nx and ny must be > 1 -- nz can be == 1.
% 5- or 7-point block-Diffusion/conv. matrix. with
%-----------------------------------------------------------------------
tx = sptridiag( -1+alpx, 2, -1-alpx, nx) ;
ty = sptridiag( -1+alpy, 2, -1-alpy, ny) ;
A = kron(speye(ny,ny),tx) + kron(ty,speye(nx,nx)); 
if (nz > 1) 
     tz = sptridiag( -1+alpz, 2, -1-alpz, nz) ;
     A = kron(speye(nz,nz),A) + kron(tz,speye(nx*ny,nx*ny)); 
end
A = A - dshift * speye(nx*ny*nz,nx*ny*nz);
