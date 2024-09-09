% Apply Inverse Discrete Cosine Transform
function idctBlock = idct_transform(dctBlock)
    idctBlock = idct2(dctBlock) + 128;
end
