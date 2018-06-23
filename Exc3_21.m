clear all
close all
clc
%% specifications 
Dt = 0.001;          % delta 
t =0:Dt:1;
Ts=.01;              %sampling rate in sec
Fs=1/Ts;

Ts1=.05;             %sampling rate in sec
Fs1=1/Ts1;

Ts2=.1;              %sampling rate in sec
Fs2=1/Ts2;

n=0:100;
n1=0:20;
n2=0:10;

nTs=n*Ts;
nTs1=n1*Ts1;
nTs2=n2*Ts2;
%% input signal
x=cos(20*pi*t);                       % CT signal

sampledX=cos(20*pi*n*Ts);                   % DT signal
figure;plot(t,x);hold on;
stem(n*Ts,sampledX);hold off;

wd1=cos(20*pi*n1*Ts1);                % DT signal
figure;plot(t,x);hold on;
stem(n1*Ts1,wd1);hold off;

wd2=cos(20*pi*n2*Ts2);                % DT signal
plot(t,x);hold on;
stem(n2*Ts2,wd2);hold off;
%% TS1
% check
Sinc1 = sampledX*sinc(Fs*(ones(length(n),1)*t - nTs'*ones(1,length(t))));  % using sinc function to make DT,CT
sinc_1error = max(abs(Sinc1 - cos(20*pi*t)))
figure; plot(t,Sinc1);grid on;xlabel('using sinc function to reconstruct signal sampled by 0.05') ;
%% TS2
% check
Sinc2 = wd1*sinc(Fs1*(ones(length(n1),1)*t - nTs1'*ones(1,length(t)))); % using sinc function to make DT,CT
sinc_2error = max(abs(Sinc2 - cos(20*pi*t)))
figure; plot(t,Sinc2);grid on;xlabel('using sinc function to reconstruct signal sampled by 0.05') ;
%% TS3
% check
Sinc3 = wd2*sinc(Fs2*(ones(length(n2),1)*t - nTs2'*ones(1,length(t))));  % using sinc function to make DT,CT
sinc_3error = max(abs(Sinc3 - cos(20*pi*t)))
figure; plot(t,Sinc3);xlabel('using sinc function to reconstruct signal sampled by 0.1') ;grid on;
%% spline (interpolation)
% TS1
% check 
SPline1 = spline(nTs,sampledX,t);         
spiline_1error = max(abs(SPline1 - cos(20*pi*t)))                            %using interpolation method to recostruct signal
figure; plot(t,SPline1);xlabel('using interpolation method to recostruct signal sampled by 0.01') ;grid on;
%% TS2
% check 
SPline2 = spline(nTs1,wd1,t);      
spiline_2error = max(abs(SPline2 - cos(20*pi*t)))  %using interpolation method to recostruct signal
figure; plot(t,SPline2);xlabel('using interpolation method to recostruct signal sampled by 0.05') ;grid on;
%% TS3
% check 
SPline3 = spline(nTs2,wd2,t);    
spiline_3error = max(abs(SPline3 - cos(20*pi*t)))                           %using interpolation method to recostruct signal
figure; plot(t,SPline3);xlabel('using interpolation method to recostruct signal sampled by 0.1') ;grid on;