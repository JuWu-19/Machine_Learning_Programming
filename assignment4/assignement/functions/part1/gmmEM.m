function [  Priors, Mu, Sigma, iter ] = gmmEM(X, params)
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
iter=0;
Max=params.max_iter;
[ Priors0, Mu0, Sigma0, labels0 ] = gmmInit(X, params);
pt1=Priors0;
pt=Priors0;
Sigmat1=Sigma0;
Mut1=Mu0;
Sigmat=Sigma0;
Mut=Mu0;
for i=1:1:Max
   iter=iter+1; 
   pt=pt1;
   Mut=Mut1;
   Sigmat=Sigmat1;
   Pk_x= expectation_step(X, pt, Mut, Sigmat, params);
   [P,M,S] = maximization_step(X, Pk_x, params);
   pt1=P;
   Mut1=M;
   Sigmat1=S;
   e1=norm(Mut1-Mut);
   e2=norm(pt1-pt);
   e3=0;
   for i=1:1:K
       e3=e3+norm(Sigmat1(:,:,i)-Sigmat(:,:,i));
   end
       
   if (e1<e)&&(e2<e)&&(e3<e)
      break; 
   end
Priors=pt1;
Mu=Mut1;
Sigma=Sigmat1;

end

%MY_GMMEM Computes maximum likelihood estimate of the parameters for the 
% given GMM using the EM algorithm and initial parameters
%   input------------------------------------------------------------------
%       o X         : (N x M), a data set with M samples each being of 
%                           dimension N, each column corresponds to a datapoint.
%       o params : Structure containing the paramaters of the algorithm:
%           * cov_type: Type of the covariance matric among 'full', 'iso',
%           'diag'
%           * k: Number of gaussians
%           * max_iter: Max number of iterations

%   output ----------------------------------------------------------------
%       o Priors    : (1 x K), the set of FINAL priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu        : (N x K), an NxK matrix corresponding to the FINAL centroids 
%                           mu = {mu^1,...mu^K}
%       o Sigma     : (N x N x K), an NxNxK matrix corresponding to the
%                   FINAL Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%       o iter      : (1 x 1) number of iterations it took to converge
%%





end

