function [C] =  confusion_matrix(y_test, y_est)
K=size(y_test,2);
TP=0;
FN=0;
FP=0;
TN=0;
for i=1:1:K
 if y_test(i)==1&&y_est(i)==1    
    TP=TP+1;
 end
 
 if  y_test(i)==1&&y_est(i)==2
    FN=FN+1;
 end
 
  if  y_test(i)==2&&y_est(i)==1
    FP=FP+1;
  end
  if  y_test(i)==2&&y_est(i)==2
    TN=TN+1;
  end
 
end

C=[TP,FN;FP,TN];
%CONFUSION_MATRIX Implementation of confusion matrix 
%   for classification results.
%   input -----------------------------------------------------------------
%
%       o y_test    : (1 x M), a vector with true labels y \in {1,2} 
%                        corresponding to X_test.
%       o y_est     : (1 x M), a vector with estimated labels y \in {1,2} 
%                        corresponding to X_test.
%
%   output ----------------------------------------------------------------
%       o C          : (2 x 2), 2x2 matrix of |TP & FN|
%                                             |FP & TN|.
%        
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






end

