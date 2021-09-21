function [Xhat] = reconstruct_pca(Y, Ap, Mu)
%AL=((Ap'*Ap)^-1)*Ap';
AL=Ap';
X1=AL*Y;
mu2=repmat(Mu,1,size(Y,2));
Xhat=X1+mu2;
%RECONSTRUCT_PCA Reconstruct dataset to original dimensions from PCA
%   projection. In this function, the student should follow Eq. 6 from
%   Assignment 1.
%
%   input -----------------------------------------------------------------
%   
%       o Y      : (p x M), Projected data set with M samples each being of dimension p.
%       o A_p    : (p x N), Projection Matrix.
%       o Mu     : (N x 1), Mean Vector of Dataset
%
%   output ----------------------------------------------------------------
%
%       o X_hat  : (N x M), reconstructed data set with M samples each being of dimension N.


end

