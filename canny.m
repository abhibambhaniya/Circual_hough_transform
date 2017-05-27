function [ output mag theta GX GY ] = canny( img )
%CANNY Summary of this function goes here
%   Detailed explanation goes here
%%output=zeros(size(img,1),size(img,2));
M1=zeros(3,3);    %% matrix for a element with its neighbour
temp1=zeros(3,3);  %% temporary matrix storing M1*x_mask
temp2=zeros(3,3);  %% temporary matrix storing M1*y_mask
mag=zeros(size(img));
theta=zeros(size(img));

y_mask=[-1 -2 -1 ;
         0  0  0 ;
         1  2  1 ];
     
x_mask=[-1 0 1;
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
      temp1(row2,col2)=M1(row2,col2)*x_mask(row2,col2);
      temp2(row2,col2)=M1(row2,col2)*y_mask(row2,col2);    
     end
    end 
    
    for row2= 1:3
     for col2= 1:3   
      Gx=Gx+temp1(row2,col2);
      Gy=Gy+temp2(row2,col2);
     end
    end
    mag(row,col)=sqrt(Gx.^2+Gy.^2);
    theta(row,col)=atand(Gy/Gx);
    GX(row,col)=Gx;
    GY(row,col)=Gy;
  
  end
end
 

for row= 2:size(img,1)-1
  for col=2:size(img,2)-1
      
    %%Horizontal Edge   
   if (((-22.5<theta(row,col))&&(theta(row,col)<= 22.5))||((157.5 <theta(row,col))&&(theta(row,col)<= -157.5)))
            
                if(mag(row,col)<mag(row,col-1) ||mag(row,col)<mag(row,col+1))   
                out1(row,col)=0;
                else
                out1(row,col)=mag(row,col);    
                end
   end
  %%Vertical edge
  if (((-112.5 < theta(row,col)) && (theta(row,col) <= -67.5)) || ((67.5 <theta(row,col)) && (theta(row,col) <= 112.5)))
           
                if(mag(row,col)<mag(row-1,col) || mag(row,col)<mag(row+1,col))   
                out1(row,col)=0;
                else
                out1(row,col)=mag(row,col);  
                end
  end
  %%-45 edge 
  if (((-67.5 <theta(row,col)) && (theta(row,col) <= -22.5)) || ((112.5 < theta(row,col)) && (theta(row,col) <= 157.5)))
         if(mag(row,col)<mag(row+1,col-1) || mag(row,col)<mag(row-1,col+1))   
           out1(row,col)=0;
           else
           out1(row,col)=mag(row,col);  
           end    
              
  end
            
  %%+45 edge           
     if (((-157.5 < theta(row,col)) && (theta(row,col) <= -112.5)) || ((22.5 < theta(row,col)) && (theta(row,col) <= 67.5)))
            
           if(mag(row,col)<mag(row-1,col-1) || mag(row,col)<mag(row+1,col+1))   
                out1(row,col)=0;
                else
                out1(row,col)=mag(row,col);  
                end     
            
     end
     
     
  end
end
     
     
out1=mat2gray(out1);
out1=im2uint8(out1);
output=hysterisis(out1);
  end

