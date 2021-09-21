function [Mu, C, EigenVectors, EigenValues] = compute_pca(X)
%COMPUTE_PCA Step-by-step implementation of Principal Component Analysis
%   In this function, the student should implement the Principal Component 
%   Algorithm
xx=X';
mu=mean(xx);
mu2=repmat(mu',1,size(X,2));
Mu=mu';
X=X-mu2;
C1=X*X';

C=C1./(size(X,2)-1);
[V,D]=eig(C);
xx=diag(D);
[evs,idx]=sort(xx,'descend');
EigenVectors=V(:,idx);
EigenValues=evs;

%   input -----------------------------------------------------------------
%   
%       o X      : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%
%   output ----------------------------------------------------------------
%
%       o Mu              : (N x 1), Mean Vector of Dataset
%       o C               : (N x N), Covariance matrix of the dataset
%       o EigenVectors    : (N x N), Eigenvectors of Covariance Matrix.
%       o EigenValues     : (N x 1), Eigenvalues of Covariance Matrix
end

