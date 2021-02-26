close all
clear all
im = imread('cameraman.tif');
figure(1)
imshow(im);
r = size(im);
roirect = [0 0 round(r(1)/2) round(r(2)/2)];
im2 = imcrop(im,roirect);
figure(2)
imshow(im2)





%function func()
% FigH = figure('UserData', []);
% while isvalid(FigH)
% for i = 1:10
%   subplot(1, 10, i);     % You need 10 SUBPLOTs for 10 images
%   j=2;
%   image(rand(100,100,3), 'ButtonDownFcn', {@Callback, [i,j]});  % Not IMSHOW
%   
% end
% pause(1)
% end
% function Callback(ObjectH, EventData, Index)
% FigH = ancestor(ObjectH, 'figure');
% subplot(1,1,1);
% 
% while isvalid(FigH)
% image(rand(100,100,3));
% pause(1)
% end
% func()
% 


% 
% FigH = ancestor(ObjectH, 'figure');
% disp(Index)
% UserData = [get(FigH, 'UserData'), Index];
% set(FigH, 'Userdata', UserData);

