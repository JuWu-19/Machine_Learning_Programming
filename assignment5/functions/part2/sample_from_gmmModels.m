function [XNew] = sample_from_gmmModels(models, nbSamplesPerClass, desiredClass)
%SAMPLE_FROM_GMMMODELS Generate new samples from a set of GMM
%   input------------------------------------------------------------------
%       o models : (structure array), Contains the following fields
%                   | o Priors : (1 x K), the set of priors (or mixing weights) for each
%                   |            k-th Gaussian component
%                   | o Mu     : (N x K), an NxK matrix corresponding to the centroids
%                   |            mu = {mu^1,...mu^K}
%                   | o Sigma  : (N x N x K), an NxNxK matrix corresponding to the
%                   |            Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%       o nbSamplesPerClass    : (int) Number of samples per class to generate.
%       o desiredClass : [optional] (int) Desired class to generate samples for
%   output ----------------------------------------------------------------
%       o XNew  :  (N x nbSamples), Newly generated set of samples.
%       nbSamples depends if the optional argument is provided or not. If
%       not nbSamples = nbSamplesPerClass * nbClasses, if yes nbSamples = nbSamplesPerClass
%%
nn=models(1).Mu;
N=size(nn,1);
if nargin<3
    T=length(models);
    nbs=nbSamplesPerClass*T;
    XNew=zeros(N,nbs);
for i=1:1:T
    pr=models(i).Priors;
    Mu=models(i).Mu;
    N=size(Mu,1);
    K=size(Mu,2);
    Sigma=models(i).Sigma;
    XNewi=zeros(N,nbSamplesPerClass);
    out=randsrc(1,nbSamplesPerClass,[1:1:K;pr]); 
for j=1:1:nbSamplesPerClass
   XNewi(:,j)=mvnrnd(Mu(:,out(j)),Sigma(:,:,out(j)),1);
end
   XNew(:,(i-1)*nbSamplesPerClass+1:i*nbSamplesPerClass)=XNewi;
end
    
    
else
    nbs=nbSamplesPerClass;
    pr=models(desiredClass+1).Priors;
    Mu=models(desiredClass+1).Mu;
    N=size(Mu,1);
    K=size(Mu,2);
    Sigma=models(desiredClass).Sigma;
    XNewi=zeros(N,nbSamplesPerClass);
    out=randsrc(1,nbSamplesPerClass,[1:1:K;pr]); 
    for j=1:1:nbSamplesPerClass
       XNewi(:,j)=mvnrnd(Mu(:,out(j)),Sigma(:,:,out(j)),1);
    end
    XNew=XNewi;


end




end
