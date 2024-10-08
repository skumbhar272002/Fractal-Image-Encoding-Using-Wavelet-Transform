# Fractal-Image-Encoding-Using-Wavelet-Transform

This repository provides a MATLAB-based implementation of fractal image compression enhanced with the Discrete Cosine Transform (DCT). The project focuses on compressing images efficiently by leveraging both fractal methods and DCT, optimizing the compression ratio, PSNR, and memory usage. It includes scripts for encoding, decoding, and image processing utility functions, all designed for ease of use and reproducibility.

## Project Overview

Fractal image compression is a technique that uses self-similarity within an image to achieve high compression ratios. This project integrates DCT into the fractal compression process to enhance efficiency and performance, particularly for 256x256 images. The method achieves a compression ratio of 10:1, with a decoding time of 5 seconds, and a Peak Signal-to-Noise Ratio (PSNR) of 32 dB, while also reducing memory usage by 40%.

## Comparative Performance Metrics
Below are the comparative performance metrics for 256x256 images using various fractal compression techniques:

![Comparative Metrics](https://github.com/skumbhar272002/Fractal-Image-Encoding-Using-Wavelet-Transform/blob/7ee9747ef02544b55e549577d803dcdd641560f3/Comparative%20Performance%20Metrics.png)

**Table 1**. Comparative Performance Metrics of Fractal Image Compression Methods for 256x256 Images in MATLAB.

## Compression Techniques Comparison
The following table compares different compression techniques applied to the Lena image with thresholds of 0.5 and 0.1:

![Compression Comparison](https://github.com/skumbhar272002/Fractal-Image-Encoding-Using-Wavelet-Transform/blob/7ee9747ef02544b55e549577d803dcdd641560f3/Compression%20Techniques%20Comparison.png)

**Table 2**. Comparing the compression using different techniques on the Lena image for thresholds = 0.5 and 0.1.


The repository includes:

- Scripts for encoding and decoding images.
- Utility functions for image transformation and partitioning.
- Example scripts demonstrating the usage of the compression and decompression methods.
- A sample image for testing the algorithm.

### Key Features

- **DCT-based Fractal Compression:** Combines fractal compression with DCT to achieve superior results.
- **Efficient Partitioning:** Uses domain transformations and non-search-based partitioning to speed up the process.
- **Quantization with Normalization Matrices:** Includes tools for DCT quantization and error thresholding.
- **Comparative Study:** Provides insights into time complexity, compression ratio, PSNR, and memory usage.

## Prerequisites

Before running the scripts, ensure you have the following software:

- **MATLAB** (R2021a or later)
- Basic knowledge of image processing and MATLAB scripting.

## Setup and Installation

To set up the project on your local machine, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/fractal-dct-combined-compression.git
   cd fractal-dct-combined-compression
   ```

2. **Open MATLAB:**
   Launch MATLAB and navigate to the project directory.

3. **Run the example scripts:**  
   You can run the compression and decompression example scripts provided in the `examples/` folder:
   - `examples/compression_example.m`: Script for compressing an image.
   - `examples/decompression_example.m`: Script for decompressing an image.

## Usage

To compress an image:

1. Open `examples/compression_example.m`.
2. Run the script to compress the sample image (`data/bridge.pgm`).

To decompress an image:

1. Open `examples/decompression_example.m`.
2. Run the script to decompress the previously compressed image.

## Repository Structure

```bash
FractalImageCompression/
├── README.md            # Project overview and documentation
├── LICENSE              # License information
├── src/                 # Source code for compression and decompression
│   ├── fractal_dct_compress.m     # Main compression function
│   ├── fractal_dct_decompress.m   # Main decompression function
│   ├── distortion_calculation.m   # Distortion calculation function
│   ├── mean_domain_calculation.m  # Mean domain calculation
│   ├── partition_no_search.m      # Partitioning without search
│   └── utils/                     # Utility functions
│       ├── dct_transform.m        # DCT transformation function
│       ├── idct_transform.m       # Inverse DCT transformation function
│       └── normalization_matrix.m # Normalization matrix for quantization
├── data/
│   └── bridge.pgm        # Sample image for testing
└── examples/
    ├── compression_example.m    # Example script for image compression
    └── decompression_example.m  # Example script for image decompression
```

### Key Functions and Variables

- **Normalization Matrices (`normar1`)**: Matrices used for DCT quantization.
- **Image Processing Parameters**: 
  - `T1, T`: Input images.
  - `numrange, numdom`: Range and domain block sizes.
  - `dct2, idct2`: DCT and inverse DCT functions.
- **Compression Parameters**:
  - `ss, quan, errr`: Scaling, quantization, and error thresholding.
  - `ym, hk, DDF, fdel`: Parameters for managing the state of compression.

## License

This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to all contributors and the open-source community for their support and valuable insights that made this project possible.

