A=[-5 -7 -10;1 0 0;0 1 0];
B=[1;0;0];
C=[1 1 1];
D=[0];
P=[0 0 1;0 1 0;1 0 0];
AP=inv(P)*A*P
BP=inv(P)*B
CP=C*P
DP=D