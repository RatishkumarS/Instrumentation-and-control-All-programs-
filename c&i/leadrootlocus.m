clear all
close all
g=tf(1,[1 2 0]);
num=[80];

bode(g);
[gm,pm,pcf,gcf]=margin(num,den)