function [ output ] = gaus_blur( img )
%GAUS Summary of this function goes here
%   Detailed explanation goes here


output=zeros(size(img,1),size(img,2));
M1=zeros(5,5);    %% matrix for a element with its neighbour
output1=zeros(5,5);  %% temporary matrix storing M1*kernel
kernel=zeros(5,5);   %% http://dev.theomader.com/gaussian-kernel-calculator/

a=0.049045;
b=0.055432;
c=0.062651;
d=0.033969;
e=0.038393;
f=0.023528;

kernel=[ f d e d f
         d a b a d ;
         e b c b e;
         d a b a d
         f d e d f];
    

for row=1:size(img,1)
  for col=1:size(img,2)
    
   for row2= 1:5
    for col2= 1:5
     if all([(row+row2-3)>0,(col+col2-3)>0,(row+row2-3)<=size(img,1),(col+col2-3)<=size(img,2)] )    
     M1(row2,col2)=img(row+row2-3,col+col2-3);
     else
     M1(row2,col2)=img(row,col);
     end
    end
   end  
      
   for row2= 1:5
    for col2= 1:5   
    output1(row2,col2)=M1(row2,col2)*kernel(row2,col2);
    end
   end
   
   for row2= 1:5
    for col2= 1:5
    output(row,col)=output(row,col)+output1(row2,col2);
    end
   end  
   
   
  end
end

output=mat2gray(output);
output=im2uint8(output);

end

