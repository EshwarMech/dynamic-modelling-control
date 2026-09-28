%% State-Feedback Control Demo
% Dynamic Modelling & Control Portfolio
%
% Demonstrates state-feedback control using pole placement.
%
% Control law:
%
% u = -K*x
%
% where K is the state-feedback gain.

clear;
clc;
close all;

%% System Model

A = [0 1;
    -2 -0.5];

B = [0;
     1];

C = [1 0];

D = 0;

%% Desired Closed-Loop Poles

desired_poles = [-2 -3];

%% Calculate State-Feedback Gain

K = place(A, B, desired_poles);

%% Closed-Loop System

A_cl = A - B*K;

sys_cl = ss(A_cl, B, C, D);

%% Simulation

t = 0:0.01:10;

x0 = [1; 0];

u = zeros(size(t));

[y, t, x] = initial(sys_cl, x0, t);

%% Plot Position

figure;

plot(t, x(:,1), 'LineWidth', 1.5);

grid on;

xlabel('Time (s)');
ylabel('Position');

title('State-Feedback Controlled Response');

%% Display Controller Gain

disp('State-feedback gain K:');
disp(K);
