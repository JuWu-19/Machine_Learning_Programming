function [labels, Mu, Mu_init, iter] =  kmeans(X,K,init,type,MaxIter,plot_iter)
%MY_KMEANS Implementation of the k-means algorithm
%   for clustering.
%
%   input -----------------------------------------------------------------
%   
%       o X        : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o K        : (int), chosen K clusters
%       o init     : (string), type of initialization {'sample','range'}
%       o type     : (string), type of distance {'L1','L2','LInf'}
%       o MaxIter  : (int), maximum number of iterations
%       o plot_iter: (bool), boolean to plot iterations or not (only works with 2d)
%
%   output ----------------------------------------------------------------
%
%       o labels   : (1 x M), a vector with predicted labels labels \in {1,..,k} 
%                   corresponding to the k-clusters for each points.
%       o Mu       : (N x k), an Nxk matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^N 
%       o Mu_init  : (N x k), same as above, corresponds to the centroids used
%                            to initialize the algorithm
%       o iter     : (int), iteration where algorithm stopped
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% TEMPLATE CODE (DO NOT MODIFY)
% Auxiliary Variable
[D, N] = size(X);
d_i    = zeros(K,N);
k_i    = zeros(1,N);
r_i    = zeros(K,N);
if plot_iter == [];plot_iter = 0;end
tolerance = 1e-8;
MaxTolIter = 15;

% Output Variables
Mu     = zeros(D, K);
labels = zeros(1,N);

%% INSERT CODE HERE
aa=sum(r_i');
cc=find(aa==0);
while(~isempty(cc))
  
Mu_init=kmeans_init(X, K, init);  
Mu = Mu_init;

LM=MaxIter;
iter=0;
tol_iter=0;
for i=1:1:LM+1
d_i    = zeros(K,N);
k_i    = zeros(1,N);
r_i    = zeros(K,N);
iter=iter+1;
Mu_previous=Mu;
d_i=  distance_to_centroids(X, Mu, type);

[kk,k_i]=min(d_i);
if size(d_i,1)==1
    k_i=ones(1,N);
end
for k=1:1:N
 r_i(k_i(k),k)=1;
end
rr=r_i';
for k=1:1:K
Mu(:,k)=X*rr(:,k)./sum(rr(:,k));
end

[fg, tol_iter1] = check_convergence(Mu, Mu_previous, iter, tol_iter, MaxIter, MaxTolIter, tolerance);
tol_iter=tol_iter1;
if fg==true
    break;
end

end

aa=sum(r_i');
cc=find(aa==0);
end
labels=k_i;


%% TEMPLATE CODE (DO NOT MODIFY)
% Visualize Initial Centroids if N=2 and plot_iter active
colors     = hsv(K);
if (D==2 && plot_iter)
    options.title       = sprintf('Initial Mu with %s method', init);
    ml_plot_data(X',options); hold on;
    ml_plot_centroids(Mu_init',colors);
end


%% INSERT CODE HERE











%% TEMPLATE CODE (DO NOT MODIFY)
if (D==2 && plot_iter)
    options.labels      = labels;
    options.class_names = {};
    options.title       = sprintf('Mu and labels after %d iter', iter);
    ml_plot_data(X',options); hold on;    
    ml_plot_centroids(Mu',colors);
end


end