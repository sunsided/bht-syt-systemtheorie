% Programm "zustm.m"
% Erzeugung und Nutzung eines Zustandsmodellobjekts

clear, home, close all

% Parametermatrizen des Zustandsmodells
%
A=[-2,2;0.5,-2];	% Systemmatrix
b=[0;1.5];			% Eingangsvektor
c=[0,1];				% Ausgangsvektor
d=0;						% Durchgangsfaktor

% Bildung des LTI-Objekts: Zustansmodellobjekt "zstm"
%
zstm=ss(A,b,c,d);

% Anschauliche Ausgabe des Zustandsmodellobjekts
% auf dem MCW
%
zstm

% Zugriff auf die Parametermatrizen im 
% Zustandsmodellobjekt
%
[A_zmo, b_zmo, c_zmo, d_zmo]=ssdata(zstm);

