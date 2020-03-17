clc 
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%% Change directory to images folder %%%%%%%%%%%%%%%%%%%%%%%%%%
    % badweather
%     cd  ('C:\dataset2014\dataset\badWeather\blizzard\input')
%     cd  ('C:\dataset2014\dataset\badWeather\skating\input')
%     cd  ('C:\dataset2014\dataset\badWeather\snowFall\input')
%     cd  ('C:\dataset2014\dataset\badWeather\wetSnow\input')
%   % baseline
      cd  ('C:\dataset2014\dataset\baseline\highway\input')
%     cd  ('C:\dataset2014\dataset\baseline\office\input')
%     cd  ('C:\dataset2014\dataset\baseline\pedestrians\input')
%     cd  ('C:\dataset2014\dataset\baseline\PETS2006\input')
    % cameraJitter
%     cd  ('C:\dataset2014\dataset\cameraJitter\badminton\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\boulevard\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\sidewalk\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\traffic\input')
    % dynamicBackground
%     cd  ('C:\dataset2014\dataset\dynamicBackground\boats\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\canoe\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fall\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fountain01\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fountain02\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\overpass\input')
    % intermittentObjectMotion
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\abandonedBox\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\parking\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\sofa\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\streetLight\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\tramstop\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\winterDriveway\input')
    % shadow
%     cd  ('C:\dataset2014\dataset\shadow\backdoor\input')
%     cd  ('C:\dataset2014\dataset\shadow\bungalows\input')
%     cd  ('C:\dataset2014\dataset\shadow\busStation\input')
%     cd  ('C:\dataset2014\dataset\shadow\copyMachine\input')
%     cd  ('C:\dataset2014\dataset\shadow\cubicle\input')
%     cd  ('C:\dataset2014\dataset\shadow\peopleInShade\input')
    % thermal
%     cd  ('C:\dataset2014\dataset\thermal\corridor\input')
%     cd  ('C:\dataset2014\dataset\thermal\diningRoom\input')
%     cd  ('C:\dataset2014\dataset\thermal\lakeSide\input')
%     cd  ('C:\dataset2014\dataset\thermal\library\input')
%     cd  ('C:\dataset2014\dataset\thermal\park\input')
   % lowFramerate
%    cd  ('C:\dataset2014\dataset\lowFramerate\port_0_17fps\input');
%    cd  ('C:\dataset2014\dataset\lowFramerate\tramCrossroad_1fps\input');
%    cd  ('C:\dataset2014\dataset\lowFramerate\tunnelExit_0_35fps\input');
%    cd  ('C:\dataset2014\dataset\lowFramerate\turnpike_0_5fps\input');
   % nightVideos
%    cd  ('C:\dataset2014\dataset\nightVideos\bridgeEntry\input');
%    cd  ('C:\dataset2014\dataset\nightVideos\busyBoulvard\input');
%    cd  ('C:\dataset2014\dataset\nightVideos\fluidHighway\input');
%    cd  ('C:\dataset2014\dataset\nightVideos\streetCornerAtNight\input');
%    cd  ('C:\dataset2014\dataset\nightVideos\tramStation\input');
%    cd  ('C:\dataset2014\dataset\nightVideos\winterStreet\input');
   % PTZ
%    cd  ('C:\dataset2014\dataset\PTZ\continuousPan\input');
%    cd  ('C:\dataset2014\dataset\PTZ\intermittentPan\input');
%    cd  ('C:\dataset2014\dataset\PTZ\twoPositionPTZCam\input');
%    cd  ('C:\dataset2014\dataset\PTZ\zoomInZoomOut\input');
   % turbulence
%    cd  ('C:\dataset2014\dataset\turbulence\turbulence0\input');
%    cd  ('C:\dataset2014\dataset\turbulence\turbulence1\input');
%    cd  ('C:\dataset2014\dataset\turbulence\turbulence2\input');
%    cd  ('C:\dataset2014\dataset\turbulence\turbulence3\input');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% lists all images in this directory
imageNames = dir((fullfile('*.jpg')));
% select Filename from the result of dir (imagesNames is structure)
imageNames = {imageNames.name}'; % imageNames is cell now
% returns the number of frames with jpeg extension in this folder
numFrames = length(imageNames)
% read the last frame
%lastFrame = imread(fullfile(imageNames{numFrames})); 
% show the last frame 
%figure(1)
%imshow(lastFrame);
% returns the width and height of frames in video and number of coor planes
[height,width,N]= size(imread(imageNames{1}))

% create avifile object to save results as video
% vidObj= VideoWriter('1deltafr with Th & cond.avi');
tic

% calculer l'image moyenne mub
mub=zeros(height,width);
for l = 1 :10: 280
    DD=double(rgb2gray(imread(['in', num2str(l, '%.6d'),'.jpg'])));  %I1=imread(['in', num2str(k, '%.6d'),'.jpg']);
    mub=mub+DD;
end
mub=mub/28;
%figure(1)
%imshow(uint8(mub));

mub = reshape(mub,width*height,1);
% etablire la matrice de varaince-covariance
% la taille de X (160*120*28*64)/(1024^2)=32.8125MB
% la taille de Cb est 32.8125^2=1.07GB
% de l'instruction memory i have 1.2GB
    % B = A(:); % one way B = reshape(A,100,1); % another way
   
    
    
    BB1(:,:)=double(rgb2gray(imread(['in', num2str(1, '%.6d'),'.jpg'])));
    BB2(:,:)=double(rgb2gray(imread(['in', num2str(10, '%.6d'),'.jpg'])));
    BB3(:,:)=double(rgb2gray(imread(['in', num2str(20, '%.6d'),'.jpg'])));
    BB4(:,:)=double(rgb2gray(imread(['in', num2str(30, '%.6d'),'.jpg'])));
    BB5(:,:)=double(rgb2gray(imread(['in', num2str(40, '%.6d'),'.jpg'])));
    BB6(:,:)=double(rgb2gray(imread(['in', num2str(50, '%.6d'),'.jpg'])));
    BB7(:,:)=double(rgb2gray(imread(['in', num2str(60, '%.6d'),'.jpg'])));
    BB8(:,:)=double(rgb2gray(imread(['in', num2str(70, '%.6d'),'.jpg'])));
    BB9(:,:)=double(rgb2gray(imread(['in', num2str(80, '%.6d'),'.jpg'])));
    BB10(:,:)=double(rgb2gray(imread(['in', num2str(90, '%.6d'),'.jpg'])));
    BB11(:,:)=double(rgb2gray(imread(['in', num2str(100, '%.6d'),'.jpg'])));
    BB12(:,:)=double(rgb2gray(imread(['in', num2str(110, '%.6d'),'.jpg'])));
    BB13(:,:)=double(rgb2gray(imread(['in', num2str(120, '%.6d'),'.jpg'])));
    BB14(:,:)=double(rgb2gray(imread(['in', num2str(130, '%.6d'),'.jpg'])));
    BB15(:,:)=double(rgb2gray(imread(['in', num2str(140, '%.6d'),'.jpg'])));
    BB16(:,:)=double(rgb2gray(imread(['in', num2str(150, '%.6d'),'.jpg'])));
    BB17(:,:)=double(rgb2gray(imread(['in', num2str(160, '%.6d'),'.jpg'])));
    BB18(:,:)=double(rgb2gray(imread(['in', num2str(170, '%.6d'),'.jpg'])));
    BB19(:,:)=double(rgb2gray(imread(['in', num2str(180, '%.6d'),'.jpg'])));
    BB20(:,:)=double(rgb2gray(imread(['in', num2str(190, '%.6d'),'.jpg'])));
    BB21(:,:)=double(rgb2gray(imread(['in', num2str(200, '%.6d'),'.jpg'])));
    BB22(:,:)=double(rgb2gray(imread(['in', num2str(210, '%.6d'),'.jpg'])));
    BB23(:,:)=double(rgb2gray(imread(['in', num2str(220, '%.6d'),'.jpg'])));
    BB24(:,:)=double(rgb2gray(imread(['in', num2str(230, '%.6d'),'.jpg'])));
    BB25(:,:)=double(rgb2gray(imread(['in', num2str(240, '%.6d'),'.jpg'])));
    BB26(:,:)=double(rgb2gray(imread(['in', num2str(250, '%.6d'),'.jpg'])));
    BB27(:,:)=double(rgb2gray(imread(['in', num2str(260, '%.6d'),'.jpg'])));
    BB28(:,:)=double(rgb2gray(imread(['in', num2str(270, '%.6d'),'.jpg'])));
    
    
    B1 = reshape(BB1,width*height,1);
    B2 = reshape(BB2,width*height,1);
    B3 = reshape(BB3,width*height,1);
    B4 = reshape(BB4,width*height,1);
    B5 = reshape(BB5,width*height,1);
    B6 = reshape(BB6,width*height,1);
    B7 = reshape(BB7,width*height,1);
    B8 = reshape(BB8,width*height,1);
    B9 = reshape(BB9,width*height,1);
    B10 = reshape(BB10,width*height,1);
    B11 = reshape(BB11,width*height,1);
    B12 = reshape(BB12,width*height,1);
    B13 = reshape(BB13,width*height,1);
    B14 = reshape(BB14,width*height,1);
    B15 = reshape(BB15,width*height,1);
    B16 = reshape(BB16,width*height,1);
    B17 = reshape(BB17,width*height,1);
    B18 = reshape(BB18,width*height,1);
    B19 = reshape(BB19,width*height,1);
    B20 = reshape(BB20,width*height,1);
    B21 = reshape(BB21,width*height,1);
    B22 = reshape(BB22,width*height,1);
    B23 = reshape(BB23,width*height,1);
    B24 = reshape(BB24,width*height,1);
    B25 = reshape(BB25,width*height,1);
    B26 = reshape(BB26,width*height,1);
    B27 = reshape(BB27,width*height,1);
    B28 = reshape(BB28,width*height,1);
    
    X=[B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28];
    
    % compute the eigenvectors of XX' (basis of X) by using eigen decomposition EVD :
    % we compute the covariance matrix then using eigs instruction in
    % Matlab. we compute the first eigenvectors that have the M largest
    % eigenvalues
    % we can compute the eigenvectors of cov(X') by computing the Singular
    % value decomposition where X= U Sigma V' and V are the eigenvectors
    % of cov(X)
     [U,S,V] = svds(X',3);
    %% 
for k = 280 : numFrames
    firstFrame=imread(['in', num2str(k, '%.6d'),'.jpg']);

    % Convert to grayscale
    I = rgb2gray(firstFrame);
    % convert to double
    I = double(I);
    
    % project the acquired image on the basis
    I = reshape(I,width*height,1);
    II=V'*(I-mub);
    
    % reproject the acquired image
    III=(V*II)+mub;
    RES = reshape(III,height,width);
    I = reshape(I,height,width);
    D=abs(I-RES);

    %thresholding
    %DF=D>45;
    D=D./255;
    T = graythresh(D);
    DF = im2bw(D,T);
    % show results
    %figure(k)
    %imshow(DF);
   
% set pathname where you will store results
    % badweather
%     pathname = 'C:\Results all\1delta frame\badWeather\blizzard\';
%     pathname = 'C:\Results all\1delta frame\badWeather\skating\';
%     pathname = 'C:\Results all\1delta frame\badWeather\snowFall\';
%     pathname = 'C:\Results all\1delta frame\badWeather\wetSnow\';
    % baseline 
%     pathname = 'C:\Results all\1delta frame\baseline\highway\';
%     pathname = 'C:\Results all\1delta frame\baseline\office\';
%     pathname = 'C:\Results all\1delta frame\baseline\pedestrians\';
%     pathname = 'C:\Results all\1delta frame\baseline\PETS2006\';
    % cameraJitter
%     pathname = 'C:\Results all\1delta frame\cameraJitter\badminton\';
%     pathname = 'C:\Results all\1delta frame\cameraJitter\boulevard\';
%     pathname = 'C:\Results all\1delta frame\cameraJitter\sidewalk\';
%     pathname = 'C:\Results all\1delta frame\cameraJitter\traffic\';
    % dynamicBackground
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\boats\';
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\canoe\';
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\fall\';
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\fountain01\';
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\fountain02\';
%     pathname = 'C:\Results all\1delta frame\dynamicBackground\overpass\';
    % intermittentObjectMotion
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\abandonedBox\';
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\parking\';
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\sofa\';
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\streetLight\';
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\tramstop\';
%     pathname = 'C:\Results all\1delta frame\intermittentObjectMotion\winterDriveway\';
    % shadow
%     pathname = 'C:\Results all\1delta frame\shadow\backdoor\';
%     pathname = 'C:\Results all\1delta frame\shadow\bungalows\';
%     pathname = 'C:\Results all\1delta frame\shadow\busStation\';
%     pathname = 'C:\Results all\1delta frame\shadow\copyMachine\';
%     pathname = 'C:\Results all\1delta frame\shadow\cubicle\';
%     pathname = 'C:\Results all\1delta frame\shadow\peopleInShade\';
    % thermal
%     pathname = 'C:\Results all\1delta frame\thermal\corridor\';
%     pathname = 'C:\Results all\1delta frame\thermal\diningRoom\';
%     pathname = 'C:\Results all\1delta frame\thermal\lakeSide\';
%     pathname = 'C:\Results all\1delta frame\thermal\library\';
%     pathname = 'C:\Results all\1delta frame\thermal\park\';
    % lowFramerate
%     pathname = 'C:\Results all\1delta frame\lowFramerate\port_0_17fps\';
%     pathname = 'C:\Results all\1delta frame\lowFramerate\tramCrossroad_1fps\';
%     pathname = 'C:\Results all\1delta frame\lowFramerate\tunnelExit_0_35fps\';
%     pathname = 'C:\Results all\1delta frame\lowFramerate\turnpike_0_5fps\';
    % nightVideos
%     pathname = 'C:\Results all\1delta frame\nightVideos\bridgeEntry\';
%     pathname = 'C:\Results all\1delta frame\nightVideos\busyBoulvard\';
%     pathname = 'C:\Results all\1delta frame\nightVideos\fluidHighway\';
%     pathname = 'C:\Results all\1delta frame\nightVideos\streetCornerAtNight\';
%     pathname = 'C:\Results all\1delta frame\nightVideos\tramStation\';
%     pathname = 'C:\Results all\1delta frame\nightVideos\winterStreet\';
   % PTZ
%     pathname = 'C:\Results all\1delta frame\PTZ\continuousPan\';
%     pathname = 'C:\Results all\1delta frame\PTZ\intermittentPan\';
%     pathname = 'C:\Results all\1delta frame\PTZ\twoPositionPTZCam\';
%     pathname = 'C:\Results all\1delta frame\PTZ\zoomInZoomOut\';
   % turbulence
%     pathname = 'C:\Results all\1delta frame\turbulence\turbulence0\';
%     pathname = 'C:\Results all\1delta frame\turbulence\turbulence1\';
%     pathname = 'C:\Results all\1delta frame\turbulence\turbulence2\';
%     pathname = 'C:\Results all\1delta frame\turbulence\turbulence3\';

   pathname = 'C:\Results all\Teste\';
   imwrite(DF,[pathname,['bin', num2str(k, '%.6d'),'.png']]);
    %hold on
   %open(vidObj);
   % Add next frame to movie
   %newFrameOut= getframe;
   %writeVideo(vidObj,newFrameOut);
end
%close(vidObj);
Framepersecond= (numFrames/toc)