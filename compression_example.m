 % Example Script for Fractal DCT Compression
clear all;

% Load and preprocess the image
inputImage = imread('bridge.pgm');
grayscaleImage = double(inputImage);
imshow(grayscaleImage / 256);

% Perform compression
fractal_dct_compress;
