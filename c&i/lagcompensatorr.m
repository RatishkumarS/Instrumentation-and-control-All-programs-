close all;
clear all;
%input
n=input("enetr numerator");
d=input("enter the denomnator");
g=tf(n,d);
[gm,pd]=margin(g);
pm=input("enetr phase margin");
ph=pm+pd;
alpha=(1-sin(ph*pi/180))/(1+sin(ph*pi/180));
db=20*log10(1/sqrt(alpha));
w=logspace(-1,1,100);
[mag,phase]=bode(g,w);
magdb=20*log10(mag);
wc=interp1(magdb,w,db);
t=1/(sqrt(alpha)*wc);
gc=tf([t 1],[alpha*t,1])
sys=g*gc
figure
margin(sys);
