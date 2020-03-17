
%tic
clear all
close all
clc
% constructs a multimedia reader object

    % badweather
%     cd  ('C:\dataset2014\dataset\badWeather\blizzard\input')
%     cd  ('C:\dataset2014\dataset\badWeather\skating\input')
%     cd  ('C:\dataset2014\dataset\badWeather\snowFall\input')
%     cd  ('C:\dataset2014\dataset\badWeather\wetSnow\input')
%     % baseline
%     cd  ('C:\dataset2014\dataset\baseline\highway\input')
%     cd  ('C:\dataset2014\dataset\baseline\office\input')
%     cd  ('C:\dataset2014\dataset\baseline\pedestrians\input')
     cd  ('C:\dataset2014\dataset\baseline\PETS2006\input')
%     % cameraJitter
%     cd  ('C:\dataset2014\dataset\cameraJitter\badminton\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\boulevard\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\sidewalk\input')
%     cd  ('C:\dataset2014\dataset\cameraJitter\traffic\input')
%     % dynamicBackground
%     cd  ('C:\dataset2014\dataset\dynamicBackground\boats\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\canoe\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fall\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fountain01\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\fountain02\input')
%     cd  ('C:\dataset2014\dataset\dynamicBackground\overpass\input')
%     % intermittentObjectMotion
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\abandonedBox\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\parking\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\sofa\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\streetLight\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\tramstop\input')
%     cd  ('C:\dataset2014\dataset\intermittentObjectMotion\winterDriveway\input')
%     % shadow
%     cd  ('C:\dataset2014\dataset\shadow\backdoor\input')
%     cd  ('C:\dataset2014\dataset\shadow\bungalows\input')
%     cd  ('C:\dataset2014\dataset\shadow\busStation\input')
%     cd  ('C:\dataset2014\dataset\shadow\copyMachine\input')
%     cd  ('C:\dataset2014\dataset\shadow\cubicle\input')
%     cd  ('C:\dataset2014\dataset\shadow\peopleInShade\input')
%     % thermal
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
%     
%     % badweather
%    a = VideoReader('blizzard.avi');
%     a = VideoReader('skating.avi');
%     a = VideoReader('snowFall.avi');
%     a = VideoReader('wetSnow.avi');
%     % baseline
%     a = VideoReader('highway.avi');
%     a = VideoReader('office.avi');
%     a = VideoReader('pedestrians.avi');
     a = VideoReader('Pets2006.avi');
%     % cameraJitter
%     a = VideoReader('badminton.avi');
%     a = VideoReader('boulevard.avi');
%     a = VideoReader('sidewalk.avi');
%     a = VideoReader('traffic.avi');
%     % dynamicBackground
%     a = VideoReader('boats.avi');
%     a = VideoReader('canoe.avi');
%     a = VideoReader('fall.avi');
%     a = VideoReader('fountain01.avi');
%     a = VideoReader('fountain02.avi');
%     a = VideoReader('overpass.avi');
%     % intermittentObjectMotion
%     a = VideoReader('abandonedBox.avi');
%     a = VideoReader('parking.avi');
%     a = VideoReader('sofa.avi');
%     a = VideoReader('streetLight.avi');
%     a = VideoReader('tramstop.avi');
%     a = VideoReader('winterDriveway.avi');
%     % shadow
%     a = VideoReader('backdoor.avi');
%     a = VideoReader('bungalows.avi');
%     a = VideoReader('busStation.avi');
%     a = VideoReader('copyMachine.avi');
%     a = VideoReader('cubicle.avi');
%     a = VideoReader('peopleInShade.avi');
%     % thermal
%     a = VideoReader('corridor.avi');
%     a = VideoReader('diningRoom.avi');
%     a = VideoReader('lakeSide.avi');
%     a = VideoReader('library.avi');
%     a = VideoReader('park.avi');


% lowFramerate
%     a = VideoReader('port_0_17fps.avi');
%     a = VideoReader('tramCrossroad_1fps.avi');
%     a = VideoReader('tunnelExit_0_35fps.avi');
%     a = VideoReader('turnpike_0_5fps.avi');

% nightVideos
%     a = VideoReader('bridgeEntry.avi');
%     a = VideoReader('busyBoulvard.avi');
%     a = VideoReader('fluidHighway.avi');
%     a = VideoReader('streetCornerAtNight.avi');
%     a = VideoReader('tramStation.avi');
%     a = VideoReader('winterStreet.avi');

% PTZ
%     a = VideoReader('continuousPan.avi');
%     a = VideoReader('intermittentPan.avi');
%     a = VideoReader('twoPositionPTZCam.avi');
%     a = VideoReader('zoomInZoomOut.avi');
% turbulence
%     a = VideoReader('turbulence0.avi');
%     a = VideoReader('turbulence1.avi');
%     a = VideoReader('turbulence2.avi');
%     a = VideoReader('turbulence3.avi');

%mplay('Pets2006.avi');

% read the last frame
%lastFrame = read(a, inf); 

% show the last frame 
%figure(1)
%imshow(lastFrame); 

% returns the number of frames from the multimedia reader object
numFrames = a.NumberOfFrames

% returns the width and height of frames in video
width= a.Width
height= a.Height

% reads only the specified frames from xxx to yyy
%B = read(a,[310 610]); % cam3 empty untill 230, normal mvt 310-370, fall 370-450 lack of mvt 450-610
B = read(a,[1 numFrames]); % chute 5 cam3 empty untill 230, normal mvt 230-310, fall 310-380 lack of mvt 380-405

% % show the last frame in "A" that correspond to the 40th frame in "a"
% figure(2)
% imshow(A(:,:,:,510));

% create avifile
%vidObj= VideoWriter('14eigbg2.avi'); 
tic
% calculer l'image moyenne mub
mub=zeros(height,width);
for l = 1 :10: 280
    DD=double(rgb2gray(imread(['in', num2str(l, '%.6d'),'.jpg'])));  %I1=imread(['in', num2str(k, '%.6d'),'.jpg']);
    mub=mub+DD;
end
    mub=mub/28;
    mub = reshape(mub,width*height,1);
% etablire la matrice de varaince-covariance
% la taille de X (160*120*28*64)/(1024^2)=32.8125MB
% la taille de Cb est 32.8125^2=1.07GB
% de l'instruction memory i have 1.2GB
    % B = A(:); % one way B = reshape(A,100,1); % another way
   
    
    
    BB1(:,:)=double(rgb2gray(B(:,:,:,1)));
    BB2(:,:)=double(rgb2gray(B(:,:,:,10)));
    BB3(:,:)=double(rgb2gray(B(:,:,:,20)));
    BB4(:,:)=double(rgb2gray(B(:,:,:,30)));
    BB5(:,:)=double(rgb2gray(B(:,:,:,40)));
    BB6(:,:)=double(rgb2gray(B(:,:,:,50)));
    BB7(:,:)=double(rgb2gray(B(:,:,:,60)));
    BB8(:,:)=double(rgb2gray(B(:,:,:,70)));
    BB9(:,:)=double(rgb2gray(B(:,:,:,80)));
    BB10(:,:)=double(rgb2gray(B(:,:,:,90)));
    BB11(:,:)=double(rgb2gray(B(:,:,:,100)));
    BB12(:,:)=double(rgb2gray(B(:,:,:,110)));
    BB13(:,:)=double(rgb2gray(B(:,:,:,120)));
    BB14(:,:)=double(rgb2gray(B(:,:,:,130)));
    BB15(:,:)=double(rgb2gray(B(:,:,:,140)));
    BB16(:,:)=double(rgb2gray(B(:,:,:,150)));
    BB17(:,:)=double(rgb2gray(B(:,:,:,160)));
    BB18(:,:)=double(rgb2gray(B(:,:,:,170)));
    BB19(:,:)=double(rgb2gray(B(:,:,:,180)));
    BB20(:,:)=double(rgb2gray(B(:,:,:,190)));
    BB21(:,:)=double(rgb2gray(B(:,:,:,200)));
    BB22(:,:)=double(rgb2gray(B(:,:,:,210)));
    BB23(:,:)=double(rgb2gray(B(:,:,:,220)));
    BB24(:,:)=double(rgb2gray(B(:,:,:,230)));
    BB25(:,:)=double(rgb2gray(B(:,:,:,240)));
    BB26(:,:)=double(rgb2gray(B(:,:,:,250)));
    BB27(:,:)=double(rgb2gray(B(:,:,:,260)));
    BB28(:,:)=double(rgb2gray(B(:,:,:,270)));

%     BB1(:,:)=single(rgb2gray(B(:,:,:,1)));
%     BB2(:,:)=single(rgb2gray(B(:,:,:,10)));
%     BB3(:,:)=single(rgb2gray(B(:,:,:,20)));
%     BB4(:,:)=single(rgb2gray(B(:,:,:,30)));
%     BB5(:,:)=single(rgb2gray(B(:,:,:,40)));
%     BB6(:,:)=single(rgb2gray(B(:,:,:,50)));
%     BB7(:,:)=single(rgb2gray(B(:,:,:,60)));
%     BB8(:,:)=single(rgb2gray(B(:,:,:,70)));
%     BB9(:,:)=single(rgb2gray(B(:,:,:,80)));
%     BB10(:,:)=single(rgb2gray(B(:,:,:,90)));
%     BB11(:,:)=single(rgb2gray(B(:,:,:,100)));
%     BB12(:,:)=single(rgb2gray(B(:,:,:,110)));
%     BB13(:,:)=single(rgb2gray(B(:,:,:,120)));
%     BB14(:,:)=single(rgb2gray(B(:,:,:,130)));
%     BB15(:,:)=single(rgb2gray(B(:,:,:,140)));
%     BB16(:,:)=single(rgb2gray(B(:,:,:,150)));
%     BB17(:,:)=single(rgb2gray(B(:,:,:,160)));
%     BB18(:,:)=single(rgb2gray(B(:,:,:,170)));
%     BB19(:,:)=single(rgb2gray(B(:,:,:,180)));
%     BB20(:,:)=single(rgb2gray(B(:,:,:,190)));
%     BB21(:,:)=single(rgb2gray(B(:,:,:,200)));
%     BB22(:,:)=single(rgb2gray(B(:,:,:,210)));
%     BB23(:,:)=single(rgb2gray(B(:,:,:,220)));
%     BB24(:,:)=single(rgb2gray(B(:,:,:,230)));
%     BB25(:,:)=single(rgb2gray(B(:,:,:,240)));
%     BB26(:,:)=single(rgb2gray(B(:,:,:,250)));
%     BB27(:,:)=single(rgb2gray(B(:,:,:,260)));
%     BB28(:,:)=single(rgb2gray(B(:,:,:,270)));
    
    
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
    % Matlab we compute the first eigenvectors that have the M largest
    % eigenvalues
    
     %Cb=cov(X');
     %[V,D]=eigs(Cb,3);
     
     % we can compute the eigenvectors of cov(X') by computing the Singular
     % value decomposition where X= U Sigma V' and V are the eigenvectors
     % of cov(X)
     
     [U,S,V] = svds(X',3);
    %% 
for k = 280 : numFrames
    firstFrame = B(:,:,:,k);
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
    
    %filtrage morphologique 
     se = strel('square',2);
     D1=imopen(D,se);
     D=imclose(D1,se);
     
    D=D./255;
    T = graythresh(D);
     if T<0.05
        T=0.10;
     end
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
toc