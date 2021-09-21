function [acc] =  accuracy(y_test, y_est)
Mt=size(y_test,2);
acc=0;
for i=1:1:Mt
if y_test(i)==y_est(i)
   acc=acc+1; 
end
end
acc=acc/Mt;
%My_accuracy Computes the accuracy of a given classification estimate.
%   input -----------------------------------------------------------------
%   
%       o y_test  : (1 x M_test),  true labels from testing set
%       o y_est   : (1 x M_test),  estimated labes from testing set
%
%   output ----------------------------------------------------------------
%
%       o acc     : classifier accuracy
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



end