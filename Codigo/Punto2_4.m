clear
clc
[f,Fs]= audioread('Sputnik_beep.mp3');

f=sum(f,2);
f=f';
Ts=1/Fs;
L=length(f);
t=(0:(L-1))*Ts;
x=f(1,:);



t1=(t>=2882*Ts & t<9993*Ts);
t2=(t>=33460*Ts & t<43290*Ts);
t3=(t>=70990*Ts & t<79680*Ts);
t4=(t>=107800*Ts & t<116300*Ts);
t5=(t>=142200*Ts & t<152000*Ts);
t6=(t>=176300*Ts & t<185800*Ts);

tramo1=((0.3277*sin(2*pi*1060*t))).*t1;
tramo2=((0.641*sin(2*pi*1064*t))).*t2;
tramo3=((1.047*sin(2*pi*1060*t))).*t3;
tramo4=((0.9886*sin(2*pi*1056*t))).*t4;
tramo5=((1.114*sin(2*pi*1063*t))).*t5;
tramo6=((0.5923*sin(2*pi*1061*t))).*t6;

f1=tramo1+tramo2+tramo3+tramo4+tramo5+tramo6;


subplot(3,1,1)
plot(t,f1)
sound(f1,Fs)

subplot(3,1,2)

plot(t,f)

subplot(3,1,3)
[r,lags]=xcorr(x,f1,'normalized');
plot(lags,r)


