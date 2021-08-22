A=[-6 -16; 1 0];
B=[1; 0];
C=[ 0 4];
D=[0];
sys=ss(A,B,C,D);
step(sys)
impulse(sys)