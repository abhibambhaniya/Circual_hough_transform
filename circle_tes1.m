function [centers, r_estimated] = circle_tes1(e)


[y,x]=find(e);          %Find the co-ordinates where there are ones in the image
[sy,sx]=size(e);        %Size of full image
imshow(e);

totalpix = length(x);   %Total number pixels with 1(where accumleter is to be made)

HM = zeros(sy,sx,15);   %Make a accumilator matrix
R = 20:35;               %Radius range
R2 = R.^2;              %Square of radius
sz = sy*sx;             %Total number of pixels

for cnt = 1:totalpix
for cntR = 1:15
    b = 1:sy;
    a = (round(x(cnt) - sqrt(R2(cntR) - (y(cnt) - [1:sy]).^2)));
    b = b(imag(a)==0 & a>0);
    a = a(imag(a)==0 & a>0);
    ind = sub2ind([sy,sx],b,a); 
    HM(sz*(cntR-1)+ind) = HM(sz*(cntR-1)+ind) + 1;
end
end

for cnt = 1:15
H(cnt) = max(max(HM(:,:,cnt)));
end
plot(H,'*-');

[maxval, maxind] = max(H);
[B,A] = find(HM(:,:,maxind)==maxval);
imshow(e); hold on;

plot(mean(A),mean(B),'xr')
text(mean(A),mean(B),num2str(maxind),'color','green')

centers=mean(A);
r_estimated=(B);

end
