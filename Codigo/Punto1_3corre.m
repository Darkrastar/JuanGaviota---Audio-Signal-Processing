clear
clc
[f,Fs]= audioread('ID_audiencia.wav');

f=f';
Ts=1/Fs;
L=length(f);
t=(0:(L-1))*Ts;

t1=(t>=0.0518821 & t<0.122489);
t2=(t>=1.0009070 & t<1.09977324);
t3=(t>=1.9777778 & t<2.0798186);
t4=(t>=2.9578231 & t<3.0566893);
t5=(t>=3.9346939 & t<4.0331066);
t6=(t>=4.9115646 & t<5.4058957);

tramo1=((0.1612*sin(2*pi*1020*t)+0.03058*sin(2*pi*3059*t)+0.01131*sin(2*pi*5098*t))).*t1;
tramo2=((0.1346*sin(2*pi*1021*t)+0.03925*sin(2*pi*3063*t)+0.0179*sin(2*pi*5106*t))).*t2;
tramo3=((0.1058*sin(2*pi*1024*t)+0.04294*sin(2*pi*3062*t)+0.01539*sin(2*pi*5100*t))).*t3;
tramo4=((0.1263*sin(2*pi*1021*t)+0.04306*sin(2*pi*3063*t)+0.01697*sin(2*pi*5106*t))).*t4;
tramo5=((0.08959*sin(2*pi*1026*t))).*t5;
tramo6=((0.09958*sin(2*pi*1021*t))).*t6;

f1=tramo1+tramo2+tramo3+tramo4+tramo5+tramo6;
subplot(2,1,1)
plot(t,f1)
sound(f1,Fs)

subplot(2,1,2)
[r,lags]=xcorr(f,f1,'normalized');
plot(lags,r)
