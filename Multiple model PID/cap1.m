% Adaptive Control Systems
% Student name: Sohrab Rezaei

clc;
clear;
close all;
dt=0.00001;
t=0:dt:0.3;
N=numel(t);
u=sin(2*pi*10*t);
vc=zeros(1,N);
R=2;
Cc=[];
c0=0.1;
for i = 1:N
    i_r=(u(i)-vc(i))/(R);
    C=vc(i)^2+c0;
    Cc=[Cc C];
    vc(i+1)=(1/C)*i_r*dt+vc(i);
end
dvu=0.25;
u0=10:dvu:12;
g0=zeros(1,numel(u0));
g1=g0;
g2=g0;
for i=1:numel(u0)
        C=u0(i)^2/1000+c0;
        g1(i)=-1/(C);
        g2(i)=1/(R*C); 
end

num1=g2(1);
num2=g2(2);
num3=g2(3);
num4=g2(4);
num5=g2(5);
num6=g2(6);
num7=g2(7);
num8=g2(8);
num9=g2(9);

den1=[1 -g1(1)];
den2=[1 -g1(2)];
den3=[1 -g1(3)];
den4=[1 -g1(4)];
den5=[1 -g1(5)];
den6=[1 -g1(6)];
den7=[1 -g1(7)];
den8=[1 -g1(8)];
den9=[1 -g1(9)];

sys1=tf(num1,den1);
sys2=tf(num2,den2);
sys3=tf(num3,den3);
sys4=tf(num4,den4);
sys5=tf(num5,den5);
sys6=tf(num6,den6);
sys7=tf(num7,den7);
sys8=tf(num8,den8);
sys9=tf(num9,den9);

load 'pid_box4.mat'
kp1=pid1.kp;
kp2=pid2.kp;
kp3=pid3.kp;
kp4=pid4.kp;
kp5=pid5.kp;
kp6=pid6.kp;
kp7=pid7.kp;
kp8=pid8.kp;
kp9=pid9.kp;
% 
% kp1=30;
% kp2=30;
% kp3=30;
% kp4=54;
% kp5=4;
% kp6=4;
% kp7=4;
% kp8=4;
% kp9=30;

ki1=pid1.ki;
ki2=pid2.ki;
ki3=pid3.ki;
ki4=pid4.ki;
ki5=pid5.ki;
ki6=pid6.ki;
ki7=pid7.ki;
ki8=pid8.ki;
ki9=pid9.ki;

kd1=pid1.kd;
kd2=pid2.kd;
kd3=pid3.kd;
kd4=pid4.kd;
kd5=pid5.kd;
kd6=pid6.kd;
kd7=pid7.kd;
kd8=pid8.kd;
kd9=pid9.kd;


% kd1=0;
% kd2=0;
% kd3=0;
% kd4=0;
% kd5=0;
% kd6=0;
% kd7=0;
% kd8=0;
% kd9=0;
pid_t=[kp1,ki1,kd1;kp2,ki2,kd2;kp3,ki3,kd3;kp4,ki4,kd4;kp5,ki5,kd5;kp6,ki6,kd6;kp7,ki7,kd7;kp8,ki8,kd8;kp9,ki9,kd9];


% plot(t,vc(2:end));
% hold on
% plot(t,u);
% figure(2)
% plot(t,Cc)