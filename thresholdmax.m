function [ output , H ] = thresholdmax( img, thres)
%THRESHOLD Summary of this function goes here
%   Detailed explanation goes here

H=zeros(2,20);
count=0;
output=zeros(size(img,1),size(img,2));

for row= 1:size(img,1)
  for col=1:size(img,2)
      
   if(img(row,col)>thres)
      max=1;          %% a boolean
      for row2=1:13
        for col2=1:13
        
          if all([ max~=0,(row+row2-7)>0 , (col+col2-7)>0 , (row+row2-7)<size(img,1) ,(col+col2-7)<size(img,2)] )
           if (row2~=7||col2~=7) 
            if(img(row+row2-7,col+col2-7)>img(row,col))
             max=0;
             output(row,col)=0;
            end
           end
          end
        
        end
      end
      
      
     if(max~=0)
      output(row,col)=255;
      count=count+1;
      H(1,count)= row;
      H(2,count)= col;
      H(3,count)= col;
     end
   else
    output(row,col)=0;    
   end
  end
end

output=mat2gray(output);
output=im2uint8(output);

end

