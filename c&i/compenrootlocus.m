close all
 clear all 
G=tf(1,[1 2 0]);
 figure(1)
 rlocus(G); 
axis equal; 
axis([-7 2 -5 5]);
 %spchart(gca,[0.5 1],4); 
sgrid 
beta=input('Enter trial value of beta:')
 D=tf([1 2.9],[1 beta]); 
figure(2)
 rlocus(D*G) 
axis equal;
axis([-7 2 -5 5]); 
%spchart(gca,[0.5 1],4);
 sgrid 
 [KK polesCL]=rlocfind(D*G)
 Gv=tf([1 0],1)*KK*D*G;
 Kv=dcgain(Gv) 
M=feedback(KK*D*G,1); 
ltiview('step',M) 
 
 