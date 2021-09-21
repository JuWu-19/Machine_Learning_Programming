function [acc_curve] = knn_eval( X_train, y_train, X_test, y_test, params)
K=params.k_range;
kk=length(K);
acc_curve=zeros(1,kk);
tt=params.d_type;
for i=1:1:kk
    
para=struct('k',K(i),'d_type',tt);

yest=knn(X_train,  y_train, X_test, para);
acc_curve(i)=accuracy(y_test, yest);
    
    
end
%KNN_EVAL Implementation of kNN evaluation.
%
%   input -----------------------------------------------------------------
%   
%       o X_train   : (N x M_train), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_train   : (1 x M_train), a vector with labels y \in {1,2} corresponding to X_train.
%       o X_test    : (N x M_test), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_test    : (1 x M_test), a vector with labels y \in {1,2} corresponding to X_test.
%       o params : struct array containing the parameters of the KNN (k,
%                  d_type). Also include the k_range for the
%                  evaluation
%
%   output ----------------------------------------------------------------
%       o acc_curve : (1 X K), Accuracy for each value of K
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






end

