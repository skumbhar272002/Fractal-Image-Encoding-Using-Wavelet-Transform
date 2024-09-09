% Apply Discrete Cosine Transform
function dctBlock = dct_transform(imageBlock)
    dctBlock = dct2(imageBlock - 128);
end
