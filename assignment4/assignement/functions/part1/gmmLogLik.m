function [ logl ] = gmmLogLik(X, Priors, Mu, Sigma)
%MY_GMMLOGLIK Compute the likelihood of a set of parameters for a GMM
%given a dataset X
%
%   input------------------------------------------------------------------
%
%       o X      : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o Priors : (1 x K), the set of priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu     : (N x K), an NxK matrix corresponding to the centroids mu = {mu^1,...mu^K}
%       o Sigma  : (N x N x K), an NxNxK matrix corresponding to the 
%                    Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%
%   output ----------------------------------------------------------------
%
%      o logl       : (1 x 1) , loglikelihood
%%
K=size(Priors,2);
N=size(X,1);
M=size(X,2);
lpdf=zeros(M,1);
for i=1:1:M
    lpdf(i)=sdpdf(X(:,i),Priors,Mu,Sigma);
end
logl=sum(lpdf);


end

function lpdf=sdpdf(X,pr,Mu,Sigma)
K=size(pr,2);
N=size(X,1);
M=size(X,2);
exx=zeros(K,1);
for i=1:1:K
   exx(i)=pr(i)*gaussPDF(X, Mu(:,i), Sigma(:,:,i)); 
end
sexx=sum(exx);
lpdf=log(sexx);

end
