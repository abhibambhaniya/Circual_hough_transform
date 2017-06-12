%make a coe file for a RGB image.

a=imread('coins2.jpg');

p = fopen('coins.coe', 'wt');
fprintf(p,'%s\n','memory_initialization_radix=16;'); 
fprintf(p,'%s\n','memory_initialization_vector=');
for m=1:size(a,1)
    for n=1:size(a,2)
        p1 = dec2hex(a(m,n,1),2);           %hex of R value of (m,n)
        p2 = dec2hex(a(m,n,2),2);           %hex of G value of (m,n)
        p3 = dec2hex(a(m,n,3),2);           %hex of B value of (m,n)
        fprintf(p,'%c',p1(1));
        fprintf(p,'%c,',p1(2));
        fprintf(p,'%c',p2(1));
        fprintf(p,'%c,',p2(2));
        fprintf(p,'%c',p3(1));
        fprintf(p,'%c,\n',p3(2));
        end;
end;
fprintf(p,';');
        
fclose(p);