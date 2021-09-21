function [XNew] = sample_from_gmm(gmm, nbSamples)
%SAMPLE_FROM_GMM Generate new samples from a learned GMM
%
%   input------------------------------------------------------------------
%       o gmm    : (structure), Contains the following fields
%                   | o Priors : (1 x K), the set of priors (or mixing weights) for each
%                   |            k-th Gaussian component
%                   | o Mu     : (N x K), an NxK matrix corresponding to the centroids
%                   |            mu = {mu^1,...mu^K}
%                   | o Sigma  : (N x N x K), an NxNxK matrix corresponding to the
%                   |            Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%       o nbSamples    : (int) Number of samples to generate.
%   output ----------------------------------------------------------------
%       o XNew  :  (N x nbSamples), Newly generated set of samples.
%%
nb=nbSamples;
pr=gmm.Priors;
Mu=gmm.Mu;
N=size(Mu,1);
K=size(Mu,2);
Sigma=gmm.Sigma;
XNew=zeros(N,nb);
out=randsrc(1,nb,[1:1:K;pr]);
for i=1:1:length(out)

XNew(:,i)=mvnrnd(Mu(:,out(i)),Sigma(:,:,out(i)),1);

end

end

