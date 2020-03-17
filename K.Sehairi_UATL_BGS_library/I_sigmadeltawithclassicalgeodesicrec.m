% Sigma-Delta with hybrid geodesic reconstraction
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
% set the amplification factor
Mut=3;

for k = 1 : numFrames
    
    Frame=imread(['in', num2str(k, '%.6d'),'.jpg']);
    I = rgb2gray(Frame);
    I=double(I);
 % Compute the Sigma-Delta mean
    if k==1
        M=I;
    end
    Mprev=M;
    if k>1
         for i=1:height 
            for j=1:width
                 if Mprev(i,j)<I(i,j)
                     M(i,j)=Mprev(i,j)+1;
                 end
                 if Mprev(i,j)>I(i,j)
                    M(i,j)=Mprev(i,j)-1;
                 end 
                 if Mprev(i,j)==I(i,j)
                    M(i,j)=Mprev(i,j);
                 end
             end
         end
    end

% Compute the difference betweenthe current frame and the mean
% sigma-delta(mesure de vraissemblance du mouvement)
 O=abs(M-I);
 
 % Cacul de la variance sigma-delta définie par la moyenne  sigma-delta de
 % N fois les differences non nulles
     if k==2
        Vprev=Mut*O;
     end
     
     if k>2
        %Vprev=V;
         for i=1:height 
            for j=1:width
                 if O(i,j)~=0
                     if Vprev(i,j)<Mut*O(i,j)
                         V(i,j)=Vprev(i,j)+1;
                     end
                     if Vprev(i,j)>Mut*O(i,j)
                         V(i,j)=Vprev(i,j)-1;
                     end
                     if Vprev(i,j)==Mut*O(i,j)
                         V(i,j)=Vprev(i,j);
                     end
                 end
             end
         end
          Vprev=V;
     end 

       
 level = graythresh(O);
 BWO = im2bw(O,level);
 
 % compute the gradient module of O and I
     % sobel applied on O (Delta)
        [~, threshold] = edge(O, 'sobel');
        fudgeFactor = .5;
        BW1 = edge(O,'sobel', threshold * fudgeFactor);
        
    % sobel applied on I
        [~, threshold] = edge(I, 'sobel');
        fudgeFactor = .5;
        BW2 = edge(I,'sobel', threshold * fudgeFactor);
        
    % the classical geodesic reconstruction
        DD= min(BW1,BW2);
    % computing euclidean norm
    %         gradofO=norm(O - BW1);
    %         gradofI=norm(I - BW2);
    % computing the min
    %DD=min(Onorm,Inorm);
    % classical geodesic reconstruction de?ned by the relaxation of the geodesic dilation
        se = strel('square',3);
        dilatedDD = imdilate(DD,se);
        Rec=min(dilatedDD,BWO);
        
        % convert logical image to uint8
        Rec3 = im2uint8(Rec);
        O=double(Rec3);
        
% Calcule des etiquetes de mouvement par comparaison entre la différence et la variance    
if k>2
         for i=1:height 
            for j=1:width
                 if O(i,j)<V(i,j)
                     E(i,j)=0;
                 else
                     E(i,j)=1;
                 end
            end
         end 
end

% opening by reconstruction
if k==3
        se = strel('disk',3);
        erodeE = imerode(E,se);
        dilateE=imdilate(erodeE,se);
        L=min(dilateE,E);
end
if k>3
        se = strel('disk',3);
        dilateL=imdilate(L,se);
        L=min(dilateL,L);
end      


        
    %imshow(D);
    
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
if k>2
    imwrite(E,[pathname,['bin', num2str(k, '%.6d'),'.png']]);
end
    %hold on
    %open(vidObj);
    % Add next frame to movie
    %newFrameOut= getframe;
    %writeVideo(vidObj,newFrameOut);
end
 %close(vidObj);
 toc
 Framepersecond= (numFrames/toc)