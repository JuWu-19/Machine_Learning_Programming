function [AIC_curve, BIC_curve] =  gmm_eval(X, K_range, repeats, params)
cot=params.cov_type;
e=1e-5;
K=params.k;
Mi=params.max_iter_init;
km_dt=params.d_type;
kt=params.init;
N=size(X,1);
M=size(X,2);
aic=zeros(length(K_range),repeats);
bic=zeros(length(K_range),repeats);
AIC_curve=zeros(1,length(K_range));
BIC_curve=zeros(1,length(K_range));
for i=1:1:length(K_range)
    for j=1:1:repeats
params.k=K_range(i);
[  Priors, Mu, Sigma, iter ] = gmmEM(X, params);
cc=params.cov_type;
[AIC, BIC] =  gmm_metrics(X, Priors, Mu, Sigma, cc);
aic(i,j)=AIC;
bic(i,j)=BIC;
    end

AIC_curve(1,i)=mean(aic(i,:));
BIC_curve(1,i)=mean(bic(i,:));
end
%GMM_EVAL Implementation of the GMM Model Fitting with AIC/BIC metrics.
%
%   input -----------------------------------------------------------------
%       o X        : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o K_range  : (1 X K), Range of k-values to evaluate
%       o repeats  : (1 X 1), # times to repeat k-means
%       o params : Structure containing the paramaters of the algorithm:
%           * cov_type: Type of the covariance matric among 'full', 'iso',
%           'diag'
%           * d_type: Distance metric for the k-means initialization
%           * init: Type of initialization for the k-means
%           * max_iter_init: Max number of iterations for the k-means
%           * max_iter: Max number of iterations for EM algorithm
%
%   output ----------------------------------------------------------------
%       o AIC_curve  : (1 X K), vector of max AIC values for K-range
%       o BIC_curve  : (1 X K), vector of max BIC values for K-range
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

