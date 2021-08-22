n=[10];
d=[0.0045 0.22 1 0];
sys=tf(n,d);
bode(sys);