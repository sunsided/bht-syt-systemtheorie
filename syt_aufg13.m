close all; clear; clc;

%% Parameter definieren
T = 10      % Sekunden
R = 10000   % 10 kOhm
C = T/R     % Aus T = R*C

%% System direkt
s = tf('s');
G = 1/((1+s*T)^2);

%% Mittels Simulink
[A, b, c, d] = linmod('syt_a22'); % Zustandsmodell aus Simulation beziehen
sys = ss(A, b, c, d);
G2 = tf(sys);
bode(G, G2);