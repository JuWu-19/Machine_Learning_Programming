function [dZ] = cost_derivative(Y, Yd, typeCost, typeLayer)
%COST_DERIVATIVE compute the derivative of the cost function w.r.t to the Z
%value of the last layer
%   inputs:
%       o Y (PxM) Output of the last layer of the network, should match
%       Yd
%       o Yd (PxM) Ground truth
%       o typeCost (string) type of the cost evaluation function
%       o typeLayer (string) type of the last layer
%   outputs:
%       o dZ (PxM) The derivative dE/dZL
[P,M]=size(Y);
dZ=zeros(P,M);
switch typeCost
    case 'LogLoss'
        for i=1:M
            for k=1:P
                if Yd(k,i)>0
                    dZ(k,i)=-1/M*Yd(k,i)/Y(k,i);
                else
                    dZ(k,i)=1/M*(1-Yd(k,i))/(1-Y(k,i));
                end
            end
        end
    case 'CrossEntropy'
        for i=1:M
            for k=1:P
                    dZ(k,i)=-1/M*Yd(k,i)/Y(k,i);
            end
        end
    otherwise
        msg='invalid type';
        error(msg);
end




end

