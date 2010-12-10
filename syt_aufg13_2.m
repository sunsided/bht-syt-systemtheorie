close all;

%% Aufgabe 20 a

a = -2; % von 10^a
b =  4; % bis 10^b
N =  1000;

w = logspace(a, b, N);

s = tf('s');
G = (s^2+20*s+24)/(2*s^3+8*s^2+16*s);
[betrag, phase] = bode(G, w);

betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);

figure('Name', 'SYT Aufgabe 20, G1', 'NumberTitle', 'off');

a = subplot(2,1,1);
semilogx(w, betrag, 'k', 'LineWidth', 2);
title('Betrag');
xlabel('\omega');
ylabel('|G(\omega)|');
grid on;

b = subplot(2,1,2);
semilogx(w, phase, 'k', 'LineWidth', 2);
title('Phase');
xlabel('\omega');
ylabel('\phi\{G(j\omega)\}');
grid on;

linkaxes([a b], 'x');


%% Aufgabe 20 G2

s = tf('s');
G = (4*s^2+13*s+20)/((2*s^2+8)*(s+1));
[betrag, phase, w] = bode(G);

betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);

figure('Name', 'SYT Aufgabe 20, G2', 'NumberTitle', 'off');

a = subplot(2,1,1);
semilogx(w, betrag, 'k', 'LineWidth', 2);
title('Betrag');
xlabel('\omega');
ylabel('|G(\omega)|');
grid on;

b = subplot(2,1,2);
semilogx(w, phase, 'k', 'LineWidth', 2);
title('Phase');
xlabel('\omega');
ylabel('\phi\{G(j\omega)\}');
grid on;

linkaxes([a b], 'x');

% Einzelne Komponenten

[betrag, phase, w] = bode(2.5*s/s); %(1 + 2*0.72672*0.44721*s + 0.2*s^2));
betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);
subplot(a); hold on; semilogx(w, betrag, 'b');
subplot(b); hold on; semilogx(w, phase, 'b');

[betrag, phase, w] = bode((4*s^2+13*s+20)); %(1 + 2*0.72672*0.44721*s + 0.2*s^2));
betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);
subplot(a); hold on; semilogx(w, betrag, 'r');
subplot(b); hold on; semilogx(w, phase, 'r');

[betrag, phase, w] = bode(1/(2*s^2+8)); %1/(1 + 2*-2.7756e-017*0.5*s + 0.25*s^2));
betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);
subplot(a); hold on; semilogx(w, betrag, 'm');
subplot(b); hold on; semilogx(w, phase, 'm');

[betrag, phase, w] = bode(1/(s+1)); %1/(1 + 1*s));
betrag = reshape(betrag, [1 length(w)]);
phase = reshape(phase, [1 length(w)]);
subplot(a); hold on; semilogx(w, betrag, 'g');
subplot(b); hold on; semilogx(w, phase, 'g');

subplot(a); 
legend('Kennlinie', 'Verstärkung', 'Vorhalt 2. Ordnung', 'VZ_2', 'VZ_1');

%% Aufgabe 20 G3

s = tf('s');
G = exp(-s*5)/(1+s^2+s);

figure('Name', 'SYT Aufgabe 20, G3', 'NumberTitle', 'off');
bode(G);
grid on;
