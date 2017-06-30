function [ output , H ] = thresholdmax( img, thres)
%THRESHOLD Summary of this function goes here
%   Detailed explanation goes here

H=zeros(2,20);
count=0;
output=zeros(size(img,1),size(img,2));
img2=img;

for row= 1:size(img,1)
  for col=1:size(img,2)
      
   if(img2(row,col)>thres)
      max=1;          %% a boolean
      for row2=1:19
        for col2=1:19
        
          if all([ max~=0,(row+row2-9)>0 , (col+col2-9)>0 , (row+row2-9)<size(img,1) ,(col+col2-9)<size(img,2)] )
           if (row2~=9||col2~=9) 
            if(img2(row+row2-9,col+col2-9)>=img2(row,col))
             max=0;
             img2(row,col)=0;
            end
           end
          end
        
        end
      end
      
      
     if(max~=0)
      img2(row,col)=255;
      count=count+1;
      H(1,count)= row;
      H(2,count)= col;
     end
   else
    img2(row,col)=0;    
   end
  end
end

output=mat2gray(img2);
output=im2uint8(output);

end

