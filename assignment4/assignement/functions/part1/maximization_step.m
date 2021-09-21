function [Priors,Mu,Sigma] = maximization_step(X, Pk_x, params)
cot=params.cov_type;
e=1e-5;
K=params.k;
Mi=params.max_iter_init;
km_dt=params.d_type;
kt=params.init;
N=size(X,1);
M=size(X,2);
Priors=zeros(1,K);
Mu=zeros(N,K);
Sigma=zeros(N,N,K);

for i=1:1:K
Priors(i)=(1/M)*sum(Pk_x(i,:));
Mu(:,i)=X*Pk_x(i,:)'/sum(Pk_x(i,:));
end

switch cot
    
    case 'full'
    for i=1:1:K
        ss=zeros(N,N);
        for j=1:1:M
    ss=ss+Pk_x(i,j)*(X(:,j)-Mu(:,i))*(X(:,j)-Mu(:,i))';
        end
         Sigma(:,:,i)=ss/sum(Pk_x(i,:));
         Sigma(:,:,i)=Sigma(:,:,i)+diag(ones(1,N)*e);
    end
   
    case 'diag'
    for i=1:1:K
        ss=zeros(N,N);
        for j=1:1:M
    ss=ss+Pk_x(i,j)*(X(:,j)-Mu(:,i))*(X(:,j)-Mu(:,i))';
        end
        ss1=ss/sum(Pk_x(i,:));
        Sigma(:,:,i)=diag(diag(ss1));
        Sigma(:,:,i)=Sigma(:,:,i)+diag(ones(1,N)*e);
    end
      
    case 'iso'
    for i=1:1:K
        ss=0;
        for j=1:1:M
    ss=ss+Pk_x(i,j)*(norm(X(:,j)-Mu(:,i)))^2;
        end
        ss2=ss/(sum(Pk_x(i,:))*N);
        Sigma(:,:,i)=diag(ones(1,N)*ss2);
        Sigma(:,:,i)=Sigma(:,:,i)+diag(ones(1,N)*e);
    end 
        
    otherwise
        msg='Invalid Type';
        error(msg);
end


%MAXIMISATION_STEP Compute the maximization step of the EM algorithm
%   input------------------------------------------------------------------
%       o X         : (N x M), a data set with M samples each being of 
%       o Pk_x      : (K, M) a KxM matrix containing the posterior probabilty
%                     that a k Gaussian is responsible for generating a point
%                     m in the dataset, output of the expectation step
%       o params    : The hyperparameters structure that contains k, the number of Gaussians
%                     and cov_type the coviariance type
%   output ----------------------------------------------------------------
%       o Priors    : (1 x K), the set of updated priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu        : (N x K), an NxK matrix corresponding to the updated centroids 
%                           mu = {mu^1,...mu^K}
%       o Sigma     : (N x N x K), an NxNxK matrix corresponding to the
%                   updated Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%%





end

