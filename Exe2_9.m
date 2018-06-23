clear all
clc
%% specifications 
t=0:.1:20;                                                      %%individuals
x=(0.9).^t;
n=-20:.1:0;
y=(0.8).^(-n);
%% using Xcorr function
corr_seq1=xcorr(x,y);                                          %%calciuting crosscorrelation  using xcorr function            
[corr_seq1 lags]=xcorr(x,y); 

corr_seq2=xcorr(x);                                            %%calciuting autocorrelation using xcorr function
[corr_seq2 lags]=xcorr(x);
%% plots
subplot(2,2,1); stem(lags,corr_seq1);  grid
xlabel('lags'); ylabel('Magnitude');
title('corr-seq1=xcorr(x,y)')
subplot(2,2,2); stem(lags,corr_seq2); grid
xlabel('lags'); ylabel('Magnitude');
title('corr-seq2=xcorr(x)')
%% using conv_m function
crosscorrelation=conv(fliplr(x),y);                            %%calciuting crosscorrelation using conv_m function                                   
autocorrelation=conv(fliplr(x),x);                             %%calciuting autocorrelation using conv_m function     
%% plots        
subplot(2,2,3); stem(lags,fliplr(crosscorrelation)); grid
xlabel('lags'); ylabel('Magnitude');
title('crosscorrelation using conv-m ')
subplot(2,2,4); stem(lags,fliplr(autocorrelation)); grid
xlabel('lags'); ylabel('Magnitude');
title('autocorrelation using conv-m ')












