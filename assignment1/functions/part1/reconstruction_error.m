function [err] = reconstruction_error(X, Xhat)
%RECONSTRUCTION_ERROR Compute reconstruction error
%   In this function, the student should compute the reconstruction error
%   between the original dataset and the reconstructed one
%
%   input -----------------------------------------------------------------
%   
%       o X      : (N x M), original data set with M samples each being of dimension N.
%       o X_hat  : (N x M), reconstructed data set with M samples each being of dimension N.
%
%   output ----------------------------------------------------------------
%
%       o e_rec  :  reconstruction error
err=norm(X-Xhat);

end

