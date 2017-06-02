function [ ] = plotline( input )
%PLOT Summary of this function goes here
%   Detailed explanation goes here

for i=size(input,2)
    if(input(1,i)~=0)
      x= 0:317;
      y = (input(1,i) - x* cos(input(2,i)) )/ sin(input(2,i));
      plot(x,y);
    end
end


end

