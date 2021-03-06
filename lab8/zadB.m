clearvars; close all; clc;

figure;
%scienianie
finger = imread('fingerprint.bmp');

BW2_1 = bwmorph(finger, 'thin', 1);
BW2_2 = bwmorph(finger, 'thin', 2);
BW2_Inf = bwmorph(finger, 'thin', Inf);
subplot(2,2,1); imshow(finger, []); title('oryginal');
subplot(2,2,2); imshow(BW2_1, []); title('scienianie - 1');
subplot(2,2,3); imshow(BW2_2, []); title('scienianie - 2');
subplot(2,2,4); imshow(BW2_Inf, []); title('scienianie - Inf');

%szkieletyzcja
figure;
BW3 = bwmorph(finger, 'skel', Inf);
subplot(2,2,1); imshow(BW3, []); title('szkieletyzcja - skel');
subplot(2,2,2); imshow(bwmorph(finger, 'thin'), []); title('szkieletyzcja - thin');
subplot(2,2,3); imshow(bwmorph(finger, 'thin',2 ), []); title('szkieletyzcja - thin - 2');
subplot(2,2,4); imshow(bwmorph(finger, 'thin', Inf), []); title('szkieletyzcja - thin - Inf');

%otwarcie przez rekonstrukcje
figure;
textBmp = imread('text.bmp');
SE = ones(51,1);
open = imopen(textBmp, SE);
subplot(1,3,1); imshow(textBmp, []); title('oryginal');
subplot(1,3,2); imshow(open, []); title('otwarcie(51,1)');
subplot(1,3,3); imshow(imreconstruct(imerode(textBmp, SE), textBmp)); title('imreconstruct()')

%wypelnianie dziur
figure;
subplot(1,2,1); imshow(textBmp, []); title('oryginal');
subplot(1,2,2); imshow(imfill(textBmp, 'holes'), []); title('imfill()');

%czyszczenie brzegu
figure;
subplot(1,2,1); imshow(textBmp, []); title('oryginal');
subplot(1,2,2); imshow(imclearborder(textBmp), []); title('imclearborder()');




