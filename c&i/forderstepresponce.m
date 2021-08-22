a=[50];
b=[1 3 2];
sys=tf(a,b);
figure(1);
nyquist(sys);
axis([-5 30 -20 20]);