function [ Sigma ] = compute_covariance( X, X_bar, type )
M=size(X,2);
N=size(X,1);
Xn=X-X_bar;
switch type
    
    case 'full'
        Sigma=(Xn*Xn')*(M-1)^(-1);
    case 'diag'
        f1=(Xn*Xn')*(M-1)^(-1);
        Sigma=diag(diag(f1));
    case 'iso'
        s=0;
        for i=1:1:M
           s=s+(norm(Xn(:,i)))^2; 
        end
        ss=s/(N*M);
        Sigma=diag(ss*ones(1,N));
    otherwise
        msg = 'Error occurred.Invalid Type';
        error(msg);
        
end
%MY_COVARIANCE computes the covariance matrix of X given a covariance type.
%
% Inputs -----------------------------------------------------------------
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                          each column corresponds to a datapoint
%       o X_bar : (N x 1), an Nx1 matrix corresponding to mean of data X
%       o type  : string , type={'full', 'diag', 'iso'} of Covariance matrix
%
% Outputs ----------------------------------------------------------------
%       o Sigma : (N x N), an NxN matrix representing the covariance matrix of the 
%                          Gaussian function
%%




end

