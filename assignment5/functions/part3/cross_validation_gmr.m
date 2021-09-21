function [metrics] = cross_validation_gmr( X, y, F_fold, valid_ratio, k_range, params )
N=size(X,1);
M=size(X,2);
P=size(y,1);
F=F_fold;
K=length(k_range);
MSE=zeros(F,K);
NMSE=zeros(F,K);
R2=zeros(F,K);
AIC=zeros(F,K);
BIC=zeros(F,K);

mean_MSE=zeros(1,K);
mean_NMSE=zeros(1,K); 
mean_R2=zeros(1,K);
mean_AIC=zeros(1,K); 
mean_BIC=zeros(1,K); 
std_MSE=zeros(1,K); 
std_NMSE=zeros(1,K);
std_R2=zeros(1,K);
std_AIC=zeros(1,K); 
std_BIC=zeros(1,K);

for i=1:1:F
    [ Xt, yt, Xtt, ytt ] = split_regression_data(X, y, valid_ratio);
for k=1:1:K
    in=(1:N);
    out=(1:P);
    params.k=k_range(k);
    [  Priors, Mu, Sigma,~] = gmmEM([Xt;yt], params);
    [yest, var_est] = gmr(Priors, Mu, Sigma, Xtt, in, out);
    [M1, N1, Rsquared] = regression_metrics( yest, ytt );
    MSE(i,k)=M1;
    NMSE(i,k)=N1;
    cov_type=params.cov_type;
    [A, B] =  gmm_metrics([Xt;yt], Priors, Mu, Sigma, cov_type);
    R2(i,k)=Rsquared;
    AIC(i,k)=A;
    BIC(i,k)=B;
end
      
end

for k=1:1:K
mean_MSE(k)=mean(MSE(:,k));
mean_NMSE(k)=mean(NMSE(:,k)); 
mean_R2(k)=mean(R2(:,k));
mean_AIC(k)=mean(AIC(:,k)); 
mean_BIC(k)=mean(BIC(:,k)); 
std_MSE(k)=std(MSE(:,k)); 
std_NMSE(k)=std(NMSE(:,k));
std_R2(k)=std(R2(:,k));
std_AIC(k)=std(AIC(:,k)); 
std_BIC(k)=std(BIC(:,k));
end

metrics.mean_MSE=mean_MSE;
metrics.mean_NMSE=mean_NMSE;
metrics.mean_R2=mean_R2;
metrics.mean_AIC=mean_AIC;
metrics.mean_BIC=mean_BIC;

metrics.std_MSE=std_MSE;
metrics.std_NMSE=std_NMSE;
metrics.std_R2=std_R2;
metrics.std_AIC=std_AIC;
metrics.std_BIC=std_BIC;

%CROSS_VALIDATION_GMR Implementation of F-fold cross-validation for regression algorithm.
%
%   input -----------------------------------------------------------------
%
%       o X         : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y         : (P x M) array representing the y vector assigned to
%                           each datapoints
%       o F_fold    : (int), the number of folds of cross-validation to compute.
%       o valid_ratio  : (double), Testing Ratio.
%       o k_range   : (1 x K), Range of k-values to evaluate
%       o params    : parameter strcuture of the GMM
%
%   output ----------------------------------------------------------------
%       o metrics : (structure) contains the following elements:
%           - mean_MSE   : (1 x K), Mean Squared Error computed for each value of k averaged over the number of folds.
%           - mean_NMSE  : (1 x K), Normalized Mean Squared Error computed for each value of k averaged over the number of folds.
%           - mean_R2    : (1 x K), Coefficient of Determination computed for each value of k averaged over the number of folds.
%           - mean_AIC   : (1 x K), Mean AIC Scores computed for each value of k averaged over the number of folds.
%           - mean_BIC   : (1 x K), Mean BIC Scores computed for each value of k averaged over the number of folds.
%           - std_MSE    : (1 x K), Standard Deviation of Mean Squared Error computed for each value of k.
%           - std_NMSE   : (1 x K), Standard Deviation of Normalized Mean Squared Error computed for each value of k.
%           - std_R2     : (1 x K), Standard Deviation of Coefficient of Determination computed for each value of k averaged over the number of folds.
%           - std_AIC    : (1 x K), Standard Deviation of AIC Scores computed for each value of k averaged over the number of folds.
%           - std_BIC    : (1 x K), Standard Deviation of BIC Scores computed for each value of k averaged over the number of folds.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





end


function [AIC, BIC] =  gmm_metrics(X, Priors, Mu, Sigma, cov_type)

K=size(Priors,2);

N=size(X,1);
M=size(X,2);
[ logl ] = gmmLogLik(X, Priors, Mu, Sigma);
AIC=-2*logl+2*numb(N,K,cov_type);
BIC=-2*logl+log(M)*numb(N,K,cov_type);


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
