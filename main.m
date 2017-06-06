a=imread('coins2.jpg');
% figure;imshow(a);

b=rgb2gray(a);
% figure;imshow(b);

c=gaus_blur(b);
% figure;imshow(c,[0,255]);

[d mag theta GX GY]=canny(c);
 figure;imshow(d,[0,255]);


[e, HS]=hough2(d);
 figure;imshow(e);

% [f,H]=thresholdmax(e,120);
% figure;imshow(f);
% 
% figure;imshow(d);
% hold on;
% plotline(H);