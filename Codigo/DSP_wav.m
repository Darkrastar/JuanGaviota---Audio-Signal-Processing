clear
clc

[f,Fs]= audioread('ID_audiencia.wav');
disp(Fs)

f=f';
Ts=1/Fs;
L=length(f);
t=(0:(L-1))*Ts;
t1=0:(L-1);

f1=f(1144:2700);
f2=f(22070:24250);
f3=f(43600:45860);
f4=f(65220:67400);
f5=f(86760:88930);
f6=f(108300:119200);

L1=length(f1);
L2=length(f2);
L3=length(f3);
L4=length(f4);
L5=length(f5);
L6=length(f6);

subplot(7,1,1)
plot(t,f)

subplot(7,1,2)
y1=fft(f1);

P2 = abs(y1/L1);
P1 = P2(1:L1/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F1 = Fs*(0:(L1/2))/L1;
plot(F1,P1) 

subplot(7,1,3)
y2=fft(f2);

P2 = abs(y2/L2);
P1 = P2(1:L2/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F2 = Fs*(0:(L2/2))/L2;
plot(F2,P1) 

subplot(7,1,4)
y3=fft(f3);

P2 = abs(y3/L3);
P1 = P2(1:L3/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F3 = Fs*(0:(L3/2))/L3;
plot(F3,P1) 

subplot(7,1,5)
y4=fft(f4);

P2 = abs(y4/L4);
P1 = P2(1:L4/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F4 = Fs*(0:(L4/2))/L4;
plot(F4,P1) 

subplot(7,1,6)
y5=fft(f5);

P2 = abs(y5/L5);
P1 = P2(1:L5/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F5 = Fs*(0:(L5/2))/L5;
plot(F5,P1) 

subplot(7,1,7)
y6=fft(f6);

P2 = abs(y6/L6);
P1 = P2(1:L6/2+1);
P1(2:end-1) = 2*P1(2:end-1);

F6 = Fs*(0:(L6/2))/L6;
plot(F6,P1) 


