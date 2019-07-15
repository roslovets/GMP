% Gyroboy model configuration
REAL = 0; % 1 for modeling with discrete sensors
HW = 0; % 1 to run model on EV3
MB = 0; % simulate nonlinear plant with Simscape Multibody
% Load data and parameters
load('bus_data.mat');
gb_init;