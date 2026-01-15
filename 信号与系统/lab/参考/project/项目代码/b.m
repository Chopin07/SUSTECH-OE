fc = 77*10^9;
B =150*10^6;
Tchirp = 8*10^(-6);
K = B / Tchirp;
c = 3e8;
lamuda = c/fc;
range_res = 1;

Nr = 1024;
Nd = 128;
vel_res = lamuda/(2*Tchirp*Nd);


Mix_fft1d = reshape(x2, [Nr, Nd]);

%%原始信号
figure(1);
subplot(2,1,1);
plot(abs((Mix_fft1d(:,1))));
xlabel('采样点数(N)')
ylabel('幅度(A)')
subplot(2,1,2);
plot(abs(fft(Mix_fft1d(:,1))));
xlabel('采样点数(N)')
ylabel('幅度(A)')



% 两个fft搭建fft2
% signal_fft = fft(Mix_fft1d, Nr);
% figure(2)
% mesh(db(abs(signal_fft./max(signal_fft))));
% title('Range from First FFT');
% ylabel('Range [m]');
% xlabel('chirps[N]')
% zlabel('Amplitude (dB)');
% title('距离维FFT')
% for i=1:Nr
%     signal_fft2(i,:) = fftshift(fft(signal_fft(i,:)));
% end
signal_fft2 = fft2(Mix_fft1d,1024,128);
for i = 1:Nr/2 % 速度包含正负，所以对速度fftshift；距离直接截一半
    signal_fft3(i,:) = fftshift(signal_fft2(i,:));
end
doppler_axis = vel_res*((-Nd/2:Nd/2-1));
range_axis = range_res*((1:Nr/2));

figure(3);
mesh(doppler_axis,range_axis,db(abs(signal_fft3)));
xlabel('Speed[m/s]');
ylabel('Range[m]');
zlabel('Amplitude[dB]');
title('Amplitude and Range From FFT2');

% CFAR implementation
RDM =(abs(signal_fft3));
n_train_cells = 8;
n_train_bands = 8;
%test (CUT) for accurate estimation
n_guard_cells = 4;
n_guard_bands = 4;
offset = 1.4;
noise_level = zeros(1,1);
RDM = RDM / max(RDM(:));

 
RDM(RDM~=0 & RDM~=1) = 0;
figure('Name', 'CA-CFAR Filtered RDM')
mesh(doppler_axis,range_axis,RDM);
title( 'CA-CFAR Filtered RDM surface plot');
xlabel('Speed[m/s]');
ylabel('Range[m]');
zlabel('Amplitude[dB]');

%%$ ending % 11.4144m/s;89m
% 1-512m
% -1.9024*64~1.9024*63 = -121.7532~119.8509