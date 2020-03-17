
clear all
close all
clc
% add path to the dataset video files
 addpath('C:\video original\') % change the path to your video folder 

 
% constructs a multimedia reader object 
a = VideoReader('test.avi'); % change test by the name of your video
%mplay('test.avi') % to play your video

% returns the number of frames from the multimedia reader object
numFrames = a.NumberOfFrames

% returns the width and height of frames in video
width= a.Width
height= a.Height

% reads only the specified frames from xxx to yyy
B = read(a,[1 numFrames]); 

% create avifile
vidObj= VideoWriter('result.avi'); 
vidObj.FrameRate = 25; % select the rate frps

for z=1:numFrames
    % read the current frame
    X_t = B(:,:,:,z);
    X=imresize(X_t, [720,1280]);
    % Add next frame to movie
    open(vidObj);
    %Xdouble=double(X)/255;
    writeVideo(vidObj,X);
end
% do not forget to close video object or the video will not run
close(vidObj)
mplay('result.avi')