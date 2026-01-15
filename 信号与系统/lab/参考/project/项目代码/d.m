clear all;
clc;
close all;
%% Radar Specifications 
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
%% User Defined Range and Velocity of target
range = 140;
vel = 10;

range1 = 100;
vel1 = 30;

max_vel = lamuda/(4*Tchirp);% m/s

%% FMCW Waveform Generation
B = c / (2*range_res);
slope = B/Tchirp;
t=linspace(0,Nd*Tchirp,Nr*Nd); %total time for samples
r_t=zeros(1,length(t));

td = 2 * (range + vel*t)/ c;
td1 = 2 * (range1 + vel1*t)/ c;
Tx  = cos(2*pi*(fc*t + (slope*t.*t)/2 ) );
Rx  = cos(2*pi*(fc*(t -td) + (slope * (t-td).*(t-td))/2 ) );
Rx1  = cos(2*pi*(fc*(t -td1) + (slope * (t-td1).*(t-td1))/2 ) );
% Mix = Tx.*Rx;%混频
% Mix1 = Tx.*Rx1;
% Mix = Mix + Mix1;
Mix = Tx.*(Rx+Rx1);

% Mix_fft1d =Mix+awgn(Mix,20);%增加高斯白噪声
Mix_fft1d = reshape(Mix, [Nr, Nd]);

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

[pks1,locs1] = findpeaks(abs(fft(Mix_fft1d(:,1))));
cnt = 1;
for i = 1:length(locs1)
    if(pks1(i)>max(pks1)*0.9 && locs1(i) <= 512)
        locs2(cnt) = locs1(i);
        cnt = cnt + 1;
    end
end

signal_fft = fft(Mix_fft1d, Nr);
figure(2)
mesh(db(abs(signal_fft./max(signal_fft))));
title('Range from First FFT');
ylabel('Range [m]');
xlabel('chirps[N]')
zlabel('Amplitude (dB)');
title('距离维FFT')
signal_fft2 = zeros(512,128);
for i=1:Nr/2
    signal_fft2(i,:) = fftshift(fft(signal_fft(i,:)));
end
% for i=1:length(locs2)
%     signal_fft2(locs2(i),:) = fftshift(fft(signal_fft(locs2(i),:)));
% end

% signal_fft2 = fft2(Mix_fft1d,1024,128);
% for i = 1:Nr/2 % 速度包含正负，所以对速度fftshift；距离直接截一半
%     signal_fft3(i,:) = fftshift(signal_fft2(i,:));
% end
doppler_axis = vel_res*((-Nd/2:(Nd-1)/2)-1);
range_axis = range_res*((1:Nr/2)-1);

figure(3);
mesh(doppler_axis,range_axis,db(abs(signal_fft2)));
xlabel('Speed[m/s]');
ylabel('Range[m]');
zlabel('Amplitude[dB]');
title('Amplitude and Range From FFT2');

%% CFAR implementation
RDM =db(abs(signal_fft2));
n_train_cells = 8;
n_train_bands = 8;
%test (CUT) for accurate estimation
n_guard_cells = 4;
n_guard_bands = 4;
offset = 1.4;
noise_level = zeros(1,1);
for i = 1:length(locs2)
    [~,v_r(i)] = max(RDM(locs2(i),:));
    RDM(locs2(i),:) = 0;
    RDM(locs2(i),v_r(i)) = 1;
end
for i = 1 : Nr/2
    if(i ~= locs2(1) && i ~= locs2(2))
        RDM(i,:)=0;
    end
end

v_r = (v_r - 65 - 1) * vel_res;
r_r = locs2 - 1;
% 噪声消除
% for row0 = n_train_cells + n_guard_cells + 1 : Nr - (n_train_cells + n_guard_cells)
%   for col0 = n_train_bands + n_guard_bands + 1 : (Nd) - (n_train_bands + n_guard_bands)
%     noise_level = zeros(1, 1);
%     for row1 = row0 - (n_train_cells + n_guard_cells) : row0 + (n_train_cells + n_guard_cells)
%       for col1 = col0 - (n_train_bands + n_guard_bands) : col0 + (n_train_bands + n_guard_bands)
%         if (abs(row0 - row1) > n_guard_cells || abs(col0 - col1) > n_guard_bands)
%           noise_level = noise_level + db2pow(RDM(row1, col1));
%         end
%       end
%     end
%     % Calculate threshold from noise average then add the offset
%     thresh = pow2db(noise_level / (2 * (n_train_bands + n_guard_bands + 1) * 2 * (n_train_cells + n_guard_cells + 1) - (n_guard_cells * n_guard_bands) - 1));
%     thresh = thresh + offset;
% 
%     CUT = RDM(row1-(n_train_cells + n_guard_cells) ,col1-(n_train_bands + n_guard_bands));
%     if (CUT < thresh)
%       RDM(row0, col0) = 0;
%     else
%       RDM(row0, col0) = 1;
%     end
% 
%   end
% end
 
% RDM(RDM~=0 & RDM~=1) = 0;

% RDM(RDM<0.98) = 0;

% count = 0;
% for i=1:512
%     for j=1:128
%         if(RDM(i,j)~=0)
%             count = count + 1;
%         end
%     end
% end

figure('Name', 'CA-CFAR Filtered RDM')
mesh(doppler_axis,range_axis,RDM);
title( 'CA-CFAR Filtered RDM surface plot');
xlabel('Speed[m/s]');
ylabel('Range[m]');
zlabel('Amplitude[dB]');
%%$ ending 