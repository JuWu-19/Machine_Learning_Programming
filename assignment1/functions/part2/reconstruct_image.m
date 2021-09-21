function [rimg] = reconstruct_image(cimg, ApList, muList)
%RECONSTRUCT_IMAGE Reconstruct the image given the compressed image, the
%projection matrices and mean vectors of each channels
%
%   input -----------------------------------------------------------------
%   
%       o cimg : The compressed image
%       o ApList : List of projection matrices for each independent
%       channels
%       o muList : List of mean vectors for each independent channels
%
%   output ----------------------------------------------------------------
%
%       o rimg : The reconstructed image
rimg(:,:,1)=ApList(:,:,1)'*cimg(:,:,1)+muList(:,1);
rimg(:,:,2)=ApList(:,:,2)'*cimg(:,:,2)+muList(:,2);
rimg(:,:,3)=ApList(:,:,3)'*cimg(:,:,3)+muList(:,3);

end

