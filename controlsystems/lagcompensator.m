n=[5];
d=[0.5 1.5 1 0];
bode(n,d);
[Gm,Pm,pcf,gcf]=margin(n,d)
%using the above values we can find the transfer function of uncompensated
%system
%enter the compensated system
n1=[5];
d1=[0.5 1.5 1 0];
n2=[1 0.0056];
d2=[1 0.00747];
%coefficents of compensated system
[n3,d3]=series(n1,d1,n2,d2);
bode(n3,d3)
