clear all
close all
clc
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

for k = 3 : numFrames
    
    firstFrame=imread(['in', num2str(k-2, '%.6d'),'.jpg']);
    secondFrame=imread(['in', num2str(k-1, '%.6d'),'.jpg']);
    thirdFrame=imread(['in', num2str(k, '%.6d'),'.jpg']);
    
    % Convert to grayscale
    I = rgb2gray(firstFrame);
    J = rgb2gray(secondFrame);
    L = rgb2gray(thirdFrame);

    % convert to double
    I = double(I);
    J = double(J);
    L = double(L);

    
      I=padarray(I,[1 1],'replicate','both');
      J=padarray(J,[1 1],'replicate','both');
      L=padarray(L,[1 1],'replicate','both');
      [height,width]=size(I);
    
    % Absolute difference (delta frame)
     Ot=abs(J-I);
     Otfuture=abs(J-L);
    % threshold
        for i=1:height 
        for j=1:width 
            if Ot(i,j)>35
                Eest(i,j)=255;
            else
                Eest(i,j)=0;
            end
        end
        end
        for i=1:height 
        for j=1:width 
            if Otfuture(i,j)>35
                Eestfut(i,j)=255;
            else
                Eestfut(i,j)=0;
            end
        end
        end
    
    
    % computing energy Ua
        % computing psi
        alpha=20;

        for i=1:height 
            for j=1:width
                if Eest(i,j)==0
                    psi(i,j)=0;
                else
                    psi(i,j)=alpha;
                end
            end
        end
    
        % computing sigma
        S=0;
        
%         Ot=double(Ot);
        
        for i=1:height 
            for j=1:width
                S=S+Ot(i,j);
            end
        end
        Mu=S/(height*width);
        
        Sum=0;
        for i=1:height 
            for j=1:width
                Sum=Sum+((Ot(i,j)-Mu)^2);
            end
        end
        sigma=sqrt(Sum/(height*width));
        
   % Ua(Ot) Ua for a (past) in ref 160    
   for i=1:height 
       for j=1:width
           Ua(i,j)=(1/(2*(sigma^2))).*((Ot(i,j)-psi(i,j))^2);
       end
   end
   
   % Ua(Ot+1) Ua for b (future) in ref 160    
   for i=1:height 
       for j=1:width
           Ua(i,j)=(1/(2*(sigma^2))).*((Otfuture(i,j)-psi(i,j))^2);
       end
   end
   % computing Um
   
   Bs=20;
   Bp=10;
   Bf=30;
   for i=2:height-2
       for j=2:width-2
           
           if Eest(i-1,j-1)==Eest(i,j);
               V1(i,j)=-Bs;
           else
               V1(i,j)=Bs;
           end
           
           if Eest(i-1,j)==Eest(i,j);
               V2(i,j)=-Bs;
           else
               V2(i,j)=Bs;
           end
           
           if Eest(i-1,j+1)==Eest(i,j);
               V3(i,j)=-Bs;
           else
               V3(i,j)=Bs;
           end
           
           if Eest(i,j-1)==Eest(i,j);
               V4(i,j)=-Bs;
           else
               V4(i,j)=Bs;
           end
           
           if Eest(i,j+1)==Eest(i,j);
               V5(i,j)=-Bs;
           else
               V5(i,j)=Bs;
           end
           
           if Eest(i+1,j-1)==Eest(i,j);
               V6(i,j)=-Bs;
           else
               V6(i,j)=Bs;
           end
           
           if Eest(i+1,j)==Eest(i,j);
               V7(i,j)=-Bs;
           else
               V7(i,j)=Bs;
           end
           
           if Eest(i+1,j+1)==Eest(i,j);
               V8(i,j)=-Bs;
           else
               V8(i,j)=Bs;
           end
           
           if k==3
               Vp=zeros(height,width);
           else
           if Eestprev(i,j)==Eest(i,j);
               Vp(i,j)=-Bp;
           else
               Vp(i,j)=Bp;
           end
           end

           if Eestfut(i,j)==Eest(i,j);
               Vf(i,j)=-Bf;
           else
               Vf(i,j)=Bf;
           end

           
           Um(i,j)=V1(i,j)+V2(i,j)+V3(i,j)+V4(i,j)+V5(i,j)+V6(i,j)+V7(i,j)+V8(i,j)+Vp(i,j)+Vf(i,j);
       end
   end
   
   % computing U
   for i=2:height-2
       for j=2:width-2
              U(i,j)=Um(i,j)+(Ua(i,j));
       end
   end
      Eestprev=U;
    
    Uend=255*uint8(U);

    

    
    % show results
    %figure(k)    
    %imshow(U);
    
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
    imwrite(Uend,[pathname,['bin', num2str(k, '%.6d'),'.png']]);
    %hold on
    %open(vidObj);
    % Add next frame to movie
    %newFrameOut= getframe;
    %writeVideo(vidObj,newFrameOut);
end
%close(vidObj);
toc
Framepersecond= (numFrames/toc)