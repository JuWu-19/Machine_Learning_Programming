function [dZ, dW, dW0] = backward_pass(dE, W, A, Z, Sigmas)
%BACKWARD_PASS This function calculate the backward pass of the network with
%   inputs:
%       o dE (PxM) The derivative dE/dZL
%       o W {Lx1} cell array containing the weight matrices for all the layers 
%       o b {Lx1} cell array containing the bias matrices for all the layers
%       o A {L+1x1} cell array containing the results of the activation functions
%       at each layer. Also contain the input layer A0
%       o Z {Lx1} cell array containing the Z values at each layer
%       o Sigmas {Lx1} cell array containing the type of the activation
%       functions for all the layers
%
%   outputs:
%       o dZ {Lx1} cell array containing the derivatives dE/dZl values at each layer
%       o dW {Lx1} cell array containing the derivatives of the weights at
%       each layer
%       o dW0 {Lx1} cell array containing the derivatives of the bias at each layer[N,M]=size(X);
L=length(W);
[P,M]=size(dE);
dZ=cell(L,1);
dW=cell(L,1);
dW0=cell(L,1);
for k=1:M
BA=backward_activation(Z{L}, Sigmas{L});
dZ{L}(:,k)=diag(BA(:,k))*dE(:,k);
end
Sw=sum((dZ{L})');
dW0{L}=1/M*Sw;
dW{L}=1/M*(dZ{L})*(A{L})';
for i=1:L-1
k=L-i;
for i=1:M
BA=backward_activation(Z{k}, Sigmas{k});
dZ{k}(:,i)=diag(BA(:,i))*(W{k+1})'*dZ{k+1}(:,i);
end
Sw=sum((dZ{k})');
dW0{k}=1/M*Sw';
dW{k}=1/M*(dZ{k})*(A{k})';
end



end

