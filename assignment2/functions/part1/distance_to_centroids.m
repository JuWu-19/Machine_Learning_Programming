function [d] =  distance_to_centroids(X, Mu, type)
%MY_DISTX2Mu Computes the distance between X and Mu.
%
%   input -----------------------------------------------------------------
%   
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o Mu    : (N x k), an Nxk matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^N
%       o type  : (string), type of distance {'L1','L2','LInf'}
%
%   output ----------------------------------------------------------------
%
%       o d      : (k x M), distances between X and Mu 
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d=zeros(size(Mu,2),size(X,2));
K=size(Mu,2);
M=size(X,2);
for i=1:1:K
    for j=1:1:M
        d(i,j)=compute_distance(X(:,j),Mu(:,i),type); 
    end 
end



end