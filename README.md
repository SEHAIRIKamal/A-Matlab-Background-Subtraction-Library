# K.Sehairi_UATL_BGS_library

A Matlab Background Subtraction Library

![Release](https://img.shields.io/badge/Release-1.0.0-red.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg) ![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg) ![Algorithms](https://img.shields.io/badge/Algorithms-29-black.svg)

Last page update 17-03-2020

The K.Sehairi_UATL_BGS_library is Background subtraction Library developed by Dr. Sehairi Kamal in 2015. 
It contains more than 30 background subtraction algorithms implemented using Matlab. 
The library is tested on Matlab 2015 and higher.
The algorithms are written from scratch. All scripts are not vectorized and are not fully optimized.
All implementations are well commented and are written in simple manner to be easily understood.

## List of methods

### Basic

  1. Frame difference
  2. Euclidean distance
  3. Chebyshev distance 
  4. Manhattan distance 
  5. Three Frame difference
  6. Three Frame difference using Euclidean distance (RGB images/Video)
  7. Three Frame difference using Chebyshev distance (RGB images/Video)
  8. Three Frame difference using Manhattan distance (RGB images/Video)
  9. Running Average filter (Adaptive Background subtraction)
  10. Running Average filter using Euclidean distance (RGB images/Video)
  11. Selective Running Average Filter
  12. Selective Running Average Filter using Euclidean distance (RGB images/Video)
  13. Forgetting Morphological Temporal Gradient
  14. ΣΔ Background Estimation
  15. ΣΔ Background Estimation with classical geodesic reconstruction
  16. ΣΔ Background Estimation with Hybrid geodesic reconstruction

### Fuzzy

  17. Fuzzy Running Average filter

### Statistical

  18. Markov Random Field-Based Motion Detection Algorithm

### Gaussian

  19. Running Gaussian Average (One Gaussian)

  20. Running Gaussian Average (One Gaussian) applied on RGB

  21. Gaussian Mixture Model (GMM)

### Entropy

  22. Spatio-Temporal Entropy Image

  23. Spatio-Temporal Entropy Image applied on RGB images with Gaussian and Morphological filter

  24. Spatio-Temporal Entropy Image applied on HSV images with Gaussian and Morphological filter (all images are converted to HSV color space)

  25. Difference-Based Spatio-Temporal Entropy Image

### subspace learning using principle component learning (SL-PCA)

  26. Eigen-Background Subtraction

### Neural networks

  27. Simplified Self-Organized Background Subtraction on HSV images (all images are converted to HSV color space)

  28. Simplified Self-Organized Background Subtraction on RGB images


## How to use

The original script files are applied on CDNet 2014 dataset http://changedetection.net/ , but you can use any dataset or your own video/images for these methods. 

For that, you have to:

1. Change the path to the folder where the images are stored

   `cd  ('C:\dataset2014\dataset\badWeather\blizzard\input')` to `cd  ('path to folder where the images are stored ')`

2. Change the 'imread' instructions to correctly read the image files in your folder

   `imread(['in', num2str(k, '%.6d'),'.jpg']);` depending on how the images are named in this folder, the images in CDnet dataset are named as : in000001.jpg, in000002.jpg …
	
3. Change the folder where you want to store the results / 

   `pathname = 'C:\Results all\Teste\';` to `pathname = 'the path you want';`
	
4. Change the name of the image results 

   `imwrite(fg,[pathname,['bin', num2str(k, '%.6d'),'.png']]);`	

5. you can store the results in video file. To do that uncomment these lines in the script
```
	vidObj= VideoWriter('nameofyourvideoOutput.avi');
	figure(k)
	imshow(fg);
	hold on
	open(vidObj);
	newFrameOut= getframe;
	writeVideo(vidObj,newFrameOut);
	close(vidObj);

```
	
### Note: if you have video files you can run the codes in _'IfURUsingVideoFiles'_

## Citation

If you use this library, please cite it as:

K. Sehairi, F. Chouireb, and J. Meunier, "Comparative study of motion 
detection methods for video surveillance systems," Journal of Electronic 
Imaging, vol. 26, p. 023025, 2017. doi: 10.1117/1.JEI.26.2.023025.

```
@article{sehairi2017comparative,
  title={Comparative study of motion detection methods for video surveillance systems},
  author={Sehairi, Kamal and Chouireb, Fatima and Meunier, Jean},
  journal={Journal of Electronic Imaging},
  volume={26},
  number={2},;
  pages={023025},
  year={2017},
  publisher={International Society for Optics and Photonics}
}
```

## Download PDF
https://arxiv.org/pdf/1804.05459
https://www.spiedigitallibrary.org/journals/Journal-of-Electronic-Imaging/volume-26/issue-2/023025/Comparative-study-of-motion-detection-methods-for-video-surveillance-systems/10.1117/1.JEI.26.2.023025.short?SSO=1
