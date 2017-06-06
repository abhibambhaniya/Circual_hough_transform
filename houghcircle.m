function [ output ] = houghcircle( img )
%HOUGHCIRCLE Summary of this function goes here
%   Detailed explanation goes here  59.17 61.51 45

rmin=23;
rmax=60/2;
% r=45;
HSC =zeros(size(img,1),size(img,2));   %,rmax-rmin+1
for row=1:size(img,1)
 for col=1:size(img,2)
    for r= rmin:rmax
      if(img(row,col)==255)
         for t = 0:360  %% the possible  theta 0 to 360 
          a = ceil(col - r * cos(t * pi / 180));%% polar coordinate for center
          b = ceil(row - r * sin(t * pi / 180));%% polar coordinate for center 
          if all([a>0,b>0,a<size(img,2),b<size(img,1)])
%            HSC(b,a,r-rmin+1) =HSC(b,a,r-rmin+1)+1; %%voting
            HSC(b,a) =HSC(b,a)+1; %%voting
          end
         end
      end
    end
 end
end

output=mat2gray(HSC);
output=im2uint8(output);
end