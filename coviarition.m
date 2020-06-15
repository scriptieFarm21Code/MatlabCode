% Initialize matlab
close all; % close other editors
clc;
clear all; % cache clear

data = readtable("/Users/roelvoordendag/farm21/mongoDumps/100.csv")

% Changing/Removing useless row
% data(:,1)=[];
% data=data(:,1:end-1)
% data=data(:,1:end-1)

% More data on the Data
% whos data

cvar = cov([data.temp, data.humidity, data.rain]);

diag(cvar)

var([data.temp, data.humidity, data.rain])

sqrt(cvar)

std([data.temp, data.humidity, data.rain])

corrcoef([data.soil_moisture_10, data.rain, data.temp])
