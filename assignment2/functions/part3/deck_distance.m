function [dist] = deck_distance(deck, Mu, type)
%DECK_DISTANCE Calculate the distance between a partially filled deck and
%the centroides
%
%   input -----------------------------------------------------------------
%   
%       o deck : (N x 1) a partially filled deck
%       o Mu : (N x K) Value of the centroids
%       o type : type of distance to use {'L1', 'L2', 'Linf'}
%
%   output ----------------------------------------------------------------
%
%       o dist : K X 1 the distance to the k centroids
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K=size(Mu,2);
N=size(deck,1);
dist=zeros(K,1);
for i=1:1:K
d=compute_distance(deck(deck~=0), Mu((deck~=0),i), type);
dist(i,1)=d;

end


end

