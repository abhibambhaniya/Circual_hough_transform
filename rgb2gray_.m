function [  output ] = rgb2gray_( input )
%RGB Summary of this function goes here
%   Detailed explanation goes here
r=input(:,:,1);
g=input(:,:,2);
b=input(:,:,3);

output=0.2989*r + 0.5870*g + 0.1140*b;

%0.2989= 298/  1000                 150/500
%0.5870= 117410508/   200017902     293/500
%0.1140= 22802040/   200017902      57/500

end
