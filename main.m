a=imread('coins2.jpg');
figure;imshow(a);

b=rgb2gray(a);
figure;imshow(b);

c=gaus_blur(b);
figure;imshow(c,[0,255]);

d=sobel(c);
figure;imshow(d,[0,255]);
