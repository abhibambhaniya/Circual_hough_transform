function plotcircle( I )

for i=1:20
  if(I(1,i)>0)
    circle(I(2,i),I(1,i),I(3,i));  
  end
end 


end