function [ output,output2  ] = houghcircle( img )
%HOUGHCIRCLE Summary of this function goes here
%   Detailed explanation goes here  59.17 61.51 45

rmin=25;
rmax=30;
% r=45;
HSC =zeros(size(img,1),size(img,2),rmax-rmin+1);   %,rmax-rmin+1
HSC2 =zeros(size(img,1),size(img,2));
for row=1:size(img,1)
 for col=1:size(img,2)
    for r= rmin:rmax
      if(img(row,col)==255)
         for t = 0:360  %% the possible  theta 0 to 360 
          a = floor(col - r * cos(t * pi / 180));%% polar coordinate for center
          b = floor(row - r * sin(t * pi / 180));%% polar coordinate for center 
          if all([a>0,b>0,a<size(img,2),b<size(img,1)])
           HSC(b,a,r-rmin+1) =HSC(b,a,r-rmin+1)+1; %%voting
             HSC2(b,a) =HSC2(b,a)+1; %%voting only for center
          end
         end
      end
    end
 end
end

output=HSC;
output2=mat2gray(HSC2);
output2=im2uint8(output2);
end