function [cimg, ApList, muList] = compress_image(img, p)
img1=img(:,:,1);
[Mu1, C1, EVector1, EV1] = compute_pca(img1);
[Y1, Ap1] = project_pca(img1, Mu1, EVector1, p);
muList(:,1)=Mu1;
cimg(:,:,1)=Y1;
ApList(:,:,1)=Ap1;

img2=img(:,:,2);
[Mu2, C2, EVector2, EV2] = compute_pca(img2);
[Y2, Ap2] = project_pca(img2, Mu2, EVector2, p);
muList(:,2)=Mu2;
cimg(:,:,2)=Y2;
ApList(:,:,2)=Ap2;

img3=img(:,:,3);
[Mu3, C3, EVector3, EV3] = compute_pca(img3);
[Y3, Ap3] = project_pca(img3, Mu3, EVector3, p);
muList(:,3)=Mu3;
cimg(:,:,3)=Y3;
ApList(:,:,3)=Ap3;

%COMPRESS_IMAGE Compress the image by applying the PCA over each channels 
% independently
%
%   input -----------------------------------------------------------------
%   
%       o img : (width x height x 3), an image of size width x height over RGB channels
%       o p : The number of components to keep during projection 
%
%   output ----------------------------------------------------------------
%
%       o cimg : (p x height x 3) The projection of the image on the eigenvectors
%       o ApList : (p x width x 3) The projection matrices for each channels
%       o muList : (width x 3) The mean vector for each channels


end

