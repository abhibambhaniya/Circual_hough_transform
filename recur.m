function [ output_args ] = recur( input )
%RECUR Summary of this function goes here
%   Detailed explanation goes here
 for row2= 1:3
   for col2=1:3
   if all([img(a(1,i)+row2-2,a(2,i)+col2-2)>100,img(a(1,i)+row2-2,a(2,i)+col2-2)<160]) 
    output(a(1,i)+row2-2,a(2,i)+col2-2)=255;
     count=count+1;
     a(1,count)=a(1,i)+row2-2;
     a(2,count)=a(2,i)+col2-2;
   end
   end  
  end


end

