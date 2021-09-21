function [F1_overall, P, R, F1] =  f1measure(cluster_labels, class_labels)
%MY_F1MEASURE Computes the f1-measure for semi-supervised clustering
%
%   input -----------------------------------------------------------------
%   
%       o class_labels     : (1 x M),  M-dimensional vector with true class
%                                       labels for each data point
%       o cluster_labels   : (1 x M),  M-dimensional vector with predicted 
%                                       cluster labels for each data point
%   output ----------------------------------------------------------------
%
%       o F1_overall      : (1 x 1)     f1-measure for the clustered labels
%       o P               : (nClusters x nClasses)  Precision values
%       o R               : (nClusters x nClasses)  Recall values
%       o F1              : (nClusters x nClasses)  F1 values
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u1=unique(class_labels);
u11=size(u1,2);
u2=unique(cluster_labels);
u22=size(u2,2);
P=zeros(u22,u11);
R=zeros(u22,u11);
F1=zeros(u22,u11);
G1=size(u11,2);
B=size(class_labels,2);
aa=zeros(G1,1);
for i=1:1:u11
a1=find(class_labels==i);
a11=size(a1,2);
aa(i)=a11/B;
for j=1:1:u22
b1=find(cluster_labels==j);
b11=size(b1,2);
bij=sum(class_labels(1, :) == i & cluster_labels(1, :) == j);
P(j,i)=bij/b11;
R(j,i)=bij/a11;
if (P(j,i)==0)&(R(j,i)==0)
    F1(j,i)=0;
else
F1(j,i)=2*P(j,i)*R(j,i)/(P(j,i)+R(j,i));
end

end

end
if size(F1,1)==1
    mm=F1;
else
mm=max(F1);
end
F1_overall=mm*aa';



end
