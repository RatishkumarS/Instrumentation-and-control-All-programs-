clear all;
close all;
n=[40];
d=[1 1 0];
g=tf(n,d);
[gm,pm]=margin(g);
margin(g);2
p=input("enter req phase angle:");
ph=p-pm;
alpha=(1-sin(ph*pi/180))/(1+sin(ph*pi/180));
db=-20*log10(1/sqrt(alpha));
w=logspace(-1,1,100);
[mag,ph]=bode(g,w);
magDb=20*log10(mag);
wm=interp1(squeeze(magDb),w,db);
t=1/(sqrt(alpha)*wm);
gc=tf([t 1],[alpha*t 1])
sys=g*gc
figure
margin(sys);

