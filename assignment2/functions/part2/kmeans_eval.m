function [RSS_curve, AIC_curve, BIC_curve] =  kmeans_eval(X, K_range,  repeats, init, type, MaxIter)
%KMEANS_EVAL Implementation of the k-means evaluation with clustering
%metrics.
%
%   input -----------------------------------------------------------------
%   
%       o X           : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o repeats     : (1 X 1), # times to repeat k-means
%       o K_range     : (1 X K_range), Range of k-values to evaluate
%       o init        : (string), type of initialization {'sample','range'}
%       o type        : (string), type of distance {'L1','L2','LInf'}
%       o MaxIter     : (int), maximum number of iterations
%
%   output ----------------------------------------------------------------
%       o RSS_curve  : (1 X K_range), RSS values for each value of K in K_range
%       o AIC_curve  : (1 X K_range), AIC values for each value of K in K_range
%       o BIC_curve  : (1 X K_range), BIC values for each value of K in K_range
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RSS_curve=zeros(1,size(K_range,2));
AIC_curve=zeros(1,size(K_range,2));
BIC_curve=zeros(1,size(K_range,2));
for i=1:1:size(K_range,2)
    
    rss=zeros(1,repeats);
    aic=zeros(1,repeats);
    bic=zeros(1,repeats);
    for j=1:1:repeats
        [labels, Mu, Mu_init, iter] =  kmeans(X,i,init,type,MaxIter,1);
        [RSS, AIC, BIC] =  compute_metrics(X, labels, Mu);
        rss(j)=RSS;
        aic(j)=AIC;
        bic(j)=BIC;
    end
RSS_curve(i)=sum(rss)/repeats;
AIC_curve(i)=sum(aic)/repeats;
BIC_curve(i)=sum(bic)/repeats;
    
    
end








end