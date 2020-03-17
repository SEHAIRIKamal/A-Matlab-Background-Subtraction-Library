% you have to change to current folder (where the pictures are)
clc
clear all
%addpath('C:\Users\...);
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

imageNames = dir((fullfile('*.jpg')));% dir: lists all images in this directory
imageNames = {imageNames.name}'; % select Filename from the result of dir (imagesNames is structure)
outputVideo = VideoWriter('turbulence3.avi');
outputVideo.FrameRate = 25; % select the rate frps
open(outputVideo)
for ii = 1:length(imageNames)% loop to the last image file
   img = imread(fullfile(imageNames{ii})); % read the image file
   writeVideo(outputVideo,img) % in each loop add the image to output video
end
close(outputVideo)
