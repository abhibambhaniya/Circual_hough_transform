function [ output , H ] = thresholdmax( img, thres)
%THRESHOLD Summary of this function goes here
%   Detailed explanation goes here


rmax=(size(img,2)-1)/2;
H=zeros(2,20);
count=0;
output=zeros(size(img,1),size(img,2));

for row= 1:size(img,1)
  for col=1:size(img,2)
   if(img(row,col)>thres)
      max=img(row,col);
      for row2=1:5
        for col2=1:5
        if all([(row+row2-3)>0 , (col+col2-3)>0 , (row+row2-3)<size(img,1) ,(col+col2-3)<size(img,2)] )
          if(img(row+row2-3,col+col2-3)>max)
           max=0;
          end
        end
        end
      end
     if(max~=0)
      output(row,col)=255;
      count=count+1;
      H(1,count)= row/306*pi;
      H(2,count)= col-(rmax+1);
     end 
   end    
  end
end

output=mat2gray(output);
output=im2uint8(output);

end

