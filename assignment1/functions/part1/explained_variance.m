function [ExpVar, CumVar, p_opt] = explained_variance(EigenValues, var_threshold)
%EXPLAINED_VARIANCE Function that returns the optimal p given a desired
%   explained variance.
%
%   input -----------------------------------------------------------------
%   
%       o EigenValues     : (N x 1), Diagonal Matrix composed of lambda_i 
%       o var_threshold   : Desired Variance to be explained
%  
%   output ----------------------------------------------------------------
%
%       o ExpVar  : (N x 1) vector of explained variance
%       o CumVar  : (N x 1) vector of cumulative explained variance
%       o p_opt   : optimal principal components given desired Var
ExpVar=EigenValues./(sum(EigenValues));
Tr=tril(ones(size(EigenValues,1)));
CumVar=Tr*ExpVar;
trail=(CumVar>var_threshold);
kk=[1:size(EigenValues,1)];
tt=kk(trail);
p_opt=tt(1);


end

