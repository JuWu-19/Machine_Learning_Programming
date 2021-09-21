function [X, unique_cards] = prepare_data(data)
%PREPARE_DATA Convert the list of cards and deck to a matrix representation
%             where each row is a unique card and each column a deck. The
%             value in each cell is the number of time the card appears in
%             the deck
%
%   input -----------------------------------------------------------------
%   
%       o data   : (60, M) a dataset of M decks. A deck contains 60 non
%       necesserally unique cards
%
%   output ----------------------------------------------------------------
%
%       o X  : (N x M) matrix representation of the frequency of appearance
%       of unique cards in the decks whit N the number of unique cards in
%       the dataset and M the number of decks
%       o unique_cards : {N x 1} the set of unique card names as a cell
%       array
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uni=unique(data);
N=size(uni,1);
M=size(data,2);
X=zeros(N,M);
for i=1:1:M
    
    for j=1:1:N
       idx=find(ismember(data(:,i),uni(j)));
       X(j,i)=length(idx);
        
    end

    
end

unique_cards=uni;



end

