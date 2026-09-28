%% Open-Loop vs Closed-Loop Comparison
% Dynamic Modelling & Control Portfolio

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

%% State-Feedback Controller

desired_poles = [-2 -3];

K = place(A, B, desired_poles);

%% Open-Loop System

sys_open = ss(A, B, C, D);

%% Closed-Loop System

A_cl = A - B*K;

sys_closed = ss(A_cl, B, C, D);

%% Simulation

t = 0:0.01:10;

x0 = [1; 0];

[~, t, x_open] = initial(sys_open, x0, t);

[~, ~, x_closed] = initial(sys_closed, x0, t);

%% Compare Position

figure;

plot(t, x_open(:,1), 'LineWidth', 1.5);
hold on;

plot(t, x_closed(:,1), 'LineWidth', 1.5);

grid on;

xlabel('Time (s)');
ylabel('Position');

title('Open-Loop vs Closed-Loop Response');

legend('Open Loop', 'State Feedback');

hold off;
