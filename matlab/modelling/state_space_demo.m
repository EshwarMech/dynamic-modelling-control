%% State-Space Modelling Demo
% Dynamic Modelling & Control Portfolio
%
% This script demonstrates a simple state-space model
% and simulates its response to an initial condition.
%
% This is a portfolio reimplementation created for
% demonstrating control-engineering concepts.

clear;
clc;
close all;

%% System Model
%
% State vector:
% x = [position; velocity]
%
% Continuous-time model:
%
% x_dot = A*x + B*u
% y     = C*x + D*u

A = [0 1;
    -2 -0.5];

B = [0;
     1];

C = [1 0];

D = 0;

%% Create State-Space System

sys = ss(A, B, C, D);

%% Simulation

t = 0:0.01:10;

% Initial state
x0 = [1; 0];

% Zero input
u = zeros(size(t));

% Simulate system response
[y, t, x] = initial(sys, x0, t);

%% Plot Position

figure;

plot(t, x(:,1), 'LineWidth', 1.5);

grid on;

xlabel('Time (s)');
ylabel('Position');

title('State-Space System Response');

%% Plot Velocity

figure;

plot(t, x(:,2), 'LineWidth', 1.5);

grid on;

xlabel('Time (s)');
ylabel('Velocity');

title('Velocity Response');
