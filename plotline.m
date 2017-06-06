function [ ] = plotline( input )
%PLOT Summary of this function goes here
%   Detailed explanation goes here

for i=1:size(input,2)
    if(input(2,i)~=0)
      x= 1:317;
      y = (input(2,i) - x* cos(input(1,i)) )/ sin(input(1,i));
      plot(x,y);
      hold on;
    end
end


end

