clear all
close all
clc
n=input('enter the num');
d=input('enter the den');
sys_tf=tf(n,d);
step(n,d)
[y,x,t]=step(n,d);
v=max(y);
for i=1:length(t)
    if v==y(i)
        k=i;
    end
end
t_peak=t(k);
%to determine rise time
k1=1;
while (y(k1)<0.1)
    k1=k1+1;
    break
end
t1=t(k1);
while(y(k1)<0.9)
    k1=k1+1;
    break
end
t2=t(k1);
t_rise=t2-t1;
%to determine maximum peak overshoot
perc_overshoot=(y(k)-1)*100;
%settling time
for k2=length(t):-1:1
    if((y(k2)-1)>=0.02)
        s_t=k2;
        break
    end
end
set_time_2_per=t(s_t);
%settling time for 5 tollerence
for k3= length(t):-1:1
    if((y(k3)-1)>=0.05)
        s_t1=k3;
        break
    end
end
set_time_5_per=t(s_t1);
fprintf('rise time = %f \n',t_rise);
fprintf('peak overshoot = %f \n',perc_overshoot);
fprintf('peak time = %f \n',t_peak);
fprintf('settling time = %f \n',set_time_2_per);
fprintf('settling time for 5 percent tolerence =%f \n',set_time_5_per);


    