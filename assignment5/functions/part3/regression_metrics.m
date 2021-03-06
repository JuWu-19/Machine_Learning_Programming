function [MSE, NMSE, Rsquared] = regression_metrics( yest, y )
%REGRESSION_METRICS Computes the metrics (MSE, NMSE, R squared) for 
%   regression evaluation
%
%   input -----------------------------------------------------------------
%   
%       o yest  : (P x M), representing the estimated outputs of P-dimension
%       of the regressor corresponding to the M points of the dataset
%       o y     : (P x M), representing the M continuous labels of the M 
%       points. Each label has P dimensions.
%
%   output ----------------------------------------------------------------
%
%       o MSE       : (1 x 1), Mean Squared Error
%       o NMSE      : (1 x 1), Normalized Mean Squared Error
%       o R squared : (1 x 1), Coefficent of determination
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=size(yest,1);
M=size(yest,2);
Mu=mean(y');
Mu2=mean(yest');
Mu2=Mu2';
Mu=Mu';
MSE=0;
up=0;
var=0;
for k=1:1:M
    MSE=MSE+(norm(y(:,k)-yest(:,k)))^2; 
end
MSE=MSE/M;
for k=1:1:M
   var=var+(norm(y(:,k)-Mu))^2; 
end
var=var/(M-1);
NMSE=MSE/var;

for i=1:1:M
    up=up+((y(:,i))'-Mu')*(yest(:,i)-Mu2);
end
up=up^2;
d1=0;
d2=0;
for i=1:1:M
    d1=d1+(norm(y(:,i)-Mu))^2;
    d2=d2+(norm(yest(:,i)-Mu2))^2;
end
down=d1*d2+1e-6;
Rsquared=up/down;
end

