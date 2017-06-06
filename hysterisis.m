function [ output] = hysterisis( img )
%HYSTERISIS Summary of this function goes here
%   Detailed explanation goes here

output=zeros(size(img));
count=0;
ac=zeros(2,(size(img,1)*size(img,2)));
for row= 2:size(img,1)-1
  for col=2:size(img,2)-1

  if(img(row,col)>=180)
      output(row,col)=255;
      count=count+1;
      ac(1,count)=row;
      ac(2,count)=col; 
  else
      output(row,col)=img(row,col);
  end
  end
end

 for i= 1:(size(img,1)*size(img,2))
     
  if (ac(1,i)>0)  
   for row2= 1:3
    for col2=1:3
     if all([output(ac(1,i)+row2-2,ac(2,i)+col2-2)>80,output(ac(1,i)+row2-2,ac(2,i)+col2-2)<180]) 
      output(ac(1,i)+row2-2,ac(2,i)+col2-2)=255;
      count=count+1;
      ac(1,count)=ac(1,i)+row2-2;
      ac(2,count)=ac(2,i)+col2-2;
      elseif(output(ac(1,i)+row2-2,ac(2,i)+col2-2)<80)
      output(ac(1,i)+row2-2,ac(2,i)+col2-2)=0;    
     end
    end  
   end
  end
 end

for row= 1:size(img,1)
  for col=2:size(img,2)
    if(output(row,col)<255)
      output(row,col)=0;
    end
  end
end

 
output=mat2gray(output);
output=im2uint8(output);



end

