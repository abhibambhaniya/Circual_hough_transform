a=imread('coins2.jpg');
figure;imshow(a);

b=rgb2gray_(a);
figure;imshow(b);

c=gaus_blur(b);
for i=1:3
    c=gaus_blur(c);
end    
figure;imshow(c);

d=sobel(c);
figure;imshow(d);

e=imbinarize(d);
figure;imshow(e);

[cen_est,rad_estimate] = circle_tes1(e);
