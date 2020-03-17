% fitting one Gaussian to each color plan
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

    alpha= 0.01; % learning rate
    var_init=400; % initial variance sd=20
% Initialize gaussian component means, standard deviation and weights
    for i=1:height
        for j=1:width
            for c=1:3
                mean(i,j,c) = rand*255;             % means random (0-255) 255=pixel range
                var(i,j,c) = var_init;                % initialize variance
            end
        end
    end
    
for z=1:numFrames
    
   % read the current frame
    X_t=imread(['in', num2str(z, '%.6d'),'.jpg']);
    % Convert to grayscale
    X_t=double(X_t);
    
      % calculate difference of pixel values from mean  
    for i=1:height
        for j=1:width
            for c=1:3
                    mean(i,j,c)=alpha*X_t(i,j,c)+(1-alpha)*mean(i,j,c);
                    var(i,j,c)=alpha*(X_t(i,j,c)-mean(i,j,c))^2+(1-alpha)*var(i,j,c);
            end
        end
    end
    
    diffR=abs(X_t(:,:,1)-mean(:,:,1));
    diffB=abs(X_t(:,:,2)-mean(:,:,2));
    diffG=abs(X_t(:,:,3)-mean(:,:,3));
    
    %diff=sqrt((X_t(:,:,1)-mean(:,:,1)).^2+(X_t(:,:,2)-mean(:,:,2)).^2+(X_t(:,:,3)-mean(:,:,3)).^2);
    
%     ss1=(X_t(:,:,1)-mean(:,:,1));
%     R=cov(X_t(:,:,1)');
%     %tt1=(var(:,:,1).*eye(height,width));
%     uu1=(X_t(:,:,1)-mean(:,:,1)).';
%     diff=uu1*R*ss1;
% %     diff=sqrt(((X_t(:,:,1)-mean(:,:,1)))*((eye(height,width).*var(:,:,1)))*(X_t(:,:,1)-mean(:,:,1))');
%    for i=1:height
%     for j=1:width 
%       diff(i,j)=sqrt(([(X_t(i,j,1)-mean(i,j,1)) (X_t(i,j,2)-mean(i,j,2)) (X_t(i,j,3)-mean(i,j,3))]) * ([var(i,j,1) var(i,j,2) var(i,j,3)].*eye(3,3)) * ([(X_t(i,j,1)-mean(i,j,1)) (X_t(i,j,2)-mean(i,j,2)) (X_t(i,j,3)-mean(i,j,3))])');
%     end
%    end
         
   for i=1:height
    for j=1:width 
       if diffR(i,j)<= 2.5*sqrt(var(i,j,1))
            fgR(i,j) = 0;
        else
            fgR(i,j) = X_t(i,j,1);     
       end
       if diffG(i,j)<= 2.5*sqrt(var(i,j,2))
            fgG(i,j) = 0;
        else
            fgG(i,j) = X_t(i,j,2);     
       end
       
       if diffB(i,j)<= 2.5*sqrt(var(i,j,3))
            fgB(i,j) = 0;
        else
            fgB(i,j) = X_t(i,j,3);     
       end
       
       fg(i,j)=(fgR(i,j)+fgG(i,j)+fgB(i,j))/3;
    end
   end

    
   
     %filtrage morphologique
     se = strel('square',2);
     fg1=imopen(fg,se);
     fg=imclose(fg1,se);
   


   %figure(1);
   %subplot(2,1,1);
   %imshow(X_t);
   %subplot(2,1,2);
   %fg3=fg2;
   %imshow(fg3);
   
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

   imwrite(fg,[pathname,['bin', num2str(z, '%.6d'),'.png']]);
   %hold on
   %open(vidObj);
   % Add next frame to movie
   %newFrameOut= getframe;
   %writeVideo(vidObj,newFrameOut);
end
%close(vidObj);
toc
Framepersecond= (numFrames/toc)