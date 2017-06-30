function [ I ] = thresholdmax( HSC,H )
%THRESHOLD Summary of this function goes here
%   Detailed explanation goes here

rmin=25;
rmax=30;
I=zeros(2,20);

for i=1:20
  if(H(1,i)>0)
      maxr=1;
         for r=1:rmax-rmin+1
           if(HSC(H(1,i),H(2,i),r)>HSC(H(1,i),H(2,i),maxr))
             maxr=r;  
           end   
         end
    I(1,i)= H(1,i);
    I(2,i)= H(2,i);
    I(3,i)= rmin+maxr-1;
    
  end
end 


end



