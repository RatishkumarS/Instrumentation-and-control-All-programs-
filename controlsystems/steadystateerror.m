clear all
close all
clc
n1=[10 20];
d1=[1 7 12 0 0];
n2=[1];
d2=[1];
%to determine loop tf
[n3,d3]=series(n1,d1,n2,d2);
[z , p, k]=tf2zp(n3,d3);
k=0;
for i=1:length(p)
    if (p(i)==0)
        k=k+1;
    end
end
k= n3(length(n3))/d3(length(d3)-k);
switch k
    case 0
        p=k;
        v=0;
        a=0;
        steady_state_error=1/(1+p);
        ramp_steady_error=1/v;
        parabolic_steady_error=1/a;
    case 1
        p=inf;
        v=k;
        a=0;
        steady_state_error=1/(1+p);
        ramp_steady_error=1/v;
        parabolic_steady_error=1/a;
    case 2
        p=inf;
        v=inf;
        a=k;
        steady_state_error=1/(1+p);
        ramp_steady_error=1/v;
        parabolic_steady_error=1/a;
    otherwise
        p=inf;
        v=inf;
        a=inf;
        steady_state_error=1/(1+p);
        ramp_steady_error=1/v;
        parabolic_steady_error=1/a;
end
fprintf('the given system is TYPE%d system\n',k);
fprintf('the error constants of the system are \n');
fprintf('kp= %f \nkv= %f\n ka=%f\n\n',p,v,a);
fprintf('the steady state error of the system for \n');
fprintf('unit step input =%f\nunit ramp input=%f\nunit parabolic input =%f\n\n',steady_state_error,ramp_steady_error,parabolic_steady_error);
