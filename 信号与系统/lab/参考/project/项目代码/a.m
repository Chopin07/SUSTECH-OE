fc = 77e9;
B =150*10^6;
Tchirp = 8*10^(-6);
K = B / Tchirp;
c = 3e8;

Nr = 1024;
Nd = 128;



%%
% vres=(c/fc)/(2*Nd*Tchirp);%速度分辨率
range_res = 1;


signal = reshape(x1,Nr,Nd);

% 距离维FFT
sig_fft = fft(x1(1:1024))./Nr;
sig_fft = abs(sig_fft);
sig_fft = sig_fft(1:(Nr/2));

figure;
plot(sig_fft);
xlabel('距离（频率）');
ylabel('幅度')
title('第一个chirp的FTF结果')

%距离：89m
%精度：1m和1.9024m/s
