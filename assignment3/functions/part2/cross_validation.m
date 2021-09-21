function [avgTP, avgFP, stdTP, stdFP] =  cross_validation(X, y, F_fold, valid_ratio, params)
KR=params.k_range;
tt=params.d_type;
tp=zeros(F_fold,length(KR));
fp=zeros(F_fold,length(KR));

for i=1:1:length(KR)

for j=1:1:F_fold

[X_train, Y_train, X_test, Y_test] = split_data(X, y, valid_ratio);
%param.d_type=tt;
param=struct('d_type',tt,'k',KR(i));
%param.k=KR(i);
yest=knn(X_train, Y_train, X_test, param);
C =  confusion_matrix(Y_test, yest);
PP=C(1,1)+C(1,2);
NN=C(2,1)+C(2,2);
TP_rate=C(1,1)/ PP;
FP_rate=C(2,1)/NN;
tp(j,i)=TP_rate;
fp(j,i)=FP_rate;
end

end

for i=1:1:length(KR)
avgTP(i)=mean(tp(:,i));
avgFP(i)=mean(fp(:,i));
stdTP(i)=std(tp(:,i));
stdFP(i)=std(fp(:,i));
end
%CROSS_VALIDATION Implementation of F-fold cross-validation for kNN algorithm.
%
%   input -----------------------------------------------------------------
%
%       o X         : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y         : (1 x M), a vector with labels y \in {1,2} corresponding to X.
%       o F_fold    : (int), the number of folds of cross-validation to compute.
%       o valid_ratio  : (double), Training/Testing Ratio.
%       o params : struct array containing the parameters of the KNN (k,
%                  d_type and k_range)
%
%   output ----------------------------------------------------------------
%
%       o avgTP  : (1 x K), True Positive Rate computed for each value of k averaged over the number of folds.
%       o avgFP  : (1 x K), False Positive Rate computed for each value of k averaged over the number of folds.
%       o stdTP  : (1 x K), Standard Deviation of True Positive Rate computed for each value of k.
%       o stdFP  : (1 x K), Standard Deviation of False Positive Rate computed for each value of k.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








end