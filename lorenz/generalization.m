clc;
clear;

p=10;
r=28;
b=8/3;
x(1)=10;
y(1)=1;
z(1)=0;
h=0.01;
for i=1:1:10000
    K1=p*(y(i)-x(i));
    L1=r*x(i)-y(i)-x(i)*z(i);
    M1=-b*z(i)+x(i)*y(i);
    
    K2=p*((y(i)+h/2*L1)-(x(i)+h/2*K1));
    L2=r*(x(i)+h/2*K1)-(y(i)+h/2*L1)-(x(i)+h/2*K1)*(z(i)+h/2*M1);
    M2=-b*(z(i)+h/2*M1)+(x(i)+h/2*K1)*(y(i)+h/2*L1);
    
    K3=p*((y(i)+h/2*L2)-(x(i)+h/2*K1));
    L3=r*(x(i)+h/2*K1)-(y(i)+h/2*L2)-(x(i)+h/2*K1)*(z(i)+h/2*M2);
    M3=-b*(z(i)+h/2*M1)+(x(i)+h/2*K1)*(y(i)+h/2*L2);
    
    K4=p*((y(i)+h*L3)-(x(i)+h*K3));
    L4=r*(x(i)+h*K3)-(y(i)+h*L3)-(x(i)+h*K3)*(z(i)+h*M3);
    M4=-b*(z(i)+h*M3)+(x(i)+h*K3)*(y(i)+h*L3);
    
    x(i+1)=x(i)+h/6*(K1+2*K2+2*K3+K4);
    y(i+1)=y(i)+h/6*(L1+2*L2+2*L3+L4);
    z(i+1)=z(i)+h/6*(M1+2*M2+2*M3+M4);
end
figure(1);
plot3(x,y,z);
xlabel('x(t)'),ylabel('y(t)'),zlabel('z(t)');
title('Lorenz');
figure(2);
plot(x);
xlabel('t'),ylabel('x(t)')
title('Lorenz X');
figure(3)
plot(y);
xlabel('t'),ylabel('y(t)')
title('Lorenz Y');
figure(4)
plot(z);
xlabel('t'),ylabel('z(t)')
title('Lorenz Z');
N=length(x);
m=6;
tau=2;
P=N-(m-1)*tau;
for ii=1:m
   for jj=1:P
       data(jj,ii)=x(jj+(ii-1)*tau);
   end
end
y1=data(:,1);
y2=data(:,2);
y3=data(:,3);
figure(5);
plot3(y1,y2,y3);
legend('tau=10');
xlabel('x(t+tau)'),ylabel('x(t+tau)'),zlabel('x(t+2*tau)');
title('Lorenz X');