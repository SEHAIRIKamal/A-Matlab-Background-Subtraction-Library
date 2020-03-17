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

Q=100;
Th=20;
for k = 5 : numFrames

    Frame=imread(['in', num2str(k, '%.6d'),'.jpg']);
    secondFrame=imread(['in', num2str(k-1, '%.6d'),'.jpg']);
    thirdFrame=imread(['in', num2str(k-2, '%.6d'),'.jpg']);
    fourthFrame=imread(['in', num2str(k-3, '%.6d'),'.jpg']);
    fifthFrame=imread(['in', num2str(k-4, '%.6d'),'.jpg']);    

    % Convert to grayscale
    P1 = rgb2gray(Frame);
    P1=double(P1);
    
    P2 = rgb2gray(secondFrame);
    P2=double(P2);
    
    P3 = rgb2gray(thirdFrame);
    P3=double(P3);
    
    P4 = rgb2gray(fourthFrame);
    P4=double(P4);
    
    P5 = rgb2gray(fifthFrame);
    P5=double(P5);
    
    % difference image
    II1=abs(P2-P1);
    %II1=uint8(II1);
    [c,l]= size(P1);
    
    %I01=II1>Th;
    for i=1:c
        for j=1:l
            if II1(i,j)>=Th
                I01(i,j)=II1(i,j);
            else
                I01(i,j)=0;
            end
        end
    end
    
    II2=abs(P3-P2);
    %II2=uint8(II2);
    for i=1:c
        for j=1:l
            if II2(i,j)>=Th
                I02(i,j)=II2(i,j);
            else
                I02(i,j)=0;
            end
        end
    end
    
    
    II3=abs(P3-P2);
    %II3=uint8(II3);
    for i=1:c
        for j=1:l
            if II3(i,j)>=Th
                I03(i,j)=II3(i,j);
            else
                I03(i,j)=0;
            end
        end
    end
    
    II4=abs(P4-P3);
    %II4=uint8(II4);
    for i=1:c
        for j=1:l
            if II4(i,j)>=Th
                I04(i,j)=II4(i,j);
            else
                I04(i,j)=0;
            end
        end
    end
    
    
    II5=abs(P5-P4);
    %II5=uint8(II5);
    for i=1:c
        for j=1:l
            if II5(i,j)>=Th
                I05(i,j)=II5(i,j);
            else
                I05(i,j)=0;
            end
        end
    end
    
        
        % pad the original input images 
        I1=padarray(I01,[1 1],'replicate','both');
        I2=padarray(I02,[1 1],'replicate','both');
        I3=padarray(I03,[1 1],'replicate','both');
        I4=padarray(I04,[1 1],'replicate','both');
        I5=padarray(I05,[1 1],'replicate','both');
    
%     % Create the gaussian filter with hsize = [5 5] and sigma = 2
%     G = fspecial('gaussian',[25 25],2);
%     % Filter it
%     I1 = imfilter(I1,G,'same');
%     I2 = imfilter(I2,G,'same');
%     I3 = imfilter(I3,G,'same');
%     I4 = imfilter(I4,G,'same');
%     I5 = imfilter(I5,G,'same');
    
    w=3;
    L=5;
    [n,m]=size(I1);
    for i=3:n-2
        for j=3:m-2
            Y(i,j,:)=[I1(i-1,j-1);I1(i-1,j);I1(i-1,j+1);I1(i,j-1);I1(i,j);I1(i,j+1);I1(i+1,j-1);I1(i+1,j);I1(i+1,j+1);...
                I2(i-1,j-1);I2(i-1,j);I2(i-1,j+1);I1(i,j-1);I2(i,j);I2(i,j+1);I2(i+1,j-1);I2(i+1,j);I2(i+1,j+1);...
                I3(i-1,j-1);I3(i-1,j);I3(i-1,j+1);I3(i,j-1);I3(i,j);I3(i,j+1);I3(i+1,j-1);I3(i+1,j);I3(i+1,j+1);...
                 I4(i-1,j-1);I4(i-1,j);I4(i-1,j+1);I4(i,j-1);I4(i,j);I4(i,j+1);I4(i+1,j-1);I4(i+1,j);I4(i+1,j+1);...
                 I5(i-1,j-1);I5(i-1,j);I5(i-1,j+1);I5(i,j-1);I5(i,j);I5(i,j+1);I5(i+1,j-1);I5(i+1,j);I5(i+1,j+1)];
            

        end
    end

    
        for i=3:n-2
        for j=3:m-2
                hst(i,j,:)=hist(reshape(Y(i,j,1:45),1,45),1:Q);
                hst(i,j,:)= hst(i,j,:)./(w*w*L);   
        end
        end
        
        % exemple pour comprendre hst(y,1:20) au lieu de hst(y,1:255)
%         x = -4:0.1:4;
%         y = randn(10000,1);
%         figure(100)
%         hist(y,x);
%         figure(101)
%         hist(y,-8:-4);
        
                
       for i=3:n-2
        for j=3:m-2
         ent(i,j)=0;
            for z=1:Q
                        if hst(i,j,z)~=0
                        ent(i,j)=ent(i,j)+(-(hst(i,j,z)).*log(hst(i,j,z)));
                        end
            end
        end
       end
    
    %remove all object containing fewer than 50 pixels
    %ent= bwareaopen(ent,150);
    
    
     % normalization
     if max(max(ent))~=0
       coef=255/max(max(ent));
       ent=ent.*coef;
     end
      
    % Create the gaussian filter with hsize = [5 5] and sigma = 2
    %G = fspecial('gaussian',[5 5],2);
    % Filter it
    %entfilter = imfilter(ent,G,'same');
    % threshold    
    T = graythresh(ent);
    entth = im2bw(uint8(ent),T);
    %show results
    %figure(k)
    %imshow(entth);
    
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
   imwrite(entth,[pathname,['bin', num2str(k, '%.6d'),'.png']]);
   %hold on
   %open(vidObj);
   % Add next frame to movie
   %newFrameOut= getframe;
   %writeVideo(vidObj,newFrameOut);

end
%close(vidObj);
toc
Framepersecond= (numFrames/toc)