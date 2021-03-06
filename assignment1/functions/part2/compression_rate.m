function [cr, compressedSize] = compression_rate(img,cimg,ApList,muList)
%COMPRESSION_RATE Calculate the compression rate based on the original
%image and all the necessary components to reconstruct the compressed image
%
%   input -----------------------------------------------------------------
%       o img : The original image   
%       o cimg : The compressed image
%       o ApList : List of projection matrices for each independent
%       channels
%       o muList : List of mean vectors for each independent channels
%
%   output ----------------------------------------------------------------
%
%       o cr : The compression rate
%       o compressedSize : The size of the compressed elements
ssr=memorycalc(img);
sst=memorycalc(cimg)+memorycalc(ApList)+memorycalc(muList);

cr=1-sst/ssr;
compressedSize=sst;

% convert the size to megabits
compressedSize = compressedSize / 1048576; 
end

function SM=memorycalc(MM)

SM=64*numel(MM);
end

