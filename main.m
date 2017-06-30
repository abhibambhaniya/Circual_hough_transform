a=imread('coins2.jpg');
%  figure;imshow(a);

b=rgb2gray(a);
 figure;imshow(b);

c=gaus_blur(b);
  figure;imshow(c,[0,255]);

[d mag theta GX GY]=canny(c);
figure;imshow(d,[0,255]);

%  d=sobel(c);
%  figure;imshow(d);

[HSC, HSC2]=houghcircle(d);
figure;imshow(HSC2);

[g,H]=thresholdmax(HSC2,160);
 figure;imshow(g);

 figure;imshow(a);
[I]=threshold3(HSC,H);
 plotcircle(I);