num=input('enetr num');
den=input('enter den');
h=tf(num,den);
[gm pm wcp wcg]=margin(h)
bode(h);
if (wcg>wcp)
     disp('stable')
else
    disp(' the system is unstable')
end
