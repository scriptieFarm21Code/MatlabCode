% Initialize matlab
close all; % close other editors
clc;
clear all; % cache clear

% Determine length Var


% LOAD DATA
testing = readtable("/Users/roelvoordendag/farm21/mongoDumps/100.csv");



% Getting the data I want
x = testing.humidity;
y = testing.soil_moisture_10;

format long
b1 = x\y;
% B1 is the line between x and y

% look what the comparison between rain and soil moisture 10
yCalc1 = b1*x;
scatter(x,y)
hold on
plot(x, yCalc1)
xlabel('Luchtvochtigheid')
ylabel('soil moisture 10')
title('Lineair verband tussen bodemvochtigheid en Luchtvochtigheid')
grid on
% Improving fit
X = [ones(length(x),1) x];
b = X\y;

yCalc2 = X*b;
plot(x,yCalc2,'--')
legend('Data','Slope','Slope & Intercept','Location','best');
