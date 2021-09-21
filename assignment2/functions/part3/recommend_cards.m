function [cards] = recommend_cards(deck, Mu, type)
%RECOMMAND_CARDS Recommands a card for the deck in input based on the
%centroid of the clusters
%
%   input -----------------------------------------------------------------
%   
%       o deck : (N, 1) a deck of card
%       o Mu : (M x k) the centroids of the k clusters
%       o type : type of distance to use {'L1', 'L2', 'Linf'}
%
%   output ----------------------------------------------------------------
%
%       o cards : a set of cards recommanded to add to this deck
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=size(deck,1);
[dist] = deck_distance(deck, Mu, type);
[a,b]=min(dist);
non=Mu(:,b);
aa=length(find(non==0));
[cc,dd]=sort(Mu(:,b),'descend');

cards=dd(1:N-aa,1);




end

