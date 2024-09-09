% Fractal Image Decompression using DCT

% Initialize variables for decompression
decodedImage = zeros(size(grayscaleImage));
blockIndex = 0;

% Reconstruct the image from compressed data
for row = 1:numBlocks
    for col = 1:numBlocks
        blockIndex = blockIndex + 1;
        dctBlock = blockStorage{blockIndex};
        quantizedBlock = dctBlock .* normMat;
        currentBlock = idct2(quantizedBlock) + 128;
        decodedImage(rangeBlockSize*(row-1)+1:rangeBlockSize*row, rangeBlockSize*(col-1)+1:rangeBlockSize*col) = currentBlock;
    end
end

% Display the decoded image
imshow(decodedImage / 256);
