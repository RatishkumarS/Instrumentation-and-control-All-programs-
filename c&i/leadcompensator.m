clear all; 
close all
 den=[1 1 0];
 G=tf(10,den); 
figure(1); 
margin(G);
 phiM=input('Enter required phase lead :'); 
alpha=(1-sin(phiM*pi/180))/(1+sin(phiM*pi/180));
 w=logspace(-1,1,100); 
[mag,ph]=bode(G,w);
 magdB=20*log10(mag);
 magdB=reshape(magdB,100,1);
 wm=interp1(magdB,w,-20*log10(1/sqrt(alpha)));
 tau=1/(wm*sqrt(alpha));
 D=tf([tau 1],[alpha*tau 1]) 
 figure(2);
 margin(D*G); w=[1:0.1:10]; 
[mag,ph,w]=bode(feedback(G,1));
 magdB=20*log10(mag);
 wb=interp1q(-magdB,w,3)
 [mag1,ph1,w]=bode(feedback(D*G,1)); 
mag1dB=20*log10(mag1); 
wb1=interp1q(-mag1dB,w,3)
 figure(3) 
 Gc=D*G;
 ngrid;nichols(G,Gc);
 pause 
 [theta,dB]=ginput(1);
 rp=10.^(dB./20); 
theta=theta*pi/180; 
[x,y]=pol2cart(theta,rp);
 Mr=((x.^2+y.^2)./(((1+x).^2)+y.^2)).^0.5;
 Mr=20*log10(Mr)
 M=feedback(D*G,1); 
ltiview('step',M)