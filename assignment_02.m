clear all;
close all;
clc;

StartingFrame = 1;
EndingFrame = 489;

Xcentroid = [];
Ycentroid = [];

Xcentroid2 = [];
Ycentroid2 = [];

for k = StartingFrame : EndingFrame-1
k

rgb = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);

BW1 = createMask(rgb);
BW2 = createMask2(rgb);

SE = strel('disk',1,0);
BW = imopen(BW1,SE);
bw = imopen(BW2,SE);

[labels,number] = bwlabel(BW,8);

if number > 0

Istats = regionprops(labels,'basic','Centroid');

[values,index] = sort([Istats.Area],'descend');

[maxVal, maxIndex] = max([Istats.Area]);

Xcentroid = [Xcentroid Istats(maxIndex).Centroid(1)];
Ycentroid = [Ycentroid Istats(maxIndex).Centroid(2)];
     
end

[labels2,number2] = bwlabel(bw,8);

if number2 > 0

Istats2 = regionprops(labels2,'basic','Centroid');

[values2,index2] = sort([Istats2.Area],'descend');

[maxVal2, maxIndex2] = max([Istats2.Area]);

Xcentroid2 = [Xcentroid2 Istats2(maxIndex2).Centroid(1)];
Ycentroid2 = [Ycentroid2 Istats2(maxIndex2).Centroid(2)];
     
end
end

close all;
rgb = imread('balls/img001.jpg');
imshow(rgb);
hold on;
scatter(Xcentroid,Ycentroid);

scatter(Xcentroid2,Ycentroid2);




