function [ y,x,total_pix ] = find_ones( img )
i=1;
y=0;
x=0;
k=200;       %threshold
for row= 1:size(img,1)
  for col=1:size(img,2)
      if img(row,col)==1
          y(i)=col;
          x(i)=row;
          i=i+1;
      end
  end
end

total_pix=i-1;
