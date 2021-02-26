function find_creep(u,v)
    rgbImage = zeros(size(u));
    rgbImage(:,:,2) = v;
    t=atand(v./u);
    t(isnan(t))=0;
%     figure(2);
%     subplot(1,3,1);
%     imshow(u);
%     subplot(1,3,2);
%     imshow(v); 
%     subplot(1,3,3);
%     imshow(t);
    rgbImage(:,:,3) = t;% zeros(size(u));
    %rgbImage = rgb2gray(rgbImage);
    templateWidth = 30;
    templateHeight = 30;
    threshold = 0.4;
%     figure(2)
%     imshow(v);
%     hold on;
%     boxRect = [214, 49,templateWidth, templateHeight];
%     hold on
%     rectangle('position',boxRect,'edgecolor', 'g', 'linewidth',2)
    smallSubImage = imcrop(rgbImage(:,:,3), boxRect);

%     smallSubImage = imcrop(rgbImage(:,:,3), boxRect);
    correlationOutput = normxcorr2(smallSubImage, rgbImage(:,:,3));
    [m, n] = size(smallSubImage);
     correlationOutput = correlationOutput(m+1:end,n+1:end);
    bw = correlationOutput > threshold;
    r = regionprops(bwlabel(bw));
    if nargin>3
        rgbImage(1:m,1:n) = smallSubImage;
    end
    figure(2);
    imshow(rgb2gray(rgbImage));
    hold on
    for j = 1:length(r)
        xxx= rectangle('position', [r(j).Centroid(1), r(j).Centroid(2), 30, 30], 'edgecolor', 'g', 'linewidth',2);
        xxx
    end
    figure(3)
    imshow(bw)