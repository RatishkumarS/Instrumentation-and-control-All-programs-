clear all;close all 
den=[1 1 0]; 
G=tf(10,den); 
figure(1);
 margin(G); 
w=logspace(-1,1,100);
 [mag ph]=bode(G,w); 
ph=reshape(ph,100,1);
 mag=reshape(mag,100,1); 
Phi=input('Enter phase angle Phi :')
 wg=interp1(ph,w,Phi)
 beta=interp1(ph,mag,Phi) 
wcu=input('Enter upper corner frequency :') 
tau=1/wcu; 
D=tf([tau 1],[beta*tau 1]);
 figure(2);
 margin(D*G); 
w=[1:0.1:10]; 
[mag,ph,w]=bode(feedback(G,1));
 magdB=20*log10(mag); 
wb=interp1q(-magdB,w,3) 
[mag1,ph1,w]=bode(feedback(D*G,1)); 
mag1dB=20*log10(mag1); 
wb1=interp1q(-mag1dB,w,3)
 figure(3)
 Gc=D*G; 
ngrid;
nichols(G,Gc);
 M=feedback(D*G,1); 
ltiview('step',M) 