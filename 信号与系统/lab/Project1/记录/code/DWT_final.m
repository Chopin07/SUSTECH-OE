clear;
close all;
clc;
addpath('data')
ScreenSize = get(0,'ScreenSize');

array_start_time = [0:0.5:9.5];                             %每隔0.5s截取一段数据
array_sample_shift = [0:1:5];                               %时移范围[0 5]
array_Doppler_frequency = [-40:2:40];                       %频移范围[-40 40]


f_c = 2.123e9;                                              %载波频率2.123GHz
f_s = 25e6;                                                 %采样率25MHz
lambda = 3e8/f_c;                                           %波长
array_range = (array_sample_shift/f_s)*3e8;                 %时差*光速=距离范围
f_ddc = -3e6;
bandwidth = 9e6;
   
A_TRD = zeros(length(array_start_time),length(array_sample_shift),length(array_Doppler_frequency));

for idx_start_time = 1:length(array_start_time) 
    %% idx_start_time = 1

    fprintf('[stat] Index of start time: %d / %d.\n',idx_start_time,length(array_start_time))
    %% Read Data File                                 %读取第一段5s数据
    fprintf('[stat]   Read data file.\n')
    load(sprintf('data/data_%d.mat',idx_start_time))

    %% Digital downconvert                            %数字下变频
    fprintf('[stat]   Downconvert.\n')
    seq_ref_ddc = seq_ref.*exp(-1i*2*pi*f_ddc*[0:duration*f_s-1]/f_s);
    seq_sur_ddc = seq_sur.*exp(-1i*2*pi*f_ddc*[0:duration*f_s-1]/f_s);
    
    %% LPF                                            %低通滤波器
    fprintf('[stat]   LPF.\n')
    [b,a] = butter(20,bandwidth/(f_s/2));
    seq_ref_lpf = filter(b,a,seq_ref_ddc);
    seq_sur_lpf = filter(b,a,seq_sur_ddc);

    %% Plot waveform and spectrum                     %画出时域波形和频谱
    duration_plot = 0.01;
    num_t_axis_plot = duration_plot*f_s;
    num_f_axis_plot = num_t_axis_plot;
    t_axis_plot = 0:1/f_s:duration_plot-1/f_s;
    f_axis_plot = -f_s/2:f_s/(num_f_axis_plot-1):f_s/2;

    fig1 = figure(1);
    set(fig1,'Position',[1,41,0.4*ScreenSize(3),0.8*ScreenSize(4)]);

    subplot(6,2,1)
        plot(t_axis_plot*1e3,real(seq_ref(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-0.5e-3,0.5e-3])
        title('Reference signal (raw)')
    subplot(6,2,2)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_ref(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (raw)')
    subplot(6,2,3)
        plot(t_axis_plot*1e3,real(seq_ref_ddc(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-0.5e-3,0.5e-3])
        title('Reference signal (after DDC)')
    subplot(6,2,4)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_ref_ddc(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (after DDC)')
    subplot(6,2,5)
        plot(t_axis_plot*1e3,real(seq_ref_lpf(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-0.5e-3,0.5e-3])
        title('Reference signal (after LPF)')
    subplot(6,2,6)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_ref_lpf(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (after LPF)')
    subplot(6,2,7)
        plot(t_axis_plot*1e3,real(seq_sur(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-2e-3,2e-3])
        title('Surveillance signal (raw)')
    subplot(6,2,8)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_sur(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (raw)')
    subplot(6,2,9)
        plot(t_axis_plot*1e3,real(seq_sur_ddc(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-2e-3,2e-3])
        title('Surveillance signal (after DDC)')
    subplot(6,2,10)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_sur_ddc(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (after DDC)')
    subplot(6,2,11)
        plot(t_axis_plot*1e3,real(seq_sur_lpf(1,1:num_t_axis_plot)))
        xlabel('Time (ms)')
        ylabel('Amplitude')
        axis([0,duration_plot*1e3,-2e-3,2e-3])
        title('Surveillance signal (after LPF)')
    subplot(6,2,12)
        plot(f_axis_plot/1e6,20*log10(abs(fftshift(fft(seq_sur_lpf(1,1:num_t_axis_plot))))))
        xlabel('Frequency (MHz)')
        ylabel('Amplitude (dB)')
        axis([-f_s/2/1e6,f_s/2/1e6,-100,0])
        title('Spectrum (after LPF)')

   % Ambiguity function                             
    fprintf('[stat]   Ambiguity processing.\n')
    num_loop = length(array_sample_shift)*length(array_Doppler_frequency);
    t_axis = 0:1/f_s:(duration*f_s-1)/f_s;
    temp = zeros(1,num_loop);

    for idx_RD = 1:num_loop
        idx_sample_shift = ceil(idx_RD/length(array_Doppler_frequency));
        idx_f_d = mod(idx_RD-1,length(array_Doppler_frequency))+1;
        sample_shift = array_sample_shift(idx_sample_shift);            %从数组[0:5]中取值
        f_d = array_Doppler_frequency(idx_f_d);                         %从数组[-40:2:40]中取值                  

        temp(1,idx_RD) = sum(seq_sur_lpf(1,1+sample_shift:end) ...
                        .*conj(seq_ref_lpf(1,1:end-sample_shift)) ...
                        .*exp(-1i*2*pi*f_d*t_axis(1+sample_shift:end)));
        
        A_TRD(idx_start_time, idx_sample_shift, idx_f_d) = abs(temp(1, idx_RD));
    end
end

% Plot RD Spectrum
idx_max_range = zeros(1,length(array_start_time))-1;
idx_max_Doppler_frequency = zeros(1,length(array_start_time));
thres_A_TRD = -10;
for idx_start_time = 1:length(array_start_time)
    fig = figure(idx_start_time);
    ScreenSize = get(0,'ScreenSize');
    set(fig,'Position',[0.75*ScreenSize(3)+50,0.5*ScreenSize(4)+50,0.25*ScreenSize(3)-100,0.5*ScreenSize(4)-150]);
    [meshgrid_Doppler,meshgrid_range] = meshgrid(array_Doppler_frequency,[array_range,2*array_range(end)-array_range(end-1)]);
    plot_A_RD = abs(squeeze(A_TRD(idx_start_time,:,:)));
    plot_A_RD = plot_A_RD/max(max(plot_A_RD));
    plot_A_RD = 20*log10(plot_A_RD);
    plot_A_RD(plot_A_RD<thres_A_TRD) = thres_A_TRD;
    plot_A_RD = [plot_A_RD;thres_A_TRD*ones(1,size(plot_A_RD,2))];
    surf(meshgrid_Doppler,meshgrid_range,plot_A_RD)
    view(0,90)
    colorbar
    xlim([array_Doppler_frequency(1),array_Doppler_frequency(end)])
    ylim([array_range(1),2*array_range(end)-array_range(end-1)])
    xticks([array_Doppler_frequency(1):20:array_Doppler_frequency(end)])
    yticks([array_range,2*array_range(end)-array_range(end-1)])
    xlabel('Doppler frequency (Hz)')
    ylabel('Range (m)')
    [idx_max_range(idx_start_time),idx_max_Doppler_frequency(idx_start_time)] = find(plot_A_RD==max(max(plot_A_RD)));
    temp = sprintf('Range-Doppler Spectrum [%4.1fs: %3.0fm %3.0fHz]', ...
        array_start_time(idx_start_time), ...
        array_range(idx_max_range(idx_start_time)), ...
        array_Doppler_frequency(idx_max_Doppler_frequency(idx_start_time)));
    title(temp)

end

% Plot TD Spectrum
fig3 = figure(25);
ScreenSize = get(0,'ScreenSize');
set(fig3,'Position',[0.5*ScreenSize(3)+50,50,0.25*ScreenSize(3)-100,0.5*ScreenSize(4)-150]);
[meshgrid_Doppler,meshgrid_start_time] = ...
    meshgrid(array_Doppler_frequency,[array_start_time,array_start_time(end)+duration]);
plot_A_TD = zeros(length(array_start_time),length(array_Doppler_frequency));
for idx_start_time = 1:length(array_start_time)
    plot_A_TD(idx_start_time,:) = abs(squeeze(A_TRD(idx_start_time,idx_max_range(idx_start_time),:)));
end
plot_A_TD = plot_A_TD./max(plot_A_TD,[],2);
plot_A_TD = 20*log10(plot_A_TD);
plot_A_TD(plot_A_TD<thres_A_TRD) = thres_A_TRD;
plot_A_TD = [plot_A_TD;thres_A_TRD*ones(1,size(plot_A_TD,2))];
surf(meshgrid_Doppler,meshgrid_start_time,plot_A_TD)
view(0,90)
colorbar
xlim([array_Doppler_frequency(1),array_Doppler_frequency(end)])
ylim([array_start_time(1),array_start_time(end)])
xticks([array_Doppler_frequency(1):20:array_Doppler_frequency(end)])
yticks([array_start_time(1):0.5:array_start_time(end)+duration])
xlabel('Doppler frequency (Hz)')
ylabel('Time (s)')
title('Time-Doppler Spectrum')
