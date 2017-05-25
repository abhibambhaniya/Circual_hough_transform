function [ output ] = threshold( img, thres)
%THRESHOLD Summary of this function goes here
%   Detailed explanation goes here

output=zeros(size(img,1),size(img,2));

for row= 1:size(img,1)
  for col=1:size(img,2)
   if(img(row,col)>thres)
    output(row,col)=255;
   else    
    output(row,col)=0;
   end    
  end
end


end

