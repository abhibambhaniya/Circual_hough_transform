function [ output ] = hough2( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% 
% theta=zeros(1,360);
% theta(1)=-90;
% for i=2:360
%  theta(i)=theta(i-1)+0.5
% end

rmax=ceil((size(img,1)^2+size(img,1)^2)^0.5);
% R=zeros(1,2*rmax+1);
% R(1)=-rmax;
% for i=2:360
%  R(i)=R(i-1)+1;
% end
 
HS=zeros(360,2*rmax+1); 
for row=1:size(img,1)
 for col=1:size(img,2)
  if(img(row,col)==255)
      for i=1:360
       r=floor(col*cos(pi*i/360)+row*sin(pi*i/360));   
       HS(i,r+(rmax+1))=HS(i,r+(rmax+1))+1;
      end     
  end
 end
end

output=HS;
output=mat2gray(HS);
output=im2uint8(output);






end

