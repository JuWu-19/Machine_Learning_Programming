function [ y_est ] =  knn(X_train,  y_train, X_test, params)
K=params.k;
type=params.d_type;
Mt=size(X_test,2);
Mg=size(X_train,2);
y_est=zeros(1,Mt);

d=distance_to_centroids1(X_test, X_train, type);
[rr,idx]=sort(d,'ascend');

idx1=idx(1:K,:);

cc=y_train(idx1);
if K==1
    y_est=cc;
else 
y_est=mode(cc);
end


%MY_KNN Implementation of the k-nearest neighbor algorithm
%   for classification.
%
%   input -----------------------------------------------------------------
%   
%       o X_train  : (N x M_train), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_train  : (1 x M_train), a vector with labels y \in {1,2} corresponding to X_train.
%       o X_test   : (N x M_test), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o params : struct array containing the parameters of the KNN (k, d_type)
%
%   output ----------------------------------------------------------------
%
%       o y_est   : (1 x M_test), a vector with estimated labels y \in {1,2} 
%                   corresponding to X_test.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








end

function [d] =  distance_to_centroids1(X, Mu, type)

[~, M] = size(X);
[~, k] = size(Mu);

% Output Variable
d = zeros(k,M);

% Output Variable
for i=1:k
    for j=1:M
        d(i,j) = compute_distance(X(:,j), Mu(:,i), type);
    end
end


end