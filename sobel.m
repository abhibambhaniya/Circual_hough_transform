function [ output ] = sobel( img )
%SOBEL Summary of this function goes here
%   Detailed explanation goes here

output=zeros(size(img,1),size(img,2));
M1=zeros(3,3);    %% matrix for a element with its neighbour
output1=zeros(3,3);  %% temporary matrix storing M1*x_mask
output2=zeros(3,3);  %% temporary matrix storing M1*y_mask

x_mask=[-1 -2 -1 ;
         0  0  0 ;
         1  2  1 ];
     
y_mask=[-1 0 1;
        -2 0 2 ;
        -1 0 1 ];
    
for row= 1:size(img,1)
  for col=1:size(img,2)
    Gx=0;
    Gy=0;
  
    for row2= 1:3
     for col2= 1:3
      if all([(row+row2-2)>0,(col+col2-2)>0,(row+row2-2)<=size(img,1),(col+col2-2)<=size(img,2)] )    
      M1(row2,col2)=img(row+row2-2,col+col2-2);
      else
      M1(row2,col2)=img(row,col);
      end
     end
    end 
    
    for row2= 1:3
     for col2= 1:3   
      output1(row2,col2)=M1(row2,col2)*x_mask(row2,col2);
      output2(row2,col2)=M1(row2,col2)*y_mask(row2,col2);    
     end
    end 
    
    for row2= 1:3
     for col2= 1:3   
      Gx=Gx+output1(row2,col2);
      Gy=Gy+output2(row2,col2);
     end
    end
    output(row,col)=sqrt(Gx.^2+Gy.^2);
  end
end

end

