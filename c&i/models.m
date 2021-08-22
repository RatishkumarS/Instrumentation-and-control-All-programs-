clear all;
close all;
n=[4000];
d=[1 300 0];
g=tf(n,d);
kp=15;
d1=feedback(kp*g,1);
t=[0:0.0001:0.04];
y1=step(d1,t);
plot(t,y1);
kd=0.4;
ki=150;
g1=tf([kp ki kd],[1 0 0]);
d2=feedback(g*g1,1);
y2=step(d2,t);
plot(t,y1,t,y2);

