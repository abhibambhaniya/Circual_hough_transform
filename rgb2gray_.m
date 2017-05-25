function [  output ] = rgb2gray_( input )
%RGB Summary of this function goes here
%   Detailed explanation goes here
r=input(:,:,1);
g=input(:,:,1);
b=input(:,:,1);

output=0.299*r + 0.5870*g + 0.1140*b;

end

