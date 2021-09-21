function [RSS, AIC, BIC] =  compute_metrics(X, labels, Mu)
%MY_METRICS Computes the metrics (RSS, AIC, BIC) for clustering evaluation
%
%   input -----------------------------------------------------------------
%   
%       o X        : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o labels   : (1 x M), a vector with predicted labels labels \in {1,..,k} 
%                   corresponding to the k-clusters.
%       o Mu       : (N x k), matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^D 
%
%   output ----------------------------------------------------------------
%
%       o RSS      : (1 x 1), Residual Sum of Squares
%       o AIC      : (1 x 1), Akaike Information Criterion
%       o BIC      : (1 x 1), Bayesian Information Criteria
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RSS=0;
AIC=0;
BIC=0;
for i=1:1:size(Mu,2)
    for j=1:1:size(X,2)
        if i==labels(j)
        RSS=RSS+(norm(X(:,j)-Mu(:,i)))^2;
        end
    end
end 
AIC=RSS+2*size(Mu,1)*size(Mu,2);
BIC=RSS+log(size(X,2))*size(Mu,1)*size(Mu,2);



end