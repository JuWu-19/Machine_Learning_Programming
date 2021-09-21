function [X, param1, param2] = normalize(data, normalization, param11, param12)

switch nargin
    case 4
        if ((param11==0)&&(param12==0))||(normalization=='none')
        param1=0;
        param2=0;
        X=data;
        elseif (normalization=='minmax')
        param1=param11;
        param2=param12;
        X1=data-repmat(param1,1,size(data,2));
        delta=param2-param1;
        X=X1./repmat(delta,1,size(data,2));
        elseif (normalization=='zscore')
        param1=param11;
        param2=param12;
        X1=data-repmat(param1,1,size(data,2));
        delta=param2;
        X=X1./repmat(delta,1,size(data,2));
        else 
             param1=0;
        param2=0;
        X=data;
        end     
    otherwise
        if (normalization=='none')
        param1=0;
        param2=0;
        X=data;
        elseif (normalization=='zscore')
        mu=mean(data');
        sd=std(data');
        param1=mu';
        param2=sd';
        X1=data-repmat(param1,1,size(data,2));
        delta=param2;
        X=X1./repmat(delta,1,size(data,2));
        elseif (normalization=='minmax')
        m1=min(data');
        M1=max(data');
        param1=m1';
        param2=M1';
        X1=data-repmat(param1,1,size(data,2));
        delta=param2-param1;
        X=X1./repmat(delta,1,size(data,2));
        else
        param1=0;
        param2=0;
        X=data;
        end     
end
%NORMALIZE Normalize the data wrt to the normalization technique passed in
%parameter. If param1 and param2 are given, use them during the
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o data : (N x M), a dataset of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : (optional) first parameter of the normalization to be
%                  used instead of being recalculated if provided
%       o param2 : (optional) second parameter of the normalization to be
%                  used instead of being recalculated if provided
%
%   output ----------------------------------------------------------------
%
%       o X : (N x M), normalized data
%       o param1 : first parameter of the normalization
%       o param2 : second parameter of the normalization


end

