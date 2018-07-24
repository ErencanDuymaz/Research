dx = freq(2:end) - freq(1:end-1);
dt = time(2:end) - time(1:end-1);
rocof = dx./dt;

fc = 0.75; % Cut off frequency
fs = 1000; % Sampling rate

[b,a] = butter(6,fc/(fs/2)); % Butterworth filter of order 6
rocof_filtered = filter(b,a,rocof); % Will be the filtered signal
time_filtered=time(2:end,1);
plot(time_filtered,rocof)
hold on 
plot(time_filtered,rocof_filtered)
 