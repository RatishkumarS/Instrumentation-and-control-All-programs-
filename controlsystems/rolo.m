function [ output_args ] = rolo( num,den)

syms k s

rlocus(tf(num,den))
poles=roots(den);
zeros=roots(num);

if isempty (zeros)
    
centroid=(sum(poles)-sum(zeros))/(length(poles)-0);

    
else 
    
    centroid=sum(poles)-sum(zeros)/(length(poles)-length(zeros));
end

c=length(poles)-length(zeros)-1;
for i=0:1:c
 
    theta=((2*i+1)*180)/(length(poles)-length(zeros));
end
pzmap(den);









    
symnum=poly2sym(num,s);
symden=poly2sym(den,s);

disp('Finding Break away point')
bap=((symnum*k)/symden)==1;
pretty(bap)

bap=solve(bap,k);
disp('Value of K')
pretty(bap)
disp('After differentation')
dk=diff(bap,s);
pretty(dk)

Break_away_points=double(solve(dk));


disp('Finding the value of "K" and "w" ')


w = sym('w','real');
k = sym('k','real');

expr=bap+k;
fx=inline(expr);
fx=fx(k,1i*w);
pretty(fx)

imaginary=expand(imag(fx))==0;
disp('Imaginary')
pretty(imaginary)
omega=solve(imaginary,w);
omega=double(omega(omega>=0));

real_part=expand(real(fx))==0;
disp('Real part')
disp(pole)
disp(zeros)
pretty(real_part)
K=solve(real_part,k);
disp('K=')
pretty(K)
kw=inline(K);
K=double(kw(omega));
disp(p)
a=poles;
disp(a)

end


