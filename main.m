a=imread('coins2.jpg');
figure;imshow(a);

b=rgb2gray(a);
figure;imshow(b);

c=gaus_blur(b);
for i=1:10
    c=gaus_blur(c);
end    
figure;imshow(c);

d=sobel(c);
figure;imshow(d);

