% Partitioning of Image Blocks without Search
newRangeBlockSize = rangeBlockSize / 2;
newDomainBlockSize = domainBlockSize / 2;

numLevels = numLevels + 1;
if numLevels == 2
    normMat = normMat(1:8, 1:8);
    errorThreshold = 6.5;
elseif numLevels == 3
    normMat = 0.5 * normMat(1:4, 1:4);
    errorThreshold = 6.2;
else
    normMat = 0.25 * normMat(1:2, 1:2);
    errorThreshold = inf;
end

for i = 1:totalBlocks
    rangeBlock = blockStorage{i};
    for j = 1:4
        newBlock{j} = rangeBlock((j-1)*newRangeBlockSize+1:j*newRangeBlockSize, :);
    end
    blockStorage = [blockStorage newBlock];
end

totalBlocks = length(blockStorage);
