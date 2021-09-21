function [dZ] = backward_activation(Z, Sigma)
%BACKWARD_ACTIVATION Compute the derivative of the activation function
%evaluated in Z
%   inputs:
%       o Z (NxM) Z value, input of the activation function. The size N
%       depends of the number of neurons at the considered layer but is
%       irrelevant here.
%       o Sigma (string) type of the activation to use
%   outputs:
%       o dZ (NXM) derivative of the activation function

k=0.01;
switch Sigma
    case 'sigmoid'
        dZ=-exp(Z)./(exp(Z) + 1).^2;
    case 'tanh'
        dZ=1-(exp(-Z) - exp(Z)).^2./(exp(-Z) + exp(Z)).^2;
    case 'relu'
        Z(Z>0)=1;
        dZ=Z;
    case 'leakyrelu'
        Z(Z>0)=1;
        Z(Z<0)=k;
        dZ=Z;
    otherwise 
        msg='invalid type';
        error(msg);

end






end

