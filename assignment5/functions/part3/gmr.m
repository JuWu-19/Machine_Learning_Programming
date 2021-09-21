function [y_est, var_est] = gmr(Priors, Mu, Sigma, X, in, out)
%GMR This function performs Gaussian Mixture Regression (GMR), using the 
% parameters of a Gaussian Mixture Model (GMM) for a D-dimensional dataset,
% for D= N+P, where N is the dimensionality of the inputs and P the 
% dimensionality of the outputs.
%
% Inputs -----------------------------------------------------------------
%   o Priors:  1 x K array representing the prior probabilities of the K GMM 
%              components.
%   o Mu:      D x K array representing the centers of the K GMM components.
%   o Sigma:   D x D x K array representing the covariance matrices of the 
%              K GMM components.
%   o X:       N x M array representing M datapoints of N dimensions.
%   o in:      1 x N array representing the dimensions of the GMM parameters
%                to consider as inputs.
%   o out:     1 x P array representing the dimensions of the GMM parameters
%                to consider as outputs. 
% Outputs ----------------------------------------------------------------
%   o y_est:     P x M array representing the retrieved M datapoints of 
%                P dimensions, i.e. expected means.
%   o var_est:   P x P x M array representing the M expected covariance 
%                matrices retrieved. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K=size(Priors,2);
N=length(in);
P=length(out);
D=N+P;
M=size(X,2);
y_est=zeros(P,M);
var_est=zeros(P,P,M);
pr=Priors;

beta_w=zeros(K,M);
for i=1:1:M
    Mu_c=zeros(P,K);
    var_c=zeros(P,P,K);
for k=1:1:K
    beta_w(k,i)=pr(k)*gaussPDF(X(:,i),Mu(1:N,k),Sigma(1:N,1:N,k));
    Mu_c(:,k)=Mu(N+1:D,k)+Sigma(N+1:D,1:N,k)*(Sigma(1:N,1:N,k))^(-1)*(X(:,i)-Mu(1:N,k));
    var_c(:,:,k)=Sigma(N+1:D,N+1:D,k)-Sigma(N+1:D,1:N,k)*(Sigma(1:N,1:N,k)^(-1))*Sigma(1:N,N+1:D,k);
end
beta_w(:,i)=beta_w(:,i)/sum(beta_w(:,i));
y_est(:,i)=Mu_c*beta_w(:,i);

for k=1:1:K
var_est(:,:,i)=var_est(:,:,i)+beta_w(k,i)*((Mu_c(:,k))^2+var_c(:,:,k));
end
offset=y_est(:,i);
var_est(:,:,i)=var_est(:,:,i)-offset*offset';
end

