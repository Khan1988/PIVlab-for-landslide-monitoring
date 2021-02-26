function [aligned] = register(fixed,moving)
    %fixed = rgb2gray(fixed);
    FixRect = [1908 3639 300 300];
    FixCrop = imcrop(fixed,FixRect);
    fpoints = detectSURFFeatures(fixed, 'ROI',[1908 3639 300 300]);
    [f1,vpts1] = extractFeatures(FixCrop,fpoints);
   % moving = rgb2gray(moving);
    MovRect = [1908 3639 300 300];
    MovCrop = imcrop(moving,MovRect);
    mpoints = detectSURFFeatures(moving, 'ROI',[1908 3639 300 300]);
    [f2,vpts2] = extractFeatures(MovCrop,mpoints);
    [indexPairs,~] = matchFeatures(f1,f2,"Method",'Exhaustive',"MatchThreshold",1,"MaxRatio",0.3);
    matchedPoints1 = vpts1(indexPairs(:,1));
    matchedPoints2 = vpts2(indexPairs(:,2));
    %MovCrop_ref = imref2d(size(MovCrop));
    [tform,~,~,~] = estimateGeometricTransform(matchedPoints2,matchedPoints1,'projective');
    aligned =  imwarp(moving,tform,'OutputView',imref2d(size(fixed)));
end


