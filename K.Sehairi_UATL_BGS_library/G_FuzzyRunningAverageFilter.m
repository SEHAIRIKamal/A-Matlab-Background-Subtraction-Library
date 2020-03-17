
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

% read the empty scene frame (the empty scen is considered as the first
% image (you can take the median of N images)
    %Background = imread(['in', num2str(1, '%.6d'),'.jpg']);
    % Convert to grayscale
    %Background = rgb2gray(Background);
    % convert to double
    %Background=double(Background);

    
% construct the initial background model by median

    BB1=double(rgb2gray(imread(['in', num2str(1, '%.6d'),'.jpg'])));
    BB2=double(rgb2gray(imread(['in', num2str(10, '%.6d'),'.jpg'])));
    BB3=double(rgb2gray(imread(['in', num2str(20, '%.6d'),'.jpg'])));
    BB4=double(rgb2gray(imread(['in', num2str(30, '%.6d'),'.jpg'])));
    BB5=double(rgb2gray(imread(['in', num2str(40, '%.6d'),'.jpg'])));
    BB6=double(rgb2gray(imread(['in', num2str(50, '%.6d'),'.jpg'])));
    BB7=double(rgb2gray(imread(['in', num2str(60, '%.6d'),'.jpg'])));
    BB8=double(rgb2gray(imread(['in', num2str(70, '%.6d'),'.jpg'])));
    BB9=double(rgb2gray(imread(['in', num2str(80, '%.6d'),'.jpg'])));
    BB10=double(rgb2gray(imread(['in', num2str(90, '%.6d'),'.jpg'])));
    
    
    B1(:,1) = reshape(BB1,1,width*height);
    B2(:,1) = reshape(BB2,1,width*height);
    B3(:,1) = reshape(BB3,1,width*height);
    B4(:,1) = reshape(BB4,1,width*height);
    B5(:,1) = reshape(BB5,1,width*height);
    B6(:,1) = reshape(BB6,1,width*height);
    B7(:,1) = reshape(BB7,1,width*height);
    B8(:,1) = reshape(BB8,1,width*height);
    B9(:,1) = reshape(BB9,1,width*height);
    B10(:,1) = reshape(BB10,1,width*height);
    
    BB=[B1 B2 B3 B4 B5 B6 B7 B8 B9 B10]';
    BG=median(BB);
    Background = reshape(BG,height,width);
    %imshow(uint8(Background));
    FBGS=Background;
    
    
alpha_min=0.1;
alpha_min=alpha_min*ones(height,width);

Ths=30;
Thfs=0.99;
Thu=20;
for k = 2 : numFrames
    
    % read the next frame
    Frame=imread(['in', num2str(k, '%.6d'),'.jpg']);
    %Frame = A(:,:,:,k);
    % Convert to grayscale
    I = rgb2gray(Frame);
    % convert to double
    I=double(I);
    
    Iprev=imread(['in', num2str(k-1, '%.6d'),'.jpg']);
    Iprev=rgb2gray(Iprev);
    Iprev=double(Iprev);
    
%  Fuzzy running average   	 Change background slightly at each frame
     for i=1: height
        for j=1: width
            alpha(i,j)=1-(1-alpha_min(i,j))*exp(-5*FBGS(i,j));
            if (abs(I(i,j)-Background(i,j)))<Thu 
                Background(i,j) = (alpha(i,j) *Background(i,j)) +((1-alpha(i,j))*  Iprev(i,j));
            else
                Background(i,j)=Background(i,j);
            end
        end
     end
		
    % compute the fuzzy background subtraction     
    for i=1: height
        for j=1: width
            if (abs(I(i,j)-Background(i,j)))>Ths
                FBGS(i,j)=1;
            else
                FBGS(i,j)=(abs(I(i,j)-Background(i,j)))/Ths;
            end
        end
    end
    
    %LPFFBGS=conv2(FBGS,1/9.*ones(3,3),'same');
    LPFFBGS = medfilt2(FBGS);
     for i=1: height
        for j=1: width
            if abs(LPFFBGS(i,j))>Thfs
                BGS(i,j)=1;
            else
                BGS(i,j)=0;
            end
        end
     end
    

     
%      for i=1: height
%         for j=1: width   
%          Background(i,j) = (alpha(i,j) * Iprev(i,j)) +((1-alpha(i,j))* Background(i,j));   
%         end
%      end
     
%    %filtrage morphologique 
%      se = strel('square',2);
%      K=imopen(S,se);
%      S=imclose(K,se);
     
    % Threshold
%     D=S>15;
%     for i=1:height 
%         for j=1:width 
%              if S(i,j)>15
%                  D(i,j)=1;
%              else
%                  D(i,j)=0;
%              end
%         end
%     end
    
%     %Otsu's threshold
%     S=S./255;
%     level = graythresh(S);
%     if level<0.05
%         level=0.10;
%     end
%     D = im2bw(S,level);
    

    
    % show results
    %figure(k+2)
    %imshow(D);
    % badweather
    
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

    imwrite(BGS,[pathname,['bin', num2str(k, '%.6d'),'.png']]);
    %hold on
    %open(vidObj);
    % Add next frame to movie
    %newFrameOut= getframe;
    %writeVideo(vidObj,newFrameOut);
end
%close(vidObj);
toc