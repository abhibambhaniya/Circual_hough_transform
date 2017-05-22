function [ output ] = sobel( input )
%SOBEL Summary of this function goes here
%   Detailed explanation goes here

x_mask=[-1 -2 -1;
         0 0 0 ;
         1 2 1 ];
     
y_mask=[-1 0 1;
        -2 0 2 ;
         -1 0 1 ];
     
img=im2double(input);   
output=zeros(size(img,1)-2,size(img,2)-2);

for row= 2:size(img,1)-1
  for col=2:size(img,2)-1
 Gx= ((2*img(row+1,col)+img(row+1,col-1)+img(row+1,col+1))-(2*img(row-1,col)+img(row-1,col-1)+img(row-1,col+1)));
 Gy= ((2*img(row,col+1)+img(row-1,col+1)+img(row+1,col+1))-(2*img(row,col-1)+img(row-1,col-1)+img(row+1,col-1)));
 
 output(row-1,col-1)=sqrt(Gx.^2+Gy.^2);
%  output=mat2gray(output); 
  end
end

end

