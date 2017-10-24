clearvars; close all; clc;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure(1);
subplot(2,4,1);
imshow(lena1);
subplot(2,4,2);
imshow(lena2);
subplot(2,4,3);
imshow(lena3);
subplot(2,4,4);
imshow(lena4);
subplot(2,4,5);
imhist(lena1, 256);
subplot(2,4,6);
imhist(lena2, 256);
subplot(2,4,7);
imhist(lena3, 256);
subplot(2,4,8);
imhist(lena4, 256);

%adjust
figure(2);
subplot(1,3,1);
hist1 = imread('hist1.bmp');
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

imshow(hist1);
subplot(1,3,2);
imhist(hist1, 256);
subplot(1,3,3);
newHist1 = imadjust(hist1);
imshow(newHist1);

%cumulated
[H, x] = imhist(hist1);
C = cumsum(H);
k = max(C) / max(H);
C2 = C / k;
figure(3);
hold on;
plot(x,H, 'red');
plot(x,C2, 'blue');
hold off;

%11
figure(4);
tLut = uint8(255*(C2/max(C2)));
res = intlut(hist1, tLut);
subplot(1,2,1);
imshow(hist1);
subplot(1,2,2);
imshow(res);

%14
figure(5);
subplot(1,3,1);
imshow(hist1);
title('original');
subplot(1,3,2);
imshow(histeq(hist1));
title('histeq');
subplot(1,3,3);
imshow(adapthisteq(hist1));
title('adapthisteq');