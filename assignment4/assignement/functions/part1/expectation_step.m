function [Pk_x] = expectation_step(X, Priors, Mu, Sigma, params)
cot=params.cov_type;
K=params.k;
Mi=params.max_iter_init;
km_dt=params.d_type;
kt=params.init;
N=size(X,1);
M=size(X,2);
Pk_x=zeros(K,M);
pp=zeros(K,M);
for i=1:1:K
pp(i,:)=gaussPDF(X, Mu(:,i), Sigma(:,:,i));
end
for i=1:1:M
   for j=1:1:K
       Pk_x(j,i)=Priors(j)*pp(j,i)/(Priors*pp(:,i));
   end
end
%EXPECTATION_STEP Computes the expection step of the EM algorihtm
% input------------------------------------------------------------------
%       o X         : (N x M), a data set with M samples each being of 
%                           dimension N, each column corresponds to a datapoint.
%       o Priors    : (1 x K), the set of updated priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu        : (N x K), an NxK matrix corresponding to the CURRENT centroids mu^(0) = {mu^1,...mu^K}
%       o Sigma     : (N x N x K), an NxNxK matrix corresponding to the CURRENT Covariance matrices   
% 					Sigma^(0) = {Sigma^1,...,Sigma^K} 
%       o params    : The hyperparameters structure that contains k, the number of Gaussians
% output----------------------------------------------------------------
%       o Pk_x      : (K, M) a KxM matrix containing the posterior probabilty that a k Gaussian is responsible
%                     for generating a point m in the dataset 
%%

end

