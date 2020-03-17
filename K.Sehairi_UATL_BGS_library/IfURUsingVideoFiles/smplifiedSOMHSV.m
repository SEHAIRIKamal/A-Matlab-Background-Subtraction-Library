tic
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
%     cd  ('C:\dataset2014\dataset\baseline\PETS2006\input')
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
    cd  ('C:\dataset2014\dataset\turbulence\turbulence3\input');



%     
%     % badweather
%     a = VideoReader('blizzard.avi');
%     a = VideoReader('skating.avi');
%     a = VideoReader('snowFall.avi');
%     a = VideoReader('wetSnow.avi');
%     % baseline
%     a = VideoReader('highway.avi');
%     a = VideoReader('office.avi');
%     a = VideoReader('pedestrians.avi');
%     a = VideoReader('Pets2006.avi');
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
     a = VideoReader('turbulence3.avi');


%mplay('cam3.avi');

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
%A = read(a,[310 510]); % cam3 empty untill 230, normal mvt 310-370, fall 370-450 lack of mvt 450-610
A = read(a,[1 numFrames]); % chute 5 cam3 empty untill 230, normal mvt 230-310, fall 310-380 lack of mvt 380-405

% % show the last frame in "A" that correspond to the 40th frame in "a"
% figure(2)
% imshow(A(:,:,:,510));

% create avifile
%vidObj= VideoWriter('11GMM01.avi'); % GMM1 without filter and th

% construct the initial background model by median

    BB1(:,:,:)=double(A(:,:,:,1));
    BB2(:,:,:)=double(A(:,:,:,2));
    BB3(:,:,:)=double(A(:,:,:,3));
    BB4(:,:,:)=double(A(:,:,:,4));
    BB5(:,:,:)=double(A(:,:,:,5));
    BB6(:,:,:)=double(A(:,:,:,6));
    BB7(:,:,:)=double(A(:,:,:,7));
    BB8(:,:,:)=double(A(:,:,:,8));
    BB9(:,:,:)=double(A(:,:,:,9));
    BB10(:,:,:)=double(A(:,:,:,10));
    
    for k=1:3
    B1(:,k) = reshape(BB1(:,:,k),1,width*height);
    B2(:,k) = reshape(BB2(:,:,k),1,width*height);
    B3(:,k) = reshape(BB3(:,:,k),1,width*height);
    B4(:,k) = reshape(BB4(:,:,k),1,width*height);
    B5(:,k) = reshape(BB5(:,:,k),1,width*height);
    B6(:,k) = reshape(BB6(:,:,k),1,width*height);
    B7(:,k) = reshape(BB7(:,:,k),1,width*height);
    B8(:,k) = reshape(BB8(:,:,k),1,width*height);
    B9(:,k) = reshape(BB9(:,:,k),1,width*height);
    B10(:,k) = reshape(BB10(:,:,k),1,width*height);
    
    BB(:,:,k)=[B1(:,k) B2(:,k) B3(:,k) B4(:,k) B5(:,k) B6(:,k) B7(:,k) B8(:,k) B9(:,k) B10(:,k)]';
    
    end
    

    BG1=median(BB(:,:,1));
    BG2=median(BB(:,:,2));
    BG3=median(BB(:,:,3));
    
    Background(:,:,1) = reshape(BG1,height,width);
    Background(:,:,2) = reshape(BG2,height,width);
    Background(:,:,3) = reshape(BG3,height,width);


    BG=Background./255;
    BG_HSV = rgb2hsv(BG);
    
alpha1=0.02;
alpha2=0.01;
    
for z=10:numFrames
    
   % read the current frame
    X_t = A(:,:,:,z);
    % Convert to double
    X_t=double(X_t);
    X_t=X_t./255;
    % convert to HSV
    X_t_HSV = rgb2hsv(X_t);
    
    if z==10
        W=BG_HSV;
    end
    
    Xt_H=X_t_HSV(:,:,1);
    Xt_S=X_t_HSV(:,:,2);
    Xt_V=X_t_HSV(:,:,3);
    
    W_H=W(:,:,1);
    W_S=W(:,:,2);
    W_V=W(:,:,3);
    
    for i=1: height
        for j=1:width
            Diff(i,j)=sqrt((((Xt_V(i,j)*Xt_S(i,j)*cos(Xt_H(i,j)))-(W_V(i,j)*W_S(i,j)*cos(W_H(i,j)))).^2)+(((Xt_V(i,j)*Xt_S(i,j)*sin(Xt_H(i,j)))-(W_V(i,j)*W_S(i,j)*sin(W_H(i,j)))).^2)+((Xt_V(i,j)-W_V(i,j)).^2));
        end
    end 
    
%     for i=1: height
%         for j=1:width
%             Diff(i,j)=sqrt((((X_t_HSV(i,j,3)*X_t_HSV(i,j,2)*cos(X_t_HSV(i,j,1)))-(W(i,j,3)*W(i,j,2)*cos(W(i,j,1)))).^2)+(((X_t_HSV(i,j,3)*X_t_HSV(i,j,2)*sin(X_t_HSV(i,j,1)))-(W(i,j,3)*W(i,j,2)*sin(W(i,j,1)))).^2)+((X_t_HSV(i,j,3)-W(i,j,3)).^2));
%         end
%     end
    
    Th1=0.10;
    Th2=0.15;
    for i=2: height-1
        for j=2:width-1  
            if ((Diff(i,j)>Th1) && (abs(Xt_V(i,j)-W_V(i,j))>Th2))
                fg(i,j)=1;
            else
                fg(i,j)=0;
                for k=1:3
                    W(i,j,k)=W(i,j,k)+alpha1*((X_t_HSV(i,j,k)-W(i,j,k)));
                    
                    W(i-1,j-1,k)=W(i-1,j-1,k)+alpha2*((X_t_HSV(i-1,j-1,k)-W(i-1,j-1,k)));
                    W(i,j-1,k)=W(i,j-1,k)+alpha2*((X_t_HSV(i,j-1,k)-W(i,j-1,k)));
                    W(i+1,j-1,k)=W(i+1,j-1,k)+alpha2*((X_t_HSV(i+1,j-1,k)-W(i+1,j-1,k)));
                    W(i-1,j,k)=W(i-1,j,k)+alpha2*((X_t_HSV(i-1,j,k)-W(i-1,j,k)));
                    W(i+1,j,k)=W(i+1,j,k)+alpha2*((X_t_HSV(i+1,j,k)-W(i+1,j,k)));
                    W(i-1,j+1,k)=W(i-1,j+1,k)+alpha2*((X_t_HSV(i-1,j+1,k)-W(i-1,j+1,k)));
                    W(i,j+1,k)=W(i,j+1,k)+alpha2*((X_t_HSV(i,j+1,k)-W(i,j+1,k)));
                    W(i+1,j+1,k)=W(i+1,j+1,k)+alpha2*((X_t_HSV(i+1,j+1,k)-W(i+1,j+1,k)));
                end
            end
        end
    end
    
                    
    
   %median filtering
   %fg3 = medfilt2(fg); % performs median filtering of the matrix A using the default 3-by-3 neighborhood,Padded with 0s. This is the default.

%      %filtrage morphologique 
%      se = strel('square',2);
%      fg2=imopen(fg,se);
%      fg3=imclose(fg2,se);
    
    %Otsu's threshold
    %fg3=fg2./255;
%     level = graythresh(fg3);
%     if level<0.05
%         level=0.10;
%     end
%     fg3 = im2bw(fg3,level);


   %figure(1);
   %subplot(2,1,1);
   %imshow(X_t);
   %subplot(2,1,2);
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

%    figure(1),subplot(3,1,1),imshow(X_t)
%     subplot(3,1,2),imshow(uint8(bg_bw))
%     subplot(3,1,3),imshow(uint8(fg)) 
%     
%     Mov1(z)  = im2frame(uint8(fg),gray);           % put frames into movie
%     %Mov2(z)  = im2frame(uint8(bg_bw),gray);           % put frames into movie
%     
% end
%       
% movie2avi(Mov1,'GMM1','fps',25);           % save movie as avi 
% %movie2avi(Mov2,'MOG_background5','fps',25);           % save movie as avi 

 toc