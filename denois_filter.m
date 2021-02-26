function [u1, v1] = denois_filter(x,y,u, v)

% us=sum(u(:))/length(u(:));
% vs=sum(u(:))/length(v(:));
% u = u - us;
% v = v - vs;
%%%% Retain vector only with gradient between 270 +- 45 (Note: Frame is upside down here)%%%%
t = atan2(v,u);
t = t*180/pi;
% tf = t;
t_lower = 55;t_upper = 125;
u1 = u;v1=v;
t(t<t_lower) = 0;
t(t>t_upper) = 0;
u1(t==0)=0;v1(t==0)=0;
%%%%%  Morphological filters %%%%
im = u1;
im(:,:,2) = v1;
im(:,:,3) = zeros(size(v1));
im2 = rgb2gray(im);
im2 = imbinarize(im2);
b = strel('rectangle',[3,2]);
im2 = imerode(im2,b);
b = strel('rectangle',[3,2]);
im2 = imdilate(im2,b);
mask = zeros(size(im2));
mask(im2>0.2) = 1;
u1(mask==0) = 0;v1(mask==0) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%[maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
%[yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
% corr_offset = [(xPeak-size(smallSubImage,2)) (yPeak-size(smallSubImage,1))];
% boxRect = [corr_offset(1) corr_offset(2) templateWidth, templateHeight];
% rectangle('position', boxRect, 'edgecolor', 'g', 'linewidth',2);
%  

%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(2)
% subplot(1,4,1);
% quiver(x,y,u,v);
% subplot(1,4,2)
% quiver(x,y,un,vn)
% subplot(1,4,3);
% imshow(img);
% subplot(1,4,4);
% imshow(im2)




