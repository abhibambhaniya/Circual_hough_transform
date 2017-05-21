%function [centersBright, radiiBright]=script1()
a=imread('G:\sem4\Sura\Work\coins2.jpg');      %Read image
figure;imshow(a);

b=rgb2gray(a);              %Convert into greyscale
figure;imshow(b);

d=edge(b,'sobel');
%figure;imshow(d);

c= imgaussfilt(b,1.8);          %Gaussian filter to clear out high frequency noise here we have used a standard deviation of 2
figure;imshow(c);                          

d=edge(c,'sobel');              %Blured images can have better edge detection
figure;imshow(d);

minradius=20;
maxradius=35;

[centersBright, radiiBright] = imfindcircles(d,[minradius maxradius]);

viscircles(centersBright, radiiBright,'Color','b');
%end