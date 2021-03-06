clearvars; close all; clc;

image = imread('lab112.png');

image = im2bw(image, 0.2);

image = imdilate(image, ones(3,10));

edge = edge(image, 'sobel');

imshow(image, []); title('oryginal');

[H, theta, rho] = hough(edge, 'RhoResolution',0.1, 'ThetaResolution', 0.5);
peaks = houghpeaks(H, 8);
lines = houghlines(edge, theta, rho, peaks, 'FillGap', 5, 'MinLength', 7);

figure;
imshow(edge); hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

hold off;