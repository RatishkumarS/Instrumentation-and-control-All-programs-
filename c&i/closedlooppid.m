clear all 
close all 
G=tf(4500,[1 361.2 0]);
 Kc=184.1; 
M1=feedback(Kc*G,1);
 t=[0:0.0001:0.04];
 y1=step(M1,t);
 KD=0.324;
 D1=tf([KD Kc],1);
 M2=feedback(D1*G,1);
 y2=step(M2,t); 
figure(1);
 plot(t,y1,t,y2);
grid;xlabel('t');
ylabel('y(t)'); 
text(0.005,1.4,'With P control') 
text(0.003,1.07,'With PD control')
 Kc=14.728;KI=147.28;
 D2=tf([Kc KI],[1 0]); 
M3=feedback(D2*G,1);
 y3=step(M3,t);
 figure(2); 
plot(t,y1,t,y3);
grid; 
xlabel('t');
ylabel('y(t)');
 text(0.005,1.5,'With P control') 
text(0.02,1.15,'With PI control') 
