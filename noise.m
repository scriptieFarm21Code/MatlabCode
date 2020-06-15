% Initialize matlab
close all; % close other editors
clc;
clear all; % cache clear


data = readtable("/Users/roelvoordendag/farm21/mongoDumps/100.csv")

x = data.soil_moisture_10

d1 = designfilt('lowpassiir','FilterOrder',12, ...
    'HalfPowerFrequency',0.15,'DesignMethod','butter');
y = filtfilt(d1,x);

subplot(1,1,1)
plot(x)
hold on
plot(y,'LineWidth',3)
legend('Noisy ECG','Zero-Phase Filtering')

data(:, 'soil_moisture_10') = [];

disp(data)

data.soil_moisture_10 = y;

writetable(data,'testing.csv');