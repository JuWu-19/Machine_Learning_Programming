function [Mu] =  kmeans_init(X, k, init)
%KMEANS_INIT This function computes the initial values of the centroids
%   for k-means algorithm, depending on the chosen method.
%
%   input -----------------------------------------------------------------
%   
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o k     : (double), chosen k clusters
%       o init  : (string), type of initialization {'sample','range'}
%
%   output ----------------------------------------------------------------
%
%       o Mu    : (D x k), an Nxk matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^N                   
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch init
    case 'sample'
        ran=randsample(size(X,2),k);
        Mu=X(:,ran');
    case 'range'
        minx=min(X');
        maxx=max(X');
        Mu=zeros(size(X,1),k);
        for i=1:1:k
            Mu(:,i)=unifrnd(minx,maxx);
        end
    otherwise
        msg = 'Please Input Valid Init Method';
        error(msg)

end
end