function [AIC, BIC] =  gmm_metrics(X, Priors, Mu, Sigma, cov_type)

K=size(Priors,2);

N=size(X,1);
M=size(X,2);
 [ logl ] = gmmLogLik(X, Priors, Mu, Sigma);
AIC=-2*logl+2*numb(N,K,cov_type);
BIC=-2*logl+log(M)*numb(N,K,cov_type);
% AIC_curve=zeros(1,length(K_range));
% BIC_curve=zeros(1,length(K_range));
% for i=1:1:length(K_range)
% params.k=K_range(i);
% [  Priors, Mu, Sigma, iter ] = gmmEM(X, params);
% [ logl ] = gmmLogLik(X, Priors, Mu, Sigma);
% AIC_curve(1,i)=-2*logl+2*numb(N,K_range(i),params);
% BIC_curve(1,i)=-2*logl+log(M)*numb(N,K_range(i),params);
%     
% end
%GMM_METRICS Computes the metrics (AIC, BIC) for model fitting
%
%   input -----------------------------------------------------------------
%   
%       o X        : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o Priors : (1 x K), the set of priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu     : (N x K), an NxK matrix corresponding to the centroids 
%                           mu = {mu^1,...mu^K}
%       o Sigma  : (N x N x K), an NxNxK matrix corresponding to the 
%                       Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%       o cov_type : string ,{'full', 'diag', 'iso'} type of Covariance matrix
%
%   output ----------------------------------------------------------------
%
%       o AIC      : (1 x 1), Akaike Information Criterion
%       o BIC      : (1 x 1), Bayesian Information Criteria
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





end

function nb=numb(N,K,params)
type=params;

switch type
    case 'full'
        nb=K*(1+N+N*(N+1)/2)-1;
        
    case 'diag'
         nb=K*(1+N+N)-1;
        
    case 'iso'
         nb=K*(1+N+1)-1;
    otherwise
        msg='Invalid Type';
        error(msg);
    
end

end