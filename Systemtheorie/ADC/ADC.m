
% Vergleich eines mehrstufigen Analog/Digital Wandlers
% mit einem 1-Bit Sigma-Delta Wandler
%
clear all
home
%
% veränderbare Simulations-Parameter
A1 = 1/3;        % Amplitude von s1(t)
A2 = 1/4;        % Amplitude von s2(t)
A3 = 1/5;        % Amplitude von s3(t)
f1 = 1;          % Frequenz von s1(t) in [Hz]
f2 = 2;          % Frequenz von s2(t) in [Hz]
f3 = 3;          % Frequenz von s3(t) in [Hz]
b  = 4;          % Auflösung des Mehrstufen ADCs (in Bit)
fs = 30;         % Abtastrate des Mehrstufen ADCs
k  = 2;          % Verstärkungsfaktor im Sigma-Delta Modulator
N  = 30;         % Oversampling Faktor des Sigma Delta Wandlers
fg = 60;         % Grenzfrequenz des digitalen TP-Filters
%
% Simulationsparameter
fc = N*fs;       % Taktfrequenz der Simulaton
Smin = -48;      % Kleinste darzustellende Spektrallinie in [dB]
fmax = fs/2;     % Maximale eindeutige Frequenz
df   = 0.5;      % Frequenzauflösung
%
% Berechnung von G(z) für ein Tiefpass-Filter zweiter Ordnung
[num den] = zp2tf([], [-fg -fg], fg^2);
sys = tf(num, den);
sys_d = c2d(sys, 1/(N*fs), 'tustin');
[num_d, den_d] = tfdata(sys_d); % Zähler- und Nennerpolynom aus LTI-Objekt ermitteln
num_d = num_d{1,1};
den_d = den_d{1,1};
%
% Start der Simulation
[t,x,y] = sim('ADC_sim',3);  % Simulationsdauer: 3s
L = length(y);
%
% Spektrum des Mehrstufen ADCs mit b Bits
figure(1)
f1 = -fmax:df:fmax-df; % Frequenzachse vorgeben
S1 = 20*log10(max(abs(fftshift(fft(y(L-2*fc:N:L-1,1)'))),1e-20)); % Berechnung des Spektrums
plot(f1,S1-max(S1),'LineWidth',1.5)
grid
axis([-fmax fmax Smin 0])
set(gca,'YTick',[Smin:6:0])
title(sprintf('Spektrum des mehrstufigen ADCs mit b = %d Bits und ft = %d Hz',b,fs))
%
% Spektrum des Sigma-Delta ADCs nach dem Komparator
figure(2)
f2 = -fmax*N:df:fmax*N-df; % Frequenzachse vorgeben
S2 = 20*log10(max(abs(fftshift(fft(y(L-2*fc:1:L-1,2)'))),1e-20)); % Berechnung des Spektrums
plot(f2,S2-max(S2),'b','LineWidth',1)
grid
axis([-fmax*N fmax*N Smin 0])
set(gca,'YTick',[Smin:6:0])
set(gca,'XTick',[-N*fs/2:fs:N*fs/2])
title(sprintf('Spektrum am Ausgang des Vorzeichen-Komparators mit ft = %d Hz',N*fs))
%
% Spektrums des digitalen TP-Filters
fb = 0:df:fmax*N-df; % Frequenzachse vorgeben
[betrag,phas]=bode(sys_d,fb);	 
betrag=20*log10(betrag);					
betrag=reshape(betrag,[1,length(fb)]);
% Darstellung des Achsensymmetrischen Betragsspektrums
bdB(1:length(betrag)) = fliplr(betrag); % dazu: Spiegeln der Betragswerte
bdB(length(fb)+1:2*length(fb)) = betrag; % und kopieren in bdB-Vektor
hold on
plot(f2,bdB,'r','LineWidth',1.5)
%
% Spektrum des Sigma-Delta ADCs nach dem digitalen TP-Filter
figure(3)
f3 = -fmax:df:fmax-df;
S3 = 20*log10(max(abs(fftshift(fft(y(L-2*fc:N:L-1,3)'))),1e-20));
plot(f3,S3-max(S3),'b','LineWidth',1.5)
grid
axis([-fmax fmax Smin 0])
set(gca,'YTick',[Smin:6:0])
title(sprintf('Spektrum des Sigma-Delta ADCs mit N = %d fachem Oversampling',N))
