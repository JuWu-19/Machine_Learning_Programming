function [ TP_rate, FP_rate ] = knn_ROC( X_train, y_train, X_test, y_test,  params )
KR=params.k_range;
tt=params.d_type;
TP_rate=zeros(1,length(KR));
FP_rate=zeros(1,length(KR));

for i=1:1:length(KR)
params.d_type=tt;
params.k=KR(i);
yest=knn(X_train,  y_train, X_test, params);

C =  confusion_matrix(y_test, yest);

PP=C(1,1)+C(1,2);

NN=C(2,1)+C(2,2);

TP_rate(i)=C(1,1)/ PP;

FP_rate(i)=C(2,1)/NN;

end
%KNN_ROC Implementation of ROC curve for kNN algorithm.
%
%   input -----------------------------------------------------------------
%
%       o X_train  : (N x M_train), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_train  : (1 x M_train), a vector with labels y \in {1,2} corresponding to X_train.
%       o X_test   : (N x M_test), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_test   : (1 x M_test), a vector with labels y \in {1,2} corresponding to X_test.
%       o params : struct array containing the parameters of the KNN (k,
%                  d_type and k_range)
%
%   output ----------------------------------------------------------------

%       o TP_rate  : (1 x K), True Positive Rate computed for each value of k.
%       o FP_rate  : (1 x K), False Positive Rate computed for each value of k.
%        
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






end