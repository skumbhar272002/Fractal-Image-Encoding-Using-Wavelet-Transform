% Fractal Image Compression using DCT
clear all;

% Define normalization matrices for quantization
normMat = ones(16) * 10^4;
normMat(1:8, 1:8) = [
    16 11 10 16 24 40 51 61 
    12 12 14 19 26 58 60 55
    14 13 16 24 40 57 69 56
    14 17 22 29 51 87 80 62
    18 22 37 56 68 109 103 77
    24 35 55 64 81 104 113 92
    49 64 78 87 103 121 120 101
    72 92 95 98 112 100 103 99
];

% Initialize variables for the compression process
encodingResults = zeros(1024, 10);
qualityLevels = [.1 .25 .4 .5 .6 .7 .8 .95];
currentIteration = 1;
errorThreshold = 7;
quantizationFactor = 30;

% Define image and block sizes
rangeBlockSize = 16;
domainBlockSize = 32;

% Read and display the input image
inputImage = imread('bridge.pgm');
grayscaleImage = double(inputImage);
imshow(grayscaleImage / 256);

% Get image dimensions
imageSize = size(grayscaleImage);
numBlocks = imageSize(1) / rangeBlockSize;

% Divide the image into blocks and apply DCT
blockIndex = 0;
for row = 1:numBlocks
    for col = 1:numBlocks
        blockIndex = blockIndex + 1;
        currentBlock = grayscaleImage(rangeBlockSize*(row-1)+1:rangeBlockSize*row, rangeBlockSize*(col-1)+1:rangeBlockSize*col);
        dctBlock = dct2(currentBlock - 128);
        normalizedBlock = dctBlock ./ normMat;
        blockStorage{blockIndex} = normalizedBlock;
    end
end

% Initialize variables for the main loop
totalBlocks = blockIndex;
iterations = 1;
currentError = errorThreshold;

% Main compression loop
while (iterations)
    matchedBlocks = 0;
    for i = 1:totalBlocks
        domainBlock = blockStorage{i};
        domainBlock(1, 1) = 0;
        diff = 1000;
        
        % Perform distortion calculation
        distortion_calculation;  % Custom function
        
        if (rangeBlockSize == 2)
            encodingResults(i, 1) = distortion;
            encodingResults(i, 2) = norm(domainBlock - rangeBlock);
            encodingResults(i, 3) = contrast;
            encodingResults(i, 4) = round(originalValue);
            iterations = 0;
        else
            if distortion < currentError
                matchedBlocks = matchedBlocks + 1;
                encodingResults(i, 3) = contrast;
                encodingResults(i, 4) = round(originalValue);
            else
                unmatchedBlocks(1, i-matchedBlocks) = i;
                encodingResults(i, 6) = 0;
            end
        end
    end
    
    compressionResults{iterations} = encodingResults;
    encodingResults = zeros(5000, 6);
    
    if (iterations ~= 0)
        partition_no_search;  % Custom function for further partitioning
    end
end

% Calculate and display compression metrics
totalTime = etime(clock, timeStart) / 60;
disp(['Total compression time: ', num2str(totalTime), ' minutes']);

% Calculate memory usage and compression ratio
memoryUsage = (sum(encodingResults(:) ~= 0) * 12 + sum(encodingResults(:) == 0) * 13) / 8;
memoryUsageKB = memoryUsage / 1024;
bitsPerPixel = (memoryUsageKB / 256) * 8;
compressionRatio = 256 / memoryUsageKB;
disp(['Bits per pixel: ', num2str(bitsPerPixel)]);
disp(['Compression ratio: ', num2str(compressionRatio)]);

% Decode the compressed image
fractal_dct_decompress;  % Custom function for decoding

% Calculate and display PSNR
psnrValue = calculatePSNR(grayscaleImage, decodedImage);
disp(['PSNR: ', num2str(psnrValue), ' dB']);

% Custom function to calculate PSNR
function psnrValue = calculatePSNR(originalImage, compressedImage)
    errorSum = 0;
    for i = 1:numel(originalImage)
        errorSum = errorSum + (originalImage(i) - compressedImage(i))^2;
    end
    mse = errorSum / numel(originalImage);
    psnrValue = 10 * log10(255^2 / mse);
end
