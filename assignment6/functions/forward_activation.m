function [A] = forward_activation(Z, Sigma)
%FORWARD_ACTIVATION Compute the value A of the activation function given Z
%   inputs:
%       o Z (NxM) Z value, input of the activation function. The size N
%       depends of the number of neurons at the considered layer but is
%       irrelevant here.
%       o Sigma (string) type of the activation to use
%
%   outputs:
%       o A (NXM) value of the activation function
k=0.01;
[N,M]=size(Z);
A=zeros(N,M);
switch Sigma
    case 'sigmoid'
        A=1./(1+exp(Z));
    case 'tanh'
        A=(exp(Z)-exp(-Z))./(exp(Z)+exp(-Z));
    case 'relu'
        A=max(0,Z);
    case 'leakyrelu'
        A=max(k.*Z,Z);
    case 'softmax'
        for i=1:M
            Z(:,i)=Z(:,i)-sum(Z(:,i));
            Sm=sum(exp(Z(:,i)));
            A(:,i)=exp(Z(:,i))./Sm;
        end
    otherwise 
        msg='invalid type';
        error(msg);

end

end

