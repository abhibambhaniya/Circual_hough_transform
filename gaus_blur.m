function [ output ] = gaus_blur( input )
%GAUS Summary of this function goes here
%   Detailed explanation goes here

img=im2double(input);
output=zeros(size(img,1)-2,size(img,2)-2);
a_=0.110741;
b_=0.111296;
c_=0.111853;

kernel=[a_ b_ a_ ;
        b_ c_ b_;
        a_ b_ a_];

for row= 2:size(img,1)-1
  for col=2:size(img,2)-1
    output(row-1,col-1) =(kernel(1,1)*(double(img(row-1,col-1))+double(img(row-1,col+1))+double(img(row+1,col-1))+double(img(row+1,col+1)))+kernel(1,2)*(double(img(row,col-1))+double(img(row,col+1))+double(img(row+1,col))+double(img(row-1,col)))+kernel(2,2)*double(img(row,col)));      
  end
end

output=mat2gray(output);

end

