clear;
close all;
clc;

% PATH
addpath("functions/part1")
addpath("functions/part2")
addpath("evaluation_functions")
addpath("evaluation_functions/part2")
addpath("plot_functions")

% Load 2D Testing Dataset for PCA
img = imread("data/flower.ppm");
img = im2double(img);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Task 6: Test your compress_image.m function         %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p = 50;
% INSERT CODE HERE
[cimg, ApList, muList] = compress_image(img,p);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Task 7: Test your compression_rate.m function       %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INSERT CODE HERE
[cr, cSize] = compression_rate(img, cimg, ApList, muList);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Task 8: Test your reconstruct_image.m function     %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INSERT CODE HERE
rimg = reconstruct_image(cimg, ApList, muList);

%% VISUALIZATION
plot_image_reconstruction(img)