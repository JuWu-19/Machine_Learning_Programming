function [E] = cost_function(Y, Yd, type)
%COST_FUNCTION compute the error between Yd and Y
%   inputs:
%       o Y (PxM) Output of the last layer of the network, should match
%       Y
%       o Yd (PxM) Ground truth
%       o type (string) type of the cost evaluation function
%   outputs:
%       o E (scalar) The error
[P,M]=size(Y);
loss=0;
switch type
    case 'LogLoss'
        for i=1:M
            for k=1:P
                if Yd(k,i)>0
                    loss=loss+Yd(k,i)*log(Y(k,i));
                else
                    loss=loss+(1-Yd(k,i))*log(1-Y(k,i));
                end
            end
        end
        E=-loss/M;
    case 'CrossEntropy'
        for i=1:M
            for k=1:P
                    loss=loss+Yd(k,i)*log(Y(k,i));
            end
        end
        E=-loss/M;
    otherwise
        msg='invalid type';
        error(msg);
end


end


